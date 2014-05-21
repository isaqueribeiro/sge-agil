


/*------ SYSDBA 17/12/2013 11:37:12 --------*/

ALTER TABLE TBCLIENTE
    ADD TIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBCLIENTE.TIPO IS
'Tipo:
0 - Nao se aplica
1 - Matriz
2 - Filial';

alter table TBCLIENTE
alter CODIGO position 1;

alter table TBCLIENTE
alter TIPO position 2;

alter table TBCLIENTE
alter PESSOA_FISICA position 3;

alter table TBCLIENTE
alter CNPJ position 4;

alter table TBCLIENTE
alter NOME position 5;

alter table TBCLIENTE
alter INSCEST position 6;

alter table TBCLIENTE
alter INSCMUN position 7;

alter table TBCLIENTE
alter ENDER position 8;

alter table TBCLIENTE
alter COMPLEMENTO position 9;

alter table TBCLIENTE
alter BAIRRO position 10;

alter table TBCLIENTE
alter CEP position 11;

alter table TBCLIENTE
alter CIDADE position 12;

alter table TBCLIENTE
alter UF position 13;

alter table TBCLIENTE
alter FONE position 14;

alter table TBCLIENTE
alter FONECEL position 15;

alter table TBCLIENTE
alter FONECOMERC position 16;

alter table TBCLIENTE
alter EMAIL position 17;

alter table TBCLIENTE
alter SITE position 18;

alter table TBCLIENTE
alter TLG_TIPO position 19;

alter table TBCLIENTE
alter LOG_COD position 20;

alter table TBCLIENTE
alter BAI_COD position 21;

alter table TBCLIENTE
alter CID_COD position 22;

alter table TBCLIENTE
alter EST_COD position 23;

alter table TBCLIENTE
alter NUMERO_END position 24;

alter table TBCLIENTE
alter PAIS_ID position 25;

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 26;

alter table TBCLIENTE
alter BLOQUEADO position 27;

alter table TBCLIENTE
alter BLOQUEADO_DATA position 28;

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 29;

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 30;

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 31;

alter table TBCLIENTE
alter DTCAD position 32;

alter table TBCLIENTE
alter VENDEDOR_COD position 33;

alter table TBCLIENTE
alter USUARIO position 34;

alter table TBCLIENTE
alter EMITIR_NFE_DEVOLUCAO position 35;

alter table TBCLIENTE
alter CUSTO_OPER_PERCENTUAL position 36;

alter table TBCLIENTE
alter CUSTO_OPER_FRETE position 37;

alter table TBCLIENTE
alter CUSTO_OPER_OUTROS position 38;

alter table TBCLIENTE
alter ENTREGA_FRACIONADA_VENDA position 39;




/*------ SYSDBA 17/12/2013 11:38:20 --------*/

ALTER TABLE TBFORNECEDOR
    ADD TIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBFORNECEDOR.TIPO IS
'Tipo:
0 - Nao se aplica
1 - NMatriz
2 - Filial';

alter table TBFORNECEDOR
alter CODFORN position 1;

alter table TBFORNECEDOR
alter TIPO position 2;

alter table TBFORNECEDOR
alter PESSOA_FISICA position 3;

alter table TBFORNECEDOR
alter NOMEFORN position 4;

alter table TBFORNECEDOR
alter CNPJ position 5;

alter table TBFORNECEDOR
alter INSCEST position 6;

alter table TBFORNECEDOR
alter INSCMUN position 7;

alter table TBFORNECEDOR
alter ENDER position 8;

alter table TBFORNECEDOR
alter COMPLEMENTO position 9;

alter table TBFORNECEDOR
alter NUMERO_END position 10;

alter table TBFORNECEDOR
alter CEP position 11;

alter table TBFORNECEDOR
alter CIDADE position 12;

alter table TBFORNECEDOR
alter UF position 13;

alter table TBFORNECEDOR
alter CONTATO position 14;

alter table TBFORNECEDOR
alter FONE position 15;

alter table TBFORNECEDOR
alter FONECEL position 16;

alter table TBFORNECEDOR
alter FONEFAX position 17;

alter table TBFORNECEDOR
alter EMAIL position 18;

alter table TBFORNECEDOR
alter SITE position 19;

alter table TBFORNECEDOR
alter TLG_TIPO position 20;

alter table TBFORNECEDOR
alter LOG_COD position 21;

alter table TBFORNECEDOR
alter BAI_COD position 22;

alter table TBFORNECEDOR
alter CID_COD position 23;

alter table TBFORNECEDOR
alter EST_COD position 24;

alter table TBFORNECEDOR
alter PAIS_ID position 25;

alter table TBFORNECEDOR
alter GRF_COD position 26;

