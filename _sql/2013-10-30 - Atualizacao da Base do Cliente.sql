/* Server version: WI-V6.3.4.18393 Firebird 2.1 
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */
SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll';

SET NAMES ISO8859_2;

SET SQL DIALECT 3;

--CONNECT 'localhost:NORTEMIX' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

/* Dropping trigger... */
DROP TRIGGER TG_VENDAS_ATUALIZAR_ESTOQUE;


/* Create Table... */
CREATE TABLE TBCLIENTE_ESTOQUE(COD_CLIENTE DMN_CNPJ NOT NULL,
COD_PRODUTO VARCHAR(10) NOT NULL,
QUANTIDADE INTEGER,
VALOR_MEDIO DMN_MONEY_4,
USUARIO VARCHAR(50),
ANO_VENDA_ULT DMN_SMALLINT_N,
COD_VENDA_ULT DMN_INTEGER_N);


DESCRIBE TABLE TBCLIENTE_ESTOQUE
'Tabela Estoque Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/10/2013

Tabela responsavel por armazenar o estoque satelite de produtos do clientes. Estoque este gerado no momento da
finalizacao da venda.';

DESCRIBE FIELD COD_CLIENTE TABLE TBCLIENTE_ESTOQUE
'Cliente.';

DESCRIBE FIELD COD_PRODUTO TABLE TBCLIENTE_ESTOQUE
'Produto.';

DESCRIBE FIELD QUANTIDADE TABLE TBCLIENTE_ESTOQUE
'Quantidade.';

DESCRIBE FIELD VALOR_MEDIO TABLE TBCLIENTE_ESTOQUE
'Valor Medio (Valor Liquido Unitario da Venda).';

DESCRIBE FIELD USUARIO TABLE TBCLIENTE_ESTOQUE
'Usuario.';

DESCRIBE FIELD ANO_VENDA_ULT TABLE TBCLIENTE_ESTOQUE
'Ultima venda - Ano.';

DESCRIBE FIELD COD_VENDA_ULT TABLE TBCLIENTE_ESTOQUE
'Ultima venda - Controle.';

CREATE TABLE TBCLIENTE_REQUISICAO(ANO DMN_SMALLINT_NN NOT NULL,
NUMERO DMN_INTEGER_NN NOT NULL,
CODEMPRESA DMN_CNPJ,
CODCLIENTE DMN_CNPJ NOT NULL,
DATA_MOVIMENTO DMN_DATE,
INSERCAO_DATA DMN_DATE,
INSERCAO_HORA DMN_TIME,
INSERCAO_USUARIO DMN_VCHAR_50,
SITUACAO DMN_SMALLINT_NN DEFAULT 0 NOT NULL,
OBSERVACOES DMN_TEXTO,
AUTORIZACAO_DATA DMN_DATE,
AUTORIZACAO_USUARIO DMN_VCHAR_50,
RECEBEDOR_NOME DMN_VCHAR_50,
RECEBEDOR_RG DMN_VCHAR_50,
CANCELADO_DATA DMN_DATE,
CANCELADO_MOTIVO DMN_TEXTO);


DESCRIBE TABLE TBCLIENTE_REQUISICAO
'Tabela de Requisicoes do Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/10/2013

Tabela responsavel por armazenar as requisicoes de produtos do cliente feitas a empresa. Este processo promove a saida
de produtos do estoque satelite do cliente quando este trabalha com recebimento fracionado de produtos oriundo das vendas
feittas pela empresa a este.';

DESCRIBE FIELD ANO TABLE TBCLIENTE_REQUISICAO
'Ano';

DESCRIBE FIELD NUMERO TABLE TBCLIENTE_REQUISICAO
'Numero';

DESCRIBE FIELD CODEMPRESA TABLE TBCLIENTE_REQUISICAO
'Empresa';

DESCRIBE FIELD CODCLIENTE TABLE TBCLIENTE_REQUISICAO
'Cliente';

DESCRIBE FIELD DATA_MOVIMENTO TABLE TBCLIENTE_REQUISICAO
'Data Movimento';

DESCRIBE FIELD INSERCAO_DATA TABLE TBCLIENTE_REQUISICAO
'Data de insercao';

DESCRIBE FIELD INSERCAO_HORA TABLE TBCLIENTE_REQUISICAO
'Hora de insercao';

DESCRIBE FIELD INSERCAO_USUARIO TABLE TBCLIENTE_REQUISICAO
'Usuario de insercao';

DESCRIBE FIELD SITUACAO TABLE TBCLIENTE_REQUISICAO
'Situacao:
1 - Aberta
2 - Autorizada
3 - Fechada
4 - Cancelada';

