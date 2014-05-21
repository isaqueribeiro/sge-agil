/* Server version: WI-V6.3.4.18393 Firebird 2.1 
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */

SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll';
SET NAMES ISO8859_2;

SET SQL DIALECT 3;

CONNECT 'localhost:NORTEMIX' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

/* Dropping trigger... */
DROP TRIGGER TRGAJUSTESTOQ;


ALTER TABLE TBCIDADE ADD CUSTO_OPER_PERCENTUAL DMN_SMALLINT_N DEFAULT 1;

DESCRIBE FIELD CUSTO_OPER_PERCENTUAL TABLE TBCIDADE
'Custo Operacional em Percentual:
0 - Nao
1 - Sim';

ALTER TABLE TBCIDADE ADD CUSTO_OPER_FRETE DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_FRETE TABLE TBCIDADE
'Custo Operacional (Frete) - Percentual ou Valor';

ALTER TABLE TBCIDADE ADD CUSTO_OPER_OUTROS DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_OUTROS TABLE TBCIDADE
'Custo Operacional (Outros) - Percentual ou Valor';

ALTER TABLE TBCLIENTE ADD EMITIR_NFE_DEVOLUCAO DMN_SMALLINT_N;

DESCRIBE FIELD EMITIR_NFE_DEVOLUCAO TABLE TBCLIENTE
'Emitir NF-e de devolucao para o cliente:
0 - Nao
1 - Sim';

ALTER TABLE TBCLIENTE ADD CUSTO_OPER_PERCENTUAL DMN_SMALLINT_N DEFAULT 1;

DESCRIBE FIELD CUSTO_OPER_PERCENTUAL TABLE TBCLIENTE
'Custo Operacional em Percentual:
0 - Nao
1 - Sim';

ALTER TABLE TBCLIENTE ADD CUSTO_OPER_FRETE DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_FRETE TABLE TBCLIENTE
'Custo Operacional (Frete) - Percentual ou Valor';

ALTER TABLE TBCLIENTE ADD CUSTO_OPER_OUTROS DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_OUTROS TABLE TBCLIENTE
'Custo Operacional (Outros) - Percentual ou Valor';

ALTER TABLE TBCONFIGURACAO ADD CUSTO_OPER_CALCULAR DMN_SMALLINT_N DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_CALCULAR TABLE TBCONFIGURACAO
'Calcular custo operacional nas vendas:
0 - Nao
1 - Sim';

ALTER TABLE TBFORNECEDOR ADD FONECEL DMN_FONERSD;

DESCRIBE FIELD FONECEL TABLE TBFORNECEDOR
'Telefone Movel.';

ALTER TABLE TBFORNECEDOR ADD FONEFAX DMN_FONERSD;

DESCRIBE FIELD FONEFAX TABLE TBFORNECEDOR
'Fax.';

ALTER TABLE TBFORNECEDOR ADD DTCAD DMN_DATE;

DESCRIBE FIELD DTCAD TABLE TBFORNECEDOR
'Data de Cadastro.';

ALTER TABLE TBFORNECEDOR ADD CLIENTE_ORIGEM DMN_CNPJ;

DESCRIBE FIELD CLIENTE_ORIGEM TABLE TBFORNECEDOR
'FORNECEDOR corresponde a CLIENTE cadastrado.';

ALTER TABLE TBVENDAS ADD CUSTO_OPER_PERCENTUAL DMN_SMALLINT_N DEFAULT 1;

DESCRIBE FIELD CUSTO_OPER_PERCENTUAL TABLE TBVENDAS
'Custo Operacional em Percentual:
0 - Nao
1 - Sim';

ALTER TABLE TBVENDAS ADD CUSTO_OPER_FRETE DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_FRETE TABLE TBVENDAS
' Custo Operacional (Frete) - Percentual ou Valor';

ALTER TABLE TBVENDAS ADD CUSTO_OPER_OUTROS DMN_MONEY_4 DEFAULT 0;