alter table TBFORNECEDOR
alter TRANSPORTADORA position 27;

alter table TBFORNECEDOR
alter DTCAD position 28;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM position 29;




/*------ SYSDBA 17/12/2013 11:39:29 --------*/

ALTER TABLE TBFORNECEDOR
    ADD CLIENTE_ORIGEM_COD DMN_INTEGER_N;

COMMENT ON COLUMN TBFORNECEDOR.CLIENTE_ORIGEM IS
'FORNECEDOR corresponde a CLIENTE cadastrado (CPF/CNPJ).';

COMMENT ON COLUMN TBFORNECEDOR.CLIENTE_ORIGEM_COD IS
'FORNECEDOR corresponde a CLIENTE cadastrado (Codigo).';




/*------ SYSDBA 17/12/2013 11:41:22 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
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
    where f.cliente_origem_cod = new.codigo
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
        , CLIENTE_ORIGEM_COD
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
        , new.codigo
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
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^


/*------ SYSDBA 17/12/2013 11:44:43 --------*/

execute block
as
  declare variable cliente_origem varchar(18);
  declare variable cliente_origem_cod integer;
begin
  for
    Select
      f.cliente_origem
    from TBFORNECEDOR f
    where f.cliente_origem_cod is null
      and f.cliente_origem is not null
    Into
      cliente_origem
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_origem
    Into
      cliente_origem_cod;

    Update TBFORNECEDOR f Set
      f.cliente_origem_cod = :cliente_origem_cod
    where f.cliente_origem = :cliente_origem;
  end 
end;
/*------ SYSDBA 17/12/2013 11:44:48 --------*/

COMMIT WORK;



/*------ SYSDBA 17/12/2013 11:48:23 --------*/

COMMENT ON COLUMN TBVENDAS.CODCLI IS
'CPF/CNPJ do Cliente.';




/*------ SYSDBA 17/12/2013 11:48:37 --------*/

COMMENT ON COLUMN TBVENDAS.CODEMP IS
'CNPJ da Empresa.';




/*------ SYSDBA 17/12/2013 11:49:19 --------*/

ALTER TABLE TBVENDAS
    ADD CODCLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDAS.CODCLIENTE IS
'Codigo do Cliente.';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLIENTE position 4;

alter table TBVENDAS
alter CODCLI position 5;

alter table TBVENDAS
alter DTVENDA position 6;

alter table TBVENDAS
alter COMPETENCIA position 7;

alter table TBVENDAS
alter STATUS position 8;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

alter table TBVENDAS
alter DESCONTO position 10;

alter table TBVENDAS
alter TOTALVENDA position 11;

alter table TBVENDAS
alter TOTALCUSTO position 12;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 13;

alter table TBVENDAS
alter OBS position 14;

alter table TBVENDAS
alter FORMAPAG position 15;

alter table TBVENDAS
alter FATDIAS position 16;

alter table TBVENDAS
alter SERIE position 17;

alter table TBVENDAS
alter NFE position 18;

alter table TBVENDAS
alter DATAEMISSAO position 19;

alter table TBVENDAS
alter HORAEMISSAO position 20;

alter table TBVENDAS
alter CFOP position 21;

alter table TBVENDAS
alter VERIFICADOR_NFE position 22;

alter table TBVENDAS
alter XML_NFE position 23;

alter table TBVENDAS
alter VENDEDOR_COD position 24;

alter table TBVENDAS
alter USUARIO position 25;

alter table TBVENDAS
alter FORMAPAGTO_COD position 26;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 27;

alter table TBVENDAS
alter VENDA_PRAZO position 28;

alter table TBVENDAS
alter PRAZO_01 position 29;

alter table TBVENDAS
alter PRAZO_02 position 30;

alter table TBVENDAS
alter PRAZO_03 position 31;

alter table TBVENDAS
alter PRAZO_04 position 32;

alter table TBVENDAS
alter PRAZO_05 position 33;

alter table TBVENDAS
alter PRAZO_06 position 34;

alter table TBVENDAS
alter PRAZO_07 position 35;

alter table TBVENDAS
alter PRAZO_08 position 36;

alter table TBVENDAS
alter PRAZO_09 position 37;

alter table TBVENDAS
alter PRAZO_10 position 38;

alter table TBVENDAS
alter PRAZO_11 position 39;

alter table TBVENDAS
alter PRAZO_12 position 40;

alter table TBVENDAS
alter LOTE_NFE_ANO position 41;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 42;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 43;

alter table TBVENDAS
alter NFE_ENVIADA position 44;

alter table TBVENDAS
alter CANCEL_USUARIO position 45;

alter table TBVENDAS
alter CANCEL_DATAHORA position 46;

alter table TBVENDAS
alter CANCEL_MOTIVO position 47;