DESCRIBE FIELD OBSERVACOES TABLE TBCLIENTE_REQUISICAO
'Observacoes';

DESCRIBE FIELD AUTORIZACAO_DATA TABLE TBCLIENTE_REQUISICAO
'Data da autorizacao';

DESCRIBE FIELD AUTORIZACAO_USUARIO TABLE TBCLIENTE_REQUISICAO
'Usuario da autorizacao';

DESCRIBE FIELD RECEBEDOR_NOME TABLE TBCLIENTE_REQUISICAO
'Nome do requerente/recebedor';

DESCRIBE FIELD RECEBEDOR_RG TABLE TBCLIENTE_REQUISICAO
'Documento do responsavel.

Ex.: RG 3320124 SSP/PA

(30/10/2013) RG do requerente/recebedor';

DESCRIBE FIELD CANCELADO_DATA TABLE TBCLIENTE_REQUISICAO
'Data do cancelamento';

DESCRIBE FIELD CANCELADO_MOTIVO TABLE TBCLIENTE_REQUISICAO
'Usuario do cancelamento';

CREATE TABLE TBCLIENTE_REQUISICAO_ITEM(ANO DMN_SMALLINT_NN NOT NULL,
NUMERO DMN_INTEGER_NN NOT NULL,
ITEM DMN_SMALLINT_NN NOT NULL,
CODEMPRESA DMN_CNPJ,
CODCLIENTE DMN_CNPJ,
CODPRODUTO DMN_VCHAR_10 NOT NULL,
QUANTIDADE DMN_INTEGER_N DEFAULT 1,
QUANTIDADE_FINAL DMN_INTEGER_N DEFAULT 0,
VALOR_MEDIO DMN_MONEY_4,
UNIDADE DMN_SMALLINT_N,
USUARIO DMN_VCHAR_50);


DESCRIBE TABLE TBCLIENTE_REQUISICAO_ITEM
'Tabela de Iten das Requisicoes do Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/10/2013

Tabela responsavel por armazenar os itens das requisicoes.';

DESCRIBE FIELD ANO TABLE TBCLIENTE_REQUISICAO_ITEM
'Ano da requisicao';

DESCRIBE FIELD NUMERO TABLE TBCLIENTE_REQUISICAO_ITEM
'Numero da requisicao';

DESCRIBE FIELD ITEM TABLE TBCLIENTE_REQUISICAO_ITEM
'Sequencial item';

DESCRIBE FIELD CODEMPRESA TABLE TBCLIENTE_REQUISICAO_ITEM
'Empresa';

DESCRIBE FIELD CODCLIENTE TABLE TBCLIENTE_REQUISICAO_ITEM
'Cliente';

DESCRIBE FIELD CODPRODUTO TABLE TBCLIENTE_REQUISICAO_ITEM
'Produto';

DESCRIBE FIELD QUANTIDADE TABLE TBCLIENTE_REQUISICAO_ITEM
'Quantidade';

DESCRIBE FIELD QUANTIDADE_FINAL TABLE TBCLIENTE_REQUISICAO_ITEM
'Estoque final

Estoque satelite - Quantidade';

DESCRIBE FIELD VALOR_MEDIO TABLE TBCLIENTE_REQUISICAO_ITEM
'Valor Medio Unitario';

DESCRIBE FIELD UNIDADE TABLE TBCLIENTE_REQUISICAO_ITEM
'Unidade';

DESCRIBE FIELD USUARIO TABLE TBCLIENTE_REQUISICAO_ITEM
'Usuario de insercao';


ALTER TABLE TBCFOP ADD CFOP_ALTERA_CUSTO_PRODUTO DMN_LOGICO DEFAULT 1;

DESCRIBE FIELD CFOP_ALTERA_CUSTO_PRODUTO TABLE TBCFOP
'CFOP altera custo produto na Entrada:
0 - Nao
1 - Sim';

ALTER TABLE TBCLIENTE ADD ENTREGA_FRACIONADA_VENDA DMN_LOGICO DEFAULT 0;

DESCRIBE FIELD ENTREGA_FRACIONADA_VENDA TABLE TBCLIENTE
'Entrega fracionada de produtos vendidos:
0 - Nao
1 - Sim

(Sim) Para esta situacao as entregas gerao feitas atraves de requisicoes, que por sua vez
estarao dando baixa no estoque do cliente.';

ALTER TABLE TBCONFIGURACAO ADD PERMITIR_VENDA_ESTOQUE_INS DMN_LOGICO DEFAULT 0;

DESCRIBE FIELD PERMITIR_VENDA_ESTOQUE_INS TABLE TBCONFIGURACAO
'Permitir vendas de produtos com estoque insuficiente e/ou zerado:
0 - Nao
1 - Sim';