DESCRIBE FIELD CUSTO_OPER_OUTROS TABLE TBVENDAS
'Custo Operacional (Outros) - Percentual ou Valor';

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN USUARIO TYPE DMN_VCHAR_50;

DESCRIBE FIELD FONE TABLE TBFORNECEDOR
'Telefone Comercial.';

/* Create Foreign Key... */
RECONNECT;

ALTER TABLE TBFORNECEDOR ADD CONSTRAINT FK_TBFORNECEDOR_CLIENTE FOREIGN KEY (CLIENTE_ORIGEM) REFERENCES TBCLIENTE (CNPJ);

/* Creating trigger... */
SET TERM ^ ;

CREATE TRIGGER TG_AJUST_ESTOQUE_HISTORICO FOR TBAJUSTESTOQ
ACTIVE AFTER INSERT POSITION 0 
AS
begin
  update TBPRODUTO p set
    p.qtde = coalesce(p.qtde, 0) + coalesce(new.qtdenova, 0)
  where p.cod    = new.codprod
    and p.codemp = new.codempresa;

  Insert Into TBPRODHIST (
      Codempresa
    , Codprod
    , Doc
    , Historico
    , Dthist
    , Qtdeatual
    , Qtdenova
    , Qtdefinal
    , Resp
    , Motivo
  ) values (
      new.codempresa
    , new.codprod
    , new.doc
    , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
    , new.dtajust
    , new.qtdeatual
    , new.qtdenova
    , new.qtdefinal
    , coalesce(new.Usuario, user)
    , substring(trim(new.motivo) from 1 for 40)
  );
end
^

CREATE TRIGGER TG_CIDADE_CUSTO_OPER FOR TBCIDADE
ACTIVE AFTER INSERT OR UPDATE POSITION 10 
AS
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    Update TBCLIENTE c Set
        c.custo_oper_percentual = new.custo_oper_percentual
      , c.custo_oper_frete      = new.custo_oper_frete
      , c.custo_oper_outros     = new.custo_oper_outros
    where c.cid_cod = new.cid_cod;
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CIDADE_CUSTO_OPER
'Trigger Definir Custo Operacional (Cliente).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2013

Trigger responsavel por definir percentuais ou valores de custos operacionais por cada cliente dentro de uma
determinada cidade, quando este custo ainda nao fora definido.';

SET TERM ^ ;

CREATE TRIGGER TG_CLIENTE_CUSTO_OPER FOR TBCLIENTE
ACTIVE AFTER INSERT OR UPDATE POSITION 10 
AS
  declare variable empresa Varchar(18);
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    for
      Select distinct
          v.codemp
      from TBVENDAS v
        inner join TBCLIENTE c on (c.cnpj = v.codcli)
        inner join TBCONFIGURACAO f on (f.empresa = v.codemp)
      where f.custo_oper_calcular = 1
        and v.ano    = extract(Year from current_date)
        and v.codcli = new.cnpj
        and ((v.custo_oper_frete is null) or (v.custo_oper_outros is null))
      Into
          empresa
    do
    begin

      Update TBVENDAS vd Set
          vd.custo_oper_percentual = new.custo_oper_percentual
        , vd.custo_oper_frete      = new.custo_oper_frete
        , vd.custo_oper_outros     = new.custo_oper_outros
      where vd.ano = extract(Year from current_date)
        and ((vd.custo_oper_frete is null) or (vd.custo_oper_outros is null))
        and vd.codemp = :empresa
        and vd.codcli = new.cnpj;

    end
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CLIENTE_CUSTO_OPER
'Trigger Definir Custo Operacional (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2013

Trigger responsavel por definir percentuais ou valores de custos operacionais por cada venda realizada para um
determinado empresa/cliente, quando este custo ainda nao fora definido.';

SET TERM ^ ;