alter table TBVENDAS
alter XML_NFE_FILENAME position 48;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 49;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 50;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 51;

alter table TBVENDAS
alter NFE_PLACA_UF position 52;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 53;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 54;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 55;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 56;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 57;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 58;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 59;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 60;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 61;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 62;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 63;

alter table TBVENDAS
alter NFE_VALOR_PIS position 64;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 65;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 66;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 67;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 68;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 69;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 70;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 71;




/*------ SYSDBA 17/12/2013 11:52:08 --------*/

ALTER TABLE TVENDASITENS
    ADD CODCLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TVENDASITENS.CODCLIENTE IS
'Codigo do Cliente.';

COMMENT ON COLUMN TVENDASITENS.CODCLI IS
'CPF/CNPJ do Cliente.';

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter SEQ position 3;

alter table TVENDASITENS
alter CODPROD position 4;

alter table TVENDASITENS
alter CODEMP position 5;

alter table TVENDASITENS
alter CODCLIENTE position 6;

alter table TVENDASITENS
alter CODCLI position 7;

alter table TVENDASITENS
alter DTVENDA position 8;

alter table TVENDASITENS
alter QTDE position 9;

alter table TVENDASITENS
alter PUNIT position 10;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 11;

alter table TVENDASITENS
alter DESCONTO position 12;

alter table TVENDASITENS
alter DESCONTO_VALOR position 13;

alter table TVENDASITENS
alter PFINAL position 14;

alter table TVENDASITENS
alter QTDEFINAL position 15;

alter table TVENDASITENS
alter UNID_COD position 16;

alter table TVENDASITENS
alter CFOP_COD position 17;

alter table TVENDASITENS
alter CST position 18;

alter table TVENDASITENS
alter CSOSN position 19;

alter table TVENDASITENS
alter ALIQUOTA position 20;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 21;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 22;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 23;

alter table TVENDASITENS
alter VALOR_IPI position 24;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 25;

alter table TVENDASITENS
alter TOTAL_BRUTO position 26;

alter table TVENDASITENS
alter TOTAL_DESCONTO position 27;

alter table TVENDASITENS
alter TOTAL_LIQUIDO position 28;




/*------ SYSDBA 17/12/2013 11:58:15 --------*/

ALTER TABLE TBPEDIDOS
    ADD CODCLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TBPEDIDOS.CODCLIENTE IS
'Codigo do Cliente.';

COMMENT ON COLUMN TBPEDIDOS.CODCLI IS
'CPF/CNPJ do Cliente.';

alter table TBPEDIDOS
alter COD position 1;

alter table TBPEDIDOS
alter DTVENDA position 2;

alter table TBPEDIDOS
alter CODCLIENTE position 3;

alter table TBPEDIDOS
alter CODCLI position 4;

alter table TBPEDIDOS
alter CODVENDED position 5;

alter table TBPEDIDOS
alter CODFPGTO position 6;

alter table TBPEDIDOS
alter TOTAL position 7;




/*------ SYSDBA 17/12/2013 11:58:22 --------*/

ALTER TABLE TBPEDIDOS DROP CONSTRAINT FK_TBPEDIDOS_1;




/*------ SYSDBA 17/12/2013 12:51:40 --------*/

ALTER TABLE TBFORNECEDOR DROP CONSTRAINT FK_TBFORNECEDOR_CLIENTE;




/*------ SYSDBA 17/12/2013 12:51:51 --------*/

ALTER TABLE TBVENDAS DROP CONSTRAINT FK_TBVENDAS_CLIENTE;




/*------ SYSDBA 17/12/2013 12:52:01 --------*/

ALTER TABLE TVENDASITENS DROP CONSTRAINT FK_TVENDASITENS_CLIENTE;


/*------ SYSDBA 17/12/2013 13:12:57 --------*/

execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      v.codcli
    from TBVENDAS v
    where v.codcliente is null
    Into
      cliente_cnpj
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_cnpj
    Into
      cliente_codi;

    Update TBVENDAS v Set
      v.codcliente = :cliente_codi
    where v.codcli = :cliente_cnpj;

    Update TVENDASITENS vi Set
      vi.codcliente = :cliente_codi
    where vi.codcli = :cliente_cnpj;
  end 
end;
/*------ SYSDBA 17/12/2013 13:13:28 --------*/

COMMIT WORK;



/*------ SYSDBA 17/12/2013 13:16:22 --------*/

ALTER TABLE TBCONTREC
    ADD CLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TBCONTREC.CLIENTE IS
'Codigo do Cliente.';

COMMENT ON COLUMN TBCONTREC.CNPJ IS
'CPF/CNPJ do Cliente.';

alter table TBCONTREC
alter ANOLANC position 1;

