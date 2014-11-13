


/*------ SYSDBA 22/07/2014 20:26:46 --------*/

DROP VIEW VW_TIPO_DOCUMENTO_ENTRADA;

CREATE VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'       as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal' as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D' as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'     as TPD_DESCRICAO from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_DOCUMENTO_ENTRADA TO "PUBLIC";




/*------ SYSDBA 22/07/2014 23:32:44 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_EMITIR_NFE DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_EMITIR_NFE IS
'NF-e: Emitir Nota Fiscal Eletronica:
0 - Nao
1 - Sim';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter NFE_EMITIR_NFE position 11;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 12;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 13;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 14;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 15;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 16;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 18;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 19;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 20;

alter table TBCONFIGURACAO
alter USUARIO position 21;




/*------ SYSDBA 22/07/2014 23:34:13 --------*/

ALTER TABLE TBCONFIGURACAO ALTER NFE_EMITIR_NFE TO NFE_EMITIR;




/*------ SYSDBA 08/08/2014 13:27:13 --------*/

ALTER TABLE TBVENDAS
    ADD DESCONTO_CUPOM DMN_MONEY DEFAULT 0;

COMMENT ON COLUMN TBVENDAS.DESCONTO_CUPOM IS
'Valor Total Desconto no Cupom (Livre).';

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
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

alter table TBVENDAS
alter OBS position 15;

alter table TBVENDAS
alter FORMAPAG position 16;

alter table TBVENDAS
alter FATDIAS position 17;

alter table TBVENDAS
alter SERIE position 18;

alter table TBVENDAS
alter NFE position 19;

alter table TBVENDAS
alter DATAEMISSAO position 20;

alter table TBVENDAS
alter HORAEMISSAO position 21;

alter table TBVENDAS
alter CFOP position 22;

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

alter table TBVENDAS
alter XML_NFE position 24;

alter table TBVENDAS
alter VENDEDOR_COD position 25;

alter table TBVENDAS
alter USUARIO position 26;

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

alter table TBVENDAS
alter VENDA_PRAZO position 29;

alter table TBVENDAS
alter PRAZO_01 position 30;

alter table TBVENDAS
alter PRAZO_02 position 31;

alter table TBVENDAS
alter PRAZO_03 position 32;

alter table TBVENDAS
alter PRAZO_04 position 33;

alter table TBVENDAS
alter PRAZO_05 position 34;

alter table TBVENDAS
alter PRAZO_06 position 35;

alter table TBVENDAS
alter PRAZO_07 position 36;

alter table TBVENDAS
alter PRAZO_08 position 37;

alter table TBVENDAS
alter PRAZO_09 position 38;

alter table TBVENDAS
alter PRAZO_10 position 39;

alter table TBVENDAS
alter PRAZO_11 position 40;

alter table TBVENDAS
alter PRAZO_12 position 41;

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

alter table TBVENDAS
alter NFE_ENVIADA position 45;

alter table TBVENDAS
alter CANCEL_USUARIO position 46;

alter table TBVENDAS
alter CANCEL_DATAHORA position 47;

alter table TBVENDAS
alter CANCEL_MOTIVO position 48;

alter table TBVENDAS
alter XML_NFE_FILENAME position 49;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 50;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 51;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 52;

alter table TBVENDAS
alter NFE_PLACA_UF position 53;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 54;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 55;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 56;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 57;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 58;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 59;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 60;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 61;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 62;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 63;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 64;

alter table TBVENDAS
alter NFE_VALOR_PIS position 65;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 66;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 67;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 68;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 69;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 70;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 71;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 72;




/*------ SYSDBA 11/08/2014 19:41:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
  declare variable total_custo Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
    , sum( coalesce(i.qtde, 0) * coalesce(p.customedio, 0) )
  from TVENDASITENS i
    inner join TBPRODUTO p on (p.cod = i.codprod)
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , Total_custo;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = (:Total_liquido - coalesce(v.Desconto_cupom, 0.0))
    , v.Totalcusto = :Total_custo
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^




/*------ SYSDBA 11/08/2014 21:43:39 --------*/

ALTER TABLE TBFORMPAGTO
    ADD FORMAPAGTO_PDV DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento n oPDV:
0 - Nao
1 - SIm';




/*------ SYSDBA 11/08/2014 21:44:00 --------*/

CREATE INDEX IDX_TBFORMPAGTO_PDV
ON TBFORMPAGTO (FORMAPAGTO_PDV);




/*------ SYSDBA 11/08/2014 21:44:26 --------*/

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento n oPDV:
0 - Nao
1 - Sim';




/*------ SYSDBA 11/08/2014 22:01:21 --------*/

ALTER TABLE TBUSERS
    ADD VENDEDOR DMN_INTEGER_N;

COMMENT ON COLUMN TBUSERS.VENDEDOR IS
'Vendedor';




/*------ SYSDBA 11/08/2014 22:01:56 --------*/

ALTER TABLE TBUSERS
ADD CONSTRAINT FK_TBUSERS_VENDEDOR
FOREIGN KEY (VENDEDOR)
REFERENCES TBVENDEDOR(COD)
ON DELETE SET NULL;




/*------ SYSDBA 12/08/2014 22:11:59 --------*/

CREATE DOMAIN DMN_VCHAR_30_NN AS
VARCHAR(30)
NOT NULL;


/*------ SYSDBA 12/08/2014 22:45:50 --------*/

CREATE TABLE SYS_ESTACAO (
    EST_NOME DMN_VCHAR_30_NN NOT NULL,
    EST_IP DMN_VCHAR_30);

ALTER TABLE SYS_ESTACAO
ADD CONSTRAINT PK_SYS_ESTACAO
PRIMARY KEY (EST_NOME);

COMMENT ON COLUMN SYS_ESTACAO.EST_NOME IS
'Nome da Estacao.';

COMMENT ON COLUMN SYS_ESTACAO.EST_IP IS
'IP da Estacao.';




/*------ SYSDBA 12/08/2014 22:45:51 --------*/

COMMENT ON TABLE SYS_ESTACAO IS 'Tabela de Estacoes de Trabalho.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   12/08/2014

Tabela responsavel por armazenar a lista de estacoes que trabalho liberadas para uso do(s) sistema(s).';

GRANT ALL ON SYS_ESTACAO TO "PUBLIC";



/*------ SYSDBA 25/08/2014 22:28:42 --------*/

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento no PDV:
0 - Nao
1 - Sim';




/*------ SYSDBA 26/08/2014 14:23:50 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_ULTIMO_ACESSO DMN_DATETIME;

COMMENT ON COLUMN SYS_ESTACAO.EST_ULTIMO_ACESSO IS
'Ultimo acesso.';




/*------ SYSDBA 26/08/2014 14:24:50 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_LOCAL DMN_VCHAR_100;

COMMENT ON COLUMN SYS_ESTACAO.EST_LOCAL IS
'Local.';

alter table SYS_ESTACAO
alter EST_NOME position 1;

alter table SYS_ESTACAO
alter EST_IP position 2;

alter table SYS_ESTACAO
alter EST_LOCAL position 3;

alter table SYS_ESTACAO
alter EST_ULTIMO_ACESSO position 4;




/*------ SYSDBA 26/08/2014 14:26:12 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_REGISTRO DMN_VCHAR_100;

COMMENT ON COLUMN SYS_ESTACAO.EST_REGISTRO IS
'Registro.';




/*------ SYSDBA 26/08/2014 14:26:22 --------*/

alter table SYS_ESTACAO
alter column EST_NOME position 1;


/*------ SYSDBA 26/08/2014 14:26:22 --------*/

alter table SYS_ESTACAO
alter column EST_IP position 2;


/*------ SYSDBA 26/08/2014 14:26:22 --------*/

alter table SYS_ESTACAO
alter column EST_LOCAL position 3;


/*------ SYSDBA 26/08/2014 14:26:22 --------*/

alter table SYS_ESTACAO
alter column EST_REGISTRO position 4;


/*------ SYSDBA 26/08/2014 14:26:22 --------*/

alter table SYS_ESTACAO
alter column EST_ULTIMO_ACESSO position 5;


/*------ SYSDBA 27/08/2014 16:23:39 --------*/

COMMENT ON TABLE TBFORMPAGTO IS 'Tabela de Formas de Pagamneto

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar as formas de pagamentos utilizadas nas movimentacoes de COMPRA e VENDA e seus
respectivos parametros de comportamento.';




/*------ SYSDBA 27/08/2014 16:23:50 --------*/

COMMENT ON COLUMN TBFORMPAGTO.COD IS
'Codigo';




/*------ SYSDBA 27/08/2014 16:23:55 --------*/

COMMENT ON COLUMN TBFORMPAGTO.DESCRI IS
'Descricao';




/*------ SYSDBA 27/08/2014 16:24:08 --------*/

COMMENT ON COLUMN TBFORMPAGTO.ACRESCIMO IS
'Percentual Acrescimo';




/*------ SYSDBA 27/08/2014 16:24:21 --------*/

COMMENT ON COLUMN TBFORMPAGTO.CONTA_CORRENTE IS
'Conta Corrente';




/*------ SYSDBA 01/09/2014 17:09:28 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 2  -- 2. Autorizada
      , ac.data_fatura = null
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

    -- Cancelar Duplicata (Contas A Pagar)
    Update TBCONTPAG cp Set
      cp.Situacao = 0 -- Cancelado
    where cp.Empresa   = new.Codemp
      and cp.codforn   = new.Codforn
      and cp.anocompra = new.Ano
      and cp.numcompra = new.Codcontrol
      and cp.quitado   = 0;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2014 17:10:12 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2014 20:52:04 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_ACEITAR_NOTA_DENEGADA DMN_SMALLINT_N DEFAULT 0;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_ACEITAR_NOTA_DENEGADA IS
'NF-e: Aceitar/Salvar XML de Notas Fiscais Eletronicas Denegadas:
0 - Nao
1 - Sim

Rejeicao:

301 -> Uso Denegado: Irregularidade fiscal do emitente
302 -> Uso Denegado: Irregularidade fiscal do destinatario';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 11;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 12;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 13;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 14;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 15;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 16;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 17;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 18;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 19;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 20;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 21;

alter table TBCONFIGURACAO
alter USUARIO position 22;




/*------ SYSDBA 04/09/2014 23:16:25 --------*/

ALTER TABLE TBVENDAS
    ADD NFE_DENEGADA DMN_SMALLINT_N DEFAULT 0,
    ADD NFE_DENEGADA_MOTIVO DMN_VCHAR_100;

COMMENT ON COLUMN TBVENDAS.NFE_DENEGADA IS
'NF de Saida Denegada:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBVENDAS.NFE_DENEGADA_MOTIVO IS
'Motivo da NF denegada.';

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
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

alter table TBVENDAS
alter OBS position 15;

alter table TBVENDAS
alter FORMAPAG position 16;

alter table TBVENDAS
alter FATDIAS position 17;

alter table TBVENDAS
alter SERIE position 18;

alter table TBVENDAS
alter NFE position 19;

alter table TBVENDAS
alter DATAEMISSAO position 20;

alter table TBVENDAS
alter HORAEMISSAO position 21;

alter table TBVENDAS
alter CFOP position 22;

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

alter table TBVENDAS
alter XML_NFE position 24;

alter table TBVENDAS
alter VENDEDOR_COD position 25;

alter table TBVENDAS
alter USUARIO position 26;

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

alter table TBVENDAS
alter VENDA_PRAZO position 29;

alter table TBVENDAS
alter PRAZO_01 position 30;

alter table TBVENDAS
alter PRAZO_02 position 31;

alter table TBVENDAS
alter PRAZO_03 position 32;

alter table TBVENDAS
alter PRAZO_04 position 33;

alter table TBVENDAS
alter PRAZO_05 position 34;

alter table TBVENDAS
alter PRAZO_06 position 35;

alter table TBVENDAS
alter PRAZO_07 position 36;

alter table TBVENDAS
alter PRAZO_08 position 37;

alter table TBVENDAS
alter PRAZO_09 position 38;

alter table TBVENDAS
alter PRAZO_10 position 39;

alter table TBVENDAS
alter PRAZO_11 position 40;

alter table TBVENDAS
alter PRAZO_12 position 41;

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

alter table TBVENDAS
alter NFE_ENVIADA position 45;

alter table TBVENDAS
alter NFE_DENEGADA position 46;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 47;

alter table TBVENDAS
alter CANCEL_USUARIO position 48;

alter table TBVENDAS
alter CANCEL_DATAHORA position 49;

alter table TBVENDAS
alter CANCEL_MOTIVO position 50;

alter table TBVENDAS
alter XML_NFE_FILENAME position 51;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 52;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 53;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 54;

alter table TBVENDAS
alter NFE_PLACA_UF position 55;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 56;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 57;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 58;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 59;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 60;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 61;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 62;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 63;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 64;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 65;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 66;

alter table TBVENDAS
alter NFE_VALOR_PIS position 67;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 68;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 69;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 70;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 71;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 72;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 73;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 74;




/*------ SYSDBA 04/09/2014 23:18:16 --------*/

ALTER TABLE TBCOMPRAS
    ADD NFE_DENEGADA DMN_SMALLINT_N DEFAULT 0,
    ADD NFE_DENEGADA_MOTIVO DMN_VCHAR_100;

COMMENT ON COLUMN TBCOMPRAS.NFE_DENEGADA IS
'NF de Entrada Denegada:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBCOMPRAS.NFE_DENEGADA_MOTIVO IS
'Motivo da NF denegada.';

alter table TBCOMPRAS
alter ANO position 1;

alter table TBCOMPRAS
alter CODCONTROL position 2;

alter table TBCOMPRAS
alter CODEMP position 3;

alter table TBCOMPRAS
alter CODFORN position 4;

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

alter table TBCOMPRAS
alter TIPO_MOVIMENTO position 7;

alter table TBCOMPRAS
alter NF position 8;

alter table TBCOMPRAS
alter NFSERIE position 9;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 10;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 11;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 12;

alter table TBCOMPRAS
alter NFE_ENVIADA position 13;

alter table TBCOMPRAS
alter NFE_DENEGADA position 14;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 15;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 16;

alter table TBCOMPRAS
alter XML_NFE position 17;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 18;

alter table TBCOMPRAS
alter DTLANCAMENTO position 19;

alter table TBCOMPRAS
alter DTEMISS position 20;

alter table TBCOMPRAS
alter HREMISS position 21;

alter table TBCOMPRAS
alter DTENT position 22;

alter table TBCOMPRAS
alter NFCFOP position 23;

alter table TBCOMPRAS
alter NATUREZA position 24;

alter table TBCOMPRAS
alter STATUS position 25;

alter table TBCOMPRAS
alter IPI position 26;

alter table TBCOMPRAS
alter ICMSBASE position 27;

alter table TBCOMPRAS
alter ICMSVALOR position 28;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 29;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 30;

alter table TBCOMPRAS
alter FRETE position 31;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 32;

alter table TBCOMPRAS
alter DESCONTO position 33;

alter table TBCOMPRAS
alter VALORSEGURO position 34;

alter table TBCOMPRAS
alter VALORTOTAL_II position 35;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 36;

alter table TBCOMPRAS
alter VALORPIS position 37;

alter table TBCOMPRAS
alter VALORCOFINS position 38;

alter table TBCOMPRAS
alter TOTALPROD position 39;

alter table TBCOMPRAS
alter TOTALNF position 40;

alter table TBCOMPRAS
alter OBS position 41;

alter table TBCOMPRAS
alter USUARIO position 42;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 43;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 44;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 45;

alter table TBCOMPRAS
alter PRAZO_01 position 46;

alter table TBCOMPRAS
alter PRAZO_02 position 47;

alter table TBCOMPRAS
alter PRAZO_03 position 48;

alter table TBCOMPRAS
alter PRAZO_04 position 49;

alter table TBCOMPRAS
alter PRAZO_05 position 50;

alter table TBCOMPRAS
alter PRAZO_06 position 51;

alter table TBCOMPRAS
alter PRAZO_07 position 52;

alter table TBCOMPRAS
alter PRAZO_08 position 53;

alter table TBCOMPRAS
alter PRAZO_09 position 54;

alter table TBCOMPRAS
alter PRAZO_10 position 55;

alter table TBCOMPRAS
alter PRAZO_11 position 56;

alter table TBCOMPRAS
alter PRAZO_12 position 57;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 58;

alter table TBCOMPRAS
alter TIPO_DESPESA position 59;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 60;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 61;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 62;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 63;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 64;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 65;




/*------ SYSDBA 04/09/2014 23:20:43 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_LOGICO'
where (RDB$FIELD_NAME = 'NFE_ENVIADA') and
(RDB$RELATION_NAME = 'TBCOMPRAS')
;


/*------ SYSDBA 04/09/2014 23:22:36 --------*/

Update TBCOMPRAS set nfe_denegada = 0 where nfe_denegada is null;

/*------ SYSDBA 04/09/2014 23:22:39 --------*/

COMMIT WORK;

/*------ SYSDBA 04/09/2014 23:22:54 --------*/

Update TBVENDAS set nfe_denegada = 0 where nfe_denegada is null;

/*------ SYSDBA 04/09/2014 23:22:58 --------*/

COMMIT WORK;



/*------ SYSDBA 05/09/2014 15:33:01 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
        clientes.
    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
        denegadas e guarda-las na base.';




/*------ SYSDBA 05/09/2014 15:34:31 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
        denegadas e guarda-las na base.';




/*------ SYSDBA 05/09/2014 15:35:44 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
        armazenar o motivo da denegacao.';




/*------ SYSDBA 05/09/2014 15:36:37 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.
    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';




/*------ SYSDBA 05/09/2014 15:36:47 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';




/*------ SYSDBA 05/09/2014 15:37:22 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';




/*------ SYSDBA 05/09/2014 15:37:30 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';




/*------ SYSDBA 05/09/2014 15:37:49 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';




/*------ SYSDBA 05/09/2014 15:38:01 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2014

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';




/*------ SYSDBA 05/09/2014 15:40:20 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';



/*------ 11/09/2014 15:14:25 --------*/

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';

/*------ 11/09/2014 15:14:25 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';

/*------ 11/09/2014 15:14:25 --------*/

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

/*------ 11/09/2014 15:14:26 --------*/

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter GRUPO position 5;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;

/*------ 11/09/2014 15:14:26 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';

/*------ 11/09/2014 15:14:26 --------*/

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';

/*------ 11/09/2014 15:14:26 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 11/09/2014 15:14:27 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ANO IS
'Ano';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CODIGO IS
'Codigo';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA IS
'Empresa';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORNECEDOR IS
'Fornecedor';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TIPO IS
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_DATA IS
'Data de Emissao';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_USUARIO IS
'Usuario de Emissao';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALIDADE IS
'Data de Validade';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.MOVITO IS
'Motivo';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.OBSERVACAO IS
'Observacoes';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ENDERECO_ENTREGA IS
'Endereco de Entrega';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Cancelada';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_DATA IS
'Data de Autorizacao';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_USUARIO IS
'Usuario de Autorizacao';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_NOME IS
'Recebedor (Nome)';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_CPF IS
'Recebedor (CPF)';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORMA_PAGTO IS
'Forma de Pagamento';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CONDICAO_PAGTO IS
'Condicao de Pagamento';

/*------ 11/09/2014 15:14:27 --------*/

GRANT ALL ON TBAUTORIZA_COMPRA TO "PUBLIC";

/*------ 11/09/2014 15:14:27 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_codigo for tbautoriza_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2020, 1);
end^

/*------ 11/09/2014 15:14:27 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_CODIGO IS 'Trigger Nova Autorizacao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de autorizacao de compra no ano.';

/*------ 11/09/2014 15:14:27 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras da empresa.';

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO;

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO;

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_US;

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO;

/*------ 11/09/2014 15:14:27 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL;

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL
FOREIGN KEY (USUARIO_CANCEL)
REFERENCES TBUSERS(NOME);

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_US
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_DATA IS
'Data de Cancelamento';

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_USUARIO IS
'Usuario de Cancelamento';

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_MOTIVO IS
'Motivo de Cancelamento';

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 20;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 21;

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto (Total Produtos)';

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_DESCONTO IS
'Valor Total de Descontos';

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total (Valor Bruto - Valor Desconto)';

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 10;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 11;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 12;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 13;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 14;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 15;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 16;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 17;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 18;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 19;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 20;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 11/09/2014 15:14:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP;

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 11/09/2014 15:14:28 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
USING INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 11/09/2014 15:14:28 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.ANO IS
'Ano da Autorizacao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CODIGO IS
'Codigo da Autorizacao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.EMPRESA IS
'Empresa da Autorizacao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.SEQ IS
'Sequencial';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.FORNECEDOR IS
'Fornecedor';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_UNITARIO IS
'Valor Unitario';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario)';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:29 --------*/