CREATE TRIGGER TG_CLIENTE_GERAR_FORNECEDOR FOR TBCLIENTE
ACTIVE AFTER INSERT OR UPDATE POSITION 1 
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem = new.cnpj
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , TRANSPORTADORA
        , DTCAD
        , CLIENTE_ORIGEM
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , current_date
        , new.cnpj
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.cliente_origem =  new.cnpj
      where f.codforn = :codigo_forn;
    end 
  end 
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CLIENTE_GERAR_FORNECEDOR
'Trigger Gerar Fornecedor do Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2013

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente ao registro do clientes quando for
permitido para este gerar NF-e de devolucao.';

SET TERM ^ ;

CREATE TRIGGER TG_VENDAS_CUSTO_OPERACIONAL FOR TBVENDAS
ACTIVE BEFORE UPDATE POSITION 3 
AS
  declare variable gerar_custo_oper      Smallint;
  declare variable custo_oper_percentual Smallint;
  declare variable custo_oper_frete      Numeric(15,4);
  declare variable custo_oper_outros     Numeric(15,4);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    /* Buscar FLAG de controle */
    Select
      coalesce(c.custo_oper_calcular, 0)
    from TBCONFIGURACAO c
    where c.empresa = new.codemp
    Into
      gerar_custo_oper;

    /* Buscar valores para calculo de custo operacional caso a empresa esteja configurada para este processo */
    if ( :gerar_custo_oper = 1 ) then
    begin
      Select First 1
          c.custo_oper_percentual
        , c.custo_oper_frete
        , c.custo_oper_outros
      from TBCLIENTE c
      where c.cnpj = new.codcli
      Into
          custo_oper_percentual
        , custo_oper_frete
        , custo_oper_outros;

      new.custo_oper_percentual = :custo_oper_percentual;
      new.custo_oper_frete      = :custo_oper_frete;
      new.custo_oper_outros     = :custo_oper_outros;
    end 
  end
end
^


/* Altering existing trigger... */
ALTER TRIGGER TG_VENDAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , reserva
        , valor_produto
    do
    begin
      reserva = :reserva - :Quantidade;
      estoque = :Estoque - :Quantidade;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Reserva = :Reserva
        , p.Qtde    = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'SAIDA - VENDA'
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_VENDAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
    do
    begin
      estoque = :Estoque + :Quantidade;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - VENDA CANCELADA'
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
      , r.enviado  = 0 -- Enviar boleto novamente para o banco
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;
     
  end 
end
^

SET TERM ; ^

ALTER TABLE TBCIDADE ALTER COLUMN CID_COD POSITION 1;

ALTER TABLE TBCIDADE ALTER COLUMN CID_NOME POSITION 2;

ALTER TABLE TBCIDADE ALTER COLUMN EST_COD POSITION 3;

ALTER TABLE TBCIDADE ALTER COLUMN CID_SIAFI POSITION 4;

ALTER TABLE TBCIDADE ALTER COLUMN CID_IBGE POSITION 5;

ALTER TABLE TBCIDADE ALTER COLUMN CID_DDD POSITION 6;

ALTER TABLE TBCIDADE ALTER COLUMN CID_CEP_INICIAL POSITION 7;

ALTER TABLE TBCIDADE ALTER COLUMN CID_CEP_FINAL POSITION 8;

ALTER TABLE TBCIDADE ALTER COLUMN CUSTO_OPER_PERCENTUAL POSITION 9;

ALTER TABLE TBCIDADE ALTER COLUMN CUSTO_OPER_FRETE POSITION 10;

ALTER TABLE TBCIDADE ALTER COLUMN CUSTO_OPER_OUTROS POSITION 11;

ALTER TABLE TBCLIENTE ALTER COLUMN CODIGO POSITION 1;

ALTER TABLE TBCLIENTE ALTER COLUMN PESSOA_FISICA POSITION 2;

ALTER TABLE TBCLIENTE ALTER COLUMN CNPJ POSITION 3;

ALTER TABLE TBCLIENTE ALTER COLUMN NOME POSITION 4;

ALTER TABLE TBCLIENTE ALTER COLUMN INSCEST POSITION 5;