alter table TBCONTREC
alter NUMLANC position 2;

alter table TBCONTREC
alter EMPRESA position 3;

alter table TBCONTREC
alter CLIENTE position 4;

alter table TBCONTREC
alter CNPJ position 5;

alter table TBCONTREC
alter FORMA_PAGTO position 6;

alter table TBCONTREC
alter TIPPAG position 7;

alter table TBCONTREC
alter HISTORIC position 8;

alter table TBCONTREC
alter NUMREC position 9;

alter table TBCONTREC
alter DTEMISS position 10;

alter table TBCONTREC
alter DTVENC position 11;

alter table TBCONTREC
alter DTREC position 12;

alter table TBCONTREC
alter DOCBAIX position 13;

alter table TBCONTREC
alter VALORREC position 14;

alter table TBCONTREC
alter VALORMULTA position 15;

alter table TBCONTREC
alter VALORRECTOT position 16;

alter table TBCONTREC
alter NUMCONTRATO position 17;

alter table TBCONTREC
alter PARCELA position 18;

alter table TBCONTREC
alter STATUS position 19;

alter table TBCONTREC
alter CODBANCO position 20;

alter table TBCONTREC
alter NOSSONUMERO position 21;

alter table TBCONTREC
alter REMESSA position 22;

alter table TBCONTREC
alter VALORSALDO position 23;

alter table TBCONTREC
alter PERCENTJUROS position 24;

alter table TBCONTREC
alter PERCENTMULTA position 25;

alter table TBCONTREC
alter PERCENTDESCONTO position 26;

alter table TBCONTREC
alter DATAPROCESSOBOLETO position 27;

alter table TBCONTREC
alter BAIXADO position 28;

alter table TBCONTREC
alter ENVIADO position 29;

alter table TBCONTREC
alter ANOVENDA position 30;

alter table TBCONTREC
alter NUMVENDA position 31;

alter table TBCONTREC
alter SITUACAO position 32;




/*------ SYSDBA 17/12/2013 13:16:33 --------*/

ALTER TABLE TBCONTREC DROP CONSTRAINT FK_TBCONTREC_1;




/*------ SYSDBA 17/12/2013 13:18:03 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
    ADD CLIENTE_COD DMN_INTEGER_N;

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.CLIENTE_COD IS
'Codigo do Cliente.';

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.CLIENTE IS
'CPF/CNPJ do Cliente.';

alter table TBCAIXA_MOVIMENTO
alter ANO position 1;

alter table TBCAIXA_MOVIMENTO
alter NUMERO position 2;

alter table TBCAIXA_MOVIMENTO
alter CAIXA_ANO position 3;

alter table TBCAIXA_MOVIMENTO
alter CAIXA_NUM position 4;

alter table TBCAIXA_MOVIMENTO
alter CONTA_CORRENTE position 5;

alter table TBCAIXA_MOVIMENTO
alter FORMA_PAGTO position 6;

alter table TBCAIXA_MOVIMENTO
alter DATAHORA position 7;

alter table TBCAIXA_MOVIMENTO
alter TIPO position 8;

alter table TBCAIXA_MOVIMENTO
alter HISTORICO position 9;

alter table TBCAIXA_MOVIMENTO
alter VALOR position 10;

alter table TBCAIXA_MOVIMENTO
alter SITUACAO position 11;

alter table TBCAIXA_MOVIMENTO
alter VENDA_ANO position 12;

alter table TBCAIXA_MOVIMENTO
alter VENDA_NUM position 13;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE_COD position 14;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE position 15;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_ANO position 16;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_NUM position 17;

alter table TBCAIXA_MOVIMENTO
alter EMPRESA position 18;

alter table TBCAIXA_MOVIMENTO
alter FORNECEDOR position 19;

alter table TBCAIXA_MOVIMENTO
alter USUARIO position 20;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_ANO position 21;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_NUM position 22;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_ANO position 23;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_NUM position 24;




/*------ SYSDBA 17/12/2013 13:18:12 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_CL;




/*------ SYSDBA 17/12/2013 13:20:29 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CODIGO_CLIENTE integer)
returns (
    VALOR_LIMITE numeric(15,2),
    VALOR_COMPRAS_ABERTAS numeric(15,2),
    VALOR_LIMITE_DISPONIVEL numeric(15,2))
as
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.cliente = c.codigo and r.Baixado = 0 and r.Parcela > 0) and ((r.Status is null) or (r.Situacao = 1)) )
    left join TBFORMPAGTO f on (f.Cod = r.Forma_pagto and f.Debitar_limite_cliente = 1)
  where c.codigo = :codigo_cliente
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:23:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_REC (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.cliente
    , c.cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.codigo = r.cliente)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , CLIENTE_COD
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :cliente_cod
    , :cliente_cnpj
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:24:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.cliente
    , r.Cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.codigo = r.cliente)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente_Cod
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :cliente_cod
    , :cliente_cnpj
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:25:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.cliente
    , c.cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.codigo = r.cliente)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente_Cod
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :cliente_cod
    , :cliente_cnpj
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:27:30 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER (
    ANOVENDA smallint,
    NUMVENDA integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:27:47 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER (
    ANOVENDA smallint,
    NUMVENDA integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:27:55 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER (
    ANOVENDA smallint,
    NUMVENDA integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:27:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER (
    ANOVENDA smallint,
    NUMVENDA integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:30:40 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_TITULOS (
    ANOVENDA smallint,
    NUMVENDA integer)
returns (
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    DATA_FINALIZ_VENDA date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.codemp
      , x.codcliente
      , x.Codcli
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.Formapagto_cod
      , x.Dtfinalizacao_venda
    from TBVENDAS x
      inner join TBVENDAS_FORMAPAGTO v on (v.ano_venda = x.ano and v.controle_venda = x.codcontrol)
    where x.Ano        = :Anovenda
      and x.Codcontrol = :Numvenda
    into
        empresa
      , cliente_cod
      , cliente_cnpj
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end^

SET TERM ; ^


/*------ SYSDBA 17/12/2013 13:33:04 --------*/

execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      r.cnpj
    from TBCONTREC r
    where r.cliente is null
      and r.cnpj is not null
    Into
      cliente_cnpj
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_cnpj
    Into
      cliente_codi;

    Update TBCONTREC r Set
      r.cliente = :cliente_codi
    where r.cnpj = :cliente_cnpj;
  end 
end;
/*------ SYSDBA 17/12/2013 13:35:20 --------*/

execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      m.cliente
    from TBCAIXA_MOVIMENTO m
    where m.cliente_cod is null
      and m.cliente is not null
    Into
      cliente_cnpj
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_cnpj
    Into
      cliente_codi;

    Update TBCAIXA_MOVIMENTO m Set
      m.cliente_cod = :cliente_codi
    where m.cliente = :cliente_cnpj;
  end 
end;
/*------ SYSDBA 17/12/2013 13:35:25 --------*/

COMMIT WORK;



/*------ SYSDBA 17/12/2013 13:40:14 --------*/

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM DROP CONSTRAINT FK_TBCLIENTE_REQ_ITEM_CLI;




/*------ SYSDBA 17/12/2013 13:40:27 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_INTEGER_N'
where (RDB$FIELD_NAME = 'CODCLIENTE') and
(RDB$RELATION_NAME = 'TBCLIENTE_REQUISICAO_ITEM')
;




/*------ SYSDBA 17/12/2013 13:40:54 --------*/

ALTER TABLE TBCLIENTE_REQUISICAO DROP CONSTRAINT FK_TBCLIENTE_REQUISICAO_CLI;




/*------ SYSDBA 17/12/2013 13:41:07 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_INTEGER_N'
where (RDB$FIELD_NAME = 'CODCLIENTE') and
(RDB$RELATION_NAME = 'TBCLIENTE_REQUISICAO')
;




/*------ SYSDBA 17/12/2013 13:41:30 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE DROP CONSTRAINT FK_TBCLIENTE_ESTOQUE_CLI;




/*------ SYSDBA 17/12/2013 13:41:36 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE DROP CONSTRAINT PK_TBCLIENTE_ESTOQUE;




/*------ SYSDBA 17/12/2013 13:41:51 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_INTEGER_NN'
where (RDB$FIELD_NAME = 'COD_CLIENTE') and
(RDB$RELATION_NAME = 'TBCLIENTE_ESTOQUE')
;




/*------ SYSDBA 17/12/2013 13:42:16 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE
ADD CONSTRAINT PK_TBCLIENTE_ESTOQUE
PRIMARY KEY (COD_CLIENTE,COD_PRODUTO);




/*------ SYSDBA 17/12/2013 13:43:51 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_custo_oper for tbcliente
active after insert or update position 10
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
        and vd.codemp     = :empresa
        and vd.codcliente = new.codigo;

    end
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:44:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_custo_oper for tbcliente
active after insert or update position 10
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
        and v.ano        = extract(Year from current_date)
        and v.codcliente = new.codigo
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
        and vd.codemp     = :empresa
        and vd.codcliente = new.codigo;

    end
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:45:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_custo_oper for tbcliente
active after insert or update position 10
AS
  declare variable empresa Varchar(18);
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    for
      Select distinct
          v.codemp
      from TBVENDAS v
        inner join TBCLIENTE c on (c.codigo = v.codcliente)
        inner join TBCONFIGURACAO f on (f.empresa = v.codemp)
      where f.custo_oper_calcular = 1
        and v.ano        = extract(Year from current_date)
        and v.codcliente = new.codigo
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
        and vd.codemp     = :empresa
        and vd.codcliente = new.codigo;

    end
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:45:56 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_custo_operacional for tbvendas
active before update position 4
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
      where c.codigo = new.codcliente
      Into
          custo_oper_percentual
        , custo_oper_frete
        , custo_oper_outros;

      new.custo_oper_percentual = :custo_oper_percentual;
      new.custo_oper_frete      = :custo_oper_frete;
      new.custo_oper_outros     = :custo_oper_outros;
    end 
  end
end^

SET TERM ; ^




/*------ SYSDBA 17/12/2013 13:46:17 --------*/