GRANT ALL ON TBAUTORIZA_COMPRAITEM TO "PUBLIC";

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_FUNCAO IS
'Recebedor (Funcao)';

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 20;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 11/09/2014 15:14:29 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:29 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Vendedor ativo:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
--  declare variable movimentar Smallint;
begin
/*
  Select
    coalesce(p.movimenta_estoque, 1)
  from TBPRODUTO p
  where p.cod    = new.codprod
    and p.codemp = new.codempresa
  Into
    movimentar;

  movimentar = coalesce(:movimentar, 1);

  if (:movimentar = 0) then
    Exit;
*/
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
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , p.movimenta_estoque
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = Case when :Movimentar = 1 then :Estoque + :Quantidade else :Estoque end
      where i.Ano = new.Ano
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
        , 'ENTRADA - COMPRA'
        , Current_time
        , :Estoque
        , :Quantidade
        , Case when :Movimentar = 1 then :Estoque + :Quantidade else :Estoque end
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
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
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , p.movimenta_estoque
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , 'ENTRADA - COMPRA'
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then :Estoque - :Quantidade else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:29 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
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
        , coalesce(p.movimenta_estoque, 1)
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
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;

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
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
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
end^

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
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
        , Movimentar
    do
    begin
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

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
        , Trim('SAIDA - VENDA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';

/*------ 11/09/2014 15:14:30 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.DATA_FATURA IS
'Data de faturamento (Entrada)';

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 9;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 10;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 11;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 12;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 13;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 14;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 15;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 16;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 17;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 18;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 19;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 20;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 21;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 22;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 23;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 24;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 25;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 26;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 27;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 9;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 10;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;

/*------ 11/09/2014 15:14:30 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia de faturamento';

/*------ 11/09/2014 15:14:30 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 9;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 10;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_competencia for tbautoriza_compra
active before insert or update position 1
AS
begin
  Select
    c.cmp_num
  from TBCOMPETENCIA c
  where c.cmp_num = extract(year from new.emissao_data) || right('00' || extract(month from new.emissao_data), 2)
  Into
    new.competencia;
end^

/*------ 11/09/2014 15:14:30 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_COMPETENCIA IS 'Trigger Competencia Autorizacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por identificar a competencia da autorizacao quando esta nao for informada, baseando-se na data de
emissao.';

/*------ 11/09/2014 15:14:30 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NUMERO IS
'Numero da Autorizacao (Livre)';

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:30 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 10;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 11;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 12;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 13;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 14;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 15;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 16;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 17;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 18;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 19;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 20;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 21;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 22;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 23;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 24;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 25;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 26;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 27;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 28;

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.UNIDADE IS
'Unidade de Medida';

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter ANO position 1;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CODIGO position 2;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter SEQ position 4;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter PRODUTO position 6;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter QUANTIDADE position 7;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter UNIDADE position 8;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_UNITARIO position 9;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_TOTAL position 10;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CONFIRMADO_RECEBIMENTO position 11;

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_ANO IS
'Autorizacao - Ano.';

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_CODIGO IS
'Autorizacao - Codigo.';

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_EMPRESA IS
'Autorizacao - Empresa.';

/*------ 11/09/2014 15:14:31 --------*/

ALTER TABLE TBCOMPRAS
    ALTER AUTORIZACAO_EMPRESA TYPE DMN_CNPJ;

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada
4 - Cancelada';

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada (NF/NFS registrada no sistema referente a autorizacao)
4 - Cancelada';

/*------ 11/09/2014 15:14:31 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.INSERCAO_DATA IS
'Data/hora de insercao';

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column NUMERO position 4;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 5;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 6;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column INSERCAO_DATA position 7;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 8;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 9;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 10;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 11;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 12;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 13;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 14;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 15;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 16;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 17;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 18;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 19;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 20;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 21;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 22;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 23;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 24;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 25;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 26;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 27;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 28;

/*------ 11/09/2014 15:14:31 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 29;

/*------ 11/09/2014 15:14:32 --------*/

GRANT ALL ON VW_TIPO_AUTORIZACAO TO "PUBLIC";

/*------ 11/09/2014 15:14:32 --------*/

DROP VIEW VW_TIPO_AUTORIZACAO;

/*------ 11/09/2014 15:14:32 --------*/

CREATE VIEW VW_TIPO_AUTORIZACAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Autorização de Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Autorização de Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Autorização de Compra/Serviço' as Descricao from RDB$DATABASE;

/*------ 11/09/2014 15:14:32 --------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_AUTORIZACAO TO "PUBLIC";

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.USUARIO IS
'Usuario de lancamento';

/*------ 11/09/2014 15:14:32 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:32 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:32 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 2  -- 2. Autorizada
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

/*------ 11/09/2014 15:14:32 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_competencia for tbautoriza_compra
active before insert or update position 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 11/09/2014 15:14:32 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBCONFIGURACAO.CLIENTE_PERMITIR_DUPLICAR_CNPJ IS
'Cliente: Permitir da duplicacao de CPF/CNPJ no Cadastro:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMPRESA position 1;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 11;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 12;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 14;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 15;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 16;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 17;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBCONFIGURACAO
alter USUARIO position 18;

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.CLIENTE_PERMITIR_DUPLICAR_CNPJ IS
'Cliente: Permitir duplicar CPF/CNPJ no Cadastro:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    16/05/2014 - IMR : Criacao do campo';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
        clientes.';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON TABLE SYS_LICENCA IS 'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes referentes a Licenca de Uso do sistema.';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN SYS_LICENCA.LINHA_CONTROLE IS
'Dados criptografados.';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.IPI_PERCENTUAL IS
'Percentual IPI';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.IPI_VALOR_TOTAL IS
'Valor Total do IPI';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario) + Valor Total IPI';

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter ANO position 1;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CODIGO position 2;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter SEQ position 4;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter PRODUTO position 6;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter QUANTIDADE position 7;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter UNIDADE position 8;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_UNITARIO position 9;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter IPI_PERCENTUAL position 10;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter IPI_VALOR_TOTAL position 11;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_TOTAL position 12;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CONFIRMADO_RECEBIMENTO position 13;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter USUARIO position 14;

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL_FRETE IS
'Valor Total Frete';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL_IPI IS
'Valor Total IPI';

/*------ 11/09/2014 15:14:32 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total = (Valor Bruto - Valor Desconto) + Valor Total Frete + Valor Total IPI';

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 7;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 8;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 9;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 10;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 11;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 12;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 13;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 14;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 15;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 16;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 17;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 18;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 19;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 20;

/*------ 11/09/2014 15:14:32 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 21;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 22;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 23;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 24;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 25;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 26;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 27;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 28;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 29;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 30;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 31;

/*------ 11/09/2014 15:14:33 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total = (Quantidade * Valor Unitario) + Valor Total IPI';

/*------ 11/09/2014 15:14:33 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TRANSPORTADOR IS
'Transportador';

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 7;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 8;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 9;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 10;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 11;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 12;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 13;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 14;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 15;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 16;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 17;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 18;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 19;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 20;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 21;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 22;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 23;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 24;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 25;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 26;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 27;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 28;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 29;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 30;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 31;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 32;

/*------ 11/09/2014 15:14:33 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NOME_CONTATO IS
'Nome do Contato';

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter NOME_CONTATO position 6;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 7;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 8;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 9;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 10;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 11;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 12;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 13;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 14;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 15;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 16;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 17;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 18;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 19;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 20;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 21;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 22;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 23;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 24;

/*------ 11/09/2014 15:14:33 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 25;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 26;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 27;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 28;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 29;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 30;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 31;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 32;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 33;

/*------ 11/09/2014 15:14:34 --------*/

COMMENT ON COLUMN TBCOMPRAS.TIPO_DESPESA IS
'Tipo de Despesa.';

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter ANO position 1;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CODEMP position 3;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CODFORN position 4;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter NF position 5;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter NFSERIE position 6;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 7;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 8;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 9;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter NFE_ENVIADA position 10;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 11;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter XML_NFE position 12;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 13;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter DTLANCAMENTO position 14;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter DTEMISS position 15;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter HREMISS position 16;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter DTENT position 17;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter NFCFOP position 18;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter NATUREZA position 19;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter STATUS position 20;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter IPI position 21;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter ICMSBASE position 22;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter ICMSVALOR position 23;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 24;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 25;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter FRETE position 26;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter OUTROSCUSTOS position 27;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter DESCONTO position 28;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VALORSEGURO position 29;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_II position 30;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 31;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VALORPIS position 32;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter VALORCOFINS position 33;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter TOTALPROD position 34;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter TOTALNF position 35;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter OBS position 36;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter USUARIO position 37;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 38;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 39;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter COMPRA_PRAZO position 40;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_01 position 41;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_02 position 42;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_03 position 43;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_04 position 44;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_05 position 45;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_06 position 46;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_07 position 47;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_08 position 48;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_09 position 49;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_10 position 50;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_11 position 51;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter PRAZO_12 position 52;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 53;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter TIPO_DESPESA position 54;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CANCEL_USUARIO position 55;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 56;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 57;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 58;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 59;

/*------ 11/09/2014 15:14:34 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 60;

/*------ 11/09/2014 15:14:34 --------*/

COMMENT ON COLUMN TBCONTPAG.CODTPDESP IS
'Tipo Despesa';

/*------ 11/09/2014 15:14:34 --------*/

COMMENT ON COLUMN TBCONTPAG.QUITADO IS
'Quitado:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contapag_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contapag_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contapag_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contapag_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contapag_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contapag_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contapag_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contapag_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contapag_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contapag_num_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end^

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_DUPLICATAS (
    ANOCOMPRA smallint,
    NUMCOMPRA integer)
returns (
    FORNECEDOR integer,
    NOTAFISCAL integer,
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    DATA_ENTRADA date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable Tipo_Despesa Smallint;
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
        c.Codforn
      , c.Nf
      , c.tipo_despesa
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , c.Dtent
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , Tipo_Despesa
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
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end^

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
        devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
        A Pagar.';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao dos campos CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
        clientes.';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao dos campos NOME_CONTATO, TRANSPORTADOR, VALOR_TOTAL_FRETE e VALOR_TOTAL_IPI, uma vez que nos processos
        de Autorizacao de Compra essas informacoes sao necessarias.';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total = (Valor Bruto - Valor Desconto) + Valor Total IPI';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao dos campos NOME_CONTATO, TRANSPORTADOR, VALOR_TOTAL_FRETE e VALOR_TOTAL_IPI, uma vez que nos processos
        de Autorizacao de Compra essas informacoes sao necessarias.';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao dos campos IPI_PERCENTUAL e IPI_VALOR_TOTAL, uma vez que nos processos
        de Autorizacao de Compra essas informacoes sao necessarias.';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBCONTPAG.EMPRESA IS
'Empresa';

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter ANOLANC position 1;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NUMLANC position 2;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter PARCELA position 4;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter CODFORN position 5;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter TIPPAG position 6;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter HISTORIC position 7;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NOTFISC position 8;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTEMISS position 9;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTVENC position 10;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTPAG position 11;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DOCBAIX position 12;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter VALORPAG position 13;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NOMEEMP position 14;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter TIPOCATEG position 15;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter BANCO position 16;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NUMCHQ position 17;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter ANOCOMPRA position 18;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NUMCOMPRA position 19;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter FORMA_PAGTO position 20;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter CONDICAO_PAGTO position 21;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter QUITADO position 22;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter CODTPDESP position 23;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column ANOLANC position 1;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column NUMLANC position 2;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column EMPRESA position 3;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column CODFORN position 4;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column PARCELA position 5;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column TIPPAG position 6;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column HISTORIC position 7;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column NOTFISC position 8;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column DTEMISS position 9;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column DTVENC position 10;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column DTPAG position 11;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column DOCBAIX position 12;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column VALORPAG position 13;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column NOMEEMP position 14;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column TIPOCATEG position 15;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column BANCO position 16;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column NUMCHQ position 17;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column ANOCOMPRA position 18;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column NUMCOMPRA position 19;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column FORMA_PAGTO position 20;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column CONDICAO_PAGTO position 21;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column QUITADO position 22;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter column CODTPDESP position 23;

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBCONTPAG.CODFORN IS
'Fornecedor';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBCONTPAG.PARCELA IS
'Numero Parcela';

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable Empresa DMN_CNPJ;
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
    c.codemp
  from TBCOMPRAS c
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
    Empresa;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contapag_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contapag_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contapag_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contapag_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contapag_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contapag_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contapag_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contapag_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contapag_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contapag_num_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end^

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCONTPAG IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/05/2014 - IMR :
        + Criacao do campo EMPRESA para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado a EMPRESA
        responsavel. Isto permitira que o sistema sela MULTI-EMPRESA.';

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable Empresa DMN_CNPJ;
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
    c.codemp
  from TBCOMPRAS c
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
    Empresa;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end^

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBCONTPAG.SITUACAO IS
'Situacao:
0 - Cancelado
1 - Ativo';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON TABLE TBCONTPAG IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/05/2014 - IMR :
        + Criacao do campos EMPRESA e SITUACAO para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado
        a EMPRESA responsavel como tambem se conheca sua situacao. Isto permitira que o sistema sela MULTI-EMPRESA.';

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable EMPRESA DMN_CNPJ;
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
    c.codemp
  from TBCOMPRAS c
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
    Empresa;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

/*------ 11/09/2014 15:14:35 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBCONTPAG.VALORPAG IS
'Valor A Pagar';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBCONTPAG.VALORMULTA IS
'Valor Juros/Multa';

/*------ 11/09/2014 15:14:35 --------*/

COMMENT ON COLUMN TBCONTPAG.VALORPAGTOT IS
'Total Pago';

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter ANOLANC position 1;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NUMLANC position 2;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter CODFORN position 4;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter PARCELA position 5;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter TIPPAG position 6;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter HISTORIC position 7;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NOTFISC position 8;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTEMISS position 9;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTVENC position 10;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DTPAG position 11;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter DOCBAIX position 12;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter VALORPAG position 13;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter VALORMULTA position 14;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter VALORPAGTOT position 15;

/*------ 11/09/2014 15:14:35 --------*/

alter table TBCONTPAG
alter NOMEEMP position 16;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter TIPOCATEG position 17;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter BANCO position 18;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NUMCHQ position 19;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter ANOCOMPRA position 20;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NUMCOMPRA position 21;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter FORMA_PAGTO position 22;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter CONDICAO_PAGTO position 23;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter QUITADO position 24;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter CODTPDESP position 25;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter SITUACAO position 26;

/*------ 11/09/2014 15:14:36 --------*/

COMMENT ON TABLE TBCONTPAG IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/05/2014 - IMR :
        + Criacao do campos EMPRESA e SITUACAO para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado
          a EMPRESA responsavel como tambem se conheca sua situacao. Isto permitira que o sistema sela MULTI-EMPRESA.

    21/05/2014 - IMR:
        + Criacao dos campos VALORJUROS, VALORPAGTOT para que se permita saber o quanto de Juros e/ou Multas foram pagos
          em determinadas contas e tambem o total parcialmente pago.';

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;


  -- Informar valores de pagamentos parciais
  Update TBCONTPAG p Set
      p.valorpagtot = :Total_pago
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc;
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
      , p.valorpagtot = :Total_pago
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ; ^

alter table TBCONTREC
alter column ANOLANC position 1;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column NUMLANC position 2;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column EMPRESA position 3;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column CLIENTE position 4;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column CNPJ position 5;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column FORMA_PAGTO position 6;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column TIPPAG position 7;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column HISTORIC position 8;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column NUMREC position 9;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column DTEMISS position 10;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column DTVENC position 11;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column DTREC position 12;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column DOCBAIX position 13;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column VALORREC position 14;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column VALORMULTA position 15;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column VALORRECTOT position 16;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column VALORSALDO position 17;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column NUMCONTRATO position 18;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column PARCELA position 19;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column STATUS position 20;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column CODBANCO position 21;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column NOSSONUMERO position 22;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column REMESSA position 23;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column PERCENTJUROS position 24;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column PERCENTMULTA position 25;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column PERCENTDESCONTO position 26;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column DATAPROCESSOBOLETO position 27;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column BAIXADO position 28;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column ENVIADO position 29;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column ANOVENDA position 30;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column NUMVENDA position 31;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTREC
alter column SITUACAO position 32;

/*------ 11/09/2014 15:14:36 --------*/

COMMENT ON COLUMN TBCONTPAG.VALORSALDO IS
'Total Saldo';

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter ANOLANC position 1;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NUMLANC position 2;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter CODFORN position 4;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter PARCELA position 5;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter TIPPAG position 6;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter HISTORIC position 7;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NOTFISC position 8;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter DTEMISS position 9;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter DTVENC position 10;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter DTPAG position 11;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter DOCBAIX position 12;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter VALORPAG position 13;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter VALORMULTA position 14;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter VALORPAGTOT position 15;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter VALORSALDO position 16;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NOMEEMP position 17;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter TIPOCATEG position 18;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter BANCO position 19;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NUMCHQ position 20;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter ANOCOMPRA position 21;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter NUMCOMPRA position 22;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter FORMA_PAGTO position 23;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter CONDICAO_PAGTO position 24;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter QUITADO position 25;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter CODTPDESP position 26;

/*------ 11/09/2014 15:14:36 --------*/

alter table TBCONTPAG
alter SITUACAO position 27;

/*------ 11/09/2014 15:14:36 --------*/

COMMENT ON TABLE TBCONTPAG IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/05/2014 - IMR :
        + Criacao do campos EMPRESA e SITUACAO para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado
          a EMPRESA responsavel como tambem se conheca sua situacao. Isto permitira que o sistema sela MULTI-EMPRESA.

    21/05/2014 - IMR:
        + Criacao dos campos VALORJUROS, VALORPAGTOT e VALORSALDO para que se permita saber o quanto de Juros e/ou Multas
          foram pagos em determinadas contas e tambem o total parcialmente pago.';

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;


  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Informar valores de pagamentos parciais
  Update TBCONTPAG p Set
      p.valorpagtot = :Total_pago
    , p.valorsaldo  = :Valor_saldo
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc;
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = p.Historic || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = p.Historic || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTPAG_QUITAR IS 'Trigger Registrar Pagto. (Contas A Pagar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/05/2014

Trigger responsavel por calcular e/ou quitar os registros de despesas do CONTAS A PAGAR.';

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = p.Historic || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:36 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBFORNECEDOR.NOMEFORN IS
'Razao Social';

/*------ 11/09/2014 15:14:36 --------*/

COMMENT ON COLUMN TBFORNECEDOR.NOMEFANT IS
'Nome Fantasia';

/*------ 11/09/2014 15:14:36 --------*/

alter table TBFORNECEDOR
alter CODFORN position 1;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter TIPO position 2;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter PESSOA_FISICA position 3;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter NOMEFORN position 4;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter NOMEFANT position 5;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CNPJ position 6;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter INSCEST position 7;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter INSCMUN position 8;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter ENDER position 9;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter COMPLEMENTO position 10;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter NUMERO_END position 11;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CEP position 12;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CIDADE position 13;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter UF position 14;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CONTATO position 15;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter FONE position 16;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter FONECEL position 17;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter FONEFAX position 18;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter EMAIL position 19;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter SITE position 20;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter TLG_TIPO position 21;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter LOG_COD position 22;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter BAI_COD position 23;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CID_COD position 24;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter EST_COD position 25;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter PAIS_ID position 26;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter GRF_COD position 27;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter TRANSPORTADORA position 28;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter DTCAD position 29;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM position 30;

/*------ 11/09/2014 15:14:37 --------*/

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM_COD position 31;

/*------ 11/09/2014 15:14:37 --------*/

COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/05/2014 - IMR :
        + Criacao do campos EMPRESA e SITUACAO para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado
          a EMPRESA responsavel como tambem se conheca sua situacao. Isto permitira que o sistema sela MULTI-EMPRESA.';

/*------ 11/09/2014 15:14:37 --------*/

COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar fornecedor tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL.';

/*------ 11/09/2014 15:14:37 --------*/

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
        , NOMEFANT
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

/*------ 11/09/2014 15:14:37 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOGRADOURO (
    NOM_LOGRADOURO varchar(250),
    TIP_LOGRADOURO varchar(10),
    COD_CIDADE integer)
returns (
    COD_LOGRADOURO integer,
    COD_TIPO smallint)
as
declare variable TMP_TIPO smallint;
declare variable TMP_DESC varchar(250);
begin
  /* 1. Buscar codigo do Tipo do Logradouro */
  Select first 1
    t.tlg_cod
  from TBTIPO_LOGRADOURO t
  where coalesce(t.tlg_sigla, t.tlg_descricao) like Trim(:tip_logradouro) || '%'
  Into
    tmp_tipo;

  /* 2. Ajustar descricao do logradouro */
  if ( coalesce(:tmp_tipo, 0) = 0 ) then
    tmp_desc = trim(:tip_logradouro) || ' ' || trim(:nom_logradouro);
  else
    tmp_desc = trim(:nom_logradouro);

  /* 3. Buscar codigo do Logradouro */
  Select first 1
    l.log_cod
  from TBLOGRADOURO l
  where l.cid_cod = :cod_cidade
    and trim(l.log_nome) = Trim(:tmp_desc)
  Into
    cod_logradouro;

  /* 4. Inserir Logradouro, caso ele nao exista */
  if ( coalesce(:cod_logradouro, 0) = 0 ) then
  begin
    cod_logradouro = Gen_id(GEN_LOGRADOURO_ID, 1);
    Insert Into TBLOGRADOURO (
        log_cod
      , log_nome
      , tlg_cod
      , cid_cod
    ) values (
        :cod_logradouro
      , :tmp_desc
      , :tmp_tipo
      , :cod_cidade
    );
  end

  cod_tipo = tmp_tipo;

  suspend;
end^

/*------ 11/09/2014 15:14:37 --------*/

SET TERM ; ^

/*------ 11/09/2014 15:14:44 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_numlanc for tbcontpag
active before insert position 0
AS
begin
  if (new.numlanc is null) then
    if ( new.anolanc = 2011 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.anolanc = 2012 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.anolanc = 2013 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.anolanc = 2014 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.anolanc = 2015 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.anolanc = 2016 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.anolanc = 2017 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.anolanc = 2018 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.anolanc = 2019 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.anolanc = 2020 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  if ( new.valorsaldo is null ) then
    new.valorsaldo = new.valorpag;
end^

/*------ 11/09/2014 15:14:44 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_numlanc for tbcontpag
active before insert position 0
AS
begin
  if (new.numlanc is null) then
    if ( new.anolanc = 2011 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.anolanc = 2012 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.anolanc = 2013 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.anolanc = 2014 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.anolanc = 2015 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.anolanc = 2016 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.anolanc = 2017 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.anolanc = 2018 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.anolanc = 2019 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.anolanc = 2020 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  if ( new.valorsaldo is null ) then
    new.valorsaldo = new.valorpag;
end^

/*------ 11/09/2014 15:14:44 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTPAG_NUMLANC IS 'Trigger Novo Lancamento (Contas A Pagar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Trigger responsavel por gerar um sequencial unico para o lancamento de Contas A Pagar de acordo com o exercicio deste.

Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/05/2014 - IMR :
        + Adicao da linha de codigo que permite a definicao do VALOR para o SALDO A PAGAR quando este nao for informado.';

/*------ 11/09/2014 15:14:44 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable EMPRESA DMN_CNPJ;
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
    c.codemp
  from TBCOMPRAS c
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
    Empresa;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

/*------ 11/09/2014 15:14:45 --------*/

SET TERM ; ^

COMMENT ON TABLE TBBANCO IS 'Tabela de Bancos FEBRABAN.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/05/2014

Tabela responsavel por armazenar a lista atualizada de bancos de acordo com a FEBRABAN.';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBBANCO.COD IS
'Codigo de Compensacao';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBBANCO.NOME IS
'Nome do Banco';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBBANCO.HOME_PAGE IS
'Pagina Web';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBCLIENTE.BANCO IS
'Dados Financeiros - Banco';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBCLIENTE.AGENCIA IS
'Dados Financeiros - Agencia';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBCLIENTE.CC IS
'Dados Financeiros - Conta';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBCLIENTE.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBCLIENTE.OBSERVACAO IS
'Observacoes Gerais';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBFORNECEDOR.BANCO IS
'Dados Financeiros - Banco';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBFORNECEDOR.AGENCIA IS
'Dados Financeiros - Agencia';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CC IS
'Dados Financeiros - Conta';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBFORNECEDOR.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca';

/*------ 11/09/2014 15:14:45 --------*/

COMMENT ON COLUMN TBFORNECEDOR.OBSERVACAO IS
'Observacoes Gerais';

/*------ 11/09/2014 15:14:45 --------*/

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
        , NOMEFANT
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
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , OBSERVACAO
        , DTCAD
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
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
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.observacao
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
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

/*------ 11/09/2014 15:14:45 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.';

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column CODFORN position 1;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column TIPO position 2;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column PESSOA_FISICA position 3;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column NOMEFORN position 4;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column NOMEFANT position 5;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column CNPJ position 6;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column INSCEST position 7;

/*------ 11/09/2014 15:14:45 --------*/

alter table TBFORNECEDOR
alter column INSCMUN position 8;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column ENDER position 9;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column COMPLEMENTO position 10;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column NUMERO_END position 11;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CEP position 12;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CIDADE position 13;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column UF position 14;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CONTATO position 15;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column FONE position 16;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column FONECEL position 17;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column FONEFAX position 18;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column EMAIL position 19;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column SITE position 20;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column TLG_TIPO position 21;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column LOG_COD position 22;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column BAI_COD position 23;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CID_COD position 24;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column EST_COD position 25;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column PAIS_ID position 26;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column GRF_COD position 27;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column TRANSPORTADORA position 28;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column BANCO position 29;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column AGENCIA position 30;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CC position 31;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column PRACA position 32;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column OBSERVACAO position 33;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column DTCAD position 34;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CLIENTE_ORIGEM position 35;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBFORNECEDOR
alter column CLIENTE_ORIGEM_COD position 36;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column CODIGO position 1;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column TIPO position 2;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column PESSOA_FISICA position 3;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column CNPJ position 4;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column NOME position 5;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column INSCEST position 6;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column INSCMUN position 7;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column ENDER position 8;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column COMPLEMENTO position 9;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BAIRRO position 10;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column CEP position 11;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column CIDADE position 12;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column UF position 13;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column FONE position 14;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column FONECEL position 15;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column FONECOMERC position 16;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column EMAIL position 17;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column SITE position 18;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column TLG_TIPO position 19;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column LOG_COD position 20;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BAI_COD position 21;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column CID_COD position 22;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column EST_COD position 23;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column NUMERO_END position 24;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column PAIS_ID position 25;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column VALOR_LIMITE_COMPRA position 26;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BLOQUEADO position 27;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_DATA position 28;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_MOTIVO position 29;

/*------ 11/09/2014 15:14:46 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_USUARIO position 30;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column DESBLOQUEADO_DATA position 31;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column VENDEDOR_COD position 32;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column USUARIO position 33;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column EMITIR_NFE_DEVOLUCAO position 34;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_PERCENTUAL position 35;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_FRETE position 36;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_OUTROS position 37;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column ENTREGA_FRACIONADA_VENDA position 38;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column BANCO position 39;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column AGENCIA position 40;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column CC position 41;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column PRACA position 42;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column OBSERVACAO position 43;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter column DTCAD position 44;

/*------ 11/09/2014 15:14:47 --------*/

COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar fornecedor tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL.

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.';

/*------ 11/09/2014 15:14:47 --------*/

GRANT ALL ON VW_BANCO_FEBRABAN TO "PUBLIC";

/*------ 11/09/2014 15:14:47 --------*/

DROP VIEW VW_BANCO_FEBRABAN;

/*------ 11/09/2014 15:14:47 --------*/

CREATE VIEW VW_BANCO_FEBRABAN(
    CODIGO,
    NOME,
    CODIGO_NOME,
    NOME_CODIGO)
AS
Select
    cast(b.cod as varchar(10))  as codigo
  , b.nome as nome
  , b.cod || ' - ' || b.nome as codigo_nome
  , b.nome || ' (' || b.cod || ')' as nome_codigo
from TBBANCO b;

/*------ 11/09/2014 15:14:47 --------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_BANCO_FEBRABAN TO "PUBLIC";

/*------ 11/09/2014 15:14:47 --------*/

COMMENT ON COLUMN TBCLIENTE.NOME IS
'Nome (Razao Social)';

/*------ 11/09/2014 15:14:47 --------*/

COMMENT ON COLUMN TBCLIENTE.NOMEFANT IS
'Nome Fantasia';

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CODIGO position 1;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter TIPO position 2;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter PESSOA_FISICA position 3;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CNPJ position 4;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter NOME position 5;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter NOMEFANT position 6;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter INSCEST position 7;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter INSCMUN position 8;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter ENDER position 9;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter COMPLEMENTO position 10;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BAIRRO position 11;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CEP position 12;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CIDADE position 13;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter UF position 14;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter FONE position 15;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter FONECEL position 16;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter FONECOMERC position 17;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter EMAIL position 18;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter SITE position 19;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter TLG_TIPO position 20;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter LOG_COD position 21;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BAI_COD position 22;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CID_COD position 23;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter EST_COD position 24;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter NUMERO_END position 25;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter PAIS_ID position 26;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 27;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BLOQUEADO position 28;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BLOQUEADO_DATA position 29;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 30;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 31;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 32;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter VENDEDOR_COD position 33;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter USUARIO position 34;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter EMITIR_NFE_DEVOLUCAO position 35;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CUSTO_OPER_PERCENTUAL position 36;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CUSTO_OPER_FRETE position 37;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CUSTO_OPER_OUTROS position 38;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter ENTREGA_FRACIONADA_VENDA position 39;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter BANCO position 40;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter AGENCIA position 41;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter CC position 42;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter PRACA position 43;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter OBSERVACAO position 44;

/*------ 11/09/2014 15:14:47 --------*/

alter table TBCLIENTE
alter DTCAD position 45;

/*------ 11/09/2014 15:14:47 --------*/

COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    29/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar clientes tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL (NOME).';

/*------ 11/09/2014 15:14:47 --------*/

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
        , NOMEFANT
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
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , OBSERVACAO
        , DTCAD
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
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
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.observacao
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
        , f.nomefant = coalesce(new.nomefant, new.nome)
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
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

/*------ 11/09/2014 15:14:47 --------*/

SET TERM ; ^

GRANT ALL ON VW_TIPO_DOCUMENTO_ENTRADA TO "PUBLIC";

/*------ 11/09/2014 15:14:47 --------*/

GRANT ALL ON VW_TIPO_ENTRADA TO "PUBLIC";

/*------ 11/09/2014 15:14:47 --------*/

DROP VIEW VW_TIPO_ENTRADA;

/*------ 11/09/2014 15:14:47 --------*/

CREATE VIEW VW_TIPO_ENTRADA(
    TPE_CODIGO,
    TPE_DESCRICAO)
AS
Select 0 as TPE_CODIGO , '* Indefinido'         as TPE_DESCRICAO from RDB$DATABASE union
Select 1 as TPE_CODIGO , 'Consumo Interno'      as TPE_DESCRICAO from RDB$DATABASE union
Select 2 as TPE_CODIGO , 'Produção/Faturamento' as TPE_DESCRICAO from RDB$DATABASE union
Select 3 as TPE_CODIGO , 'Imobilizado'          as TPE_DESCRICAO from RDB$DATABASE union
Select 4 as TPE_CODIGO , 'Outras'               as TPE_DESCRICAO from RDB$DATABASE;

/*------ 11/09/2014 15:14:47 --------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_ENTRADA TO "PUBLIC";

/*------ 11/09/2014 15:14:47 --------*/

COMMENT ON COLUMN TBCOMPRAS.TIPO_ENTRADA IS
'Tipo de Entrada.

View VW_TIPO_ENTRADA responsavel pelo dominio desse dados.';

/*------ 11/09/2014 15:14:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.TIPO_DOCUMENTO IS
'Tipo de Docuento de Entrada.

View VW_TIPO_DOCUMENTO_ENTRADA responsavel pelo dominio desse dados.';

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter ANO position 1;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CODEMP position 3;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CODFORN position 4;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter NF position 7;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter NFSERIE position 8;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 9;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 10;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 11;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter NFE_ENVIADA position 12;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 13;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter XML_NFE position 14;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 15;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter DTLANCAMENTO position 16;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter DTEMISS position 17;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter HREMISS position 18;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter DTENT position 19;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter NFCFOP position 20;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter NATUREZA position 21;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter STATUS position 22;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter IPI position 23;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter ICMSBASE position 24;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter ICMSVALOR position 25;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 26;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 27;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter FRETE position 28;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter OUTROSCUSTOS position 29;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter DESCONTO position 30;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VALORSEGURO position 31;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_II position 32;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 33;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VALORPIS position 34;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter VALORCOFINS position 35;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter TOTALPROD position 36;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter TOTALNF position 37;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter OBS position 38;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter USUARIO position 39;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 40;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 41;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter COMPRA_PRAZO position 42;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_01 position 43;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_02 position 44;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_03 position 45;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_04 position 46;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_05 position 47;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_06 position 48;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_07 position 49;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_08 position 50;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_09 position 51;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_10 position 52;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_11 position 53;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter PRAZO_12 position 54;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 55;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter TIPO_DESPESA position 56;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CANCEL_USUARIO position 57;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 58;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 59;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 60;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 61;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 62;

/*------ 11/09/2014 15:14:48 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).';

/*------ 11/09/2014 15:14:48 --------*/

DROP VIEW VW_TIPO_ALIQUOTA;

/*------ 11/09/2014 15:14:48 --------*/

CREATE VIEW VW_TIPO_ALIQUOTA(
    CODIGO,
    DESCRICAO,
    TIPO)
AS
Select First 1
    0 as Codigo
  , 'ICMS' as Descricao
  , 'Produto' as Tipo
from TBORIGEMPROD

union

Select First 1
    1 as Codigo
  , 'ISS' as Descricao
  , 'Serviço' as Tipo
from TBORIGEMPROD;

/*------ 11/09/2014 15:14:48 --------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_ALIQUOTA TO "PUBLIC";

/*------ 11/09/2014 15:14:48 --------*/

COMMENT ON COLUMN TBPRODUTO.COMPOR_FATURAMENTO IS
'Produto/Servico compoe faturamento:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODIGO position 1;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter COD position 2;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter DESCRI position 3;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter APRESENTACAO position 4;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter MODELO position 6;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PRECO position 7;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter REFERENCIA position 9;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter SECAO position 10;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter QTDE position 11;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter FRACIONADOR position 12;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PESO_BRUTO position 13;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PESO_LIQUIDO position 14;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CUBAGEM position 15;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter VENDA_FRACIONADA position 16;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 17;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter UNIDADE position 18;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter ESTOQMIN position 19;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODGRUPO position 20;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODFABRICANTE position 21;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CUSTOMEDIO position 22;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 23;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 24;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter PRECO_SUGERIDO position 25;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODEMP position 26;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODSECAO position 27;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODORIGEM position 28;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CODTRIBUTACAO position 29;

/*------ 11/09/2014 15:14:48 --------*/

alter table TBPRODUTO
alter CST position 30;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CSOSN position 31;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CST_PIS position 32;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CST_COFINS position 33;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter NCM_SH position 34;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CODIGO_NVE position 35;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CODCFOP position 36;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CODBARRA_EAN position 37;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CODUNIDADE position 38;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 39;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ALIQUOTA position 40;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 41;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ALIQUOTA_PIS position 42;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 43;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter VALOR_IPI position 44;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter RESERVA position 45;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter PRODUTO_NOVO position 46;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter COR_VEICULO position 47;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 48;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter TIPO_VEICULO position 49;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 50;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 51;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter RENAVAM_VEICULO position 52;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CHASSI_VEICULO position 53;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 54;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 55;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 56;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 57;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter USUARIO position 58;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 59;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 60;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CUST_DESP_OFIC position 61;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 62;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CUST_DESP_ADM position 63;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CUST_COMISSAO position 64;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter CUST_IMPOSTO position 65;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter FI_RET_FINANC position 66;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBPRODUTO
alter FI_RET_PLANO position 67;

/*------ 11/09/2014 15:14:49 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.';

/*------ 11/09/2014 15:14:49 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.VENDA_CARREGA_PRODUTO_EAN IS
'Venda: Carregar produto pelo EAN:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 11;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 12;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 14;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 15;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 16;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 17;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 18;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 19;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 11;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 12;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 14;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 15;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 16;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 17;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 18;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 19;

/*------ 11/09/2014 15:14:49 --------*/

COMMENT ON COLUMN TBCOMPRAS.TIPO_MOVIMENTO IS
'Tipo Movimento:
0 - Entrada de Produtos
1 - Entrada de Servicos';

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter ANO position 1;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter CODEMP position 3;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter CODFORN position 4;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter TIPO_MOVIMENTO position 7;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter NF position 8;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter NFSERIE position 9;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 10;

/*------ 11/09/2014 15:14:49 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 11;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 12;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter NFE_ENVIADA position 13;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 14;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter XML_NFE position 15;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 16;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter DTLANCAMENTO position 17;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter DTEMISS position 18;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter HREMISS position 19;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter DTENT position 20;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter NFCFOP position 21;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter NATUREZA position 22;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter STATUS position 23;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter IPI position 24;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter ICMSBASE position 25;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter ICMSVALOR position 26;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 27;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 28;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter FRETE position 29;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter OUTROSCUSTOS position 30;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter DESCONTO position 31;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VALORSEGURO position 32;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_II position 33;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 34;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VALORPIS position 35;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter VALORCOFINS position 36;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter TOTALPROD position 37;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter TOTALNF position 38;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter OBS position 39;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter USUARIO position 40;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 41;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 42;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter COMPRA_PRAZO position 43;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_01 position 44;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_02 position 45;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_03 position 46;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_04 position 47;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_05 position 48;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_06 position 49;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_07 position 50;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_08 position 51;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_09 position 52;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_10 position 53;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_11 position 54;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter PRAZO_12 position 55;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 56;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter TIPO_DESPESA position 57;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter CANCEL_USUARIO position 58;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 59;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 60;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 61;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 62;

/*------ 11/09/2014 15:14:50 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 63;

/*------ 11/09/2014 15:14:50 --------*/

COMMENT ON COLUMN TBCOMPRAS.ICMSBASE IS
'Valor Base ICMS/ISS.';

/*------ 11/09/2014 15:14:50 --------*/

COMMENT ON COLUMN TBCOMPRAS.ICMSVALOR IS
'Valor ICMS/ISS.';

/*------ 11/09/2014 15:14:50 --------*/

COMMENT ON COLUMN TBCOMPRAS.TOTALPROD IS
'Valor Total Produto/Servico.';

/*------ 11/09/2014 15:14:50 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable EMPRESA DMN_CNPJ;
declare variable EMPRESA_NOME DMN_VCHAR_60;
declare variable FORMA_PAGTO_DESC DMN_VCHAR_30;
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
      c.codemp
    , e.rzsoc
  from TBCOMPRAS c
    left join TBEMPRESA e on (e.cnpj = c.codemp)
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
      Empresa
    , Empresa_Nome;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , NomeEmp
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , substring(:Empresa_Nome from 1 for 4)
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

/*------ 11/09/2014 15:14:50 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable EMPRESA DMN_CNPJ;
declare variable EMPRESA_NOME DMN_VCHAR_60;
declare variable FORMA_PAGTO_DESC DMN_VCHAR_30;
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
      c.codemp
    , e.rzsoc
  from TBCOMPRAS c
    left join TBEMPRESA e on (e.cnpj = c.codemp)
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
      Empresa
    , Empresa_Nome;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , NomeEmp
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , substring(:Empresa_Nome from 1 for 40)
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

/*------ 11/09/2014 15:14:50 --------*/

SET TERM ; ^

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_FUN;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_ROT;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_SIS;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_SYS_ROTINA_PAI;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAJUSTESTOQ_EMP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_AUT;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_EMP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_FRN;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_PRD;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_UND;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_COMPET;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_CPAGTO;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FPAGTO;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FRN;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_TRANSP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_AUT;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_CANCEL;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBBAIRRO_CID;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBBAIRRO_DIS;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBBANCO_BOLETO_EMPRESA;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO_FP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_CONTA_CORRENTE;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CC;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CL;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CM;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CX;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_EP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FN;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FP;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_PG;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_RC;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_US;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_VD;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_USUARIO;

/*------ 11/09/2014 15:14:50 --------*/

SET STATISTICS INDEX FK_TBCAIXA_USUARIO_CANCEL;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCIDADE_UF;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_BAI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_CID;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_EST;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_CLI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_PRD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_VND;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_PAIS;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_CLI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_EMP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_CLI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_EMP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_PRD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_REQ;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_UND;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCLIENTE_VENDEDOR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRAS_AUTORIZACAO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRAS_CFOP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCOMPRAS_TIPO_DESPESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONFIGURACAO_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_SALDO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_USUARIO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_COMPRA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_USUARIO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_CLIENTE_COD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBCONTREC_VND;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_BAI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_CID;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_EST;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_PAIS;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_SEGMENTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORMPAGTO_CCORRENTE;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_CID;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_CLIENTE_COD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_EST;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBLANCDEPOS_BANCO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBLOGRADOURO_CID;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPEDIDOITENS_1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPEDIDOS_2;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPEDIDOS_3;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODHIST_1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODHIST_EMP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_2;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_CFOP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_COMBUSTIVEL;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_COR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_FABRICANTE;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_ROTATIVIDADE;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_SECAO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_TIPO_VEI;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROM;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBTPDESPESA_PLANO_CONTA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBUSERS_1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_CFOP;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_CLIENTE_COD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_COMPETENCIA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_CPG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_FPG;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TBVENDAS_VOLUME;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE_COD;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX FK_TVENDASITENS_VENDA;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IBE$LOG_BLOB_FIELDS_IDX1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IBE$LOG_FIELDS_IDX1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IBE$LOG_KEYS_IDX1;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_PLANO_CONTA_EXERCICIO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_PLANO_CONTA_GRUPO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_PRODUTO_ROTATIVIDADE;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRAITEM_REC;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRA_NUMERO;

/*------ 11/09/2014 15:14:51 --------*/

SET STATISTICS INDEX IDX_TBCAIXA_MOVIMENTO_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCLIENTE_BLOQUEADO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCLIENTE_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCOMPRAS_NFE;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCOMPRAS_RECIBO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCOMPRAS_TIPOS;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCONTPAG_SITUACAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCONTREC_CLI_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBCONTREC_SITUACAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBFORNECEDOR_CLI_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBUNIDADEPROD_SIGLA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBUSERALLOW;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBVENDAS_CLI_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TBVENDAS_RECIBO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX IDX_TVENDASITENS_CLI_CNPJ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_RENAVAM_COBUSTIVEL;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_RENAVAM_COR;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_RENAVAM_TIPOVEICULO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_SYS_FUNCAO_PERMISSAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_SYS_LICENCA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_SYS_ROTINA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_SYS_SISTEMA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBAJUSTESTOQ;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRAITEM;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBBAIRRO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBBANCO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBBANCO_BOLETO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCAIXA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCAIXA_CONSOLIDACAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCAIXA_MOVIMENTO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCFOP;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCIDADE;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCLIENTE;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCLIENTE_ESTOQUE;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO_ITEM;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCOMPETENCIA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCOMPRAS;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCOMPRASITENS;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONDICAOPAGTO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONFIGURACAO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTA_CORRENTE;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTA_CORRENTE_SALDO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTPAG;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTREC;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCONTREC_BAIXA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCST_COFINS;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBCST_PIS;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBDISTRITO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBEMPRESA;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBESTADO;

/*------ 11/09/2014 15:14:52 --------*/

SET STATISTICS INDEX PK_TBFABRICANTE;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBFORMPAGTO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBFORNECEDOR;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBFUNCAO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBGRUPOPROD;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBLANCDEPOS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBLOGRADOURO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBLOG_TRANSACAO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBNFE_ENVIADA;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBORIGEMPROD;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPAIS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPEDIDOITENS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPEDIDOS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPLANO_CONTA;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPRODUTO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPRODUTO_ROTATIVIDADE;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPROMOCAO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBPROMOCAO_PRODUTO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBSECAOPROD;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBSEGMENTO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBTPDESPESA;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBUNIDADEPROD;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBUSERALLOW;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBUSERS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBVENDAS;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBVENDAS_FORMAPAGTO;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBVENDAS_VOLUME;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX PK_TBVENDEDOR;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX RDB$INDEX_0;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX RDB$INDEX_1;

/*------ 11/09/2014 15:14:53 --------*/

SET STATISTICS INDEX RDB$INDEX_10;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_11;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_12;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_13;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_14;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_15;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_16;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_17;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_18;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_19;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_2;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_20;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_21;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_22;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_23;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_24;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_25;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_26;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_27;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_28;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_29;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_3;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_30;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_31;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_32;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_33;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_34;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_35;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_36;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_37;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_38;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_39;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_4;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_40;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_41;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_42;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_43;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_44;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_45;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_5;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_6;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_7;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_8;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$INDEX_9;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX RDB$PRIMARY1;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX UNQ1_TBFUNCAO;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX UNQ_SYS_SISTEMA;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;

/*------ 11/09/2014 15:14:54 --------*/

SET STATISTICS INDEX UNQ_TBVENDAS_NFE;

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ^ ;

ALTER PROCEDURE GET_ARQUIVO_NFC(
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE,
    TIPO_ARQUIVO DMN_SMALLINT_N,
    CNPJ_EMITENTE DMN_CNPJ,
    STATUS_VENDA DMN_SMALLINT_N)
RETURNS (
    TIPO VARCHAR(2),
    LINHA VARCHAR(250))
AS
declare variable INSC_ESTADUAL varchar(11);
declare variable QTDE_REGISTRO integer;
begin

  tipo_arquivo  = coalesce(:tipo_arquivo, 1); -- 1. Normal, 2. Retificador
  status_venda  = coalesce(:status_venda, 4); -- 4. NF-e Emitida
  qtde_registro = 0;

  if ( :cnpj_emitente is null ) then
    Select first 1
        e.cnpj
      , replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    Into
        cnpj_emitente
      , insc_estadual;
  else
    Select
        replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    where e.cnpj = :cnpj_emitente
    Into
        insc_estadual;

  /* 1. Definir Identificação do Arquivo (Cabeçalho) */

  tipo  = '10';

  linha =
       :tipo
    || '|' || :tipo_arquivo
    || '|' || '1.00'
    || '|' || trim(:cnpj_emitente)
    || '|' || trim(substring(:insc_estadual from 1 for 9))
    || '|' || trim(right('00' || extract(month from :data_inicial), 2) || right('00' || extract(year from :data_inicial), 4));

  suspend;
  linha = null;

  /* 2. Definir Identificação e Discriminação de Valores da Nota Fiscal */

  tipo = '20';

  for
    Select
         :tipo                                         -- Tipo Registro
      || '|' || '1'                                    -- Modelo da Nota Fiscal
      || '|' || '1'                                    -- Tipo da Operacao
      || '|' || trim(substring(v.serie from 1 for 3))  -- Serie
      || '|' || trim('   ')                            -- Subserie
      || '|' || v.nfe                                  -- Numero NF-e
      || '|' || right('00' ||   extract(day   from v.dataemissao), 2)
             || right('00' ||   extract(month from v.dataemissao), 2)
             || right('0000' || extract(year  from v.dataemissao), 4)  -- Data de Emissao
      || '|' || right('00' ||   extract(day   from n.dataemissao), 2)
             || right('00' ||   extract(month from n.dataemissao), 2)
             || right('0000' || extract(year  from n.dataemissao), 4)  -- Data de Saida (Temporario)
      || '|' || coalesce(trim(substring(v.codcli  from 1 for 14)), '') -- CPF/CNPJ do Cliente
      || '|' || coalesce(trim(substring(c.inscest from 1 for 9)), '')  -- IE do Cliente
      || '|' || coalesce(v.nfe_valor_base_icms, 0)                     -- Valor Base do ICMS
      || '|' || coalesce(v.nfe_valor_icms, 0)                          -- Valor Total do ICMS
      || '|' || coalesce(v.nfe_valor_total_produto, 0)                 -- Valor Total dos Produtos/Servicos
      || '|' || coalesce(v.nfe_valor_desconto, 0)                      -- Valor Total dos Descontos
      || '|' || coalesce(v.nfe_valor_outros, 0)                        -- Valor Total de Outras Despesas
      || '|' || coalesce(v.nfe_valor_total_nota, 0)                    -- Valor Total da Nota Fiscal
    from TBVENDAS v
      inner join TBNFE_ENVIADA n on (n.anovenda = v.ano and n.numvenda = v.codcontrol)
      inner join TBCLIENTE c on (c.codigo = v.codcliente)
    where v.codemp  = :cnpj_emitente
      and v.status  = :status_venda
      and v.dataemissao between :data_inicial and :data_final
    Order by
      v.serie, v.nfe
    Into
      linha
  do
  begin

    linha = replace(:linha, '.', ',');
    suspend;
    linha = null;
    qtde_registro = :qtde_registro + 1;

  end

  /* 3. Definir Totalizador dos registros */

  tipo = '90';

  linha =
       :tipo
    || '|' || :qtde_registro
    || '|' || (:qtde_registro + 2);

  suspend;
  linha = null;

end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO(
    USUARIO VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER,
    CONTA_CORRENTE INTEGER)
AS
begin

  Select First 1
      c.Ano
    , c.Numero
    , c.Conta_corrente
  from TBCAIXA c
    Inner join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente)
  where c.Situacao = 0
    and c.Usuario = :Usuario
    and ( (c.Data_abertura = :Data) or (cc.Tipo = 2) )
    and c.Conta_corrente in (
      Select
        f.Conta_corrente
      from TBFORMPAGTO f
      where f.Cod = :Forma_pagto
    )
  into
      Ano_caixa
    , Num_caixa
    , Conta_corrente;

  Suspend;

end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO_DETALHE(
    USUARIO_IN VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO SMALLINT,
    NUMERO INTEGER,
    USUARIO VARCHAR(12),
    DATA_ABERTURA DATE,
    CONTA_CORRENTE INTEGER,
    VALOR_TOTAL_CREDITO NUMERIC(15,2),
    VALOR_TOTAL_DEBITO NUMERIC(15,2))
AS
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_debito  = coalesce(:Valor_total_debito,  0);

  suspend;
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    SALDO_ANTERIOR_DATA DATE,
    SALDO_ANTERIOR_VALOR NUMERIC(15,2),
    SALDO_INICIAL_DATA DATE,
    SALDO_INICIAL_VALOR NUMERIC(15,2),
    SALDO_FINAL_DATA DATE,
    SALDO_FINAL_VALOR NUMERIC(15,2))