ALTER TABLE TBCLIENTE ALTER COLUMN INSCMUN POSITION 6;

ALTER TABLE TBCLIENTE ALTER COLUMN ENDER POSITION 7;

ALTER TABLE TBCLIENTE ALTER COLUMN COMPLEMENTO POSITION 8;

ALTER TABLE TBCLIENTE ALTER COLUMN BAIRRO POSITION 9;

ALTER TABLE TBCLIENTE ALTER COLUMN CEP POSITION 10;

ALTER TABLE TBCLIENTE ALTER COLUMN CIDADE POSITION 11;

ALTER TABLE TBCLIENTE ALTER COLUMN UF POSITION 12;

ALTER TABLE TBCLIENTE ALTER COLUMN FONE POSITION 13;

ALTER TABLE TBCLIENTE ALTER COLUMN FONECEL POSITION 14;

ALTER TABLE TBCLIENTE ALTER COLUMN FONECOMERC POSITION 15;

ALTER TABLE TBCLIENTE ALTER COLUMN EMAIL POSITION 16;

ALTER TABLE TBCLIENTE ALTER COLUMN SITE POSITION 17;

ALTER TABLE TBCLIENTE ALTER COLUMN TLG_TIPO POSITION 18;

ALTER TABLE TBCLIENTE ALTER COLUMN LOG_COD POSITION 19;

ALTER TABLE TBCLIENTE ALTER COLUMN BAI_COD POSITION 20;

ALTER TABLE TBCLIENTE ALTER COLUMN CID_COD POSITION 21;

ALTER TABLE TBCLIENTE ALTER COLUMN EST_COD POSITION 22;

ALTER TABLE TBCLIENTE ALTER COLUMN NUMERO_END POSITION 23;

ALTER TABLE TBCLIENTE ALTER COLUMN PAIS_ID POSITION 24;

ALTER TABLE TBCLIENTE ALTER COLUMN VALOR_LIMITE_COMPRA POSITION 25;

ALTER TABLE TBCLIENTE ALTER COLUMN BLOQUEADO POSITION 26;

ALTER TABLE TBCLIENTE ALTER COLUMN BLOQUEADO_DATA POSITION 27;

ALTER TABLE TBCLIENTE ALTER COLUMN BLOQUEADO_MOTIVO POSITION 28;

ALTER TABLE TBCLIENTE ALTER COLUMN BLOQUEADO_USUARIO POSITION 29;

ALTER TABLE TBCLIENTE ALTER COLUMN DESBLOQUEADO_DATA POSITION 30;

ALTER TABLE TBCLIENTE ALTER COLUMN DTCAD POSITION 31;

ALTER TABLE TBCLIENTE ALTER COLUMN VENDEDOR_COD POSITION 32;

ALTER TABLE TBCLIENTE ALTER COLUMN USUARIO POSITION 33;

ALTER TABLE TBCLIENTE ALTER COLUMN EMITIR_NFE_DEVOLUCAO POSITION 34;

ALTER TABLE TBCLIENTE ALTER COLUMN CUSTO_OPER_PERCENTUAL POSITION 35;

ALTER TABLE TBCLIENTE ALTER COLUMN CUSTO_OPER_FRETE POSITION 36;

ALTER TABLE TBCLIENTE ALTER COLUMN CUSTO_OPER_OUTROS POSITION 37;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMPRESA POSITION 1;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_CONTA POSITION 2;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SENHA POSITION 3;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_POP POSITION 4;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SMTP POSITION 5;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SMTP_PORTA POSITION 6;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_REQUER_AUTENTICACAO POSITION 7;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_CONEXAO_SSL POSITION 8;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_ASSUNTO_PADRAO POSITION 9;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_MENSAGEM_PADRAO POSITION 10;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_SOLICITA_DH_SAIDA POSITION 11;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_IMPRIMIR_COD_CLIENTE POSITION 12;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN CUSTO_OPER_CALCULAR POSITION 13;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CODFORN POSITION 1;