ALTER TABLE TBCLIENTE DROP CONSTRAINT PK_TBCLIENTE;




/*------ SYSDBA 17/12/2013 13:46:32 --------*/

ALTER TABLE TBCLIENTE DROP CONSTRAINT UNQ_TBCLIENTE_CODIGO;




/*------ SYSDBA 17/12/2013 13:46:39 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT PK_TBCLIENTE
PRIMARY KEY (CODIGO);


/*------ SYSDBA 17/12/2013 13:47:46 --------*/

Update TBCLIENTE c Set
  c.tipo = 0
where c.tipo is null;
/*------ SYSDBA 17/12/2013 13:47:50 --------*/

COMMIT WORK;



/*------ SYSDBA 17/12/2013 13:52:43 --------*/

ALTER TABLE TBFORNECEDOR
ADD CONSTRAINT FK_TBFORNECEDOR_CLIENTE_COD
FOREIGN KEY (CLIENTE_ORIGEM_COD)
REFERENCES TBCLIENTE(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 17/12/2013 13:53:25 --------*/

ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_CLIENTE_COD
FOREIGN KEY (CODCLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:53:55 --------*/

ALTER TABLE TVENDASITENS
ADD CONSTRAINT FK_TVENDASITENS_CLIENTE_COD
FOREIGN KEY (CODCLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:54:25 --------*/

ALTER TABLE TBCONTREC
ADD CONSTRAINT FK_TBCONTREC_CLIENTE_COD
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:55:07 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_CL
FOREIGN KEY (CLIENTE_COD)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:55:37 --------*/

ALTER TABLE TBCLIENTE_REQUISICAO
ADD CONSTRAINT FK_TBCLIENTE_REQUISICAO_CLI
FOREIGN KEY (CODCLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:56:07 --------*/

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM
ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_CLI
FOREIGN KEY (CODCLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 13:56:32 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE
ADD CONSTRAINT FK_TBCLIENTE_ESTOQUE_CLI
FOREIGN KEY (COD_CLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 17/12/2013 14:24:49 --------*/

create view vw_tipo_cnpj ( Codigo, Descricao )
as
Select 0 as Codigo , 'Nao se aplica' as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Matriz'        as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Filial'        as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_CNPJ TO "PUBLIC";



/*------ SYSDBA 17/12/2013 15:36:34 --------*/

DROP VIEW VW_TIPO_CNPJ;

CREATE VIEW VW_TIPO_CNPJ(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'NAO SE APLICA' as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'MATRIZ'        as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'FILIAL'        as Descricao from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_CNPJ TO "PUBLIC";




/*------ SYSDBA 20/12/2013 11:43:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_cliente for tbvendas
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable quantidade integer;
  declare variable estoque integer;
  declare variable valor_medio numeric(15,4);
  declare variable valor_venda numeric(15,2);
begin

  /* Gerar Estoque para o Cliente na Finalizacao da Venda */

  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida
          , coalesce(c.quantidade, 0) -- Estoque
          , (coalesce(c.valor_medio, 0) * coalesce(c.quantidade, 0))
          , i.total_liquido
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , valor_medio
          , valor_venda
      do
      begin

        -- Recalcular valor medio ja existente
        if ( :estoque <= 0 ) then
          valor_medio = 0.0;

        -- Gerar novo valor medio
        valor_medio = (:valor_medio + :valor_venda) / (:quantidade + :estoque);

        if (not exists(
          Select
            ec.cod_cliente
          from TBCLIENTE_ESTOQUE ec
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto
        )) then
        begin

          -- Gerar Estoque
          Insert Into TBCLIENTE_ESTOQUE (
              cod_cliente
            , cod_produto
            , quantidade
            , valor_medio
            , usuario
            , ano_venda_ult
            , cod_venda_ult
          ) values (
              new.codcliente
            , :produto
            , :quantidade
            , :valor_medio
            , new.usuario
            , new.ano
            , new.codcontrol
          );

        end
        else
        begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
              ec.quantidade  = coalesce(:quantidade, 0) + coalesce(:estoque, 0)
            , ec.valor_medio = :valor_medio
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

        end 

      end 

    end
  end

  else

  /* Atualizar Estoque do Cliente no Cancelamento da Venda */

  if ( (coalesce(old.Status, 0) in (3, 4)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida cancelada
          , coalesce(c.quantidade, 0) -- Estoque
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
      do
      begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
            ec.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

      end

    end

  end

end^

SET TERM ; ^




/*------ SYSDBA 20/12/2013 14:42:45 --------*/

CREATE INDEX IDX_TBCLIENTE_CNPJ
ON TBCLIENTE (CNPJ);




/*------ SYSDBA 20/12/2013 14:43:18 --------*/

CREATE INDEX IDX_TBFORNECEDOR_CLI_CNPJ
ON TBFORNECEDOR (CLIENTE_ORIGEM);




/*------ SYSDBA 20/12/2013 14:43:49 --------*/

CREATE INDEX IDX_TBVENDAS_CLI_CNPJ
ON TBVENDAS (CODCLI);




/*------ SYSDBA 20/12/2013 14:44:29 --------*/

CREATE INDEX IDX_TVENDASITENS_CLI_CNPJ
ON TVENDASITENS (CODCLI);




/*------ SYSDBA 20/12/2013 14:44:59 --------*/

CREATE INDEX IDX_TBCONTREC_CLI_CNPJ
ON TBCONTREC (CNPJ);




/*------ SYSDBA 20/12/2013 14:45:31 --------*/

CREATE INDEX IDX_TBCAIXA_MOVIMENTO_CNPJ
ON TBCAIXA_MOVIMENTO (CLIENTE);




/*------ SYSDBA 16/01/2014 20:13:32 --------*/

CREATE TABLE TBFUNCAO_PERMISSAO (
    SISTEMA DMN_SMALLINT_NN NOT NULL,
    FUNCAO DMN_SMALLINT_NN NOT NULL,
    ROTINA DMN_VCHAR_10_KEY NOT NULL,
    ACESSO DMN_LOGICO DEFAULT 1);

ALTER TABLE TBFUNCAO_PERMISSAO
ADD CONSTRAINT PK_TBFUNCAO_PERMISSAO
PRIMARY KEY (SISTEMA,FUNCAO,ROTINA);




/*------ SYSDBA 16/01/2014 20:13:42 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.SISTEMA IS
'Sistema';




/*------ SYSDBA 16/01/2014 20:13:51 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.FUNCAO IS
'Funcao/Perfil';




/*------ SYSDBA 16/01/2014 20:13:55 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.ROTINA IS
'Rotina';




/*------ SYSDBA 16/01/2014 20:14:07 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.ACESSO IS
'Acesso permitido:
0 - Nao
1 - Sim';

GRANT ALL ON TBFUNCAO_PERMISSAO TO "PUBLIC";



/*------ SYSDBA 16/01/2014 20:20:13 --------*/

SET TERM ^ ;

create or alter procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:20:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:21:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_FUNCAO_PERMISSAO IS 'Autor   :   Isaque Marinho Ribeiro
Data    :   16/01/2014

Store procedure responsavel pela insercao e/ou atualizacao de permissoes de acesso a rotinas dos sistemas
por funcao/perfil de acesso.';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:22:58 --------*/

ALTER TABLE TBFUNCAO_PERMISSAO
ADD CONSTRAINT FK_TBFUNCAO_PERMISSAO_FUN
FOREIGN KEY (FUNCAO)
REFERENCES TBFUNCAO(COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 20:56:36 --------*/

CREATE TABLE SYS_ROTINA (
    ROT_COD DMN_VCHAR_10_KEY NOT NULL,
    ROT_TIPO DMN_SMALLINT_NN DEFAULT 1,
    ROT_DESCRICAO DMN_VCHAR_250,
    ROT_COD_PAI DMN_VCHAR_10);

ALTER TABLE SYS_ROTINA
ADD CONSTRAINT PK_SYS_ROTINA
PRIMARY KEY (ROT_COD);

COMMENT ON COLUMN SYS_ROTINA.ROT_COD IS
'Codigo';

COMMENT ON COLUMN SYS_ROTINA.ROT_TIPO IS
'Tipo:
0 - Menu
1 - Rotina    (Tela)
2 - Subrotina (Funcoes de tela)';

COMMENT ON COLUMN SYS_ROTINA.ROT_DESCRICAO IS
'Descricao';

COMMENT ON COLUMN SYS_ROTINA.ROT_COD_PAI IS
'Rotina pai';




/*------ SYSDBA 13/02/2014 20:57:11 --------*/

ALTER TABLE SYS_ROTINA
ADD CONSTRAINT FK_SYS_ROTINA_PAI
FOREIGN KEY (ROT_COD_PAI)
REFERENCES SYS_ROTINA(ROT_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;



/*------ 13/02/2014 20:58:36 --------*/

CREATE TABLE SYS_FUNCAO_PERMISSAO (
    SISTEMA  DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    FUNCAO   DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    ROTINA   DMN_VCHAR_10_KEY NOT NULL /* DMN_VCHAR_10_KEY = VARCHAR(10) NOT NULL */,
    ACESSO   DMN_LOGICO DEFAULT 1 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 13/02/2014 20:58:36 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO ADD CONSTRAINT PK_SYS_FUNCAO_PERMISSAO PRIMARY KEY (SISTEMA, FUNCAO, ROTINA);

/*------ 13/02/2014 20:58:36 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_FUN FOREIGN KEY (FUNCAO) REFERENCES TBFUNCAO (COD) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.SISTEMA IS 
'Sistema';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.FUNCAO IS 
'Funcao/Perfil';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.ROTINA IS 
'Rotina';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.ACESSO IS 
'Acesso permitido:
0 - Nao
1 - Sim';

/*------ 13/02/2014 20:58:36 --------*/

GRANT ALL ON SYS_FUNCAO_PERMISSAO TO PUBLIC;


/*------ SYSDBA 13/02/2014 21:00:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 13/02/2014 21:00:27 --------*/

DROP TABLE TBFUNCAO_PERMISSAO;

GRANT ALL ON SYS_ROTINA TO "PUBLIC";



/*------ SYSDBA 13/02/2014 21:01:07 --------*/

COMMENT ON COLUMN SYS_ROTINA.ROT_TIPO IS
'Tipo:
0 - Menu
1 - Rotina    (Tela)
2 - Subrotina (Funcoes de tela)
4 - Processos';




/*------ SYSDBA 13/02/2014 21:02:23 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO
ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_ROT
FOREIGN KEY (ROTINA)
REFERENCES SYS_ROTINA(ROT_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 21:03:49 --------*/

CREATE TABLE SYS_SISTEMA (
    SIS_COD DMN_SMALLINT_NN NOT NULL,
    SIS_NOME DMN_VCHAR_100,
    SIS_VERSAO DMN_VCHAR_30);

ALTER TABLE SYS_SISTEMA
ADD CONSTRAINT PK_SYS_SISTEMA
PRIMARY KEY (SIS_COD);

COMMENT ON COLUMN SYS_SISTEMA.SIS_COD IS
'Codigo';

COMMENT ON COLUMN SYS_SISTEMA.SIS_NOME IS
'Nome';

COMMENT ON COLUMN SYS_SISTEMA.SIS_VERSAO IS
'Versao';

GRANT ALL ON SYS_SISTEMA TO "PUBLIC";



/*------ SYSDBA 13/02/2014 21:04:31 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO
ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_SIS
FOREIGN KEY (SISTEMA)
REFERENCES SYS_SISTEMA(SIS_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 21:07:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :sis_codigo
  )) then
    Exit;

  if (not exists(
    Select
      f.cod
    from TBFUNCAO f
    where f.cod = :fun_codigo
  )) then
    Exit;

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = :rot_codigo
  )) then
    Exit;

  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 13/02/2014 21:07:38 --------*/

ALTER TABLE SYS_SISTEMA
ADD CONSTRAINT UNQ_SYS_SISTEMA
UNIQUE (SIS_NOME);




/*------ SYSDBA 14/02/2014 11:18:26 --------*/

SET TERM ^ ;

create or alter procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  /* Procedure Text */
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 14/02/2014 14:11:46 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_SISTEMA TO "PUBLIC";

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
E.RZSOC.
At line 16, column 7.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
VERSION.
At line 2, column 4.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 5.
current.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 5.
current.

*/



/*------ SYSDBA 14/02/2014 14:20:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';




/*------ SYSDBA 14/02/2014 14:21:37 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :sis_codigo
  )) then
    Exit;

  if (not exists(
    Select
      f.cod
    from TBFUNCAO f
    where f.cod = :fun_codigo
  )) then
    Exit;

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = :rot_codigo
  )) then
    Exit;

  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Codigo do Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Codigo da Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Codigo da Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Permissao de Acesso (0 - Nao, 1 - Sim)';




/*------ SYSDBA 14/02/2014 14:21:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';




/*------ SYSDBA 14/02/2014 14:30:00 --------*/

SET TERM ^ ;

create or alter procedure SET_ROTINA (
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_ROTINA TO "PUBLIC";



/*------ SYSDBA 14/02/2014 16:12:54 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ROTINA (
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:rotina_pai)
  )) then
    rotina_pai = '';

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

SET TERM ; ^