AS
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE_SALDO s
  where s.Codigo = :Conta_corrente
    and s.Data_saldo < :Data_inicial
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo = :Tmp_data
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s2
  where s2.Codigo = :Conta_corrente
    and s2.Data_saldo = :Data_inicial
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s3
  where s3.Codigo = :Conta_corrente
    and s3.Data_saldo = :Data_final
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CST_NORMAL
RETURNS (
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    DESCRICAO_FULL VARCHAR(250))
AS
declare variable CODIGO_TMP varchar(1);
declare variable DESCRI_TMP varchar(50);
begin
  for
    Select
        o.orp_cod
      , o.orp_descricao
    from TBORIGEMPROD o
    Into
        codigo_tmp
      , descri_tmp
  do
  begin

    for
      Select
          t.tpt_cod
        , t.tpt_descricao
      from TBTRIBUTACAO_TIPO t
      where t.crt = 0
      Into
          Codigo
        , Descricao
    do
    begin

      Codigo    = Trim(:codigo_tmp) || Trim(:Codigo);
      Descricao = Trim(:Descricao) || ' (' || Trim(:descri_tmp) || ')';

      Descricao_Full = :Codigo || ' - ' || :Descricao;

      suspend;

    end 

  end 
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_DIA_UTIL(
    DATA DATE,
    DIAS INTEGER)
RETURNS (
    DIA_UTIL DATE)
AS
begin
  Dia_util = :Data + :Dias;
  if ( Extract(Weekday from :Dia_util) = 0 ) then /* Caso seja domingo */
    Dia_util = :Dia_util + 1;
  else
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sabado */
    Dia_util = :Dia_util + 2;

  suspend;
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_FLUXO_CAIXA(
    IDCONTA INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    DATA DATE,
    CONTA_CORRENTE INTEGER,
    CONTA_CORRENTE_DESC VARCHAR(50),
    FORMA_PAGTO INTEGER,
    FORMA_PAGTO_DESC VARCHAR(50),
    HISTORICO VARCHAR(250),
    TIPO VARCHAR(1),
    ENTRADA NUMERIC(18,2),
    SAIDA NUMERIC(18,2),
    SALDO NUMERIC(18,2),
    CAIXA_ANO INTEGER,
    CAIXA_NUM INTEGER)
AS
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

      /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_LIMITE_DISPONIVEL_CLIENTE(
    CODIGO_CLIENTE INTEGER)
RETURNS (
    VALOR_LIMITE NUMERIC(15,2),
    VALOR_COMPRAS_ABERTAS NUMERIC(15,2),
    VALOR_LIMITE_DISPONIVEL NUMERIC(15,2))
AS
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

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_PRODUTO_ROTATIVIDADE(
    PRODUTO VARCHAR(10),
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    COMPRA_QTDE NUMERIC(18,4),
    COMPRA_VALOR NUMERIC(18,4),
    VENDA_QTDE NUMERIC(18,4),
    VENDA_VALOR NUMERIC(18,4))
AS
begin
  /* Buscar compras */
  Select
      sum(c.qtde)
    , sum(c.qtde * c.customedio)
  from TBCOMPRAS cc
    inner join TBCOMPRASITENS c on (c.ano = cc.ano and c.codcontrol = cc.codcontrol)
  where cc.dtent between :data_inicial and :data_final
    and cc.status in (2, 4) -- Finalizada, NF-e
    and c.codprod = :produto
  Into
      compra_qtde
    , compra_valor;

  /* Buscar vendas */
  Select
      sum(v.qtde)
    , sum(v.qtde * v.pfinal)
  from TBVENDAS vv
    inner join TVENDASITENS v on (v.ano = vv.ano and v.codcontrol = vv.codcontrol)
  where cast(vv.dtvenda as date) between :data_inicial and :data_final
    and vv.status in (3, 4) -- Finalizada, NF-e
    and v.codprod = :produto
  Into
      venda_qtde
    , venda_valor;

  suspend;
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_BAIRRO(
    NOM_BAIRRO VARCHAR(100),
    COD_CIDADE INTEGER,
    COD_DISTRITO INTEGER)
RETURNS (
    COD_BAIRRO INTEGER)
AS
begin
  /* 1. Buscar codigo do Bairro */
  Select first 1
    b.bai_cod
  from TBBAIRRO b
  where b.cid_cod = :cod_cidade
    and trim(b.bai_nome) = Trim(:nom_bairro)
  Into
    cod_bairro;

  /* 2. Inserir bairro caso ele nao exista */
  if ( coalesce(:cod_bairro, 0) = 0 ) then
  begin
    cod_bairro = Gen_id(GEN_BAIRRO_ID, 1);
    Insert Into TBBAIRRO (
        bai_cod
      , bai_nome
      , cid_cod
      , dis_cod
    ) values (
        :cod_bairro
      , :nom_bairro
      , :cod_cidade
      , :cod_distrito
    );
  end 

  suspend;
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_CONSOLIDAR(
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER)
AS
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when upper(m.Tipo) = 'C' then coalesce(m.Valor, 0) else 0 end )
      , sum( case when upper(m.Tipo) = 'D' then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
    );

  end 
end^