ALTER TABLE TBCONFIGURACAO ADD ESTOQUE_UNICO_EMPRESAS DMN_LOGICO DEFAULT 0;

DESCRIBE FIELD ESTOQUE_UNICO_EMPRESAS TABLE TBCONFIGURACAO
'Trabalhar com estoque unico de produtos:
0 - Nao
1 - Sim';

ALTER TABLE TBCONFIGURACAO ADD ESTOQUE_SATELITE_CLIENTE DMN_LOGICO DEFAULT 0;

DESCRIBE FIELD ESTOQUE_SATELITE_CLIENTE TABLE TBCONFIGURACAO
'Habilitar estoque satelite para clientes:
0 - Nao
1 - Sim';

ALTER TABLE TBCONFIGURACAO ADD USUARIO DMN_VCHAR_50;

DESCRIBE FIELD USUARIO TABLE TBCONFIGURACAO
'Usuario de insercao/auteracao.';

ALTER TABLE TBEMPRESA ADD USUARIO DMN_VCHAR_50;

DESCRIBE FIELD USUARIO TABLE TBEMPRESA
'Usuario de insercao/auteracao.';

ALTER TABLE TBFORMPAGTO ADD FORMAPAGTO_NFCE DMN_VCHAR_02 DEFAULT '99';

DESCRIBE FIELD FORMAPAGTO_NFCE TABLE TBFORMPAGTO
'Forma de Pagamento para NFC-e (Campo Obrigatorio):
01 - Dinheiro
02 - Cheque
03 - Cartao de Credito
04 - Cartao de Debito
05 - Credito Loja
10 - Vale Alimentacao
11 - Vale Refeicao
12 - Vale Presente
13 - Vale Combustivel
99 - Outros';

ALTER TABLE TBPRODUTO ADD CODIGO_NVE DMN_VCHAR_10;

DESCRIBE FIELD CODIGO_NVE TABLE TBPRODUTO
'NVE - Nomenclatura de Valor Aduaneiro e Estatistica

Codificacao que detalha alguns NCM.
Formato: 2 (duas) letras maiusculas e 4 (quatro) algarismos.

Vide: Anexo X - Identificador NVE (ACBr - NT2013.005_v1.01_Verso_Nacional_2013.pdf)';

ALTER TABLE TBUSERS ADD ATIVO DMN_LOGICO DEFAULT 1;

DESCRIBE FIELD ATIVO TABLE TBUSERS
'Usuario ativo:
0 - Nao
1 - Sim';

ALTER TABLE TBVENDAS ADD GERAR_ESTOQUE_CLIENTE DMN_LOGICO DEFAULT 0;

DESCRIBE FIELD GERAR_ESTOQUE_CLIENTE TABLE TBVENDAS
'Gerar estoque p/ cliente:
0 - Nao
1 - Sim

Obs.: Apenas clientes que recebem entregas de forma fracionada que gerar estoque, ou seja, a empresa que vendeu os produtos
gerenciara o estoque do cliente atraves de venda (entrada no estoque do cliente) e a requisicao (saida do estoque do
cliente).';

/* Empty GET_PRODUTO_ROTATIVIDADE for drop TBCOMPRASITENS(QTDE) */
SET TERM ^ ;

ALTER PROCEDURE GET_PRODUTO_ROTATIVIDADE(PRODUTO VARCHAR(10),
DATA_INICIAL DATE,
DATA_FINAL DATE)
 RETURNS(COMPRA_QTDE NUMERIC(18,4),
COMPRA_VALOR NUMERIC(18,4),
VENDA_QTDE NUMERIC(18,4),
VENDA_VALOR NUMERIC(18,4))
 AS
 BEGIN SUSPEND; END
^

ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
 AS Declare variable I integer;
BEGIN I = 0; END
^

ALTER TRIGGER TG_COMPRAS_CANCELAR
 AS Declare variable I integer;
BEGIN I = 0; END
^

SET TERM ; ^

ALTER TABLE TBCOMPRASITENS ALTER COLUMN QTDE TYPE DMN_INTEGER_N;

DESCRIBE FIELD QTDE TABLE TBCOMPRASITENS
'Quantidade.';

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_CUSTO_OPER
 AS Declare variable I integer;
BEGIN I = 0; END
^

ALTER TRIGGER TG_VENDAS_CUSTO_OPERACIONAL
 AS Declare variable I integer;
BEGIN I = 0; END
^

SET TERM ; ^

ALTER TABLE TBCONFIGURACAO ALTER COLUMN CUSTO_OPER_CALCULAR TYPE DMN_LOGICO;