ALTER TABLE TBFORNECEDOR ALTER COLUMN PESSOA_FISICA POSITION 2;

ALTER TABLE TBFORNECEDOR ALTER COLUMN NOMEFORN POSITION 3;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CNPJ POSITION 4;

ALTER TABLE TBFORNECEDOR ALTER COLUMN INSCEST POSITION 5;

ALTER TABLE TBFORNECEDOR ALTER COLUMN INSCMUN POSITION 6;

ALTER TABLE TBFORNECEDOR ALTER COLUMN ENDER POSITION 7;

ALTER TABLE TBFORNECEDOR ALTER COLUMN COMPLEMENTO POSITION 8;

ALTER TABLE TBFORNECEDOR ALTER COLUMN NUMERO_END POSITION 9;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CEP POSITION 10;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CIDADE POSITION 11;

ALTER TABLE TBFORNECEDOR ALTER COLUMN UF POSITION 12;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CONTATO POSITION 13;

ALTER TABLE TBFORNECEDOR ALTER COLUMN FONE POSITION 14;

ALTER TABLE TBFORNECEDOR ALTER COLUMN FONECEL POSITION 15;

ALTER TABLE TBFORNECEDOR ALTER COLUMN FONEFAX POSITION 16;

ALTER TABLE TBFORNECEDOR ALTER COLUMN EMAIL POSITION 17;

ALTER TABLE TBFORNECEDOR ALTER COLUMN SITE POSITION 18;

ALTER TABLE TBFORNECEDOR ALTER COLUMN TLG_TIPO POSITION 19;

ALTER TABLE TBFORNECEDOR ALTER COLUMN LOG_COD POSITION 20;

ALTER TABLE TBFORNECEDOR ALTER COLUMN BAI_COD POSITION 21;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CID_COD POSITION 22;

ALTER TABLE TBFORNECEDOR ALTER COLUMN EST_COD POSITION 23;

ALTER TABLE TBFORNECEDOR ALTER COLUMN PAIS_ID POSITION 24;

ALTER TABLE TBFORNECEDOR ALTER COLUMN GRF_COD POSITION 25;

ALTER TABLE TBFORNECEDOR ALTER COLUMN TRANSPORTADORA POSITION 26;

ALTER TABLE TBFORNECEDOR ALTER COLUMN DTCAD POSITION 27;

ALTER TABLE TBFORNECEDOR ALTER COLUMN CLIENTE_ORIGEM POSITION 28;

ALTER TABLE TBVENDAS ALTER COLUMN ANO POSITION 1;

ALTER TABLE TBVENDAS ALTER COLUMN CODCONTROL POSITION 2;

ALTER TABLE TBVENDAS ALTER COLUMN CODEMP POSITION 3;

ALTER TABLE TBVENDAS ALTER COLUMN CODCLI POSITION 4;

ALTER TABLE TBVENDAS ALTER COLUMN DTVENDA POSITION 5;

ALTER TABLE TBVENDAS ALTER COLUMN STATUS POSITION 6;

ALTER TABLE TBVENDAS ALTER COLUMN TOTALVENDA_BRUTA POSITION 7;

ALTER TABLE TBVENDAS ALTER COLUMN DESCONTO POSITION 8;

ALTER TABLE TBVENDAS ALTER COLUMN TOTALVENDA POSITION 9;

ALTER TABLE TBVENDAS ALTER COLUMN TOTALCUSTO POSITION 10;

ALTER TABLE TBVENDAS ALTER COLUMN DTFINALIZACAO_VENDA POSITION 11;

ALTER TABLE TBVENDAS ALTER COLUMN OBS POSITION 12;

ALTER TABLE TBVENDAS ALTER COLUMN FORMAPAG POSITION 13;

ALTER TABLE TBVENDAS ALTER COLUMN FATDIAS POSITION 14;

ALTER TABLE TBVENDAS ALTER COLUMN SERIE POSITION 15;

