

/*------ 13/01/2015 10:08:53 --------*/

CREATE TABLE TBAPROPRIACAO_ALMOX(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN NOT NULL,
  NUMERO DMN_VCHAR_20_NN,
  EMPRESA DMN_CNPJ_NN,
  CENTRO_CUSTO DMN_INTEGER_NN,
  COMPRA_ANO DMN_SMALLINT_N,
  COMPRA_NUM DMN_BIGINT_N,
  COMPRA_EMP DMN_CNPJ,
  INSERCAO_DATA DMN_DATETIME,
  DATA_APROPRIACAO DMN_DATE,
  COMPETENCIA DMN_INTEGER_N,
  USUARIO DMN_USUARIO,
  STATUS DMN_STATUS,
  MOTIVO DMN_TEXTO,
  OBS DMN_TEXTO,
  VALOR_TOTAL DMN_MONEY,
  CANCEL_USUARIO DMN_USUARIO,
  CANCEL_DATAHORA DMN_DATETIME,
  CANCEL_MOTIVO DMN_TEXTO);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT PK_TBAPROPRIACAO_ALMOX PRIMARY KEY (ANO, CONTROLE);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_USR FOREIGN KEY (USUARIO) REFERENCES
TBUSERS (NOME);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_CNT FOREIGN KEY (CENTRO_CUSTO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_EMP FOREIGN KEY (EMPRESA) REFERENCES
TBEMPRESA (CNPJ);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_CMP FOREIGN KEY (COMPRA_ANO, COMPRA_NUM, COMPRA_EMP) REFERENCES
TBCOMPRAS (ANO, CODCONTROL, CODEMP);

/*------ 13/01/2015 10:09:36 --------*/

CREATE TABLE TBAPROPRIACAO_ALMOX_ITEM(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN NOT NULL,
  ITEM DMN_SMALLINT_NN NOT NULL,
  PRODUTO DMN_VCHAR_10_KEY,
  QTDE DMN_MONEY_NN DEFAULT 0.0,
  UNIDADE DMN_SMALLINT_N NOT NULL,
  CUSTO_UNITARIO DMN_MONEY_3,
  CUSTO_TOTAL DMN_MONEY);

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT PK_TBAPROPRIACAO_ALMOX_ITEM PRIMARY KEY (ANO, CONTROLE, ITEM);

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_MOV FOREIGN KEY (ANO, CONTROLE) REFERENCES
TBAPROPRIACAO_ALMOX (ANO, CONTROLE) ON UPDATE CASCADE ON DELETE CASCADE;

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_ITM_UND FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);GRANT ALL ON TBAPROPRIACAO_ALMOX TO "PUBLIC";
GRANT ALL ON TBAPROPRIACAO_ALMOX_ITEM TO "PUBLIC";



/*------ SYSDBA 13/01/2015 10:11:47 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX IS 'Tabela de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   02/01/2015

Tabela responsavel por armazenar todos os registros de apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    03/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.';




/*------ SYSDBA 13/01/2015 10:11:55 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX_ITEM IS 'Tabela de Itens de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   05/01/2015

Tabela responsavel por armazenar todos os registros de itens da apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    05/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.';




/*------ SYSDBA 13/01/2015 10:13:38 --------*/

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2015;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2016;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2017;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2018;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2019;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2020;




/*------ SYSDBA 13/01/2015 10:17:07 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_codigo for tbapropriacao_almox
active before insert position 0
AS
begin
  if (new.controle is null) then
    if ( new.ano = 2015 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2020, 1);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_CODIGO IS 'Trigger Nova Apropriacao de Estoque.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de apropriacao de estoque no ano.';




/*------ SYSDBA 13/01/2015 10:19:56 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_compet for tbapropriacao_almox
active before insert or update position 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_apropriacao), 4) || right('00' || extract(month from new.data_apropriacao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_COMPET IS 'Trigger Competencia Apropriacao Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por identificar a competencia da apropriacao quando esta nao for informada, baseando-se na data de
apropriacao.';




/*------ SYSDBA 13/01/2015 10:20:23 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_codigo for tbapropriacao_almox
active before insert position 0
AS
begin
  if (new.controle is null) then
    if ( new.ano = 2015 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2020, 1);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_CODIGO IS 'Trigger Nova Apropriacao de Estoque (Almoxarifado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de apropriacao de estoque no ano.';




/*------ SYSDBA 13/01/2015 10:22:08 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_COMP
ON TBAPROPRIACAO_ALMOX (COMPETENCIA);




/*------ SYSDBA 13/01/2015 10:22:25 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_DATA
ON TBAPROPRIACAO_ALMOX (DATA_APROPRIACAO);




/*------ SYSDBA 13/01/2015 10:22:46 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_STATUS
ON TBAPROPRIACAO_ALMOX (STATUS);




/*------ SYSDBA 13/01/2015 17:11:38 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX
    ADD TIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.TIPO IS
'Tipo:
0 - Apropriacao Geral
1 - Apropriacao por Entrada';

alter table TBAPROPRIACAO_ALMOX
alter ANO position 1;

alter table TBAPROPRIACAO_ALMOX
alter CONTROLE position 2;

alter table TBAPROPRIACAO_ALMOX
alter NUMERO position 3;

alter table TBAPROPRIACAO_ALMOX
alter EMPRESA position 4;

alter table TBAPROPRIACAO_ALMOX
alter CENTRO_CUSTO position 5;

alter table TBAPROPRIACAO_ALMOX
alter TIPO position 6;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_ANO position 7;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_NUM position 8;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_EMP position 9;

alter table TBAPROPRIACAO_ALMOX
alter INSERCAO_DATA position 10;

alter table TBAPROPRIACAO_ALMOX
alter DATA_APROPRIACAO position 11;

alter table TBAPROPRIACAO_ALMOX
alter COMPETENCIA position 12;

alter table TBAPROPRIACAO_ALMOX
alter USUARIO position 13;

alter table TBAPROPRIACAO_ALMOX
alter STATUS position 14;

alter table TBAPROPRIACAO_ALMOX
alter MOTIVO position 15;

alter table TBAPROPRIACAO_ALMOX
alter OBS position 16;

alter table TBAPROPRIACAO_ALMOX
alter VALOR_TOTAL position 17;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_USUARIO position 18;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_DATAHORA position 19;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_MOTIVO position 20;




/*------ SYSDBA 13/01/2015 17:12:56 --------*/

CREATE VIEW VW_TIPO_APROPRIACAO (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Apropriação Geral'       as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Apropriação Por Entrada' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_APROPRIACAO TO "PUBLIC";



/*------ SYSDBA 13/01/2015 17:54:26 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_NUMERO
ON TBAPROPRIACAO_ALMOX (NUMERO);