/*------ 11/09/2014 15:14:54 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_COMPETENCIA(
    NUMERO INTEGER,
    DESCRICAO VARCHAR(50))
AS
begin
  if (not exists(
    Select
      c.cmp_num
    from TBCOMPETENCIA c
    where c.cmp_num = :numero
  )) then
  begin

    Insert Into TBCOMPETENCIA (
        cmp_num
      , cmp_desc
    ) values (
        :numero
      , :descricao
    );

  end
  else
  begin

    Update TBCOMPETENCIA c Set
      c.cmp_desc = :descricao
    where c.cmp_num = :numero
      and c.cmp_desc is null;

  end 
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
    DATA_MOVIMENTO DATE)
AS
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
  -- Buscar Saldo anterior
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo in (
      Select
        max(s2.Data_saldo)
      from TBCONTA_CORRENTE_SALDO s2
      where s2.Codigo = :Conta_corrente
        and s2.Data_saldo < :Data_movimento
    )
  into
      Data_saldo_ant
    , Valor_saldo_ant;

  -- Gravar Saldo anterior caso nao exista
  if ( :Data_saldo_ant is null ) then
  begin
    Data_saldo_ant  = :Data_movimento - 1;
    Valor_saldo_ant = 0;

    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_saldo_ant
      , :Valor_saldo_ant
    );
  end 

  -- Consolidar Creditos e Debitos do dia
  Select
      sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
    , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
  from TBCAIXA_MOVIMENTO m
  where m.Situacao = 1 -- Confirmado
    and m.Conta_corrente = :Conta_corrente
    and cast(m.Datahora as Date ) = :Data_movimento
  into
      Total_credito_dia
    , Total_debito_dia;

  Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);

  /* Gerar Saldo Conta Corrente do Dia */
  if ( not Exists(
    Select
      s3.Codigo
    from TBCONTA_CORRENTE_SALDO s3
    where s3.Codigo = :Conta_corrente
      and s3.Data_saldo = :Data_movimento
  ) ) then
  begin

    -- Inserir Saldo do Dia
    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_movimento
      , :Total_saldo_dia
    );

   end
   else
   begin

     -- Atualizar Saldo do Dia
     Update TBCONTA_CORRENTE_SALDO s Set
       s.Valor_saldo = :Total_saldo_dia
     where s.Codigo = :Conta_corrente
       and s.Data_saldo = :Data_movimento;

   end 
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_COFINS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_COFINS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_COFINS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_COFINS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_PIS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_PIS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_PIS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_PIS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_DUPLICATA_PAGAR(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER,
    FORNECEDOR INTEGER,
    NF INTEGER,
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT,
    TIPO_DESPESA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable EMPRESA DMN_CNPJ;
declare variable EMPRESA_NOME DMN_VCHAR_60;
declare variable FORMA_PAGTO_DESC DMN_VCHAR_30;
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
      c.codemp
    , e.rzsoc
  from TBCOMPRAS c
    left join TBEMPRESA e on (e.cnpj = c.codemp)
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
      Empresa
    , Empresa_Nome;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , NomeEmp
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , substring(:Empresa_Nome from 1 for 40)
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_FUNCAO_PERMISSAO(
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Codigo do Sistema';

/*------ 11/09/2014 15:14:55 --------*/

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Codigo da Funcao';

/*------ 11/09/2014 15:14:55 --------*/

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Codigo da Rotina';

/*------ 11/09/2014 15:14:55 --------*/

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Permissao de Acesso (0 - Nao, 1 - Sim)';

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_DUPLICATAS(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER)
RETURNS (
    FORNECEDOR INTEGER,
    NOTAFISCAL INTEGER,
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    DATA_ENTRADA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
declare variable Tipo_Despesa Smallint;
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
        c.Codforn
      , c.Nf
      , c.tipo_despesa
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , c.Dtent
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , Tipo_Despesa
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
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_TITULOS(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER)
RETURNS (
    EMPRESA VARCHAR(18),
    CLIENTE_COD INTEGER,
    CLIENTE_CNPJ VARCHAR(18),
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    DATA_FINALIZ_VENDA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_LOGRADOURO(
    NOM_LOGRADOURO VARCHAR(250),
    TIP_LOGRADOURO VARCHAR(10),
    COD_CIDADE INTEGER)
RETURNS (
    COD_LOGRADOURO INTEGER,
    COD_TIPO SMALLINT)
AS
declare variable TMP_TIPO smallint;
declare variable TMP_DESC varchar(250);
begin
  /* 1. Buscar codigo do Tipo do Logradouro */
  Select first 1
    t.tlg_cod
  from TBTIPO_LOGRADOURO t
  where coalesce(t.tlg_sigla, t.tlg_descricao) like Trim(:tip_logradouro) || '%'
  Into
    tmp_tipo;

  /* 2. Ajustar descricao do logradouro */
  if ( coalesce(:tmp_tipo, 0) = 0 ) then
    tmp_desc = trim(:tip_logradouro) || ' ' || trim(:nom_logradouro);
  else
    tmp_desc = trim(:nom_logradouro);

  /* 3. Buscar codigo do Logradouro */
  Select first 1
    l.log_cod
  from TBLOGRADOURO l
  where l.cid_cod = :cod_cidade
    and trim(l.log_nome) = Trim(:tmp_desc)
  Into
    cod_logradouro;

  /* 4. Inserir Logradouro, caso ele nao exista */
  if ( coalesce(:cod_logradouro, 0) = 0 ) then
  begin
    cod_logradouro = Gen_id(GEN_LOGRADOURO_ID, 1);
    Insert Into TBLOGRADOURO (
        log_cod
      , log_nome
      , tlg_cod
      , cid_cod
    ) values (
        :cod_logradouro
      , :tmp_desc
      , :tmp_tipo
      , :cod_cidade
    );
  end

  cod_tipo = tmp_tipo;

  suspend;
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_PRODUTO_ROTATIVIDADE(
    DATA DATE,
    USUARIO VARCHAR(30),
    PRODUTO VARCHAR(10),
    EXCLUIR_ROT SMALLINT,
    TIPO_ROTATI SMALLINT,
    ULTIMA_COMPRA DATE,
    ULTIMA_VENDA DATE)
AS
declare variable TMP_DATA_INI date;
declare variable TMP_DATA_FIM date;
declare variable TMP_COMPRA_QTDE numeric(18,4);
declare variable TMP_COMPRA_VALOR numeric(18,4);
declare variable TMP_VENDA_QTDE numeric(18,4);
declare variable TMP_VENDA_VALOR numeric(18,4);
declare variable UM integer;
declare variable TRES integer;
declare variable SEIS integer;
declare variable NOVE integer;
declare variable DOZE integer;
declare variable NNNN integer;
begin
  um   = 30 * 1;
  tres = 30 * 3;
  seis = 30 * 6;
  nove = 30 * 9;
  doze = 30 * 12;
  nnnn = 30 * 36;

  excluir_rot = coalesce(:excluir_rot, 0);
  tipo_rotati = coalesce(:tipo_rotati, 0); /* 0. Compra | 1. Venda */

  -- Excluir processamento antigo
  if ( :excluir_rot = 1 ) then
    Delete from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto  = :produto;

  /************************************* MES 0-1 *************************************/

  tmp_data_fim = :data;
  tmp_data_ini = :tmp_data_fim - :um;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_01
        , compra_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_01
        , venda_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_01  = :tmp_compra_qtde
        , rp.compra_valor_01 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_01   = :tmp_venda_qtde
        , rp.venda_valor_01  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 1-3 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :tres;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_03
        , compra_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_03
        , venda_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_03  = :tmp_compra_qtde
        , rp.compra_valor_03 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_03   = :tmp_venda_qtde
        , rp.venda_valor_03  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 3-6 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :seis;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_06
        , compra_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_06
        , venda_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_06  = :tmp_compra_qtde
        , rp.compra_valor_06 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_06   = :tmp_venda_qtde
        , rp.venda_valor_06  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 6-9 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nove;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_09
        , compra_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_09
        , venda_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_09  = :tmp_compra_qtde
        , rp.compra_valor_09 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_09   = :tmp_venda_qtde
        , rp.venda_valor_09  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 9-12 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :doze;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_12
        , compra_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_12
        , venda_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_12  = :tmp_compra_qtde
        , rp.compra_valor_12 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_12   = :tmp_venda_qtde
        , rp.venda_valor_12  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 12-nn *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nnnn;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_99
        , compra_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_99
        , venda_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_99  = :tmp_compra_qtde
        , rp.compra_valor_99 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_99   = :tmp_venda_qtde
        , rp.venda_valor_99  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  -- Atualizar das Datas de Compra e Venda
  Update TBPRODUTO_ROTATIVIDADE rp Set
      rp.data_ultima_compra = :ultima_compra
    , rp.data_ultima_venda = :ultima_venda
  where rp.cod_produto = :produto;

end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_ROTINA(
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
AS
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
      , case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SEGMENTO(
    SEG_ID SMALLINT,
    SEG_DESCRICAO VARCHAR(60))
AS
begin
  if ( (:Seg_id is null) or (:Seg_descricao is null)  ) then
    Exit;

  if ( exists(
    Select
      s.Seg_id
    from TBSEGMENTO s
    where s.Seg_id = :Seg_id
  ) ) then
    Update TBSEGMENTO u Set
      u.Seg_descricao = :Seg_descricao
    where u.Seg_id = :Seg_id;
  else
    Insert Into TBSEGMENTO (
        Seg_id
      , Seg_descricao
    ) values (
        :Seg_id
      , :Seg_descricao
    );
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SISTEMA(
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

/*------ 11/09/2014 15:14:55 --------*/

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

/*------ 11/09/2014 15:14:55 --------*/

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ^ ;

ALTER PROCEDURE SET_TITULO_RECEBER(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER,
    EMPRESA VARCHAR(18),
    CLIENTE_COD INTEGER,
    CLIENTE_CNPJ VARCHAR(18),
    FORMA_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
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

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AD
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'D', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CODIGO', old.codigo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CNPJ', old.cnpj, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NOME', old.nome, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCEST', old.inscest, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCMUN', old.inscmun, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'ENDER', old.ender, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'COMPLEMENTO', old.complemento, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BAIRRO', old.bairro, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CEP', old.cep, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CIDADE', old.cidade, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'UF', old.uf, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONE', old.fone, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECEL', old.fonecel, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECOMERC', old.fonecomerc, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'EMAIL', old.email, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'SITE', old.site, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NUMERO_END', old.numero_end, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PAIS_ID', old.pais_id, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO', old.bloqueado, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, null);

  insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
         values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DTCAD', old.dtcad, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VENDEDOR_COD', old.vendedor_cod, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'USUARIO', old.usuario, null);


end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AI
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'I', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', new.cnpj);

  if (new.codigo is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CODIGO', null, new.codigo);

  if (new.pessoa_fisica is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PESSOA_FISICA', null, new.pessoa_fisica);

  if (new.cnpj is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CNPJ', null, new.cnpj);

  if (new.nome is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NOME', null, new.nome);

  if (new.inscest is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCEST', null, new.inscest);

  if (new.inscmun is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCMUN', null, new.inscmun);

  if (new.ender is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'ENDER', null, new.ender);

  if (new.complemento is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'COMPLEMENTO', null, new.complemento);

  if (new.bairro is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BAIRRO', null, new.bairro);

  if (new.cep is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CEP', null, new.cep);

  if (new.cidade is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CIDADE', null, new.cidade);

  if (new.uf is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'UF', null, new.uf);

  if (new.fone is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONE', null, new.fone);

  if (new.fonecel is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECEL', null, new.fonecel);

  if (new.fonecomerc is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECOMERC', null, new.fonecomerc);

  if (new.email is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'EMAIL', null, new.email);

  if (new.site is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'SITE', null, new.site);

  if (new.numero_end is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NUMERO_END', null, new.numero_end);

  if (new.pais_id is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PAIS_ID', null, new.pais_id);

  if (new.valor_limite_compra is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VALOR_LIMITE_COMPRA', null, new.valor_limite_compra);

  if (new.bloqueado is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO', null, new.bloqueado);

  if (new.bloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_DATA', null, new.bloqueado_data);

  if (not (new.bloqueado_motivo is null)) then
    insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
           values (:tid,'BLOQUEADO_MOTIVO',null, new.bloqueado_motivo);

  if (new.bloqueado_usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_USUARIO', null, new.bloqueado_usuario);

  if (new.desbloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DESBLOQUEADO_DATA', null, new.desbloqueado_data);

  if (new.dtcad is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DTCAD', null, new.dtcad);

  if (new.vendedor_cod is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VENDEDOR_COD', null, new.vendedor_cod);

  if (new.usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'USUARIO', null, new.usuario);


end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AU
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'U', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  if ((old.codigo is null and new.codigo is not null) or
      (new.codigo is null and old.codigo is not null) or
      (new.codigo is not null and old.codigo is not null and new.codigo <> old.codigo)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CODIGO', old.codigo, new.codigo);

  if ((old.pessoa_fisica is null and new.pessoa_fisica is not null) or
      (new.pessoa_fisica is null and old.pessoa_fisica is not null) or
      (new.pessoa_fisica is not null and old.pessoa_fisica is not null and new.pessoa_fisica <> old.pessoa_fisica)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, new.pessoa_fisica);

  if ((old.nome is null and new.nome is not null) or
      (new.nome is null and old.nome is not null) or
      (new.nome is not null and old.nome is not null and new.nome <> old.nome)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NOME', old.nome, new.nome);

  if ((old.inscest is null and new.inscest is not null) or
      (new.inscest is null and old.inscest is not null) or
      (new.inscest is not null and old.inscest is not null and new.inscest <> old.inscest)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCEST', old.inscest, new.inscest);

  if ((old.inscmun is null and new.inscmun is not null) or
      (new.inscmun is null and old.inscmun is not null) or
      (new.inscmun is not null and old.inscmun is not null and new.inscmun <> old.inscmun)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCMUN', old.inscmun, new.inscmun);

  if ((old.ender is null and new.ender is not null) or
      (new.ender is null and old.ender is not null) or
      (new.ender is not null and old.ender is not null and new.ender <> old.ender)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'ENDER', old.ender, new.ender);

  if ((old.complemento is null and new.complemento is not null) or
      (new.complemento is null and old.complemento is not null) or
      (new.complemento is not null and old.complemento is not null and new.complemento <> old.complemento)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'COMPLEMENTO', old.complemento, new.complemento);

  if ((old.bairro is null and new.bairro is not null) or
      (new.bairro is null and old.bairro is not null) or
      (new.bairro is not null and old.bairro is not null and new.bairro <> old.bairro)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BAIRRO', old.bairro, new.bairro);

  if ((old.cep is null and new.cep is not null) or
      (new.cep is null and old.cep is not null) or
      (new.cep is not null and old.cep is not null and new.cep <> old.cep)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CEP', old.cep, new.cep);

  if ((old.cidade is null and new.cidade is not null) or
      (new.cidade is null and old.cidade is not null) or
      (new.cidade is not null and old.cidade is not null and new.cidade <> old.cidade)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CIDADE', old.cidade, new.cidade);

  if ((old.uf is null and new.uf is not null) or
      (new.uf is null and old.uf is not null) or
      (new.uf is not null and old.uf is not null and new.uf <> old.uf)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'UF', old.uf, new.uf);

  if ((old.fone is null and new.fone is not null) or
      (new.fone is null and old.fone is not null) or
      (new.fone is not null and old.fone is not null and new.fone <> old.fone)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONE', old.fone, new.fone);

  if ((old.fonecel is null and new.fonecel is not null) or
      (new.fonecel is null and old.fonecel is not null) or
      (new.fonecel is not null and old.fonecel is not null and new.fonecel <> old.fonecel)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECEL', old.fonecel, new.fonecel);

  if ((old.fonecomerc is null and new.fonecomerc is not null) or
      (new.fonecomerc is null and old.fonecomerc is not null) or
      (new.fonecomerc is not null and old.fonecomerc is not null and new.fonecomerc <> old.fonecomerc)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECOMERC', old.fonecomerc, new.fonecomerc);

  if ((old.email is null and new.email is not null) or
      (new.email is null and old.email is not null) or
      (new.email is not null and old.email is not null and new.email <> old.email)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'EMAIL', old.email, new.email);

  if ((old.site is null and new.site is not null) or
      (new.site is null and old.site is not null) or
      (new.site is not null and old.site is not null and new.site <> old.site)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'SITE', old.site, new.site);

  if ((old.numero_end is null and new.numero_end is not null) or
      (new.numero_end is null and old.numero_end is not null) or
      (new.numero_end is not null and old.numero_end is not null and new.numero_end <> old.numero_end)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NUMERO_END', old.numero_end, new.numero_end);

  if ((old.pais_id is null and new.pais_id is not null) or
      (new.pais_id is null and old.pais_id is not null) or
      (new.pais_id is not null and old.pais_id is not null and new.pais_id <> old.pais_id)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PAIS_ID', old.pais_id, new.pais_id);

  if ((old.valor_limite_compra is null and new.valor_limite_compra is not null) or
      (new.valor_limite_compra is null and old.valor_limite_compra is not null) or
      (new.valor_limite_compra is not null and old.valor_limite_compra is not null and new.valor_limite_compra <> old.valor_limite_compra)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, new.valor_limite_compra);

  if ((old.bloqueado is null and new.bloqueado is not null) or
      (new.bloqueado is null and old.bloqueado is not null) or
      (new.bloqueado is not null and old.bloqueado is not null and new.bloqueado <> old.bloqueado)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO', old.bloqueado, new.bloqueado);

  if ((old.bloqueado_data is null and new.bloqueado_data is not null) or
      (new.bloqueado_data is null and old.bloqueado_data is not null) or
      (new.bloqueado_data is not null and old.bloqueado_data is not null and new.bloqueado_data <> old.bloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, new.bloqueado_data);

  if ((old.bloqueado_motivo is null and new.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is null and old.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is not null and old.bloqueado_motivo is not null and new.bloqueado_motivo <> old.bloqueado_motivo)) then
     insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
            values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, new.bloqueado_motivo);

  if ((old.bloqueado_usuario is null and new.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is null and old.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is not null and old.bloqueado_usuario is not null and new.bloqueado_usuario <> old.bloqueado_usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, new.bloqueado_usuario);

  if ((old.desbloqueado_data is null and new.desbloqueado_data is not null) or
      (new.desbloqueado_data is null and old.desbloqueado_data is not null) or
      (new.desbloqueado_data is not null and old.desbloqueado_data is not null and new.desbloqueado_data <> old.desbloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, new.desbloqueado_data);

  if ((old.dtcad is null and new.dtcad is not null) or
      (new.dtcad is null and old.dtcad is not null) or
      (new.dtcad is not null and old.dtcad is not null and new.dtcad <> old.dtcad)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DTCAD', old.dtcad, new.dtcad);

  if ((old.vendedor_cod is null and new.vendedor_cod is not null) or
      (new.vendedor_cod is null and old.vendedor_cod is not null) or
      (new.vendedor_cod is not null and old.vendedor_cod is not null and new.vendedor_cod <> old.vendedor_cod)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VENDEDOR_COD', old.vendedor_cod, new.vendedor_cod);

  if ((old.usuario is null and new.usuario is not null) or
      (new.usuario is null and old.usuario is not null) or
      (new.usuario is not null and old.usuario is not null and new.usuario <> old.usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'USUARIO', old.usuario, new.usuario);


end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TB_TESTE_CODIGO
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_tb_teste_codigo, 1);
End^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AJUST_ESTOQUE_HISTORICO
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
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_CODIGO
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2020, 1);
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_BAIRRO_COD
As
Begin
  If (New.Bai_cod Is Null) Then
    New.Bai_cod = Gen_id(Gen_bairro_id,1);
End^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_CONSOLIDACAO_SEQ
AS
  declare variable sequencial Smallint;
begin
  if ( coalesce(new.Seq, 0) = 0 ) then
  begin
    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
      sequencial;

    new.Seq = coalesce(Sequencial, 0) + 1;
  end
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_FECHAR
AS
  declare variable total_credito Dmn_money;
  declare variable total_debito Dmn_money;
begin
  if ( (old.Situacao = 0) and (new.Situacao = 1) ) then
  begin
    Execute procedure SET_CAIXA_CONSOLIDAR(new.Ano, new.Numero);

    Select
        sum(c.Total_credito)
      , sum(c.Total_debito)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
        Total_credito
      , Total_debito;

    new.Valor_total_credito = coalesce(:Total_credito, 0);
    new.Valor_total_debito  = coalesce(:Total_debito, 0);
  end 
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_MOVIMENTO_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2020, 1);
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2020, 1);
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_COD
As
Begin
  If (New.Cid_cod Is Null) Then
    New.Cid_cod = Gen_id(Gen_cidade_id,1);
End^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_CUSTO_OPER
AS
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    Update TBCLIENTE c Set
        c.custo_oper_percentual = new.custo_oper_percentual
      , c.custo_oper_frete      = new.custo_oper_frete
      , c.custo_oper_outros     = new.custo_oper_outros
    where c.cid_cod = new.cid_cod;
end^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(GEN_CLIENTE_ID, 1);
End^

/*------ 11/09/2014 15:14:55 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_CUSTO_OPER
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

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_GERAR_FORNECEDOR
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
        , NOMEFANT
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
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , OBSERVACAO
        , DTCAD
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
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
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.observacao
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
        , f.nomefant = coalesce(new.nomefant, new.nome)
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
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_ESTOQUE
AS
  declare variable item       Smallint;
  declare variable produto    Varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
begin
  /* 2. AUTORIZADA - Decrementar estoque satelite do cliente quando a requisicao for autorizada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 2) ) then
  begin
    for
      Select
          i.numero
        , i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          item
        , produto
        , quantidade
        , estoque
    do
    begin

      -- Baixar estoque
      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0) -- Retirar estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

      -- Guardar historico estoque satelite
      Update TBCLIENTE_REQUISICAO_ITEM i Set
        i.quantidade_final = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
      where i.ano    = new.ano
        and i.numero = new.numero
        and i.item   = :item;

    end 
  end 

  else

  /* 4. CANCELADA - Incfementar estoque satelite do cliente quando a requisicao for cancelada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 4) ) then
  begin
    for
      Select
          i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          produto
        , quantidade
        , estoque
    do
    begin

      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) + coalesce(:quantidade, 0) -- Devolver estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

    end 
  end
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_ITEM_SEQ
AS
begin
  if ( coalesce(new.item, 0) = 0 ) then
    Select
      coalesce(max(i.item), 0) + 1
    from TBCLIENTE_REQUISICAO_ITEM i
    where i.ano    = new.ano
      and i.numero = new.numero
    Into
      new.item;

  if ( new.usuario is null ) then
    new.usuario = user;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_NOVA
AS
begin
  if ( coalesce(new.ano, 0) = 0 ) then
    new.ano = extract(year from current_date);

  if ( coalesce(new.numero, 0) = 0 ) then
    if ( new.ano = 2011 ) then
      new.numero = gen_id(GEN_REQUISICAO_2011, 1);
    else
    if ( new.ano = 2012 ) then
      new.numero = gen_id(GEN_REQUISICAO_2012, 1);
    else
    if ( new.ano = 2013 ) then
      new.numero = gen_id(GEN_REQUISICAO_2013, 1);
    else
    if ( new.ano = 2014 ) then
      new.numero = gen_id(GEN_REQUISICAO_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.numero = gen_id(GEN_REQUISICAO_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.numero = gen_id(GEN_REQUISICAO_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.numero = gen_id(GEN_REQUISICAO_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.numero = gen_id(GEN_REQUISICAO_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.numero = gen_id(GEN_REQUISICAO_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.numero = gen_id(GEN_REQUISICAO_2020, 1);

  if ( new.insercao_data is null ) then
    new.insercao_data = current_date;

  if ( new.insercao_hora is null ) then
    new.insercao_usuario = current_time;

  if ( new.insercao_usuario is null ) then
    new.insercao_usuario = user;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 2  -- 2. Autorizada
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2020, 1);
END^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONDICAOPAGTO_COD
As
Begin
  If (New.Cond_cod Is Null) Then
    New.Cond_cod = Gen_id(Gen_condicaopagto_cod, 1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_NUMLANC
AS
begin
  if (new.numlanc is null) then
    if ( new.anolanc = 2011 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.anolanc = 2012 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.anolanc = 2013 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.anolanc = 2014 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.anolanc = 2015 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.anolanc = 2016 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.anolanc = 2017 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.anolanc = 2018 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.anolanc = 2019 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.anolanc = 2020 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  if ( new.valorsaldo is null ) then
    new.valorsaldo = new.valorpag;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_QUITAR
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = p.Historic || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_NUM
as
begin
  if (new.Numlanc is null) then
    if ( new.Anolanc = 2011 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2011, 1);
    else
    if ( new.Anolanc = 2012 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2012, 1);
    else
    if ( new.Anolanc = 2013 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2013, 1);
    else
    if ( new.Anolanc = 2014 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2014, 1);
    else
    if ( new.Anolanc = 2015 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2015, 1);
    else
    if ( new.Anolanc = 2016 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2016, 1);
    else
    if ( new.Anolanc = 2017 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2017, 1);
    else
    if ( new.Anolanc = 2018 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2018, 1);
    else
    if ( new.Anolanc = 2019 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2019, 1);
    else
    if ( new.Anolanc = 2020 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2020, 1);
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_QUITAR
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago numeric(15,2);
  declare variable valor_pagar numeric(15,2);
  declare variable valor_saldo numeric(15,2);
  declare variable quitado Smallint;
begin
  /* Quitar contas a receber */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTREC_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(r.Valorrec, 0) + coalesce(r.Valormulta, 0) - ( coalesce(r.Valorrec, 0) * coalesce(r.Percentdesconto, 0) / 100 )
  from TBCONTREC r
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
    quitado = 1;
  else
    quitado = 0;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  Update TBCONTREC r Set
      r.Baixado  = :Quitado
    , r.Historic = r.Historic || ' --> HISTORICO DA BAIXA : ' || new.Historico
    , r.Dtrec    = new.Data_pagto
    , r.Docbaix  = new.Documento_baixa
    , r.Tippag   = :Forma_pagto
    , r.Codbanco = new.Banco
    , r.Valorsaldo  = :Valor_saldo
    , r.Valorrectot = :Total_pago
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_DISTRITO_BI
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_EMPRESA_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_empresa_id, 1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FABRICANTE_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FORNECEDOR_COD
As
Begin
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_GRUPOPRODUTO_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_GRUPOPRODUTO_COD,1);
END^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_LOGRADOURO_COD
As
Begin
  If (New.Log_cod Is Null) Then
    New.Log_cod = Gen_id(Gen_logradouro_id,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_COMPRA
AS
begin
  if ( (new.anocompra > 0) and (new.numcompra > 0) ) then
  begin
    Update TBCOMPRAS c Set
        c.nfserie = new.serie
      , c.nf      = new.numero
      , c.nfe_enviada      = 1
      , c.verificador_nfe  = new.chave
      , c.xml_nfe_filename = new.xml_filename
      , c.xml_nfe          = new.xml_file
      , c.lote_nfe_ano     = new.lote_ano
      , c.lote_nfe_numero  = new.lote_num
      , c.lote_nfe_recibo  = new.recibo
      , c.status  = 4 -- Nota Fiscal Gerada
      , c.dtemiss = new.dataemissao
      , c.hremiss = new.horaemissao
    where c.ano        = new.anocompra
      and c.codcontrol = new.numcompra;
  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_VENDA
AS
begin
  if ( (new.anovenda > 0) and (new.numvenda > 0) ) then
  begin
    Update TBVENDAS v Set
        v.serie = new.serie
      , v.nfe   = new.numero
      , v.nfe_enviada      = 1
      , v.verificador_nfe  = new.chave
      , v.xml_nfe_filename = new.xml_filename
      , v.xml_nfe          = new.xml_file
      , v.lote_nfe_ano     = new.lote_ano
      , v.lote_nfe_numero  = new.lote_num
      , v.lote_nfe_recibo  = new.recibo
      , v.status      = 4 -- Nota Fiscal Gerada
      , v.dataemissao = new.dataemissao
      , v.horaemissao = new.horaemissao
    where v.ano = new.anovenda
      and v.codcontrol = new.numvenda;
  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ENVIADA_EMPRESA
AS
begin
  if (new.empresa is null) then
  begin

    /* Identificando a Empresa da Venda (Saida) */

    if (new.anovenda is not null) then
    begin
      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

    else

    /* Identificando a Empresa da Compra (Entrada) */

    if (new.anovenda is not null) then
    begin

      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

  end
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PLANO_CONTA_NOVO
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_produto_id,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_ROTATIVIDADE_MOV
AS
  declare variable movimento numeric(18,4);
begin
  movimento =
    coalesce(new.compra_qtde_01, 0) + coalesce(new.venda_qtde_01, 0) +
    coalesce(new.compra_qtde_03, 0) + coalesce(new.venda_qtde_03, 0) +
    coalesce(new.compra_qtde_06, 0) + coalesce(new.venda_qtde_06, 0) +
    coalesce(new.compra_qtde_09, 0) + coalesce(new.venda_qtde_09, 0) +
    coalesce(new.compra_qtde_12, 0) + coalesce(new.venda_qtde_12, 0) +
    coalesce(new.compra_qtde_99, 0) + coalesce(new.venda_qtde_99, 0);

  if ( :movimento > 0 ) then
    new.movimentado = 1;
  else
    new.movimentado = 0;

  if ( new.data_ultima_compra = '1899.12.30' ) then
    new.data_ultima_compra = null;

  if ( new.data_ultima_venda = '1899.12.30' ) then
    new.data_ultima_venda = null;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_NOVA
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
    NEW.CODIGO = GEN_ID(GEN_TBPROMOCAO_ID, 1);
END^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO
AS
  declare variable produto varchar(10);
  declare variable valor_prom numeric(15,2);
begin
  if ( coalesce(old.Ativa, 0) <> coalesce(new.Ativa, 0) ) then
  begin

    for
      Select
          p.Codigo_prod
        , case when new.Ativa = 1 then p.Preco_promocao else null end
      from TBPROMOCAO_PRODUTO p
      where p.Codigo_prom = new.Codigo
      into
          produto
        , valor_prom
    do
    begin
      Update TBPRODUTO x Set
        x.Preco_promocao = :Valor_prom
      where x.Cod = :Produto;
    end 

  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO_RETIRAR
AS
begin
  /* Retirar Preco de Promocao da Ficha do Produto */
  Update TBPRODUTO p Set
    p.Preco_promocao = null
  where p.Cod = old.Codigo_prod;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SECAOPRODUTO_COD
As
Begin
  If (New.Scp_cod Is Null) Then
    New.Scp_cod = Gen_id(GEN_SECAOPRODUTO_ID,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TBCONTREC_SALDO
AS
begin
  new.valorsaldo = ( coalesce(new.valorrec, 0) + coalesce(new.valormulta, 0) - ( coalesce(new.valorrec, 0) * coalesce(new.percentdesconto, 0) / 100 ) ) - coalesce(new.valorrectot, 0);
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TIPO_LOGRADOURO_COD
As
Begin
  If (New.Tlg_cod Is Null) Then
    New.Tlg_cod = Gen_id(Gen_tipo_logradouro_id,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_UNIDADEPRODUTO_COD
As
Begin
  If (New.Unp_cod Is Null) Then
    New.Unp_cod = Gen_id(Gen_unidadeproduto_id,1);
End^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_RESERVAR
AS
  --declare variable status_venda Smallint;
  declare variable reserva integer;
begin
  /*
  Select
    v.Status
  from TBVENDAS v
  where v.Ano = new.Ano
    and v.Codcontrol = new.Codcontrol
  into
    status_venda;
  */

  Exit; -- Descontinuada RESERVA

  if ( Inserting or Updating  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0) + coalesce(new.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = new.Codprod
        and p.Codemp = new.Codemp
      into
        Reserva;
  end

  else

  if ( Deleting  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = old.Codprod
        and p.Codemp = old.Codemp
      into
        Reserva;
  end

  Update TBPRODUTO Set
    Reserva = :Reserva
  where Cod    = new.Codprod
    and Codemp = new.Codemp;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAIS_PRODUTO
AS
begin
  Exit;

  new.total_bruto    = ( coalesce(new.qtde, 0.0) * coalesce(new.punit, 0.0) );
  new.total_desconto = ( coalesce(new.qtde, 0.0) * coalesce(new.desconto_valor, 0.0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0.0) - coalesce(new.total_desconto, 0.0) );
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAL_VENDA
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
  declare variable total_custo Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
    , sum( coalesce(i.qtde, 0) * coalesce(p.customedio, 0) )
  from TVENDASITENS i
    inner join TBPRODUTO p on (p.cod = i.codprod)
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , Total_custo;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
    , v.Totalcusto = :Total_custo
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
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
        , coalesce(p.movimenta_estoque, 1)
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
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;

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
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
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
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.dtvenda), 4) || right('00' || extract(month from new.dtvenda), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2020, 1);
END^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CUSTO_OPERACIONAL
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

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_ESTOQUE_ATUALIZAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
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
        , Movimentar
    do
    begin
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

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
        , Trim('SAIDA - VENDA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_ESTOQUE_CLIENTE
AS
  declare variable produto varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
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

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 2  -- 2. Autorizada
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

    -- Cancelar Duplicata (Contas A Pagar)
    Update TBCONTPAG cp Set
      cp.Situacao = 0 -- Cancelado
    where cp.Empresa   = new.Codemp
      and cp.codforn   = new.Codforn
      and cp.anocompra = new.Ano
      and cp.numcompra = new.Codcontrol
      and cp.quitado   = 0;

  end 
end^

/*------ 11/09/2014 15:14:56 --------*/

SET TERM ; ^

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.SIS_COD IS
'Sistema.';

/*------ 11/09/2014 15:14:56 --------*/

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.ROT_COD IS
'Rotina.';

/*------ 11/09/2014 15:14:56 --------*/

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.ACESSO IS
'Rotina Liberada para o Sistema:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:56 --------*/

GRANT ALL ON SYS_SISTEMA_ROTINA TO "PUBLIC";

/*------ 11/09/2014 15:14:57 --------*/

ALTER TABLE SYS_SISTEMA_ROTINA ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 1;

/*------ 11/09/2014 15:14:57 --------*/

ALTER TABLE SYS_SISTEMA_ROTINA DROP IBE$$TEMP_COLUMN;

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON TABLE SYS_SISTEMA_ROTINA IS 'Tabela Sistema x Rotina.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/06/2014

Tabela responsavel por associar o(s) com a(s) rotina(s) que o sistema pode acessar.';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON TABLE SYS_ROTINA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar as rotinas de acesso disponiveis para o sistema e seu controle de acesso.';

/*------ 11/09/2014 15:14:57 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ROTINA (
    SISTEMA DMN_SMALLINT_NN,
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  /* Gravar Rotina */

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
      , case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);

  /* Gravar Associacao Rotina x Sistema */
  if ( coalesce(:sistema, 0) > 0 ) then
    if (not exists(
      Select
        s.acesso
      from SYS_SISTEMA_ROTINA s
      where s.sis_cod = :sistema
        and s.rot_cod = :codigo
    )) then
      Insert Into SYS_SISTEMA_ROTINA (
          sis_cod
        , rot_cod
        , acesso
      ) values (
          :sistema
        , :codigo
        , 1
      );
end^

/*------ 11/09/2014 15:14:57 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_ROTINA (
    SISTEMA DMN_SMALLINT_NN,
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  /* Gravar Rotina */

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
      , case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);

  /* Gravar Associacao Rotina x Sistema */
  if ( coalesce(:sistema, -1) > -1 ) then
    if (not exists(
      Select
        s.acesso
      from SYS_SISTEMA_ROTINA s
      where s.sis_cod = :sistema
        and s.rot_cod = :codigo
    )) then
      Insert Into SYS_SISTEMA_ROTINA (
          sis_cod
        , rot_cod
        , acesso
      ) values (
          :sistema
        , :codigo
        , 1
      );
end^

/*------ 11/09/2014 15:14:57 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_DUPLICATAS (
    ANOCOMPRA smallint,
    NUMCOMPRA integer)
returns (
    FORNECEDOR integer,
    NOTAFISCAL integer,
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    DATA_ENTRADA date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable TIPO_DESPESA smallint;
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
        c.Codforn
      , c.Nf
      , c.tipo_despesa
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , coalesce(c.dtemiss, c.dtent)
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , Tipo_Despesa
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
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
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
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end^

/*------ 11/09/2014 15:14:57 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBTPDESPESA.TIPO_PARTICULAR IS
'Despesa Particular:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:57 --------*/

alter table TBTPDESPESA
alter COD position 1;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBTPDESPESA
alter TIPODESP position 2;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBTPDESPESA
alter TIPO_PARTICULAR position 3;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBTPDESPESA
alter PLANO_CONTA position 4;

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_COD IS
'Codigo';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_DESCRICAO IS
'Descricao';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_ESPECIFICACAO IS
'Especificacao';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_INFORMACAO_FISCO IS
'Informacao ao Fisco na NF-e';

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_COD position 1;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_DESCRICAO position 2;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_ESPECIFICACAO position 3;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_INFORMACAO_FISCO position 4;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_ALTERA_CUSTO_PRODUTO position 5;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_CST_PADRAO_ENTRADA position 6;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCFOP
alter CFOP_CST_PADRAO_SAIDA position 7;

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON TABLE TBCFOP IS 'Tabela CFOP

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar a lista de CFOPs que se pode utilizar na emissao de NF-e.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    25/06/2014 - IMR :
        + Criacao do campos EMPRESA e SITUACAO para que, ao inserir o registro de CONTAS A PAGAR, este esteja associado
          a EMPRESA responsavel como tambem se conheca sua situacao. Isto permitira que o sistema sela MULTI-EMPRESA.';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON TABLE TBCFOP IS 'Tabela CFOP

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar a lista de CFOPs que se pode utilizar na emissao de NF-e.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    25/06/2014 - IMR :
        + Criacao do campo CFOP_INFORMACAO_FISCO para armazenar o texto padrao que sera informado na NF-e quando esta
          possuir um CFOP com esta informacao.';

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.AUTORIZA_INFORMA_CLIENTE IS
'Autorizacao de Compra/Servico: Disponibilizar Controle p/ Informar o Cliente:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMPRESA position 1;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 11;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 12;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 14;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 15;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 16;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBCONFIGURACAO
alter USUARIO position 20;

/*------ 11/09/2014 15:14:57 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CLIENTE IS
'Cliente';

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter NOME_CONTATO position 6;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 7;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 8;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 9;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 10;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 11;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 12;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 13;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 14;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 15;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter CLIENTE position 16;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 17;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 18;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 19;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 20;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 21;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 22;

/*------ 11/09/2014 15:14:57 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 23;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 24;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 25;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 26;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 27;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 28;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 29;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 30;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 31;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 32;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 33;

/*------ 11/09/2014 15:14:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 34;

/*------ 11/09/2014 15:14:58 --------*/

ALTER TABLE TBCONFIGURACAO ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 0;

/*------ 11/09/2014 15:14:58 --------*/

ALTER TABLE TBCONFIGURACAO DROP IBE$$TEMP_COLUMN;

/*------ 11/09/2014 15:14:58 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_COTACAO_COMPRA_CODIGO FOR TBCOTACAO_COMPRA
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2020, 1);
end^

/*------ 11/09/2014 15:14:58 --------*/

CREATE OR ALTER TRIGGER TG_COTACAO_COMPRA_COMPETENCIA FOR TBCOTACAO_COMPRA
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 11/09/2014 15:14:58 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCOTACAO_COMPRA IS 
'Tabela Cotacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/06/2014

Tabela responsavel por armazenar as cotacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    DD/MM/AAAA - IMR :
        + ...
          ...';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON TRIGGER TG_COTACAO_COMPRA_CODIGO IS 
'Trigger Nova Cotacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/06/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de cotacao de compra/servico no ano.';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON TRIGGER TG_COTACAO_COMPRA_COMPETENCIA IS 
'Trigger Competencia Cotacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/06/2014

Trigger responsavel por identificar a competencia da cotacao quando esta nao for informada, baseando-se na data de
emissao.';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.ANO IS 
'Ano';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CODIGO IS 
'Codigo';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMPRESA IS 
'Empresa';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.NUMERO IS 
'Numero da Autorizacao (Livre)';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.TIPO IS 
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.INSERCAO_DATA IS 
'Data/hora de insercao';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMISSAO_DATA IS 
'Data de Emissao';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMISSAO_USUARIO IS 
'Usuario de Emissao';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALIDADE IS 
'Data de Validade';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.COMPETENCIA IS 
'Competencia';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.MOVITO IS 
'Motivo';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.OBSERVACAO IS 
'Observacoes';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS 
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada (NF/NFS registrada no sistema referente a autorizacao)
4 - Cancelada';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_DATA IS 
'Data de Cancelamento';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_USUARIO IS 
'Usuario de Cancelamento';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_MOTIVO IS 
'Motivo de Cancelamento';

/*------ 11/09/2014 15:14:59 --------*/

GRANT ALL ON TBCOTACAO_COMPRA TO PUBLIC;

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.LOG_EVENTO IS
'Log de Eventos';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Em Cotacao (Recebendo respostas dos fornecedores)
4 - Encerrada
5 - Cancelada';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_BRUTO IS
'Maximo: Valor Bruto';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_DESCONTO IS
'Maximo: Descontos';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_TOTAL IS
'Maximo: Valor Total Liquido';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_TOTAL IS
'Minimo: Valor Total Liquido';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_TOTAL IS
'Media: Valor Total Liquido';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_BRUTO IS
'Minimo: Valor Bruto';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_BRUTO IS
'Media: Valor Bruto';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_DESCONTO IS
'Minimo: Descontos';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_DESCONTO IS
'Media: Descontos';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.AUTORIZADA_DATA IS
'Data de Autorizacao';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.AUTORIZADA_USUARIO IS
'Usuario da Autorizacao';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.ENCERRADA_DATA IS
'Data de Encerramento';

/*------ 11/09/2014 15:14:59 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.ENCERRADA_USUARIO IS
'Usuario de Encerramento';

/*------ 11/09/2014 15:14:59 --------*/

alter table TBCOTACAO_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:14:59 --------*/

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:14:59 --------*/

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 15;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 16;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 17;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 18;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 19;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 20;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 21;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 22;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 23;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 24;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 25;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 26;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 27;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 28;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 29;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 30;

/*------ 11/09/2014 15:15:00 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_REF_TOTAL IS
'Valor Total Liquido de Referencia';

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 15;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 16;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 17;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 18;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 19;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 20;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 21;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 22;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 23;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 24;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 25;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 26;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 27;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 28;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 29;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 30;

/*------ 11/09/2014 15:15:00 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 31;

/*------ 11/09/2014 15:15:00 --------*/

COMMENT ON TABLE TBCOTACAO_COMPRAITEM IS 
'Tabela de Produtos/Servicos da Cotacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   27/06/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das cotacoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    DD/MM/AAAA - IMR :
        + ...
          ...';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.ANO IS 
'Ano da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.CODIGO IS 
'Codigo da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.EMPRESA IS 
'Empresa da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.SEQ IS 
'Sequencial';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.QUANTIDADE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.UNIDADE IS 
'Unidade de Medida';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.USUARIO IS
'Usuario de lancamento';

/*------ 11/09/2014 15:15:01 --------*/

GRANT ALL ON TBCOTACAO_COMPRAITEM TO PUBLIC;

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON TABLE TBCOTACAO_COMPRAITEM IS 
'Tabela de Produtos/Servicos da Cotacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   27/06/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das cotacoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    DD/MM/AAAA - IMR :
        + ...
          ...';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.ANO IS 
'Ano da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.CODIGO IS 
'Codigo da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.EMPRESA IS 
'Empresa da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.SEQ IS 
'Sequencial';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.QUANTIDADE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.UNIDADE IS 
'Unidade de Medida';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_REF IS
'Valor Unitario de Referencia';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_REF IS
'Valor Total de Referencia = (Quantidade * Valor Unitario de Referencia)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.USUARIO IS
'Usuario de lancamento';

/*------ 11/09/2014 15:15:01 --------*/

GRANT ALL ON TBCOTACAO_COMPRAITEM TO PUBLIC;

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MIN IS
'Valor Unitario Minimo';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MAX IS
'Valor Unitario Maximo';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MEDIA IS
'Valor Unitario Medio';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MIN IS
'Valor Total Minimo = (Quantidade * Valor Unitario Minimo)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MAX IS
'Valor Total Maximo = (Quantidade * Valor Unitario Maximo)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MEDIA IS
'Valor Total Medio = (Quantidade * Valor Unitario Medio)';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.NUMERO_MINIMO_FORNECEDOR IS
'Numero Minimo de Fornecedores para Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 15;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 16;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 17;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 18;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 19;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 20;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 21;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 22;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 23;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 24;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 25;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 26;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 27;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 28;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 29;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 30;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 31;

/*------ 11/09/2014 15:15:01 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 32;

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ANO IS
'Ano da Cotacao';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.EMPRESA IS
'Empresa';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.FORNECEDOR IS
'Fornecedor';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.OBSERVACAO IS
'Observacoes';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ATIVO IS
'Fornecedor ativo paara Cotacao:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:01 --------*/

GRANT ALL ON TBCOTACAO_COMPRAFORN TO "PUBLIC";

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.USUARIO IS
'Usuario de lancamento';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.FORMA_PAGTO IS
'Forma de Pagamento';

/*------ 11/09/2014 15:15:01 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.CONDICAO_PAGTO IS
'Condicao de Pagamento';

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.PRAZO_ENTREGA_DATA IS
'Prazo de Entrega (Data)';

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.PRAZO_ENTREDA_DIA IS
'Prazo de Entrega (Em dias apos faturamento)';

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 5;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 6;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 7;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 8;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 9;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 10;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 11;

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.NOME_CONTATO IS
'Nome de Contato';

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.EMAIL_ENVIO IS
'E-mail';

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 9;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 10;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 11;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 12;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 13;

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ATIVO IS
'Fornecedor ativo para Cotacao:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:02 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN DROP CONSTRAINT FK_TBCOTACAO_COMPRAFORN_COT;

/*------ 11/09/2014 15:15:02 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_COT
FOREIGN KEY (ANO,CODIGO,EMPRESA)
REFERENCES TBCOTACAO_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*------ 11/09/2014 15:15:02 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compraforn_cotar for tbcotacao_compraforn
active after insert or update or delete position 0
AS
  declare variable ano DMN_SMALLINT_N;
  declare variable cod DMN_BIGINT_N;
  declare variable emp DMN_CNPJ;
  declare variable cotacoes Integer;
begin
  if ( inserting or updating ) then
  begin
    ano = new.ano;
    cod = new.codigo;
    emp = new.empresa;
  end 
  else
  if ( deleting ) then
  begin
    ano = old.ano;
    cod = old.codigo;
    emp = old.empresa;
  end

  Select
    count(cf.fornecedor)
  from TBCOTACAO_COMPRAFORN cf
  where cf.ano     = :ano
    and cf.codigo  = :cod
    and cf.empresa = :emp
  Into
    cotacoes;

  Update TBCOTACAO_COMPRA c Set
    c.status =
      Case when coalesce(:cotacoes, 0) = 0
        then 2 -- Autorizada
        else 3 -- Em Cotacao (Recebendo respostas dos fornecedores)
      End
  where c.status in (2, 3)
    and c.ano     = :ano
    and c.codigo  = :cod
    and c.empresa = :emp;

end^

/*------ 11/09/2014 15:15:02 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_COTACAO_COMPRAFORN_COTAR IS 'Trigger Colocar Registro em Cotacao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/06/2014

Trigger responsavel por alterar o status do registro de Cotacao de Compra/Servico quando os dados referentes aos
fornecedores pertencentes a esta sao trabalhados.';

/*------ 11/09/2014 15:15:02 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.DESCRICAO_RESUMO IS
'Descricao resumo';

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter DESCRICAO_RESUMO position 6;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 7;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 8;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 9;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALIDADE position 10;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 11;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter MOVITO position 12;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 13;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 14;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter STATUS position 15;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 16;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 17;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 18;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 19;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 20;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 21;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 22;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 23;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 24;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 25;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 26;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 27;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 28;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 29;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 30;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 31;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 32;

/*------ 11/09/2014 15:15:02 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 33;

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.NOME_CONTATO_INT IS
'Nome de Contato Interno';

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter ANO position 1;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter DESCRICAO_RESUMO position 6;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter NOME_CONTATO_INT position 7;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 8;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 9;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 10;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALIDADE position 11;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 12;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter MOVITO position 13;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 14;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 15;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter STATUS position 16;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 17;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 18;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 19;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 20;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 21;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 22;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 23;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 24;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 25;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 26;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 27;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 28;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 29;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 30;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 31;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 32;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 33;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 34;

/*------ 11/09/2014 15:15:03 --------*/

GRANT ALL ON VW_TIPO_COTACAO TO PUBLIC;

/*------ 11/09/2014 15:15:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:15:03 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );
      Percentual_margem = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:15:03 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:15:03 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:15:03 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.DATA_RESPOSTA IS
'Data de Resposta';

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 9;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 10;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 11;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 12;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 13;

/*------ 11/09/2014 15:15:03 --------*/

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 14;

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.ANO IS
'Ano';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.CODIGO IS
'Codigo';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.EMPRESA IS
'Empresa';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.FORNECEDOR IS
'Fornecedor';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.ITEM IS
'Item';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.VALOR_UNITARIO IS
'Valor Unitario (R$)';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.VALOR_TOTAL IS
'Valor Total (R$)';

/*------ 11/09/2014 15:15:03 --------*/

COMMENT ON TABLE TBCOTACAO_COMPRAFORN_ITEM IS 'Tabela Cotacao de Compras/Servicos Forneredor/Item

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/07/2014

Tabela responsavel por armazenar as respostas dos fornecedores referentes as cotacoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    DD/MM/AAAA - IMR :
        + ...
          ...';

/*------ 11/09/2014 15:15:03 --------*/

GRANT ALL ON TBCOTACAO_COMPRAFORN_ITEM TO "PUBLIC";

/*------ 11/09/2014 15:15:04 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_BRUTO IS
'Total Bruto da Proposta (R$)';

/*------ 11/09/2014 15:15:04 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_DESCONTO IS
'Total Descontos da Proposta (R$)';

/*------ 11/09/2014 15:15:04 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_LIQUIDO IS
'Total Liquido da Proposta (R$)';

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_BRUTO position 9;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_DESCONTO position 10;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_LIQUIDO position 11;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 12;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 13;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 14;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 15;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 16;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 17;

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

SET TERM ; ^

COMMENT ON TABLE TBCOTACAO_COMPRAFORN IS 'Tabela de Fornecedores da Cotacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/07/2014

Tabela responsavel por armazenar os fornecedores das cotacoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    DD/MM/AAAA - IMR :
        + ...
          ...';

/*------ 11/09/2014 15:15:04 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VENCEDOR IS
'Fornecedor vencedor da Cotacao:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_BRUTO position 9;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_DESCONTO position 10;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_LIQUIDO position 11;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter VENCEDOR position 12;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 13;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 14;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 15;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 16;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 17;

/*------ 11/09/2014 15:15:04 --------*/

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 18;

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compraforn_item_vlr for tbcotacao_compraforn_item
active after insert or update or delete position 0
AS
  declare variable Ano DMN_SMALLINT_N;
  declare variable Cod DMN_BIGINT_N;
  declare variable Emp DMN_CNPJ;
  declare variable Frn DMN_INTEGER_N;

  declare variable Total_Bruto    DMN_MONEY;
  declare variable Total_Desconto DMN_MONEY;
  declare variable Total_Liquido  DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    Ano = new.ano;
    Cod = new.codigo;
    Emp = new.empresa;
    Frn = new.fornecedor;
  end 
  else
  if ( deleting ) then
  begin
    Ano = old.ano;
    Cod = old.codigo;
    Emp = old.empresa;
    Frn = old.fornecedor;
  end

  Select
      coalesce(f.valor_total_desconto, 0.0)
    , sum( coalesce(c.valor_total, 0.0) )
  from TBCOTACAO_COMPRAFORN f
    left join TBCOTACAO_COMPRAFORN_ITEM c on (c.ano = f.ano and c.codigo = f.codigo and c.empresa = f.empresa and c.fornecedor = f.fornecedor)
  where f.ano        = :Ano
    and f.codigo     = :Cod
    and f.empresa    = :Emp
    and f.fornecedor = :Frn
  group by
      coalesce(f.valor_total_desconto, 0.0)
  Into
      Total_Desconto
    , Total_Bruto;

  Total_Liquido = :Total_Bruto - :Total_Desconto;

  Update TBCOTACAO_COMPRAFORN f Set
      f.valor_total_bruto    = coalesce(:Total_Bruto, 0.0)
    , f.valor_total_desconto = coalesce(:Total_Desconto, 0.0)
    , f.valor_total_liquido  = coalesce(:Total_Liquido, 0.0)
  where f.ano        = :Ano
    and f.codigo     = :Cod
    and f.empresa    = :Emp
    and f.fornecedor = :Frn;
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_COTACAO_COMPRAFORN_ITEM_VLR IS 'Trigger Totalizar Resposta Fornecedor/Cotacao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/07/2014

Trigger responsavel por totalizar os valores referentes a resposta dos fornecedores em relacao as cotacoes.';

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compraforn_cotar for tbcotacao_compraforn
active after insert or update or delete position 0
AS
  declare variable ano DMN_SMALLINT_N;
  declare variable cod DMN_BIGINT_N;
  declare variable emp DMN_CNPJ;
  declare variable valor DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    ano = new.ano;
    cod = new.codigo;
    emp = new.empresa;
  end 
  else
  if ( deleting ) then
  begin
    ano = old.ano;
    cod = old.codigo;
    emp = old.empresa;
  end

  Select
    sum( coalesce(cf.valor_total_liquido, 0.0) )
  from TBCOTACAO_COMPRAFORN cf
  where cf.ano     = :ano
    and cf.codigo  = :cod
    and cf.empresa = :emp
  Into
    valor;

  Update TBCOTACAO_COMPRA c Set
    c.status =
      Case when coalesce(:valor, 0.0) = 0.0
        then 2 -- Autorizada
        else 3 -- Em Cotacao (Recebendo respostas dos fornecedores)
      End
  where c.status in (2, 3)
    and c.ano     = :ano
    and c.codigo  = :cod
    and c.empresa = :emp;

end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Em Cotacao (Recebendo respostas dos fornecedores)
4 - Autorizada/Encerrada
5 - Cancelada';

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compraforn_cotar for tbcotacao_compraforn
active after insert or update or delete position 0
AS
  declare variable ano DMN_SMALLINT_N;
  declare variable cod DMN_BIGINT_N;
  declare variable emp DMN_CNPJ;
  declare variable valor DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    ano = new.ano;
    cod = new.codigo;
    emp = new.empresa;
  end 
  else
  if ( deleting ) then
  begin
    ano = old.ano;
    cod = old.codigo;
    emp = old.empresa;
  end

  Select
    sum( coalesce(cf.valor_total_liquido, 0.0) )
  from TBCOTACAO_COMPRAFORN cf
  where cf.ano     = :ano
    and cf.codigo  = :cod
    and cf.empresa = :emp
  Into
    valor;

  Update TBCOTACAO_COMPRA c Set
    c.status =
      Case when coalesce(:valor, 0.0) = 0.0
        then 1 -- Aberta
        else 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
      End
  where c.status in (2, 3)
    and c.ano     = :ano
    and c.codigo  = :cod
    and c.empresa = :emp;

end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

SET TERM ^ ;

create or alter procedure SET_COTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_COTACAO_COMPRAFORN_ITEM TO "PUBLIC";

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null
    order by i.seq;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null
    order by i.seq;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null
    order by i.seq;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null
    order by i.seq;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

SET TERM ^ ;

create or alter procedure SET_COTACAO_COMPRAFORN_PROCESSA (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_MAXIMO DMN_MONEY;
declare variable VALOR_MINIMO DMN_MONEY;
declare variable VALOR_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO DMN_MONEY;
declare variable TOTAL_MINIMO DMN_MONEY;
declare variable TOTAL_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO_DESC DMN_MONEY;
declare variable TOTAL_MINIMO_DESC DMN_MONEY;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_COTACAO_COMPRAFORN_PROCESSA TO "PUBLIC";

/*------ 11/09/2014 15:15:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_PROCESSA (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_MAXIMO DMN_MONEY;
declare variable VALOR_MINIMO DMN_MONEY;
declare variable VALOR_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO DMN_MONEY;
declare variable TOTAL_MINIMO DMN_MONEY;
declare variable TOTAL_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO_DESC DMN_MONEY;
declare variable TOTAL_MINIMO_DESC DMN_MONEY;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

/*------ 11/09/2014 15:15:05 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_PROCESSA (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_MAXIMO DMN_MONEY;
declare variable VALOR_MINIMO DMN_MONEY;
declare variable VALOR_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO DMN_MONEY;
declare variable TOTAL_MINIMO DMN_MONEY;
declare variable TOTAL_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO_DESC DMN_MONEY;
declare variable TOTAL_MINIMO_DESC DMN_MONEY;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
      and fi.valor_unitario > 0.0
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

/*------ 11/09/2014 15:15:05 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER procedure SET_COTACAO_COMPRAFORN_PROCESSA (
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_MAXIMO DMN_MONEY;
declare variable VALOR_MINIMO DMN_MONEY;
declare variable VALOR_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO DMN_MONEY;
declare variable TOTAL_MINIMO DMN_MONEY;
declare variable TOTAL_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO_DESC DMN_MONEY;
declare variable TOTAL_MINIMO_DESC DMN_MONEY;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
      and fi.valor_unitario > 0.0
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido > 0.0
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

/*------ 11/09/2014 15:15:05 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compraforn_cotar for tbcotacao_compraforn
active after insert or update or delete position 0
AS
  declare variable ano DMN_SMALLINT_N;
  declare variable cod DMN_BIGINT_N;
  declare variable emp DMN_CNPJ;
  declare variable valor DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    ano = new.ano;
    cod = new.codigo;
    emp = new.empresa;
  end 
  else
  if ( deleting ) then
  begin
    ano = old.ano;
    cod = old.codigo;
    emp = old.empresa;
  end

  Select
    sum( coalesce(cf.valor_total_liquido, 0.0) )
  from TBCOTACAO_COMPRAFORN cf
  where cf.ano     = :ano
    and cf.codigo  = :cod
    and cf.empresa = :emp
  Into
    valor;

  Update TBCOTACAO_COMPRA c Set
    c.status =
      Case when coalesce(:valor, 0.0) = 0.0
        then 1 -- Aberta
        else 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
      End
  where c.status in (1, 2)
    and c.ano     = :ano
    and c.codigo  = :cod
    and c.empresa = :emp;

end^

/*------ 11/09/2014 15:15:05 --------*/

SET TERM ; ^

/*------ 11/09/2014 15:15:14 --------*/

DROP VIEW VW_TIPO_DOCUMENTO_ENTRADA;

/*------ 11/09/2014 15:15:14 --------*/

CREATE VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'       as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal' as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D' as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'     as TPD_DESCRICAO from RDB$DATABASE;

/*------ 11/09/2014 15:15:14 --------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_DOCUMENTO_ENTRADA TO "PUBLIC";

/*------ 11/09/2014 15:15:14 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_EMITIR_NFE DMN_LOGICO DEFAULT 1;

/*------ 11/09/2014 15:15:14 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFE_EMITIR_NFE IS
'NF-e: Emitir Nota Fiscal Eletronica:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMPRESA position 1;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter NFE_EMITIR_NFE position 11;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 12;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 13;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 14;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 15;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 16;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 17;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 18;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 19;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 20;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBCONFIGURACAO
alter USUARIO position 21;

/*------ 11/09/2014 15:15:14 --------*/

COMMENT ON COLUMN TBVENDAS.DESCONTO_CUPOM IS
'Valor Total Desconto no Cupom (Livre).';

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter ANO position 1;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CODEMP position 3;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CODCLIENTE position 4;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CODCLI position 5;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter DTVENDA position 6;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter COMPETENCIA position 7;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter STATUS position 8;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter DESCONTO position 10;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter TOTALVENDA position 12;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter TOTALCUSTO position 13;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter OBS position 15;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter FORMAPAG position 16;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter FATDIAS position 17;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter SERIE position 18;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE position 19;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter DATAEMISSAO position 20;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter HORAEMISSAO position 21;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CFOP position 22;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter XML_NFE position 24;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter VENDEDOR_COD position 25;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter USUARIO position 26;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter VENDA_PRAZO position 29;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_01 position 30;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_02 position 31;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_03 position 32;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_04 position 33;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_05 position 34;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_06 position 35;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_07 position 36;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_08 position 37;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_09 position 38;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_10 position 39;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_11 position 40;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter PRAZO_12 position 41;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE_ENVIADA position 45;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CANCEL_USUARIO position 46;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CANCEL_DATAHORA position 47;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter CANCEL_MOTIVO position 48;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter XML_NFE_FILENAME position 49;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 50;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 51;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 52;

/*------ 11/09/2014 15:15:14 --------*/

alter table TBVENDAS
alter NFE_PLACA_UF position 53;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_PLACA_RNTC position 54;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 55;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_ICMS position 56;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 57;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 58;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 59;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_FRETE position 60;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 61;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 62;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 63;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 64;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_PIS position 65;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_COFINS position 66;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 67;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 68;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 69;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 70;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 71;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 72;

/*------ 11/09/2014 15:15:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
  declare variable total_custo Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
    , sum( coalesce(i.qtde, 0) * coalesce(p.customedio, 0) )
  from TVENDASITENS i
    inner join TBPRODUTO p on (p.cod = i.codprod)
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , Total_custo;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = (:Total_liquido - coalesce(v.Desconto_cupom, 0.0))
    , v.Totalcusto = :Total_custo
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

/*------ 11/09/2014 15:15:15 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento n oPDV:
0 - Nao
1 - SIm';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento n oPDV:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBUSERS.VENDEDOR IS
'Vendedor';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN SYS_ESTACAO.EST_NOME IS
'Nome da Estacao.';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN SYS_ESTACAO.EST_IP IS
'IP da Estacao.';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON TABLE SYS_ESTACAO IS 'Tabela de Estacoes de Trabalho.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   12/08/2014

Tabela responsavel por armazenar a lista de estacoes que trabalho liberadas para uso do(s) sistema(s).';

/*------ 11/09/2014 15:15:15 --------*/

GRANT ALL ON SYS_ESTACAO TO "PUBLIC";

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV IS
'Usar forma de pagamento no PDV:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:15 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_ULTIMO_ACESSO DMN_DATETIME;

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN SYS_ESTACAO.EST_ULTIMO_ACESSO IS
'Ultimo acesso.';

/*------ 11/09/2014 15:15:15 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_LOCAL DMN_VCHAR_100;

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN SYS_ESTACAO.EST_LOCAL IS
'Local.';

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter EST_NOME position 1;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter EST_IP position 2;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter EST_LOCAL position 3;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter EST_ULTIMO_ACESSO position 4;

/*------ 11/09/2014 15:15:15 --------*/

ALTER TABLE SYS_ESTACAO
    ADD EST_REGISTRO DMN_VCHAR_100;

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN SYS_ESTACAO.EST_REGISTRO IS
'Registro.';

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter column EST_NOME position 1;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter column EST_IP position 2;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter column EST_LOCAL position 3;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter column EST_REGISTRO position 4;

/*------ 11/09/2014 15:15:15 --------*/

alter table SYS_ESTACAO
alter column EST_ULTIMO_ACESSO position 5;

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON TABLE TBFORMPAGTO IS 'Tabela de Formas de Pagamneto

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar as formas de pagamentos utilizadas nas movimentacoes de COMPRA e VENDA e seus
respectivos parametros de comportamento.';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.COD IS
'Codigo';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.DESCRI IS
'Descricao';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.ACRESCIMO IS
'Percentual Acrescimo';

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBFORMPAGTO.CONTA_CORRENTE IS
'Conta Corrente';

/*------ 11/09/2014 15:15:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 2  -- 2. Autorizada
      , ac.data_fatura = null
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

    -- Cancelar Duplicata (Contas A Pagar)
    Update TBCONTPAG cp Set
      cp.Situacao = 0 -- Cancelado
    where cp.Empresa   = new.Codemp
      and cp.codforn   = new.Codforn
      and cp.anocompra = new.Ano
      and cp.numcompra = new.Codcontrol
      and cp.quitado   = 0;

  end 
end^

/*------ 11/09/2014 15:15:15 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 15:15:15 --------*/

SET TERM ; ^

ALTER TABLE TBCONFIGURACAO
    ADD NFE_ACEITAR_NOTA_DENEGADA DMN_SMALLINT_N DEFAULT 0;

/*------ 11/09/2014 15:15:15 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFE_ACEITAR_NOTA_DENEGADA IS
'NF-e: Aceitar/Salvar XML de Notas Fiscais Eletronicas Denegadas:
0 - Nao
1 - Sim

Rejeicao:

301 -> Uso Denegado: Irregularidade fiscal do emitente
302 -> Uso Denegado: Irregularidade fiscal do destinatario';

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMPRESA position 1;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter NFE_EMITIR position 11;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 12;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 13;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 14;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 15;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 16;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 17;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 18;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 19;

/*------ 11/09/2014 15:15:15 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 20;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 21;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCONFIGURACAO
alter USUARIO position 22;

/*------ 11/09/2014 15:15:16 --------*/

ALTER TABLE TBVENDAS
    ADD NFE_DENEGADA DMN_SMALLINT_N DEFAULT 0,
    ADD NFE_DENEGADA_MOTIVO DMN_VCHAR_100;

/*------ 11/09/2014 15:15:16 --------*/

COMMENT ON COLUMN TBVENDAS.NFE_DENEGADA IS
'NF de Saida Denegada:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:16 --------*/

COMMENT ON COLUMN TBVENDAS.NFE_DENEGADA_MOTIVO IS
'Motivo da NF denegada.';

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter ANO position 1;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CODEMP position 3;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CODCLIENTE position 4;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CODCLI position 5;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter DTVENDA position 6;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter COMPETENCIA position 7;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter STATUS position 8;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter DESCONTO position 10;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter TOTALVENDA position 12;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter TOTALCUSTO position 13;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter OBS position 15;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter FORMAPAG position 16;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter FATDIAS position 17;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter SERIE position 18;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE position 19;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter DATAEMISSAO position 20;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter HORAEMISSAO position 21;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CFOP position 22;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter XML_NFE position 24;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter VENDEDOR_COD position 25;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter USUARIO position 26;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter VENDA_PRAZO position 29;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_01 position 30;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_02 position 31;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_03 position 32;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_04 position 33;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_05 position 34;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_06 position 35;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_07 position 36;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_08 position 37;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_09 position 38;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_10 position 39;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_11 position 40;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter PRAZO_12 position 41;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_ENVIADA position 45;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_DENEGADA position 46;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 47;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CANCEL_USUARIO position 48;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CANCEL_DATAHORA position 49;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CANCEL_MOTIVO position 50;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter XML_NFE_FILENAME position 51;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 52;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 53;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 54;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_PLACA_UF position 55;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_PLACA_RNTC position 56;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 57;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_ICMS position 58;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 59;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 60;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 61;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_FRETE position 62;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 63;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 64;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 65;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 66;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_PIS position 67;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_COFINS position 68;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 69;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 70;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 71;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 72;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 73;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 74;

/*------ 11/09/2014 15:15:16 --------*/

ALTER TABLE TBCOMPRAS
    ADD NFE_DENEGADA DMN_SMALLINT_N DEFAULT 0,
    ADD NFE_DENEGADA_MOTIVO DMN_VCHAR_100;

/*------ 11/09/2014 15:15:16 --------*/

COMMENT ON COLUMN TBCOMPRAS.NFE_DENEGADA IS
'NF de Entrada Denegada:
0 - Nao
1 - Sim';

/*------ 11/09/2014 15:15:16 --------*/

COMMENT ON COLUMN TBCOMPRAS.NFE_DENEGADA_MOTIVO IS
'Motivo da NF denegada.';

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter ANO position 1;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter CODCONTROL position 2;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter CODEMP position 3;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter CODFORN position 4;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter TIPO_MOVIMENTO position 7;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter NF position 8;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter NFSERIE position 9;

/*------ 11/09/2014 15:15:16 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 10;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 11;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 12;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter NFE_ENVIADA position 13;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter NFE_DENEGADA position 14;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 15;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 16;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter XML_NFE position 17;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 18;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter DTLANCAMENTO position 19;

/*------ 11/09/2014 15:15:17 --------*/

alter table TBCOMPRAS
alter DTEMISS position 20;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter HREMISS position 21;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter DTENT position 22;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter NFCFOP position 23;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter NATUREZA position 24;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter STATUS position 25;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter IPI position 26;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter ICMSBASE position 27;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter ICMSVALOR position 28;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 29;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 30;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter FRETE position 31;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter OUTROSCUSTOS position 32;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter DESCONTO position 33;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter VALORSEGURO position 34;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_II position 35;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 36;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter VALORPIS position 37;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter VALORCOFINS position 38;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter TOTALPROD position 39;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter TOTALNF position 40;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter OBS position 41;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter USUARIO position 42;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 43;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 44;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter COMPRA_PRAZO position 45;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_01 position 46;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_02 position 47;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_03 position 48;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_04 position 49;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_05 position 50;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_06 position 51;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_07 position 52;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_08 position 53;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_09 position 54;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_10 position 55;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_11 position 56;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter PRAZO_12 position 57;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 58;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter TIPO_DESPESA position 59;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter CANCEL_USUARIO position 60;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 61;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 62;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 63;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 64;

/*------ 11/09/2014 15:15:18 --------*/

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 65;

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
        clientes.
    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
        denegadas e guarda-las na base.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
        denegadas e guarda-las na base.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
        armazenar o motivo da denegacao.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.
    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2014

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.';

/*------ 11/09/2014 15:15:18 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.';


/*------ SYSDBA 11/09/2014 16:56:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '000000000000000000');

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

SET TERM ; ^



/*------ 11/09/2014 17:03:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = new.autorizacao_ano
      and ac.codigo  = new.autorizacao_codigo
      and ac.empresa = new.autorizacao_empresa;

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = new.autorizacao_ano
        and aci.codigo  = new.autorizacao_codigo
        and aci.empresa = new.autorizacao_empresa
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio/Final no valor de R$ ' || :Custo_final
      );
    end
     
  end 
end^

/*------ 11/09/2014 17:03:41 --------*/

SET TERM ; ^


/*------ SYSDBA 11/09/2014 17:04:02 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_250'
where (RDB$FIELD_NAME = 'MOTIVO') and
(RDB$RELATION_NAME = 'TBPRODHIST')
;




/*------ SYSDBA 11/09/2014 17:04:20 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_60'
where (RDB$FIELD_NAME = 'RESP') and
(RDB$RELATION_NAME = 'TBPRODHIST')
;




/*------ SYSDBA 17/09/2014 13:58:49 --------*/

ALTER TABLE TBNFE_ENVIADA
    ADD MODELO DMN_SMALLINT_N DEFAULT 0,
    ADD VERSAO DMN_SMALLINT_N DEFAULT 0;

COMMENT ON COLUMN TBNFE_ENVIADA.MODELO IS
'Modelo DF:
0 - moNFe
1 - moNFCe';

COMMENT ON COLUMN TBNFE_ENVIADA.VERSAO IS
'Versao da NF-e:
0 - ve200
1 - ve300
2 - ve310';

alter table TBNFE_ENVIADA
alter EMPRESA position 1;

alter table TBNFE_ENVIADA
alter SERIE position 2;

alter table TBNFE_ENVIADA
alter NUMERO position 3;

alter table TBNFE_ENVIADA
alter MODELO position 4;

alter table TBNFE_ENVIADA
alter VERSAO position 5;

alter table TBNFE_ENVIADA
alter ANOVENDA position 6;

alter table TBNFE_ENVIADA
alter NUMVENDA position 7;

alter table TBNFE_ENVIADA
alter ANOCOMPRA position 8;

alter table TBNFE_ENVIADA
alter NUMCOMPRA position 9;

alter table TBNFE_ENVIADA
alter DATAEMISSAO position 10;

alter table TBNFE_ENVIADA
alter HORAEMISSAO position 11;

alter table TBNFE_ENVIADA
alter CHAVE position 12;

alter table TBNFE_ENVIADA
alter PROTOCOLO position 13;

alter table TBNFE_ENVIADA
alter RECIBO position 14;

alter table TBNFE_ENVIADA
alter XML_FILENAME position 15;

alter table TBNFE_ENVIADA
alter XML_FILE position 16;

alter table TBNFE_ENVIADA
alter LOTE_ANO position 17;

alter table TBNFE_ENVIADA
alter LOTE_NUM position 18;




/*------ SYSDBA 25/09/2014 22:12:35 --------*/

ALTER TABLE TBEMPRESA
    ADD CARTA_CORRECAO_NFE DMN_INTEGER_N;

ALTER TABLE TBEMPRESA
    ALTER SERIE_NFE TYPE DMN_SMALLINT_N,
    ALTER NUMERO_NFE TYPE DMN_INTEGER_N,
    ALTER LOTE_ANO_NFE TYPE DMN_SMALLINT_N,
    ALTER LOTE_NUM_NFE TYPE DMN_INTEGER_N;

COMMENT ON COLUMN TBEMPRESA.SERIE_NFE IS
'NF-e : Serie.';

COMMENT ON COLUMN TBEMPRESA.NUMERO_NFE IS
'NF-e : Ultima emitida.';

COMMENT ON COLUMN TBEMPRESA.LOTE_ANO_NFE IS
'NF-e : Ano Lote.';

COMMENT ON COLUMN TBEMPRESA.LOTE_NUM_NFE IS
'NF-e : Numero do ultimo lote enviado.';

COMMENT ON COLUMN TBEMPRESA.CARTA_CORRECAO_NFE IS
'NF-e : Numero da ultima carta de correcao emitida/enviada.';

alter table TBEMPRESA
alter CODIGO position 1;

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

alter table TBEMPRESA
alter CNPJ position 3;

alter table TBEMPRESA
alter RZSOC position 4;

alter table TBEMPRESA
alter NMFANT position 5;

alter table TBEMPRESA
alter IE position 6;

alter table TBEMPRESA
alter IM position 7;

alter table TBEMPRESA
alter SEGMENTO position 8;

alter table TBEMPRESA
alter CNAE position 9;

alter table TBEMPRESA
alter ENDER position 10;

alter table TBEMPRESA
alter COMPLEMENTO position 11;

alter table TBEMPRESA
alter BAIRRO position 12;

alter table TBEMPRESA
alter CEP position 13;

alter table TBEMPRESA
alter CIDADE position 14;

alter table TBEMPRESA
alter UF position 15;

alter table TBEMPRESA
alter FONE position 16;

alter table TBEMPRESA
alter FONE2 position 17;

alter table TBEMPRESA
alter LOGO position 18;

alter table TBEMPRESA
alter TLG_TIPO position 19;

alter table TBEMPRESA
alter LOG_COD position 20;

alter table TBEMPRESA
alter BAI_COD position 21;

alter table TBEMPRESA
alter CID_COD position 22;

alter table TBEMPRESA
alter EST_COD position 23;

alter table TBEMPRESA
alter NUMERO_END position 24;

alter table TBEMPRESA
alter EMAIL position 25;

alter table TBEMPRESA
alter HOME_PAGE position 26;

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

alter table TBEMPRESA
alter PAIS_ID position 28;

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

alter table TBEMPRESA
alter SERIE_NFE position 30;

alter table TBEMPRESA
alter NUMERO_NFE position 31;

alter table TBEMPRESA
alter LOTE_ANO_NFE position 32;

alter table TBEMPRESA
alter LOTE_NUM_NFE position 33;

alter table TBEMPRESA
alter CARTA_CORRECAO_NFE position 34;

alter table TBEMPRESA
alter USUARIO position 35;




/*------ SYSDBA 30/09/2014 11:13:07 --------*/

COMMENT ON COLUMN TBEMPRESA.NUMERO_NFE IS
'NF-e : Numero da ultima nota fiscal emitida.';




/*------ SYSDBA 30/09/2014 11:13:14 --------*/

COMMENT ON COLUMN TBEMPRESA.SERIE_NFE IS
'NF-e : Serie da nota fiscal.';




/*------ SYSDBA 30/09/2014 11:29:44 --------*/

CREATE TABLE TBNFE_CARTA_CORRECAO (
    CCE_NUMERO DMN_BIGINT_NN NOT NULL,
    CCE_DATA DMN_DATE,
    CCE_HORA DMN_TIME);

ALTER TABLE TBNFE_CARTA_CORRECAO
ADD CONSTRAINT PK_TBNFE_CARTA_CORRECAO
PRIMARY KEY (CCE_NUMERO);

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_NUMERO IS
'Numero.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_DATA IS
'Data.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_HORA IS
'Hora.';

GRANT ALL ON TBNFE_CARTA_CORRECAO TO "PUBLIC";



/*------ SYSDBA 30/09/2014 11:33:28 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD NFE_SERIE DMN_VCHAR_04,
    ADD NFE_NUMERO BIGINT;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NFE_SERIE IS
'NF-e: Serie da nota fiscal.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NFE_NUMERO IS
'NF-e: Numero da nota fiscal.';




/*------ SYSDBA 30/09/2014 11:33:52 --------*/

CREATE INDEX IDX_TBNFE_CARTA_CORRECAO
ON TBNFE_CARTA_CORRECAO (NFE_SERIE,NFE_NUMERO);



/*------ 10/10/2014 14:24:57 --------*/

CREATE GENERATOR GEN_IBPT_ID;

/*------ 10/10/2014 14:24:58 --------*/

CREATE TABLE SYS_IBPT (
    ID_IBPT                 INTEGER NOT NULL,
    NCM_IBPT                VARCHAR(10),
    EX_IBPT                 VARCHAR(3),
    TABELA_IBPT             VARCHAR(3),
    ALIQNACIONAL_IBPT       NUMERIC(15,2),
    ALIQINTERNACIONAL_IBPT  NUMERIC(15,2)
);

/*------ 10/10/2014 14:24:58 --------*/

ALTER TABLE SYS_IBPT ADD CONSTRAINT PK_SYS_IBPT PRIMARY KEY (ID_IBPT);

/*------ 10/10/2014 14:24:58 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER IBPT_BI FOR SYS_IBPT
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(gen_ibpt_id,1);
end^

/*------ 10/10/2014 14:24:58 --------*/

SET TERM ; ^


/*------ SYSDBA 10/10/2014 14:25:38 --------*/

COMMENT ON COLUMN SYS_IBPT.ID_IBPT IS
'Sequencial.';

GRANT ALL ON SYS_IBPT TO "PUBLIC";



/*------ SYSDBA 10/10/2014 14:29:36 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'NCM_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:29:55 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03'
where (RDB$FIELD_NAME = 'EX_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:30:11 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03'
where (RDB$FIELD_NAME = 'TABELA_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:30:35 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_2'
where (RDB$FIELD_NAME = 'ALIQNACIONAL_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:30:50 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_2'
where (RDB$FIELD_NAME = 'ALIQINTERNACIONAL_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:31:08 --------*/

COMMENT ON COLUMN SYS_IBPT.NCM_IBPT IS
'Codigo NCM';




/*------ SYSDBA 10/10/2014 14:31:15 --------*/

COMMENT ON COLUMN SYS_IBPT.ALIQNACIONAL_IBPT IS
'Aliquota Nacional';




/*------ SYSDBA 10/10/2014 14:31:25 --------*/

COMMENT ON COLUMN SYS_IBPT.ALIQINTERNACIONAL_IBPT IS
'Aliquota de Importados.';




/*------ SYSDBA 10/10/2014 14:38:18 --------*/

CREATE INDEX IDX_SYS_IBPT_NCM
ON SYS_IBPT (NCM_IBPT);




/*------ SYSDBA 10/10/2014 14:44:31 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_20'
where (RDB$FIELD_NAME = 'NCM_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 10/10/2014 14:44:55 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'NCM_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 14/10/2014 19:39:51 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 14/10/2014 19:43:32 --------*/

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
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), r.cnpj)
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
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




/*------ SYSDBA 14/10/2014 19:43:59 --------*/

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
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
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




/*------ SYSDBA 14/10/2014 19:44:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
    left join TBFORNECEDOR f on (f.Codforn = coalesce(cc.Codforn, r.codforn))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 14/10/2014 20:11:49 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
    ADD TIPO_DESPESA DMN_SMALLINT_N;

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.TIPO_DESPESA IS
'Tipo de Despesa.';

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
alter TIPO_DESPESA position 9;

alter table TBCAIXA_MOVIMENTO
alter HISTORICO position 10;

alter table TBCAIXA_MOVIMENTO
alter VALOR position 11;

alter table TBCAIXA_MOVIMENTO
alter SITUACAO position 12;

alter table TBCAIXA_MOVIMENTO
alter VENDA_ANO position 13;

alter table TBCAIXA_MOVIMENTO
alter VENDA_NUM position 14;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE_COD position 15;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE position 16;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_ANO position 17;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_NUM position 18;

alter table TBCAIXA_MOVIMENTO
alter EMPRESA position 19;

alter table TBCAIXA_MOVIMENTO
alter FORNECEDOR position 20;

alter table TBCAIXA_MOVIMENTO
alter USUARIO position 21;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_ANO position 22;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_NUM position 23;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_ANO position 24;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_NUM position 25;




/*------ SYSDBA 14/10/2014 20:12:19 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_TD
FOREIGN KEY (TIPO_DESPESA)
REFERENCES TBTPDESPESA(COD);




/*------ SYSDBA 14/10/2014 20:14:39 --------*/

COMMENT ON TABLE TBCAIXA_MOVIMENTO IS 'Tabela Movimento Caixa (Fluxo)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimentacao (fluxo) de caixa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    14/10/2014 - IMR:
        + Criacao do campo TIPO_DESPESA para armazenar o tipo de despesa do fluxo de ciaxa quando este for um movimento
          de debito (D).';




/*------ SYSDBA 14/10/2014 20:16:43 --------*/

COMMENT ON TABLE SYS_IBPT IS 'Tabela IBPT

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/10/2014

Tabela responsavel por armazenar todos os registros IBPT, ou seja, todos os registros de taxas de tributacoes de
impostos de acordo como o NCM do produto/servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco';




/*------ SYSDBA 14/10/2014 21:41:00 --------*/

ALTER TABLE TBCONTA_CORRENTE
    ADD EMPRESA DMN_CNPJ;

COMMENT ON COLUMN TBCONTA_CORRENTE.EMPRESA IS
'Empresa.

Apenas para a conta corrente que for do tipo 2 (Banco)';

alter table TBCONTA_CORRENTE
alter CODIGO position 1;

alter table TBCONTA_CORRENTE
alter EMPRESA position 2;

alter table TBCONTA_CORRENTE
alter DESCRICAO position 3;

alter table TBCONTA_CORRENTE
alter TIPO position 4;

alter table TBCONTA_CORRENTE
alter CONTA_BANCO_BOLETO position 5;




/*------ SYSDBA 14/10/2014 21:41:25 --------*/

ALTER TABLE TBCONTA_CORRENTE
ADD CONSTRAINT FK_TBCONTA_CORRENTE_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);




/*------ SYSDBA 14/10/2014 21:43:15 --------*/

COMMENT ON TABLE TBCONTA_CORRENTE IS 'Tabela Conta Corrente

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de contas correntes do tipo Caixa (1) e do tipo Banco (2).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    14/10/2014 - IMR:
        + Criacao do campo EMPRESA para definir a empresa responsavel pela conta corrente do tipo Banco (2).';




/*------ SYSDBA 15/10/2014 13:42:38 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 13:43:00 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
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
      cc.Codemp
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
      ) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 13:44:48 --------*/

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
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        ' VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
      ) from 1 for 250)
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




/*------ SYSDBA 15/10/2014 14:35:05 --------*/

CREATE TABLE TBFORMPAGTO_CONTACOR (
    FORMA_PAGTO DMN_SMALLINT_NN NOT NULL,
    CONTA_CORRENTE DMN_INTEGER_NN NOT NULL);

ALTER TABLE TBFORMPAGTO_CONTACOR
ADD CONSTRAINT PK_TBFORMPAGTO_CONTACOR
PRIMARY KEY (FORMA_PAGTO,CONTA_CORRENTE);

COMMENT ON COLUMN TBFORMPAGTO_CONTACOR.FORMA_PAGTO IS
'Forma de Pagamento';

COMMENT ON COLUMN TBFORMPAGTO_CONTACOR.CONTA_CORRENTE IS
'Conta Corrente';




/*------ SYSDBA 15/10/2014 14:35:06 --------*/

COMMENT ON TABLE TBFORMPAGTO_CONTACOR IS 'Tabela Forma de Pagamento x Conta Corrente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2014

Tabela responsavel por armazenar a relacao "Forma de Pagamento" X "Conta Corrente". Ela permitira que varias formas de
pagamento possam esta associadas a mais de uma conta corrente e uma conta corrente associada a varias formas de pagamento.



Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco';

GRANT ALL ON TBFORMPAGTO_CONTACOR TO "PUBLIC";



/*------ SYSDBA 15/10/2014 14:35:59 --------*/

ALTER TABLE TBFORMPAGTO_CONTACOR
ADD CONSTRAINT FK_TBFORMPAGTO_CONTACOR_FPG
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBFORMPAGTO_CONTACOR
ADD CONSTRAINT FK_TBFORMPAGTO_CONTACOR_CCR
FOREIGN KEY (CONTA_CORRENTE)
REFERENCES TBCONTA_CORRENTE(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 15/10/2014 14:40:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_CAIXA_ABERTO (
    EMPRESA DMN_CNPJ,
    USUARIO varchar(12),
    DATA date,
    FORMA_PAGTO smallint)
returns (
    ANO_CAIXA smallint,
    NUM_CAIXA integer,
    CONTA_CORRENTE integer)
as
begin

  Select First 1
      c.Ano
    , c.Numero
    , c.Conta_corrente
  from TBCAIXA c
    Inner join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente and cc.empresa = :empresa)
  where c.Situacao = 0
    and c.Usuario = :Usuario
    and ( (c.Data_abertura = :Data) or (cc.Tipo = 2) )
    and c.Conta_corrente in (
      Select
        fc.conta_corrente
      from TBFORMPAGTO_CONTACOR fc
      where fc.forma_pagto = :Forma_pagto
    )
  into
      Ano_caixa
    , Num_caixa
    , Conta_corrente;

  Suspend;

end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 14:41:15 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_CAIXA_ABERTO_DETALHE (
    EMPRESA_IN DMN_CNPJ,
    USUARIO_IN varchar(12),
    DATA date,
    FORMA_PAGTO smallint)
returns (
    ANO smallint,
    NUMERO integer,
    USUARIO varchar(12),
    DATA_ABERTURA date,
    CONTA_CORRENTE integer,
    VALOR_TOTAL_CREDITO numeric(15,2),
    VALOR_TOTAL_DEBITO numeric(15,2))
as
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa_in, :Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_debito  = coalesce(:Valor_total_debito,  0);

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 14:42:33 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Montar Historico
  Select
      cc.Codemp
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
    left join TBFORNECEDOR f on (f.Codforn = coalesce(cc.Codforn, r.codforn))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 14:43:26 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
      ) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
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
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 14:44:34 --------*/

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
  -- Montar Historico
  Select
      v.Codemp
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
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

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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




/*------ SYSDBA 15/10/2014 14:44:59 --------*/

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
  -- Montar Historico
  Select
      v.Codemp
    , r.cliente
    , c.cnpj
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        ' VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
      ) from 1 for 250)
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

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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




/*------ SYSDBA 15/10/2014 17:46:26 --------*/

DROP VIEW VW_CONTA_CORRENTE;

CREATE VIEW VW_CONTA_CORRENTE(
    CODIGO,
    DESCRICAO,
    TIPO,
    TIPO_DESC,
    DESCRICAO_FULL,
    EMPRESA,
    CNPJ)
AS
Select
    c.Codigo
  , c.Descricao
  , c.Tipo
  , Case
      When c.Tipo = 1 then 'Caixa'
      When c.Tipo = 2 then 'Banco'
      else '* Indefinido'
    end as Tipo_Desc
  , right('000' || c.Codigo, 3) || ' - ' || c.Descricao as Descricao_FULL
  , e.rzsoc
  , e.cnpj
from TBCONTA_CORRENTE c
  left join TBEMPRESA e on (e.cnpj = c.empresa)
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_CONTA_CORRENTE TO "PUBLIC";




/*------ SYSDBA 15/10/2014 19:26:02 --------*/

SET TERM ^ ;

CREATE trigger tg_conta_corrente_empresa for tbconta_corrente
active before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^




/*------ SYSDBA 15/10/2014 19:28:05 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
active before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTA_CORRENTE_EMPRESA IS 'Trigger Integridade Conta Corrente X Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2014

Trigger responsavel por manter a relacao "Conta Corrente x Empresa" coerente com a relacao "Banco Boleto x Empresa".';




/*------ SYSDBA 15/10/2014 19:28:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
active before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTA_CORRENTE_EMPRESA IS 'Trigger Integridade Conta Corrente X Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2014

Trigger responsavel por manter a relacao "Conta Corrente x Empresa" coerente com a relacao "Banco Boleto x Empresa" para
toda conta corrente do tipo Banco (2).';



/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2014;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2015;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2016;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2017;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2018;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2019;

/*------ 16/10/2014 13:52:33 --------*/

CREATE GENERATOR GEN_REQUISITA_COMPRA_2020;

/*------ 16/10/2014 13:52:34 --------*/

CREATE TABLE TBREQUISITA_COMPRA (
    ANO                 DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CODIGO              DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA             DMN_CNPJ_NN NOT NULL /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    NUMERO              DMN_VCHAR_20_NN /* DMN_VCHAR_20_NN = VARCHAR(20) NOT NULL */,
    FORNECEDOR          DMN_INTEGER_NN /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    NOME_CONTATO        DMN_VCHAR_100 /* DMN_VCHAR_100 = VARCHAR(100) */,
    TIPO                DMN_SMALLINT_NN DEFAULT 0 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    INSERCAO_DATA       DMN_DATETIME /* DMN_DATETIME = TIMESTAMP */,
    EMISSAO_DATA        DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    EMISSAO_USUARIO     DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    VALIDADE            DMN_DATE /* DMN_DATE = DATE */,
    COMPETENCIA         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    DATA_FATURA         DMN_DATE /* DMN_DATE = DATE */,
    MOVITO              DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    OBSERVACAO          DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    CLIENTE             DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    ENDERECO_ENTREGA    DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    STATUS              DMN_SMALLINT_NN DEFAULT 0 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    REQUISITADO_DATA     DMN_DATE /* DMN_DATE = DATE */,
    REQUISITADO_USUARIO  DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    CANCELADO_DATA      DMN_DATE /* DMN_DATE = DATE */,
    CANCELADO_USUARIO   DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    CANCELADO_MOTIVO    DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    RECEBEDOR_NOME      DMN_VCHAR_100 /* DMN_VCHAR_100 = VARCHAR(100) */,
    RECEBEDOR_CPF       DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
    RECEBEDOR_FUNCAO    DMN_VCHAR_50 /* DMN_VCHAR_50 = VARCHAR(50) */,
    FORMA_PAGTO         DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    CONDICAO_PAGTO      DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    TRANSPORTADOR       DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    VALOR_BRUTO         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_DESCONTO      DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_FRETE   DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_IPI     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */
);

/*------ 16/10/2014 13:52:34 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT PK_TBREQUISITA_COMPRA PRIMARY KEY (ANO, CODIGO, EMPRESA);

/*------ 16/10/2014 13:52:34 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 16/10/2014 13:52:34 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_COMPET FOREIGN KEY (COMPETENCIA) REFERENCES TBCOMPETENCIA (CMP_NUM);

/*------ 16/10/2014 13:52:34 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_CPAGTO FOREIGN KEY (CONDICAO_PAGTO) REFERENCES TBCONDICAOPAGTO (COND_COD);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_FPAGTO FOREIGN KEY (FORMA_PAGTO) REFERENCES TBFORMPAGTO (COD);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_FRN FOREIGN KEY (FORNECEDOR) REFERENCES TBFORNECEDOR (CODFORN);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_TRANSP FOREIGN KEY (TRANSPORTADOR) REFERENCES TBFORNECEDOR (CODFORN);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_USR_AUT FOREIGN KEY (REQUISITADO_USUARIO) REFERENCES TBUSERS (NOME);

/*------ 16/10/2014 13:52:35 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_USR_EMISS FOREIGN KEY (EMISSAO_USUARIO) REFERENCES TBUSERS (NOME)
  USING INDEX FK_TBREQUISITA_COMPRA_EMISSOR;

/*------ 16/10/2014 13:52:35 --------*/

CREATE INDEX IDX_TBREQUISITA_COMPRA_NUMERO ON TBREQUISITA_COMPRA (NUMERO);

/*------ 16/10/2014 13:52:35 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_REQUISITA_COMPRA_CODIGO FOR TBREQUISITA_COMPRA
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2020, 1);
end^

/*------ 16/10/2014 13:52:35 --------*/

CREATE OR ALTER TRIGGER TG_REQUISITA_COMPRA_COMPETENCIA FOR TBREQUISITA_COMPRA
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 16/10/2014 13:52:35 --------*/

SET TERM ; ^

COMMENT ON TABLE TBREQUISITA_COMPRA IS 
'Tabela Requisicao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Tabela responsavel por armazenar as requisicoes de compras/servicos da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON TRIGGER TG_REQUISITA_COMPRA_CODIGO IS 
'Trigger Nova Requisicao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de Requisicao de compra no ano.';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON TRIGGER TG_REQUISITA_COMPRA_COMPETENCIA IS 
'Trigger Competencia Requisicao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por identificar a competencia da Requisicao quando esta nao for informada, baseando-se na data de
emissao.';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.ANO IS 
'Ano';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CODIGO IS 
'Codigo';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.EMPRESA IS 
'Empresa';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.NUMERO IS 
'Numero da Requisicao (Livre)';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.FORNECEDOR IS 
'Fornecedor';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.NOME_CONTATO IS 
'Nome do Contato';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.TIPO IS 
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.INSERCAO_DATA IS 
'Data/hora de insercao';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.EMISSAO_DATA IS 
'Data de Emissao';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.EMISSAO_USUARIO IS 
'Usuario de Emissao';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALIDADE IS 
'Data de Validade';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.COMPETENCIA IS 
'Competencia';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.DATA_FATURA IS 
'Data de faturamento (Entrada)';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.MOVITO IS 
'Motivo';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.OBSERVACAO IS 
'Observacoes';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CLIENTE IS 
'Cliente';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.ENDERECO_ENTREGA IS 
'Endereco de Entrega';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.STATUS IS 
'Status:
0 - Em edicao
1 - Aberta
2 - Requisitada
3 - Faturada (NF/NFS registrada no sistema referente a Autorizacao/Requisicao)
4 - Cancelada';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.REQUISITADO_DATA IS 
'Data de Requisicao';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.REQUISITADO_USUARIO IS 
'Usuario de Requisicao';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CANCELADO_DATA IS 
'Data de Cancelamento';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CANCELADO_USUARIO IS 
'Usuario de Cancelamento';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CANCELADO_MOTIVO IS 
'Motivo de Cancelamento';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.RECEBEDOR_NOME IS 
'Recebedor (Nome)';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.RECEBEDOR_CPF IS 
'Recebedor (CPF)';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.RECEBEDOR_FUNCAO IS 
'Recebedor (Funcao)';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.FORMA_PAGTO IS 
'Forma de Pagamento';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.CONDICAO_PAGTO IS 
'Condicao de Pagamento';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.TRANSPORTADOR IS 
'Transportador';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALOR_BRUTO IS 
'Valor Total Bruto';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALOR_DESCONTO IS 
'Valor Total de Descontos';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALOR_TOTAL_FRETE IS 
'Valor Total Frete';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALOR_TOTAL_IPI IS 
'Valor Total IPI';

/*------ 16/10/2014 13:52:35 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRA.VALOR_TOTAL IS 
'Valor Total = (Valor Bruto - Valor Desconto) + Valor Total IPI';

/*------ 16/10/2014 13:52:35 --------*/

GRANT ALL ON TBREQUISITA_COMPRA TO PUBLIC;

/*------ 16/10/2014 13:53:00 --------*/

ALTER TABLE TBREQUISITA_COMPRA ADD CONSTRAINT FK_TBREQUISITA_COMPRA_USR_CNL FOREIGN KEY (CANCELADO_USUARIO) REFERENCES TBUSERS (NOME);


/*------ SYSDBA 16/10/2014 13:57:36 --------*/

CREATE TABLE TBAUTORIZA_REQUISITA (
    AUTORIZACAO_ANO DMN_SMALLINT_NN NOT NULL,
    AUTORIZACAO_COD DMN_BIGINT_NN NOT NULL,
    REQUISICAO_ANO DMN_SMALLINT_NN NOT NULL,
    REQUISICAO_COD DMN_BIGINT_NN NOT NULL);

ALTER TABLE TBAUTORIZA_REQUISITA
ADD CONSTRAINT PK_TBAUTORIZA_REQUISITA
PRIMARY KEY (AUTORIZACAO_ANO,AUTORIZACAO_COD,REQUISICAO_ANO,REQUISICAO_COD);




/*------ SYSDBA 16/10/2014 13:57:37 --------*/

COMMENT ON TABLE TBAUTORIZA_REQUISITA IS 'Tabela Autorizacao x Requisicao de Compras/Servicos.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Tabela responsavel por fazer a associacao entre as autorizacoes de compras/servicos e as requisicoes de compras/servidor
utilizadas para gerar essas autorizacoes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco';

GRANT ALL ON TBAUTORIZA_REQUISITA TO "PUBLIC";



/*------ SYSDBA 16/10/2014 13:59:42 --------*/

ALTER TABLE TBAUTORIZA_REQUISITA
    ADD AUTORIZACAO_EMP DMN_CNPJ_NN,
    ADD REQUISICAO_EMP DMN_CNPJ_NN;

alter table TBAUTORIZA_REQUISITA
alter AUTORIZACAO_ANO position 1;

alter table TBAUTORIZA_REQUISITA
alter AUTORIZACAO_COD position 2;

alter table TBAUTORIZA_REQUISITA
alter AUTORIZACAO_EMP position 3;

alter table TBAUTORIZA_REQUISITA
alter REQUISICAO_ANO position 4;

alter table TBAUTORIZA_REQUISITA
alter REQUISICAO_COD position 5;

alter table TBAUTORIZA_REQUISITA
alter REQUISICAO_EMP position 6;




/*------ SYSDBA 16/10/2014 13:59:49 --------*/

ALTER TABLE TBAUTORIZA_REQUISITA DROP CONSTRAINT PK_TBAUTORIZA_REQUISITA;




/*------ SYSDBA 16/10/2014 13:59:59 --------*/

ALTER TABLE TBAUTORIZA_REQUISITA
ADD CONSTRAINT PK_TBAUTORIZA_REQUISITA
PRIMARY KEY (AUTORIZACAO_ANO,AUTORIZACAO_COD,AUTORIZACAO_EMP,REQUISICAO_ANO,REQUISICAO_COD,REQUISICAO_EMP);




/*------ SYSDBA 16/10/2014 14:00:39 --------*/

ALTER TABLE TBAUTORIZA_REQUISITA
ADD CONSTRAINT FK_TBAUTORIZA_REQUISITA_AUT
FOREIGN KEY (AUTORIZACAO_ANO,AUTORIZACAO_COD,AUTORIZACAO_EMP)
REFERENCES TBAUTORIZA_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBAUTORIZA_REQUISITA
ADD CONSTRAINT FK_TBAUTORIZA_REQUISITA_REC
FOREIGN KEY (REQUISICAO_ANO,REQUISICAO_COD,REQUISICAO_EMP)
REFERENCES TBREQUISITA_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;



/*------ 16/10/2014 14:08:40 --------*/

CREATE TABLE TBREQUISITA_COMPRAITEM (
    ANO                     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CODIGO                  DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA                 DMN_CNPJ_NN NOT NULL /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    SEQ                     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    FORNECEDOR              DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    PRODUTO                 DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    QUANTIDADE              DMN_QUANTIDADE_D3 /* DMN_QUANTIDADE_D3 = NUMERIC(18,3) DEFAULT 0 NOT NULL */,
    UNIDADE                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    VALOR_UNITARIO          DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    IPI_PERCENTUAL          DMN_PERCENTUAL /* DMN_PERCENTUAL = DECIMAL(10,2) DEFAULT 0 */,
    IPI_VALOR_TOTAL         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL             DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    CONFIRMADO_RECEBIMENTO  DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    USUARIO                 DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */
);

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT PK_TBREQUISITA_COMPRAITEM PRIMARY KEY (ANO, CODIGO, EMPRESA, SEQ);

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT FK_TBREQUISITA_COMPRAITEM_AUT FOREIGN KEY (ANO, CODIGO, EMPRESA) REFERENCES TBREQUISITA_COMPRA (ANO, CODIGO, EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT FK_TBREQUISITA_COMPRAITEM_EMP FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT FK_TBREQUISITA_COMPRAITEM_FRN FOREIGN KEY (FORNECEDOR) REFERENCES TBFORNECEDOR (CODFORN);

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT FK_TBREQUISITA_COMPRAITEM_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO (COD);

/*------ 16/10/2014 14:08:40 --------*/

ALTER TABLE TBREQUISITA_COMPRAITEM ADD CONSTRAINT FK_TBREQUISITA_COMPRAITEM_UND FOREIGN KEY (UNIDADE) REFERENCES TBUNIDADEPROD (UNP_COD);

/*------ 16/10/2014 14:08:40 --------*/

CREATE INDEX IDX_TBREQUISITA_COMPRAITEM_REC ON TBREQUISITA_COMPRAITEM (CONFIRMADO_RECEBIMENTO);

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON TABLE TBREQUISITA_COMPRAITEM IS 
'Tabela de Produtos/Servicos da REQUISITAcao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das REQUISITAcoes de compras/servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        + Criacao dos campos IPI_PERCENTUAL e IPI_VALOR_TOTAL, uma vez que nos processos
        de REQUISITAcao de Compra essas informacoes sao necessarias.';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.ANO IS 
'Ano da Requisicao';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.CODIGO IS 
'Codigo da Requisicao';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.EMPRESA IS 
'Empresa da Requisicao';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.SEQ IS 
'Sequencial';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.FORNECEDOR IS 
'Fornecedor';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.PRODUTO IS 
'Produto/Servico';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.QUANTIDADE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.UNIDADE IS 
'Unidade de Medida';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.VALOR_UNITARIO IS 
'Valor Unitario';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.IPI_PERCENTUAL IS 
'Percentual IPI';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.IPI_VALOR_TOTAL IS 
'Valor Total do IPI';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.VALOR_TOTAL IS 
'Valor Total = (Quantidade * Valor Unitario) + Valor Total IPI';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS 
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';

/*------ 16/10/2014 14:08:40 --------*/

COMMENT ON COLUMN TBREQUISITA_COMPRAITEM.USUARIO IS 
'Usuario de lancamento';

/*------ 16/10/2014 14:08:40 --------*/

GRANT ALL ON TBREQUISITA_COMPRAITEM TO PUBLIC;


/*------ SYSDBA 16/10/2014 14:19:05 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_recf for tbautoriza_compra
active after update position 3
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Faturada (NF/NFS registrada no sistema referente a autorizacao)" (3) */
  if ( (old.status <> new.status) and (new.status = 3) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp;
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_RECF IS 'Trigger Marcar Faturada Autorizacao x Requisicao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por marcar como "faturada" toda requisicao de compra/servico quando sua autorizaxao correspondem
marcada de igual forma';




/*------ SYSDBA 16/10/2014 14:19:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_recf for tbautoriza_compra
active after update position 3
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Faturada (NF/NFS registrada no sistema referente a autorizacao)" (3) */
  if ( (old.status <> new.status) and (new.status = 3) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp;
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 16/10/2014 14:20:08 --------*/

DROP TRIGGER TG_AUTORIZA_COMPRA_RECF;

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_rec_fat for tbautoriza_compra
active after update position 3
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Faturada (NF/NFS registrada no sistema referente a autorizacao)" (3) */
  if ( (old.status <> new.status) and (new.status = 3) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp;
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_REC_FAT IS 'Trigger Marcar Faturada Autorizacao x Requisicao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por marcar como "faturada" toda requisicao de compra/servico quando sua autorizaxao correspondem
marcada de igual forma';




/*------ SYSDBA 16/10/2014 14:26:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_rec_fat for tbautoriza_compra
active after update position 3
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Faturada (NF/NFS registrada no sistema referente a autorizacao)" (3) */
  if ( (old.status <> new.status) and (new.status = 3) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp
        and r.status  = 2; -- Requisitada
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 16/10/2014 14:27:05 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_rec_aut for tbautoriza_compra
active after update position 4
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Autorizada*/
  if ( (old.status <> new.status) and (new.status = 2) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp
        and r.status  = 3; -- Faturada
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_REC_AUT IS 'Trigger Marcar Requisitada Autorizacao x Requisicao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por marcar como "requisitada" toda requisicao de compra/servico quando sua autorizaxao correspondem
marcada como autorizada.';




/*------ SYSDBA 16/10/2014 14:33:23 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compraitem_rec for tbautoriza_compraitem
active after update position 5
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  if ( old.confirmado_recebimento <> new.confirmado_recebimento ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRAITEM ri Set
        ri.confirmado_recebimento = new.confirmado_recebimento
      where ri.ano     = :rec_ano
        and ri.codigo  = :rec_cod
        and ri.empresa = :rec_emp
        and ri.produto = new.produto;
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 16/10/2014 14:35:25 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compraitem_rec for tbautoriza_compraitem
active after update position 5
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  if ( old.confirmado_recebimento <> new.confirmado_recebimento ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRAITEM ri Set
        ri.confirmado_recebimento = new.confirmado_recebimento
      where ri.ano     = :rec_ano
        and ri.codigo  = :rec_cod
        and ri.empresa = :rec_emp
        and ri.produto = new.produto;
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRAITEM_REC IS 'Trigger Confirmar Recebimento Autorizacao x Requisicao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2014

Trigger responsavel por marca como recebido ou nao os produtos/servicos requisitados todas as vezes que este mesmo
registro for alterado na autorizacao de compras/servicos.';




/*------ SYSDBA 17/10/2014 09:55:27 --------*/

CREATE VIEW VW_TIPO_REQUISICAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Requisição de Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Requisição de Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Requisição de Compra/Serviço' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_REQUISICAO TO "PUBLIC";



/*------ SYSDBA 22/10/2014 14:37:53 --------*/

ALTER TABLE TBCONDICAOPAGTO
    ADD COND_QTDE_PARCELAS DMN_SMALLINT_N DEFAULT 0;

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_QTDE_PARCELAS IS
'Quantidade de parcelas na condicao a prazo.';

alter table TBCONDICAOPAGTO
alter COND_COD position 1;

alter table TBCONDICAOPAGTO
alter COND_DESCRICAO position 2;

alter table TBCONDICAOPAGTO
alter COND_PRAZO position 3;

alter table TBCONDICAOPAGTO
alter COND_QTDE_PARCELAS position 4;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_01 position 5;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_02 position 6;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_03 position 7;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_04 position 8;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_05 position 9;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_06 position 10;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_07 position 11;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_08 position 12;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_09 position 13;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_10 position 14;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_11 position 15;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_12 position 16;




/*------ SYSDBA 22/10/2014 14:38:11 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_01 IS
'Prazo em dias para a parcela 1.';




/*------ SYSDBA 22/10/2014 14:38:24 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_02 IS
'Prazo em dias para a parcela 2.';




/*------ SYSDBA 22/10/2014 14:38:30 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_03 IS
'Prazo em dias para a parcela 3.';




/*------ SYSDBA 22/10/2014 14:38:36 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_04 IS
'Prazo em dias para a parcela 4.';




/*------ SYSDBA 22/10/2014 14:38:43 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_05 IS
'Prazo em dias para a parcela 5.';




/*------ SYSDBA 22/10/2014 14:38:50 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_06 IS
'Prazo em dias para a parcela 6.';




/*------ SYSDBA 22/10/2014 14:38:57 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_07 IS
'Prazo em dias para a parcela 7.';




/*------ SYSDBA 22/10/2014 14:39:04 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_08 IS
'Prazo em dias para a parcela 8.';




/*------ SYSDBA 22/10/2014 14:39:09 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_09 IS
'Prazo em dias para a parcela 9.';




/*------ SYSDBA 22/10/2014 14:39:14 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_10 IS
'Prazo em dias para a parcela 10.';




/*------ SYSDBA 22/10/2014 14:39:19 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_11 IS
'Prazo em dias para a parcela 11.';




/*------ SYSDBA 22/10/2014 14:39:24 --------*/

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PRAZO_12 IS
'Prazo em dias para a parcela 12.';




/*------ SYSDBA 22/10/2014 14:40:53 --------*/

COMMENT ON TABLE TBCONDICAOPAGTO IS 'Tabela de Condicoes de Pagamnetos

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar as condicoes de pagamentos utilizadas nas movimentacoes de COMPRA e VENDA e seus
respectivos parametros de comportamento.



Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco';




/*------ SYSDBA 22/10/2014 14:43:59 --------*/

COMMENT ON TABLE TBCONDICAOPAGTO IS 'Tabela de Condicoes de Pagamnetos

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar as condicoes de pagamentos utilizadas nas movimentacoes de COMPRA e VENDA e seus
respectivos parametros de comportamento.



Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/10/2014 - IMR :
        + Criacao do campo COND_QTDE_PARCELAS pra armazenar o numero de parcelas da condicao de pagamento quando esta
          for a prazo. Este dado influencia no funcionamento do sistema PDV no ato de finalizar a venda.';




/*------ SYSDBA 22/10/2014 14:46:24 --------*/

DROP VIEW VW_CONDICAOPAGTO;

CREATE VIEW VW_CONDICAOPAGTO(
    COND_COD,
    COND_DESCRICAO,
    COND_PRAZO,
    COND_QTDE_PARCELAS,
    COND_PRAZO_01,
    COND_PRAZO_02,
    COND_PRAZO_03,
    COND_PRAZO_04,
    COND_PRAZO_05,
    COND_PRAZO_06,
    COND_PRAZO_07,
    COND_PRAZO_08,
    COND_PRAZO_09,
    COND_PRAZO_10,
    COND_PRAZO_11,
    COND_PRAZO_12,
    COND_DESCRICAO_FULL,
    Cond_descricao_PDV)
AS
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01 else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then 'A VISTA'
      else c.Cond_qtde_parcelas || 'x'
    end as Cond_descricao_PDV
from TBCONDICAOPAGTO c
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_CONDICAOPAGTO TO "PUBLIC";




/*------ SYSDBA 22/10/2014 14:47:10 --------*/

DROP VIEW VW_CONDICAOPAGTO;

CREATE VIEW VW_CONDICAOPAGTO(
    COND_COD,
    COND_DESCRICAO,
    COND_PRAZO,
    COND_QTDE_PARCELAS,
    COND_PRAZO_01,
    COND_PRAZO_02,
    COND_PRAZO_03,
    COND_PRAZO_04,
    COND_PRAZO_05,
    COND_PRAZO_06,
    COND_PRAZO_07,
    COND_PRAZO_08,
    COND_PRAZO_09,
    COND_PRAZO_10,
    COND_PRAZO_11,
    COND_PRAZO_12,
    COND_DESCRICAO_FULL,
    Cond_descricao_PDV)
AS
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01 else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then 'A VISTA'
      else coalesce(c.Cond_qtde_parcelas, 1) || 'x'
    end as Cond_descricao_PDV
from TBCONDICAOPAGTO c
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_CONDICAOPAGTO TO "PUBLIC";




/*------ SYSDBA 22/10/2014 14:47:29 --------*/

DROP VIEW VW_CONDICAOPAGTO;

CREATE VIEW VW_CONDICAOPAGTO(
    COND_COD,
    COND_DESCRICAO,
    COND_PRAZO,
    COND_QTDE_PARCELAS,
    COND_PRAZO_01,
    COND_PRAZO_02,
    COND_PRAZO_03,
    COND_PRAZO_04,
    COND_PRAZO_05,
    COND_PRAZO_06,
    COND_PRAZO_07,
    COND_PRAZO_08,
    COND_PRAZO_09,
    COND_PRAZO_10,
    COND_PRAZO_11,
    COND_PRAZO_12,
    COND_DESCRICAO_FULL,
    Cond_descricao_PDV)
AS
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01 else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then '* A VISTA'
      else coalesce(c.Cond_qtde_parcelas, 1) || 'x'
    end as Cond_descricao_PDV
from TBCONDICAOPAGTO c
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_CONDICAOPAGTO TO "PUBLIC";




/*------ SYSDBA 22/10/2014 14:50:08 --------*/

ALTER TABLE TBCONDICAOPAGTO
    ADD COND_PDV DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCONDICAOPAGTO.COND_PDV IS
'Usar condicao de pagamento no PDV:
0 - Nao
1 - Sim';

alter table TBCONDICAOPAGTO
alter COND_COD position 1;

alter table TBCONDICAOPAGTO
alter COND_DESCRICAO position 2;

alter table TBCONDICAOPAGTO
alter COND_PRAZO position 3;

alter table TBCONDICAOPAGTO
alter COND_PDV position 4;

alter table TBCONDICAOPAGTO
alter COND_QTDE_PARCELAS position 5;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_01 position 6;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_02 position 7;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_03 position 8;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_04 position 9;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_05 position 10;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_06 position 11;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_07 position 12;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_08 position 13;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_09 position 14;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_10 position 15;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_11 position 16;

alter table TBCONDICAOPAGTO
alter COND_PRAZO_12 position 17;




/*------ SYSDBA 22/10/2014 15:12:49 --------*/

DROP VIEW VW_CONDICAOPAGTO;

CREATE VIEW VW_CONDICAOPAGTO(
    COND_COD,
    COND_DESCRICAO,
    COND_PRAZO,
    COND_QTDE_PARCELAS,
    COND_PRAZO_01,
    COND_PRAZO_02,
    COND_PRAZO_03,
    COND_PRAZO_04,
    COND_PRAZO_05,
    COND_PRAZO_06,
    COND_PRAZO_07,
    COND_PRAZO_08,
    COND_PRAZO_09,
    COND_PRAZO_10,
    COND_PRAZO_11,
    COND_PRAZO_12,
    COND_DESCRICAO_FULL,
    COND_DESCRICAO_PDV,
    COND_PDV)
AS
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01 else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then '* A VISTA'
      else coalesce(c.Cond_qtde_parcelas, 1) || 'x'
    end as Cond_descricao_PDV
  , coalesce(c.Cond_pdv, 0)
from TBCONDICAOPAGTO c
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_CONDICAOPAGTO TO "PUBLIC";




/*------ SYSDBA 23/10/2014 11:55:16 --------*/

ALTER TABLE TBFORMPAGTO
    ADD FORMAPAGTO_PDV_CUPOM_EXTRA DMN_LOGICO;

COMMENT ON COLUMN TBFORMPAGTO.FORMAPAGTO_PDV_CUPOM_EXTRA IS
'Forma de pagamento emite cupom extra (Relatorio Gerencial) no PDV:
0 - Nao
1 - Sim';




/*------ SYSDBA 23/10/2014 11:55:31 --------*/

UPDATE TBFORMPAGTO
SET FORMAPAGTO_PDV_CUPOM_EXTRA = 0;


/*------ SYSDBA 23/10/2014 11:55:49 --------*/

Update TBCOMPRAS set nfe_denegada = 0 where nfe_denegada is null;

Update TBVENDAS set nfe_denegada = 0 where nfe_denegada is null;

UPDATE TBFORMPAGTO SET FORMAPAGTO_PDV_CUPOM_EXTRA = 0;
/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 3, column 1.
Update.

*/

/*------ SYSDBA 23/10/2014 11:55:55 --------*/

UPDATE TBFORMPAGTO SET FORMAPAGTO_PDV_CUPOM_EXTRA = 0;
/*------ SYSDBA 23/10/2014 11:56:03 --------*/

COMMIT WORK;



/*------ SYSDBA 24/10/2014 15:23:33 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
    ADD ESTORNO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.ESTORNO IS
'Movimento de Estorno:
0 - Nao
1 - Sim';

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
alter ESTORNO position 9;

alter table TBCAIXA_MOVIMENTO
alter TIPO_DESPESA position 10;

alter table TBCAIXA_MOVIMENTO
alter HISTORICO position 11;

alter table TBCAIXA_MOVIMENTO
alter VALOR position 12;

alter table TBCAIXA_MOVIMENTO
alter SITUACAO position 13;

alter table TBCAIXA_MOVIMENTO
alter VENDA_ANO position 14;

alter table TBCAIXA_MOVIMENTO
alter VENDA_NUM position 15;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE_COD position 16;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE position 17;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_ANO position 18;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_NUM position 19;

alter table TBCAIXA_MOVIMENTO
alter EMPRESA position 20;

alter table TBCAIXA_MOVIMENTO
alter FORNECEDOR position 21;

alter table TBCAIXA_MOVIMENTO
alter USUARIO position 22;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_ANO position 23;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_NUM position 24;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_ANO position 25;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_NUM position 26;




/*------ SYSDBA 24/10/2014 15:24:12 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
      ) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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
    , Estorno
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , 1
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 24/10/2014 15:24:36 --------*/

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
  -- Montar Historico
  Select
      v.Codemp
    , r.cliente
    , c.cnpj
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        ' VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
      ) from 1 for 250)
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

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

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
    , Estorno
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
    , 1
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




/*------ SYSDBA 24/10/2014 15:29:01 --------*/

ALTER TABLE TBCAIXA_CONSOLIDACAO
    ADD TOTAL_CREDITO_ESTORNO DMN_MONEY,
    ADD TOTAL_DEBITO_ESTORNO DMN_MONEY;




/*------ SYSDBA 24/10/2014 15:29:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_CONSOLIDAR (
    ANO_CAIXA smallint,
    NUM_CAIXA integer)
as
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable TOTAL_CREDITO_EST numeric(18,2);
declare variable TOTAL_DEBITO_EST numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when (upper(m.Tipo) = 'C') and (m.Estorno = 0) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when (upper(m.Tipo) = 'D') and (m.Estorno = 0) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when (upper(m.Tipo) = 'C') and (m.Estorno = 1) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when (upper(m.Tipo) = 'D') and (m.Estorno = 1) then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
      , Total_credito_Est
      , Total_debito_Est
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
      , Total_credito_Estorno
      , Total_debito_Estorno
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
      , coalesce(:Total_credito_Est, 0)
      , coalesce(:Total_debito_Est, 0)
    );

  end 
end^

SET TERM ; ^




/*------ SYSDBA 24/10/2014 15:31:39 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_CONSOLIDAR (
    ANO_CAIXA smallint,
    NUM_CAIXA integer)
as
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable TOTAL_CREDITO_EST numeric(18,2);
declare variable TOTAL_DEBITO_EST numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when ((upper(m.Tipo) = 'C') and (m.Estorno = 0)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'D') and (m.Estorno = 0)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'C') and (m.Estorno = 1)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'D') and (m.Estorno = 1)) then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
      , Total_credito_Est
      , Total_debito_Est
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
      , Total_credito_Estorno
      , Total_debito_Estorno
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
      , coalesce(:Total_credito_Est, 0)
      , coalesce(:Total_debito_Est, 0)
    );

  end 
end^

SET TERM ; ^


/*------ SYSDBA 24/10/2014 15:32:51 --------*/

Update TBCAIXA_MOVIMENTO mcx Set mcx.estorno = 0;

/*------ SYSDBA 24/10/2014 15:32:55 --------*/

COMMIT WORK;

/*------ SYSDBA 24/10/2014 15:33:22 --------*/

Update TBCAIXA_MOVIMENTO mcx Set mcx.estorno = 1 Where mcx.historico like 'ESTORNO%';

/*------ SYSDBA 24/10/2014 15:33:26 --------*/

COMMIT WORK;



/*------ SYSDBA 27/10/2014 10:08:57 --------*/

ALTER TABLE TBFORNECEDOR
    ADD FATURAMENTO_MINIMO DMN_MONEY;

COMMENT ON COLUMN TBFORNECEDOR.FATURAMENTO_MINIMO IS
'Faturamento Minimo.

Obs.:
Abaixo do faturamento - Serao emitidas apelas requisicoes de compras/servicos
Igual ou acima do faturamento - Serao emitidas apenas autorizacoes de compras/servicos';




/*------ SYSDBA 27/10/2014 10:09:04 --------*/

ALTER TABLE TBFORNECEDOR ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0.0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBFORNECEDOR') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBFORNECEDOR') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBFORNECEDOR') AND
      (F1.RDB$FIELD_NAME = 'FATURAMENTO_MINIMO');

ALTER TABLE TBFORNECEDOR DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 27/10/2014 10:09:57 --------*/

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
        , NOMEFANT
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
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , OBSERVACAO
        , DTCAD
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
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
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.observacao
        , current_date
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
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
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/10/2014 18:22:04 --------*/

SET TERM ^ ;

create or alter procedure SET_AUTORIZACAO_ITENS_REQ (
    AUTORIZACAO_ANO DMN_SMALLINT_NN,
    AUTORIZACAO_COD DMN_BIGINT_NN,
    AUTORIZACAO_EMP DMN_CNPJ_NN,
    USUARIO DMN_USUARIO)
as
declare variable SEQ integer;
declare variable PRODUTO varchar(10);
declare variable UNIDADE smallint;
declare variable VALOR_UNITARIO DMN_MONEY;
declare variable IPI_PERCENTUAL DMN_PERCENTUAL;
declare variable IPI_VALOR_TOTAL DMN_MONEY;
declare variable QUANTIDADE DMN_QUANTIDADE_D3;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  seq = 0;

  for
    Select
        i.produto
      , i.unidade
      , i.valor_unitario
      , avg(i.ipi_percentual)
      , sum(i.ipi_valor_total)
      , sum(i.quantidade)
      , sum(i.valor_total)
    from TBAUTORIZA_REQUISITA a
      inner join TBREQUISITA_COMPRA r on (r.ano = a.requisicao_ano and r.codigo = a.requisicao_cod and r.empresa = a.requisicao_emp)
      inner join TBREQUISITA_COMPRAITEM i on (i.ano = r.ano and i.codigo = r.codigo and i.empresa = r.empresa)
    where a.autorizacao_ano = :autorizacao_ano
      and a.autorizacao_cod = :autorizacao_cod
      and a.autorizacao_emp = :autorizacao_emp
    group by
        i.produto
      , i.unidade
      , i.valor_unitario
    Into
        produto
      , unidade
      , valor_unitario
      , ipi_percentual
      , ipi_valor_total
      , quantidade
      , valor_total
  do
  begin
    seq = :seq + 1;

    Insert Into TBAUTORIZA_COMPRAITEM (
        ANO
      , CODIGO
      , EMPRESA
      , SEQ
      , FORNECEDOR
      , PRODUTO
      , QUANTIDADE
      , UNIDADE
      , VALOR_UNITARIO
      , IPI_PERCENTUAL
      , IPI_VALOR_TOTAL
      , VALOR_TOTAL
      , CONFIRMADO_RECEBIMENTO
      , USUARIO
    ) values (
        :autorizacao_ano
      , :autorizacao_cod
      , :autorizacao_emp
      , :seq
      , null
      , :produto
      , :quantidade
      , :unidade
      , :valor_unitario
      , :ipi_percentual
      , :ipi_valor_total
      , :valor_total
      , 0
      , :usuario
    );

  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_AUTORIZACAO_ITENS_REQ TO "PUBLIC";



/*------ SYSDBA 29/10/2014 11:07:19 --------*/

create view VW_TABELA_IBPT ( Ncm_sh, Ncm_aliquota_nac, Ncm_aliquota_imp )
as
Select
    ib.ncm_ibpt as Ncm_sh
  , avg(ib.aliqnacional_ibpt)       as Ncm_aliquota_nac
  , avg(ib.aliqinternacional_ibpt)  as Ncm_aliquota_imp
from SYS_IBPT ib
group by
    ib.ncm_ibpt
order by
    ib.ncm_ibpt
;




/*------ SYSDBA 29/10/2014 11:07:42 --------*/

DROP VIEW VW_TABELA_IBPT;

create view VW_TABELA_IBPT ( Ncm_sh, Ncm_aliquota_nac, Ncm_aliquota_imp )
as
Select
    ib.ncm_ibpt as Ncm_sh
  , max(ib.aliqnacional_ibpt)       as Ncm_aliquota_nac
  , max(ib.aliqinternacional_ibpt)  as Ncm_aliquota_imp
from SYS_IBPT ib
group by
    ib.ncm_ibpt
order by
    ib.ncm_ibpt
;

GRANT ALL ON VW_TABELA_IBPT TO "PUBLIC";



/*------ SYSDBA 29/10/2014 12:16:39 --------*/

ALTER TABLE SYS_IBPT
    ADD DESCRICAO_IBPT DMN_TEXTO;

COMMENT ON COLUMN SYS_IBPT.DESCRICAO_IBPT IS
'Descricao';

COMMENT ON COLUMN SYS_IBPT.EX_IBPT IS
'Grupo:
0    - Pai
1..N - Filhos';

alter table SYS_IBPT
alter ID_IBPT position 1;

alter table SYS_IBPT
alter NCM_IBPT position 2;

alter table SYS_IBPT
alter DESCRICAO_IBPT position 3;

alter table SYS_IBPT
alter EX_IBPT position 4;

alter table SYS_IBPT
alter TABELA_IBPT position 5;

alter table SYS_IBPT
alter ALIQNACIONAL_IBPT position 6;

alter table SYS_IBPT
alter ALIQINTERNACIONAL_IBPT position 7;




/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column ID_IBPT position 1;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column NCM_IBPT position 2;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column EX_IBPT position 3;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column TABELA_IBPT position 4;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column DESCRICAO_IBPT position 5;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column ALIQNACIONAL_IBPT position 6;


/*------ SYSDBA 29/10/2014 12:16:55 --------*/

alter table SYS_IBPT
alter column ALIQINTERNACIONAL_IBPT position 7;


/*------ SYSDBA 29/10/2014 12:24:29 --------*/

COMMENT ON SEQUENCE GEN_IBPT_ID IS 'Sequenciador da Tabela IBTT';




/*------ SYSDBA 29/10/2014 13:23:21 --------*/

ALTER TABLE SYS_IBPT
ADD CONSTRAINT UNQ_SYS_IBPT
UNIQUE (NCM_IBPT,EX_IBPT);




/*------ SYSDBA 29/10/2014 13:25:04 --------*/

DROP VIEW VW_TABELA_IBPT;

CREATE VIEW VW_TABELA_IBPT(
    NCM_SH,
    NCM_ALIQUOTA_NAC,
    NCM_ALIQUOTA_IMP)
AS
Select
    ib.ncm_ibpt as Ncm_sh
  , max(ib.aliqnacional_ibpt)       as Ncm_aliquota_nac
  , max(ib.aliqinternacional_ibpt)  as Ncm_aliquota_imp
from SYS_IBPT ib
where ib.ex_ibpt = '0'
group by
    ib.ncm_ibpt
order by
    ib.ncm_ibpt
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TABELA_IBPT TO "PUBLIC";




/*------ SYSDBA 29/10/2014 15:25:55 --------*/

ALTER TABLE SYS_IBPT DROP CONSTRAINT UNQ_SYS_IBPT;




/*------ SYSDBA 29/10/2014 15:26:09 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10_KEY'
where (RDB$FIELD_NAME = 'NCM_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 29/10/2014 15:26:39 --------*/

CREATE DOMAIN DMN_VCHAR_03_NN AS
VARCHAR(3)
NOT NULL;


/*------ SYSDBA 29/10/2014 15:26:48 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03_NN'
where (RDB$FIELD_NAME = 'EX_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 29/10/2014 15:26:55 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03_NN'
where (RDB$FIELD_NAME = 'TABELA_IBPT') and
(RDB$RELATION_NAME = 'SYS_IBPT')
;




/*------ SYSDBA 29/10/2014 15:27:02 --------*/

ALTER TABLE SYS_IBPT ADD IBE$$TEMP_COLUMN
 VARCHAR(1) DEFAULT '0'
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'SYS_IBPT') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'SYS_IBPT') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'SYS_IBPT') AND
      (F1.RDB$FIELD_NAME = 'EX_IBPT');

ALTER TABLE SYS_IBPT DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 29/10/2014 15:27:10 --------*/

ALTER TABLE SYS_IBPT ADD IBE$$TEMP_COLUMN
 VARCHAR(1) DEFAULT '0'
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'SYS_IBPT') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'SYS_IBPT') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'SYS_IBPT') AND
      (F1.RDB$FIELD_NAME = 'TABELA_IBPT');

ALTER TABLE SYS_IBPT DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 29/10/2014 15:27:31 --------*/

ALTER TABLE SYS_IBPT
ADD CONSTRAINT UNQ_SYS_NCM_IBPT
UNIQUE (NCM_IBPT,EX_IBPT);




/*------ SYSDBA 30/10/2014 09:18:04 --------*/

COMMENT ON COLUMN SYS_IBPT.TABELA_IBPT IS
'Tipo Tabela:
0    - Produtos
1..2 - Servicos';




/*------ SYSDBA 30/10/2014 09:58:10 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO DROP CONSTRAINT PK_TBNFE_CARTA_CORRECAO;




/*------ SYSDBA 30/10/2014 09:59:29 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
ADD CONSTRAINT PK_TBNFE_CARTA_CORRECAO
PRIMARY KEY (CCE_NUMERO);




/*------ SYSDBA 30/10/2014 10:00:04 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD CCE_EMPRESA DMN_CNPJ_NN;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_EMPRESA IS
'Empresa.';

alter table TBNFE_CARTA_CORRECAO
alter CCE_NUMERO position 1;

alter table TBNFE_CARTA_CORRECAO
alter CCE_EMPRESA position 2;

alter table TBNFE_CARTA_CORRECAO
alter CCE_DATA position 3;

alter table TBNFE_CARTA_CORRECAO
alter CCE_HORA position 4;

alter table TBNFE_CARTA_CORRECAO
alter NFE_SERIE position 5;

alter table TBNFE_CARTA_CORRECAO
alter NFE_NUMERO position 6;




/*------ SYSDBA 30/10/2014 10:00:33 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
ADD CONSTRAINT FK_TBNFE_CARTA_CORRECAO_EMP
FOREIGN KEY (CCE_EMPRESA)
REFERENCES TBEMPRESA(CNPJ);




/*------ SYSDBA 30/10/2014 10:00:47 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO DROP CONSTRAINT FK_TBNFE_CARTA_CORRECAO_EMP;

ALTER TABLE TBNFE_CARTA_CORRECAO
ADD CONSTRAINT FK_TBNFE_CARTA_CORRECAO_EMP
FOREIGN KEY (CCE_EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE
USING INDEX FK_TBNFE_CARTA_CORRECAO_EMP;




/*------ SYSDBA 30/10/2014 10:01:18 --------*/

ALTER TABLE TBNFE_ENVIADA DROP CONSTRAINT PK_TBNFE_ENVIADA;


/*------ SYSDBA 30/10/2014 10:02:46 --------*/

Update TBNFE_ENVIADA nfx nfx.modelo = 0 WHere nfx nfx.modelo is null;

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 1, column 26.
nfx.

*/

/*------ SYSDBA 30/10/2014 10:02:57 --------*/

Update TBNFE_ENVIADA nfx Set nfx.modelo = 0 WHere nfx nfx.modelo is null;

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 1, column 55.
nfx.

*/

/*------ SYSDBA 30/10/2014 10:03:05 --------*/

Update TBNFE_ENVIADA nfx Set nfx.modelo = 0 WHere nfx.modelo is null;

/*------ SYSDBA 30/10/2014 10:03:09 --------*/

COMMIT WORK;



/*------ SYSDBA 30/10/2014 10:04:58 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_SMALLINT_NN'
where (RDB$FIELD_NAME = 'MODELO') and
(RDB$RELATION_NAME = 'TBNFE_ENVIADA')
;




/*------ SYSDBA 30/10/2014 10:05:53 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CNPJ_NN'
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBNFE_ENVIADA')
;




/*------ SYSDBA 30/10/2014 10:06:04 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'MODELO') and
(RDB$RELATION_NAME = 'TBNFE_ENVIADA')
;




/*------ SYSDBA 30/10/2014 10:06:40 --------*/

ALTER TABLE TBNFE_ENVIADA
ADD CONSTRAINT PK_TBNFE_ENVIADA
PRIMARY KEY (EMPRESA,SERIE,NUMERO,MODELO);




/*------ SYSDBA 30/10/2014 10:08:57 --------*/

DROP INDEX IDX_TBNFE_CARTA_CORRECAO;




/*------ SYSDBA 30/10/2014 10:11:29 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO DROP NFE_SERIE;




/*------ SYSDBA 30/10/2014 10:11:35 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO DROP NFE_NUMERO;




/*------ SYSDBA 30/10/2014 13:28:02 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD CCE_ENVIADA DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_ENVIADA IS
'CC-e enviada:
0 - Nao
1 - Sim';




/*------ SYSDBA 30/10/2014 14:28:40 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD NFE_SERIE DMN_VCHAR_03_NN,
    ADD NFE_NUMERO DMN_BIGINT_NN,
    ADD NFE_MODELO DMN_SMALLINT_NN DEFAULT 0 NOT NULL;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NFE_SERIE IS
'Serie da Nota Fiscal.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NFE_NUMERO IS
'Numero da Nota Fiscal.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NFE_MODELO IS
'Modelo da Nota Fiscal.';




/*------ SYSDBA 30/10/2014 14:29:58 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
ADD CONSTRAINT FK_TBNFE_CARTA_CORRECAO_NFE
FOREIGN KEY (CCE_EMPRESA,NFE_SERIE,NFE_NUMERO,NFE_MODELO)
REFERENCES TBNFE_ENVIADA(EMPRESA,SERIE,NUMERO,MODELO);




/*------ SYSDBA 30/10/2014 14:38:42 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD NUMERO DMN_BIGINT_N,
    ADD PROTOCOLO DMN_VCHAR_250,
    ADD XML DMN_TEXTO;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.NUMERO IS
'Retorno CCe: Sequencial do Evento.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.PROTOCOLO IS
'Retorno CCe: Protocolo do Evento.';

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.XML IS
'Retorno CCe: XML de Resposta.';




/*------ SYSDBA 30/10/2014 16:32:49 --------*/

CREATE SEQUENCE GEN_CARTA_CORRECAO;

COMMENT ON SEQUENCE GEN_CARTA_CORRECAO IS 'Sequencial para Carta de Correcao Eletronica de NF-e.';




/*------ SYSDBA 30/10/2014 16:34:01 --------*/

SET TERM ^ ;

CREATE trigger tg_carta_correcao_nova for tbnfe_carta_correcao
active before insert position 0
AS
begin
  if ( new.cce_numero is null ) then
    new.cce_numero = GEN_ID(GEN_CARTA_CORRECAO, 1);
end^

SET TERM ; ^




/*------ SYSDBA 30/10/2014 16:34:28 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_carta_correcao_nova for tbnfe_carta_correcao
active before insert position 0
AS
begin
  if ( coalesce(new.cce_numero, 0) = 0 ) then
    new.cce_numero = GEN_ID(GEN_CARTA_CORRECAO, 1);
end^

SET TERM ; ^




/*------ SYSDBA 30/10/2014 16:35:28 --------*/

DROP TRIGGER IBPT_BI;

SET TERM ^ ;

CREATE OR ALTER trigger tg_ibpt_novo for sys_ibpt
active before insert position 0
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(gen_ibpt_id, 1);
end^

SET TERM ; ^




/*------ SYSDBA 30/10/2014 16:36:00 --------*/

DROP TRIGGER TG_IBPT_NOVO;

SET TERM ^ ;

CREATE OR ALTER trigger tg_ibpt_cod for sys_ibpt
active before insert position 0
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(gen_ibpt_id, 1);
end^

SET TERM ; ^




/*------ SYSDBA 30/10/2014 16:36:19 --------*/

DROP TRIGGER TG_CARTA_CORRECAO_NOVA;

SET TERM ^ ;

CREATE OR ALTER trigger tg_carta_correcao_cod for tbnfe_carta_correcao
active before insert position 0
AS
begin
  if ( coalesce(new.cce_numero, 0) = 0 ) then
    new.cce_numero = GEN_ID(GEN_CARTA_CORRECAO, 1);
end^

SET TERM ; ^




/*------ SYSDBA 30/10/2014 16:36:37 --------*/

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_NUMERO IS
'Numero/Codigo.';




/*------ SYSDBA 30/10/2014 16:37:05 --------*/

DROP TRIGGER TG_DISTRITO_BI;

SET TERM ^ ;

CREATE OR ALTER trigger tg_distrito_cod for tbdistrito
active before insert position 0
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id, 1);
End^

SET TERM ; ^




/*------ SYSDBA 03/11/2014 19:04:27 --------*/

CREATE DOMAIN DMN_TEXTO_BINARY AS
BLOB SUB_TYPE 0 SEGMENT SIZE 80;


/*------ SYSDBA 03/11/2014 19:06:16 --------*/

ALTER TABLE TBPRODUTO
    ADD METAFONEMA DMN_VCHAR_100,
    ADD ESPECIFICACAO DMN_TEXTO_BINARY;

COMMENT ON COLUMN TBPRODUTO.METAFONEMA IS
'Metafonema de [Descricao + Apresentacao]';

COMMENT ON COLUMN TBPRODUTO.ESPECIFICACAO IS
'Especificacao';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter PRECO position 8;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 9;

alter table TBPRODUTO
alter REFERENCIA position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter CUBAGEM position 17;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 18;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 19;

alter table TBPRODUTO
alter UNIDADE position 20;

alter table TBPRODUTO
alter ESTOQMIN position 21;

alter table TBPRODUTO
alter CODGRUPO position 22;

alter table TBPRODUTO
alter CODFABRICANTE position 23;

alter table TBPRODUTO
alter CUSTOMEDIO position 24;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 26;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 27;

alter table TBPRODUTO
alter CODEMP position 28;

alter table TBPRODUTO
alter CODSECAO position 29;

alter table TBPRODUTO
alter CODORIGEM position 30;

alter table TBPRODUTO
alter CODTRIBUTACAO position 31;

alter table TBPRODUTO
alter CST position 32;

alter table TBPRODUTO
alter CSOSN position 33;

alter table TBPRODUTO
alter CST_PIS position 34;

alter table TBPRODUTO
alter CST_COFINS position 35;

alter table TBPRODUTO
alter NCM_SH position 36;

alter table TBPRODUTO
alter CODIGO_NVE position 37;

alter table TBPRODUTO
alter CODCFOP position 38;

alter table TBPRODUTO
alter CODBARRA_EAN position 39;

alter table TBPRODUTO
alter CODUNIDADE position 40;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 41;

alter table TBPRODUTO
alter ALIQUOTA position 42;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 43;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 44;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 45;

alter table TBPRODUTO
alter VALOR_IPI position 46;

alter table TBPRODUTO
alter RESERVA position 47;

alter table TBPRODUTO
alter PRODUTO_NOVO position 48;

alter table TBPRODUTO
alter COR_VEICULO position 49;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 50;

alter table TBPRODUTO
alter TIPO_VEICULO position 51;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 52;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 53;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 54;

alter table TBPRODUTO
alter CHASSI_VEICULO position 55;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 56;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 57;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 58;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 59;

alter table TBPRODUTO
alter USUARIO position 60;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 61;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 62;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 63;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 64;

alter table TBPRODUTO
alter CUST_DESP_ADM position 65;

alter table TBPRODUTO
alter CUST_COMISSAO position 66;

alter table TBPRODUTO
alter CUST_IMPOSTO position 67;

alter table TBPRODUTO
alter FI_RET_FINANC position 68;

alter table TBPRODUTO
alter FI_RET_PLANO position 69;




/*------ SYSDBA 03/11/2014 19:08:03 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.
    03/11/2014 - IMR :
        + Criacao dos campos METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico.';




/*------ SYSDBA 03/11/2014 19:08:16 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao dos campos METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico.';




/*------ SYSDBA 03/11/2014 19:08:33 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico.';




/*------ SYSDBA 03/11/2014 19:09:02 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico, muito utilizado em processos de cotacao.';




/*------ SYSDBA 03/11/2014 19:55:35 --------*/

CREATE INDEX IDX_TBPRODUTO_DESCRICAO
ON TBPRODUTO (DESCRI,APRESENTACAO,DESCRI_APRESENTACAO,METAFONEMA);




/*------ SYSDBA 10/11/2014 16:58:24 --------*/

ALTER TABLE TBNFE_CARTA_CORRECAO
    ADD CCE_TEXTO DMN_TEXTO;

COMMENT ON COLUMN TBNFE_CARTA_CORRECAO.CCE_TEXTO IS
'Texto de correcao.';

alter table TBNFE_CARTA_CORRECAO
alter CCE_NUMERO position 1;

alter table TBNFE_CARTA_CORRECAO
alter CCE_EMPRESA position 2;

alter table TBNFE_CARTA_CORRECAO
alter CCE_DATA position 3;

alter table TBNFE_CARTA_CORRECAO
alter CCE_HORA position 4;

alter table TBNFE_CARTA_CORRECAO
alter CCE_ENVIADA position 5;

alter table TBNFE_CARTA_CORRECAO
alter CCE_TEXTO position 6;

alter table TBNFE_CARTA_CORRECAO
alter NFE_SERIE position 7;

alter table TBNFE_CARTA_CORRECAO
alter NFE_NUMERO position 8;

alter table TBNFE_CARTA_CORRECAO
alter NFE_MODELO position 9;

alter table TBNFE_CARTA_CORRECAO
alter NUMERO position 10;

alter table TBNFE_CARTA_CORRECAO
alter PROTOCOLO position 11;

alter table TBNFE_CARTA_CORRECAO
alter XML position 12;




/*------ SYSDBA 10/11/2014 17:00:05 --------*/

COMMENT ON TABLE TBNFE_CARTA_CORRECAO IS 'Tabela de Cartas de Correcao (CC-e).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/11/2014

Tabela responsavel por armazenar os registros de cartas de correcai eletronica das NF-e emitidas no sistema.';




/*------ SYSDBA 10/11/2014 17:01:10 --------*/

COMMENT ON TABLE TBNFE_CARTA_CORRECAO IS 'Tabela de Cartas de Correcao (CC-e).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/11/2014

Tabela responsavel por armazenar os registros de cartas de correcai eletronica das NF-e emitidas no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    10/11/2014 - IMR :
        + Documentacao da tabela.';