ALTER TABLE TBVENDAS ALTER COLUMN NFE POSITION 16;

ALTER TABLE TBVENDAS ALTER COLUMN DATAEMISSAO POSITION 17;

ALTER TABLE TBVENDAS ALTER COLUMN HORAEMISSAO POSITION 18;

ALTER TABLE TBVENDAS ALTER COLUMN CFOP POSITION 19;

ALTER TABLE TBVENDAS ALTER COLUMN VERIFICADOR_NFE POSITION 20;

ALTER TABLE TBVENDAS ALTER COLUMN XML_NFE POSITION 21;

ALTER TABLE TBVENDAS ALTER COLUMN VENDEDOR_COD POSITION 22;

ALTER TABLE TBVENDAS ALTER COLUMN USUARIO POSITION 23;

ALTER TABLE TBVENDAS ALTER COLUMN FORMAPAGTO_COD POSITION 24;

ALTER TABLE TBVENDAS ALTER COLUMN CONDICAOPAGTO_COD POSITION 25;

ALTER TABLE TBVENDAS ALTER COLUMN VENDA_PRAZO POSITION 26;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_01 POSITION 27;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_02 POSITION 28;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_03 POSITION 29;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_04 POSITION 30;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_05 POSITION 31;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_06 POSITION 32;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_07 POSITION 33;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_08 POSITION 34;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_09 POSITION 35;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_10 POSITION 36;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_11 POSITION 37;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_12 POSITION 38;

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_ANO POSITION 39;

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_NUMERO POSITION 40;

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_RECIBO POSITION 41;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_ENVIADA POSITION 42;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_USUARIO POSITION 43;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_DATAHORA POSITION 44;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_MOTIVO POSITION 45;

ALTER TABLE TBVENDAS ALTER COLUMN XML_NFE_FILENAME POSITION 46;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_MODALIDADE_FRETE POSITION 47;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_TRANSPORTADORA POSITION 48;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_PLACA_VEICULO POSITION 49;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_PLACA_UF POSITION 50;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_PLACA_RNTC POSITION 51;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_BASE_ICMS POSITION 52;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_ICMS POSITION 53;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_BASE_ICMS_SUBST POSITION 54;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_ICMS_SUBST POSITION 55;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_PRODUTO POSITION 56;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_FRETE POSITION 57;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_SEGURO POSITION 58;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_DESCONTO POSITION 59;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_II POSITION 60;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_IPI POSITION 61;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_PIS POSITION 62;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_COFINS POSITION 63;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_OUTROS POSITION 64;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_NOTA POSITION 65;

ALTER TABLE TBVENDAS ALTER COLUMN CUSTO_OPER_PERCENTUAL POSITION 66;

ALTER TABLE TBVENDAS ALTER COLUMN CUSTO_OPER_FRETE POSITION 67;

ALTER TABLE TBVENDAS ALTER COLUMN CUSTO_OPER_OUTROS POSITION 68;

/* Create(Add) privilege */
GRANT ALL ON MON$ATTACHMENTS TO PUBLIC;

GRANT ALL ON MON$ATTACHMENTS TO SYSDBA;

GRANT ALL ON MON$CALL_STACK TO PUBLIC;

GRANT ALL ON MON$CALL_STACK TO SYSDBA;

GRANT ALL ON MON$DATABASE TO PUBLIC;

GRANT ALL ON MON$DATABASE TO SYSDBA;

GRANT ALL ON MON$IO_STATS TO PUBLIC;

GRANT ALL ON MON$IO_STATS TO SYSDBA;

GRANT ALL ON MON$RECORD_STATS TO PUBLIC;

GRANT ALL ON MON$RECORD_STATS TO SYSDBA;

GRANT ALL ON MON$STATEMENTS TO PUBLIC;

GRANT ALL ON MON$STATEMENTS TO SYSDBA;

GRANT ALL ON MON$TRANSACTIONS TO PUBLIC;

GRANT ALL ON MON$TRANSACTIONS TO SYSDBA;