DESCRIBE FIELD QTDE TABLE TBPRODUTO
'Estoque.';

DESCRIBE FIELD CODEMP TABLE TBPRODUTO
'Empresa.';

DESCRIBE FIELD CODSECAO TABLE TBPRODUTO
'Secao.';

UPDATE RDB$RELATION_FIELDS SET RDB$Collation_ID =
(Select C.Rdb$Collation_ID from Rdb$Collations C
where C.Rdb$Collation_Name='ISO8859_2'
 and C.Rdb$Character_Set_ID = (select Rdb$Character_Set_ID from Rdb$character_Sets where Rdb$character_set_name = 'ISO8859_2'))
  WHERE RDB$FIELD_NAME='NCM_SH' AND RDB$RELATION_NAME='TBPRODUTO';

ALTER TABLE TBPRODUTO ALTER COLUMN NCM_SH TYPE DMN_VCHAR_10;

DESCRIBE FIELD NCM_SH TABLE TBPRODUTO
'NCM - Nomenclatura Comum do MERCOSUL';

DESCRIBE FIELD RESERVA TABLE TBPRODUTO
'Reserva.';

DESCRIBE FIELD NOME TABLE TBUSERS
'Login';

DESCRIBE FIELD SENHA TABLE TBUSERS
'Senha';

DESCRIBE FIELD NOMECOMPLETO TABLE TBUSERS
'Nome Completo';

DESCRIBE FIELD CODFUNCAO TABLE TBUSERS
'Funcao (Perfil)';

DESCRIBE FIELD LIMIDESC TABLE TBUSERS
'Percenctual limite de desconto na venda';

/* Create Views... */
/* Create view: VW_FORMA_PAGTO_NFC_E */
CREATE VIEW VW_FORMA_PAGTO_NFC_E(
CODIGO,
DESCRICAO)
 AS 
Select first 1 '01' as codigo, 'Dinheiro' as descricao          from TBEMPRESA union
Select first 1 '02' as codigo, 'Cheque' as descricao            from TBEMPRESA union
Select first 1 '03' as codigo, 'Cartao de Credito' as descricao from TBEMPRESA union
Select first 1 '04' as codigo, 'Cartao de Debito' as descricao  from TBEMPRESA union
Select first 1 '05' as codigo, 'Credito Loja' as descricao      from TBEMPRESA union
Select first 1 '10' as codigo, 'Vale Alimentacao' as descricao  from TBEMPRESA union
Select first 1 '11' as codigo, 'Vale Refeicao' as descricao     from TBEMPRESA union
Select first 1 '12' as codigo, 'Vale Presente' as descricao     from TBEMPRESA union
Select first 1 '13' as codigo, 'Vale Combustivel' as descricao  from TBEMPRESA union
Select first 1 '99' as codigo, 'Outros' as descricao            from TBEMPRESA
;


/* Create generator... */
CREATE GENERATOR GEN_REQUISICAO_2011;

CREATE GENERATOR GEN_REQUISICAO_2012;

CREATE GENERATOR GEN_REQUISICAO_2013;

CREATE GENERATOR GEN_REQUISICAO_2014;

CREATE GENERATOR GEN_REQUISICAO_2015;

CREATE GENERATOR GEN_REQUISICAO_2016;

CREATE GENERATOR GEN_REQUISICAO_2017;

CREATE GENERATOR GEN_REQUISICAO_2018;

CREATE GENERATOR GEN_REQUISICAO_2019;

CREATE GENERATOR GEN_REQUISICAO_2020;


/* Create Primary Key... */
ALTER TABLE TBCLIENTE_ESTOQUE ADD CONSTRAINT PK_TBCLIENTE_ESTOQUE PRIMARY KEY (COD_CLIENTE, COD_PRODUTO);

ALTER TABLE TBCLIENTE_REQUISICAO ADD CONSTRAINT PK_TBCLIENTE_REQUISICAO PRIMARY KEY (ANO, NUMERO);

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT PK_TBCLIENTE_REQUISICAO_ITEM PRIMARY KEY (ANO, NUMERO, ITEM);

/* Create Foreign Key... */
RECONNECT;

ALTER TABLE TBCLIENTE_ESTOQUE ADD CONSTRAINT FK_TBCLIENTE_ESTOQUE_CLI FOREIGN KEY (COD_CLIENTE) REFERENCES TBCLIENTE (CNPJ);

ALTER TABLE TBCLIENTE_ESTOQUE ADD CONSTRAINT FK_TBCLIENTE_ESTOQUE_PRD FOREIGN KEY (COD_PRODUTO) REFERENCES TBPRODUTO (COD);

ALTER TABLE TBCLIENTE_ESTOQUE ADD CONSTRAINT FK_TBCLIENTE_ESTOQUE_VND FOREIGN KEY (ANO_VENDA_ULT, COD_VENDA_ULT) REFERENCES TBVENDAS (ANO, CODCONTROL);

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_CLI FOREIGN KEY (CODCLIENTE) REFERENCES TBCLIENTE (CNPJ);

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_EMP FOREIGN KEY (CODEMPRESA) REFERENCES TBEMPRESA (CNPJ);

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_PRD FOREIGN KEY (CODPRODUTO) REFERENCES TBPRODUTO (COD);

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_REQ FOREIGN KEY (ANO, NUMERO) REFERENCES TBCLIENTE_REQUISICAO (ANO, NUMERO) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TBCLIENTE_REQUISICAO_ITEM ADD CONSTRAINT FK_TBCLIENTE_REQ_ITEM_UND FOREIGN KEY (UNIDADE) REFERENCES TBUNIDADEPROD (UNP_COD);

ALTER TABLE TBCLIENTE_REQUISICAO ADD CONSTRAINT FK_TBCLIENTE_REQUISICAO_CLI FOREIGN KEY (CODCLIENTE) REFERENCES TBCLIENTE (CNPJ);

ALTER TABLE TBCLIENTE_REQUISICAO ADD CONSTRAINT FK_TBCLIENTE_REQUISICAO_EMP FOREIGN KEY (CODEMPRESA) REFERENCES TBEMPRESA (CNPJ);

/* Alter Procedure... */
/* empty dependent procedure body */
/* Clear: SET_PRODUTO_ROTATIVIDADE for: GET_PRODUTO_ROTATIVIDADE */
SET TERM ^ ;

ALTER PROCEDURE SET_PRODUTO_ROTATIVIDADE(DATA DATE,
USUARIO VARCHAR(30),
PRODUTO VARCHAR(10),
EXCLUIR_ROT SMALLINT,
TIPO_ROTATI SMALLINT,
ULTIMA_COMPRA DATE,
ULTIMA_VENDA DATE)
 AS
 BEGIN EXIT; END
^

/* Alter (GET_PRODUTO_ROTATIVIDADE) */
ALTER PROCEDURE GET_PRODUTO_ROTATIVIDADE(PRODUTO VARCHAR(10),
DATA_INICIAL DATE,
DATA_FINAL DATE)
 RETURNS(COMPRA_QTDE NUMERIC(18,4),
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
end
^

/* Alter (SET_PRODUTO_ROTATIVIDADE) */
ALTER PROCEDURE SET_PRODUTO_ROTATIVIDADE(DATA DATE,
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

end
^

/* Creating trigger... */
CREATE TRIGGER TG_CLIENTE_REQUISICAO_ESTOQUE FOR TBCLIENTE_REQUISICAO
ACTIVE BEFORE UPDATE POSITION 1 
AS
  declare variable item       Smallint;
  declare variable produto    Varchar(10);
  declare variable quantidade Integer;
  declare variable estoque    Integer;
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
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CLIENTE_REQUISICAO_ESTOQUE
'Trigger Atualizar Estoque Satelite (Requisicao de Clientes).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/10/2013

Trigger responsavel por atualizar (retirar ou devolver) o estoque satelite do cliente quando suas requisicoes sao
autorizadas ou canceladas.';

SET TERM ^ ;

CREATE TRIGGER TG_CLIENTE_REQUISICAO_ITEM_SEQ FOR TBCLIENTE_REQUISICAO_ITEM
ACTIVE BEFORE INSERT POSITION 0 
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
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CLIENTE_REQUISICAO_ITEM_SEQ
'Trigger Gerar Sequencial Item x Requisicao (Cliente).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/10/2013

Trigger responsavel por gerar o sequencial do item da requisicao quando este nao for previamente informado pelo sistema.';

SET TERM ^ ;

CREATE TRIGGER TG_CLIENTE_REQUISICAO_NOVA FOR TBCLIENTE_REQUISICAO
ACTIVE BEFORE INSERT POSITION 0 
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
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_CLIENTE_REQUISICAO_NOVA
'Trigger Gerar Numero Requisicao (Cliente).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/10/2013

Trigger responsavel por gerar o numero sequencial para cada nova requisicao de cliente, de acordo com o ano de sua
geracao.';

SET TERM ^ ;

CREATE TRIGGER TG_VENDAS_ESTOQUE_ATUALIZAR FOR TBVENDAS
ACTIVE AFTER UPDATE POSITION 1 
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
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
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = :Estoque - :Quantidade;

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

CREATE TRIGGER TG_VENDAS_ESTOQUE_CLIENTE FOR TBVENDAS
ACTIVE AFTER UPDATE POSITION 2 
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
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcli and c.cod_produto = i.codprod)
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
          where ec.cod_cliente = new.codcli
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
              new.codcli
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
          where ec.cod_cliente = new.codcli
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
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcli and c.cod_produto = i.codprod)
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
          where ec.cod_cliente = new.codcli
            and ec.cod_produto = :produto;

      end

    end

  end

end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_VENDAS_ESTOQUE_CLIENTE
'Trigger Gerar/Atualizar Estoque Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/10/2013

Trigger responsavel por gerar/atualizar o estoque do cliente, quando este possui habilitacao no sistema para "ESTOQUE
SATELITE", quando uma venda for FINALIZADA ou CANCELADA.';


/* Create Views... */

/* Altering existing trigger... */
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

/* Altering existing trigger... */
SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
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
        , p.Qtde       = :Estoque + :Quantidade
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
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_COMPRAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_compra numeric(15,2);
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
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = :Estoque - :Quantidade
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
        , 'SAIDA - COMPRA CANCELADA'
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
end
^

/* Altering existing trigger... */
SET TERM ; ^

DROP TRIGGER TG_VENDAS_CANCELAR;

SET TERM ^ ;

CREATE TRIGGER TG_VENDAS_CANCELAR FOR TBVENDAS
ACTIVE AFTER UPDATE POSITION 3 
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

/* Altering existing trigger... */
SET TERM ; ^

DROP TRIGGER TG_VENDAS_CUSTO_OPERACIONAL;

SET TERM ^ ;

CREATE TRIGGER TG_VENDAS_CUSTO_OPERACIONAL FOR TBVENDAS
ACTIVE BEFORE UPDATE POSITION 4 
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
SET TERM ; ^

DROP TRIGGER TG_VENDASITENS_RESERVAR;

SET TERM ^ ;

CREATE TRIGGER TG_VENDASITENS_RESERVAR FOR TVENDASITENS
INACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 1 
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
end
^

SET TERM ; ^

ALTER TABLE TBCFOP ALTER COLUMN CFOP_COD POSITION 1;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_DESCRICAO POSITION 2;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_ESPECIFICACAO POSITION 3;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_ALTERA_CUSTO_PRODUTO POSITION 4;

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

ALTER TABLE TBCLIENTE ALTER COLUMN ENTREGA_FRACIONADA_VENDA POSITION 38;

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

ALTER TABLE TBCONFIGURACAO ALTER COLUMN PERMITIR_VENDA_ESTOQUE_INS POSITION 14;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN ESTOQUE_UNICO_EMPRESAS POSITION 15;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN ESTOQUE_SATELITE_CLIENTE POSITION 16;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN USUARIO POSITION 17;

ALTER TABLE TBEMPRESA ALTER COLUMN CODIGO POSITION 1;

ALTER TABLE TBEMPRESA ALTER COLUMN PESSOA_FISICA POSITION 2;

ALTER TABLE TBEMPRESA ALTER COLUMN CNPJ POSITION 3;

ALTER TABLE TBEMPRESA ALTER COLUMN RZSOC POSITION 4;

ALTER TABLE TBEMPRESA ALTER COLUMN NMFANT POSITION 5;

ALTER TABLE TBEMPRESA ALTER COLUMN IE POSITION 6;

ALTER TABLE TBEMPRESA ALTER COLUMN IM POSITION 7;

ALTER TABLE TBEMPRESA ALTER COLUMN SEGMENTO POSITION 8;

ALTER TABLE TBEMPRESA ALTER COLUMN CNAE POSITION 9;

ALTER TABLE TBEMPRESA ALTER COLUMN ENDER POSITION 10;

ALTER TABLE TBEMPRESA ALTER COLUMN COMPLEMENTO POSITION 11;

ALTER TABLE TBEMPRESA ALTER COLUMN BAIRRO POSITION 12;

ALTER TABLE TBEMPRESA ALTER COLUMN CEP POSITION 13;

ALTER TABLE TBEMPRESA ALTER COLUMN CIDADE POSITION 14;

ALTER TABLE TBEMPRESA ALTER COLUMN UF POSITION 15;

ALTER TABLE TBEMPRESA ALTER COLUMN FONE POSITION 16;

ALTER TABLE TBEMPRESA ALTER COLUMN FONE2 POSITION 17;

ALTER TABLE TBEMPRESA ALTER COLUMN LOGO POSITION 18;

ALTER TABLE TBEMPRESA ALTER COLUMN TLG_TIPO POSITION 19;

ALTER TABLE TBEMPRESA ALTER COLUMN LOG_COD POSITION 20;

ALTER TABLE TBEMPRESA ALTER COLUMN BAI_COD POSITION 21;

ALTER TABLE TBEMPRESA ALTER COLUMN CID_COD POSITION 22;

ALTER TABLE TBEMPRESA ALTER COLUMN EST_COD POSITION 23;

ALTER TABLE TBEMPRESA ALTER COLUMN NUMERO_END POSITION 24;

ALTER TABLE TBEMPRESA ALTER COLUMN EMAIL POSITION 25;

ALTER TABLE TBEMPRESA ALTER COLUMN HOME_PAGE POSITION 26;

ALTER TABLE TBEMPRESA ALTER COLUMN CHAVE_ACESSO_NFE POSITION 27;

ALTER TABLE TBEMPRESA ALTER COLUMN PAIS_ID POSITION 28;

ALTER TABLE TBEMPRESA ALTER COLUMN TIPO_REGIME_NFE POSITION 29;

ALTER TABLE TBEMPRESA ALTER COLUMN SERIE_NFE POSITION 30;

ALTER TABLE TBEMPRESA ALTER COLUMN NUMERO_NFE POSITION 31;

ALTER TABLE TBEMPRESA ALTER COLUMN LOTE_ANO_NFE POSITION 32;

ALTER TABLE TBEMPRESA ALTER COLUMN LOTE_NUM_NFE POSITION 33;

ALTER TABLE TBEMPRESA ALTER COLUMN USUARIO POSITION 34;

ALTER TABLE TBFORMPAGTO ALTER COLUMN COD POSITION 1;

ALTER TABLE TBFORMPAGTO ALTER COLUMN DESCRI POSITION 2;

ALTER TABLE TBFORMPAGTO ALTER COLUMN ACRESCIMO POSITION 3;

ALTER TABLE TBFORMPAGTO ALTER COLUMN CONTA_CORRENTE POSITION 4;

ALTER TABLE TBFORMPAGTO ALTER COLUMN DEBITAR_LIMITE_CLIENTE POSITION 5;

ALTER TABLE TBFORMPAGTO ALTER COLUMN FORMAPAGTO_NFCE POSITION 6;

ALTER TABLE TBPRODUTO ALTER COLUMN CODIGO POSITION 1;

ALTER TABLE TBPRODUTO ALTER COLUMN COD POSITION 2;

ALTER TABLE TBPRODUTO ALTER COLUMN DESCRI POSITION 3;

ALTER TABLE TBPRODUTO ALTER COLUMN APRESENTACAO POSITION 4;

ALTER TABLE TBPRODUTO ALTER COLUMN DESCRI_APRESENTACAO POSITION 5;

ALTER TABLE TBPRODUTO ALTER COLUMN MODELO POSITION 6;

ALTER TABLE TBPRODUTO ALTER COLUMN PRECO POSITION 7;

ALTER TABLE TBPRODUTO ALTER COLUMN PRECO_PROMOCAO POSITION 8;

ALTER TABLE TBPRODUTO ALTER COLUMN REFERENCIA POSITION 9;

ALTER TABLE TBPRODUTO ALTER COLUMN SECAO POSITION 10;

ALTER TABLE TBPRODUTO ALTER COLUMN QTDE POSITION 11;

ALTER TABLE TBPRODUTO ALTER COLUMN FRACIONADOR POSITION 12;

ALTER TABLE TBPRODUTO ALTER COLUMN PESO_BRUTO POSITION 13;

ALTER TABLE TBPRODUTO ALTER COLUMN PESO_LIQUIDO POSITION 14;

ALTER TABLE TBPRODUTO ALTER COLUMN CUBAGEM POSITION 15;

ALTER TABLE TBPRODUTO ALTER COLUMN VENDA_FRACIONADA POSITION 16;

ALTER TABLE TBPRODUTO ALTER COLUMN CODUNIDADE_FRACIONADA POSITION 17;

ALTER TABLE TBPRODUTO ALTER COLUMN UNIDADE POSITION 18;

ALTER TABLE TBPRODUTO ALTER COLUMN ESTOQMIN POSITION 19;

ALTER TABLE TBPRODUTO ALTER COLUMN CODGRUPO POSITION 20;

ALTER TABLE TBPRODUTO ALTER COLUMN CODFABRICANTE POSITION 21;

ALTER TABLE TBPRODUTO ALTER COLUMN CUSTOMEDIO POSITION 22;

ALTER TABLE TBPRODUTO ALTER COLUMN PERCENTUAL_MARCKUP POSITION 23;

ALTER TABLE TBPRODUTO ALTER COLUMN PERCENTUAL_MARGEM POSITION 24;

ALTER TABLE TBPRODUTO ALTER COLUMN PRECO_SUGERIDO POSITION 25;

ALTER TABLE TBPRODUTO ALTER COLUMN CODEMP POSITION 26;

ALTER TABLE TBPRODUTO ALTER COLUMN CODSECAO POSITION 27;

ALTER TABLE TBPRODUTO ALTER COLUMN CODORIGEM POSITION 28;

ALTER TABLE TBPRODUTO ALTER COLUMN CODTRIBUTACAO POSITION 29;

ALTER TABLE TBPRODUTO ALTER COLUMN CST POSITION 30;

ALTER TABLE TBPRODUTO ALTER COLUMN CSOSN POSITION 31;

ALTER TABLE TBPRODUTO ALTER COLUMN CST_PIS POSITION 32;

ALTER TABLE TBPRODUTO ALTER COLUMN CST_COFINS POSITION 33;

ALTER TABLE TBPRODUTO ALTER COLUMN NCM_SH POSITION 34;

ALTER TABLE TBPRODUTO ALTER COLUMN CODIGO_NVE POSITION 35;

ALTER TABLE TBPRODUTO ALTER COLUMN CODCFOP POSITION 36;

ALTER TABLE TBPRODUTO ALTER COLUMN CODBARRA_EAN POSITION 37;

ALTER TABLE TBPRODUTO ALTER COLUMN CODUNIDADE POSITION 38;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_TIPO POSITION 39;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA POSITION 40;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_CSOSN POSITION 41;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_PIS POSITION 42;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_COFINS POSITION 43;

ALTER TABLE TBPRODUTO ALTER COLUMN VALOR_IPI POSITION 44;

ALTER TABLE TBPRODUTO ALTER COLUMN RESERVA POSITION 45;

ALTER TABLE TBPRODUTO ALTER COLUMN PRODUTO_NOVO POSITION 46;

ALTER TABLE TBPRODUTO ALTER COLUMN COR_VEICULO POSITION 47;

ALTER TABLE TBPRODUTO ALTER COLUMN COMBUSTIVEL_VEICULO POSITION 48;

ALTER TABLE TBPRODUTO ALTER COLUMN TIPO_VEICULO POSITION 49;

ALTER TABLE TBPRODUTO ALTER COLUMN ANO_MODELO_VEICULO POSITION 50;

ALTER TABLE TBPRODUTO ALTER COLUMN ANO_FABRICACAO_VEICULO POSITION 51;

ALTER TABLE TBPRODUTO ALTER COLUMN RENAVAM_VEICULO POSITION 52;

ALTER TABLE TBPRODUTO ALTER COLUMN CHASSI_VEICULO POSITION 53;

ALTER TABLE TBPRODUTO ALTER COLUMN KILOMETRAGEM_VEICULO POSITION 54;

ALTER TABLE TBPRODUTO ALTER COLUMN SITUACAO_ATUAL_VEICULO POSITION 55;

ALTER TABLE TBPRODUTO ALTER COLUMN SITUACAO_HISTORICO_VEICULO POSITION 56;

ALTER TABLE TBPRODUTO ALTER COLUMN PERCENTUAL_REDUCAO_BC POSITION 57;

ALTER TABLE TBPRODUTO ALTER COLUMN USUARIO POSITION 58;

ALTER TABLE TBUSERS ALTER COLUMN NOME POSITION 1;

ALTER TABLE TBUSERS ALTER COLUMN SENHA POSITION 2;

ALTER TABLE TBUSERS ALTER COLUMN NOMECOMPLETO POSITION 3;

ALTER TABLE TBUSERS ALTER COLUMN CODFUNCAO POSITION 4;

ALTER TABLE TBUSERS ALTER COLUMN LIMIDESC POSITION 5;

ALTER TABLE TBUSERS ALTER COLUMN ATIVO POSITION 6;

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

ALTER TABLE TBVENDAS ALTER COLUMN GERAR_ESTOQUE_CLIENTE POSITION 69;

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

GRANT ALL ON TBCLIENTE_ESTOQUE TO PUBLIC;

GRANT ALL ON TBCLIENTE_ESTOQUE TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON TBCLIENTE_REQUISICAO TO PUBLIC;

GRANT ALL ON TBCLIENTE_REQUISICAO TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON TBCLIENTE_REQUISICAO_ITEM TO PUBLIC;

GRANT ALL ON TBCLIENTE_REQUISICAO_ITEM TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON TBPRODUTO_ROTATIVIDADE TO PUBLIC;

GRANT ALL ON VW_FORMA_PAGTO_NFC_E TO PUBLIC;

GRANT ALL ON VW_FORMA_PAGTO_NFC_E TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON VW_LAYOUT_REM_RET_BANCO TO PUBLIC;


