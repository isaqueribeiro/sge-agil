


/*------ SYSDBA 25/04/2014 14:45:37 --------*/

ALTER TABLE SYS_SISTEMA
    ADD SIS_ATUALIZACAO DMN_DATETIME;

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';




/*------ SYSDBA 25/04/2014 14:46:54 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';




/*------ SYSDBA 08/05/2014 17:47:19 --------*/

ALTER TABLE TBPRODUTO
    ADD MOVIMENTA_ESTOQUE DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';




/*------ SYSDBA 09/05/2014 14:00:26 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'TIPODESP') and
(RDB$RELATION_NAME = 'TBTPDESPESA')
;




/*------ SYSDBA 09/05/2014 14:00:31 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';




/*------ SYSDBA 09/05/2014 14:00:37 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';




/*------ SYSDBA 09/05/2014 14:06:33 --------*/

CREATE TABLE TBPLANO_CONTA (
    EMPRESA DMN_CNPJ NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    DESCRICAO_COMPLETA DMN_VCHAR_250,
    DESCRICAO_RESUMIDA DMN_VCHAR_100);

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO,EMPRESA);

COMMENT ON COLUMN TBPLANO_CONTA.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';




/*------ SYSDBA 09/05/2014 14:06:34 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";



/*------ SYSDBA 09/05/2014 14:07:12 --------*/

CREATE DOMAIN DMN_BIGINT_N AS
INTEGER;


/*------ SYSDBA 09/05/2014 14:07:22 --------*/

ALTER TABLE TBTPDESPESA
    ADD PLANO_CONTA DMN_BIGINT_N;




/*------ SYSDBA 09/05/2014 14:08:35 --------*/

ALTER TABLE TBPLANO_CONTA DROP CONSTRAINT PK_TBPLANO_CONTA;




/*------ SYSDBA 09/05/2014 14:08:44 --------*/

ALTER TABLE TBPLANO_CONTA DROP EMPRESA;




/*------ SYSDBA 09/05/2014 14:08:53 --------*/

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO);




/*------ SYSDBA 09/05/2014 14:10:57 --------*/

ALTER TABLE TBPLANO_CONTA
    ADD EXERCICIO DMN_SMALLINT_NN DEFAULT 0,
    ADD GRUPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

alter table TBPLANO_CONTA
alter CODIGO position 2;

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

alter table TBPLANO_CONTA
alter GRUPO position 5;




/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;


/*------ SYSDBA 09/05/2014 14:12:06 --------*/

CREATE INDEX IDX_PLANO_CONTA_GRUPO
ON TBPLANO_CONTA (GRUPO);

CREATE INDEX IDX_PLANO_CONTA_EXERCICIO
ON TBPLANO_CONTA (EXERCICIO);




/*------ SYSDBA 09/05/2014 14:12:22 --------*/

ALTER TABLE TBTPDESPESA
ADD CONSTRAINT FK_TBTPDESPESA_PLANO_CONTA
FOREIGN KEY (PLANO_CONTA)
REFERENCES TBPLANO_CONTA(CODIGO);




/*------ SYSDBA 09/05/2014 14:12:41 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';




/*------ SYSDBA 09/05/2014 14:34:08 --------*/

CREATE SEQUENCE GEN_PLANO_CONTA;

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';




/*------ SYSDBA 09/05/2014 14:34:24 --------*/

SET TERM ^ ;

CREATE trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

SET TERM ; ^




/*------ SYSDBA 09/05/2014 14:35:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';




/*------ SYSDBA 13/05/2014 13:19:27 --------*/

CREATE TABLE TBAUTORIZA_COMPRA (
    ANO DMN_SMALLINT_NN NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ,
    FORNECEDOR DMN_INTEGER_NN,
    TIPO DMN_SMALLINT_NN DEFAULT 0,
    EMISSAO_DATA DMN_DATE_NN,
    EMISSAO_USUARIO DMN_USUARIO,
    VALIDADE DMN_DATE,
    MOVITO DMN_TEXTO,
    OBSERVACAO DMN_TEXTO,
    ENDERECO_ENTREGA DMN_TEXTO,
    STATUS DMN_SMALLINT_NN DEFAULT 0,
    AUTORIZADO_DATA DMN_DATE,
    AUTORIZADO_USUARIO DMN_USUARIO,
    RECEBEDOR_NOME DMN_VCHAR_100,
    RECEBEDOR_CPF DMN_CNPJ,
    FORMA_PAGTO DMN_SMALLINT_N,
    CONDICAO_PAGTO DMN_SMALLINT_N);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT PK_TBAUTORIZA_COMPRA
PRIMARY KEY (ANO,CODIGO);

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ANO IS
'Ano';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TIPO IS
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_DATA IS
'Data de Emissao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_USUARIO IS
'Usuario de Emissao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALIDADE IS
'Data de Validade';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.MOVITO IS
'Motivo';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.OBSERVACAO IS
'Observacoes';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ENDERECO_ENTREGA IS
'Endereco de Entrega';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Cancelada';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_DATA IS
'Data de Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_USUARIO IS
'Usuario de Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_NOME IS
'Recebedor (Nome)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_CPF IS
'Recebedor (CPF)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORMA_PAGTO IS
'Forma de Pagamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CONDICAO_PAGTO IS
'Condicao de Pagamento';

GRANT ALL ON TBAUTORIZA_COMPRA TO "PUBLIC";



/*------ SYSDBA 13/05/2014 13:20:36 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2014;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2015;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2016;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2017;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2018;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2019;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2020;




/*------ SYSDBA 13/05/2014 13:23:12 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_codigo for tbautoriza_compra
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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 13:24:41 --------*/

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

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_CODIGO IS 'Trigger Nova Autorizacao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de autorizacao de compra no ano.';




/*------ SYSDBA 13/05/2014 13:25:47 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras da empresa.';




/*------ SYSDBA 13/05/2014 13:27:37 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FRN
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FPAGTO
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_CPAGTO
FOREIGN KEY (CONDICAO_PAGTO)
REFERENCES TBCONDICAOPAGTO(COND_COD);




/*------ SYSDBA 13/05/2014 13:29:43 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:29:52 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:30:06 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_US;




/*------ SYSDBA 13/05/2014 13:30:15 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:30:19 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL;




/*------ SYSDBA 13/05/2014 13:30:29 --------*/

ALTER TABLE TBUSERS DROP CONSTRAINT PK_TBUSERS;




/*------ SYSDBA 13/05/2014 13:30:46 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_USUARIO'
where (RDB$FIELD_NAME = 'NOME') and
(RDB$RELATION_NAME = 'TBUSERS')
;




/*------ SYSDBA 13/05/2014 13:30:59 --------*/

ALTER TABLE TBUSERS
ADD CONSTRAINT PK_TBUSERS
PRIMARY KEY (NOME);




/*------ SYSDBA 13/05/2014 13:32:14 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL
FOREIGN KEY (USUARIO_CANCEL)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:32:46 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_US
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:33:16 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:33:45 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:34:14 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:35:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_AUT
FOREIGN KEY (AUTORIZADO_USUARIO)
REFERENCES TBUSERS(NOME);

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_EMISS
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME)
USING INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;




/*------ SYSDBA 13/05/2014 13:36:40 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD CANCELADO_DATA DMN_DATE,
    ADD CANCELADO_USUARIO DMN_USUARIO,
    ADD CANCELADO_MOTIVO DMN_TEXTO;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_DATA IS
'Data de Cancelamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_USUARIO IS
'Usuario de Cancelamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_MOTIVO IS
'Motivo de Cancelamento';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 20;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 21;




/*------ SYSDBA 13/05/2014 13:37:08 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_CANCEL
FOREIGN KEY (CANCELADO_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:42:11 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD EMPRESA_NFE DMN_CNPJ,
    ADD VALOR_BRUTO DMN_MONEY,
    ADD VALOR_DESCONTO DMN_MONEY,
    ADD VALOR_TOTAL DMN_MONEY;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA_NFE IS
'Empresa para Nota Fiscal';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto (Total Produtos)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_DESCONTO IS
'Valor Total de Descontos';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total (Valor Bruto - Valor Desconto)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter EMPRESA_NFE position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 10;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 11;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 12;

alter table TBAUTORIZA_COMPRA
alter STATUS position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 14;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 17;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 19;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 20;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;




/*------ SYSDBA 13/05/2014 13:42:35 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP EMPRESA_NFE;




/*------ SYSDBA 13/05/2014 13:44:18 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRA')
;




/*------ SYSDBA 13/05/2014 13:44:49 --------*/

CREATE DOMAIN DMN_CNPJ_NN AS
VARCHAR(18)
NOT NULL;


/*------ SYSDBA 13/05/2014 13:45:12 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP;




/*------ SYSDBA 13/05/2014 13:45:24 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CNPJ_NN'
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRA')
;




/*------ SYSDBA 13/05/2014 13:45:35 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT PK_TBAUTORIZA_COMPRA
PRIMARY KEY (ANO,CODIGO,EMPRESA);




/*------ SYSDBA 13/05/2014 13:45:53 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;




/*------ SYSDBA 13/05/2014 13:46:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
USING INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;




/*------ SYSDBA 13/05/2014 13:49:18 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto';




/*------ SYSDBA 13/05/2014 13:54:12 --------*/

CREATE TABLE TBAUTORIZA_COMPRAITEM (
    ANO DMN_SMALLINT_NN NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN NOT NULL,
    SEQ DMN_SMALLINT_NN NOT NULL,
    FORNECEDOR DMN_INTEGER_N,
    PRODUTO DMN_INTEGER_N,
    QUANTIDADE DMN_QUANTIDADE_D3,
    VALOR_UNITARIO DMN_MONEY,
    VALOR_TOTAL DMN_MONEY,
    CONFIRMADO_RECEBIMENTO DMN_LOGICO DEFAULT 0);

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT PK_TBAUTORIZA_COMPRAITEM
PRIMARY KEY (ANO,CODIGO,EMPRESA,SEQ);

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.ANO IS
'Ano da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CODIGO IS
'Codigo da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.EMPRESA IS
'Empresa da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.SEQ IS
'Sequencial';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.PRODUTO IS
'Produto/Servico';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_UNITARIO IS
'Valor Unitario';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario)';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';




/*------ SYSDBA 13/05/2014 13:56:15 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'PRODUTO') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRAITEM')
;




/*------ SYSDBA 13/05/2014 13:56:32 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT FK_TBAUTORIZA_COMPRAITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);

GRANT ALL ON TBAUTORIZA_COMPRAITEM TO "PUBLIC";



/*------ SYSDBA 13/05/2014 13:57:56 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.';




/*------ SYSDBA 13/05/2014 13:58:17 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.';




/*------ SYSDBA 13/05/2014 13:59:07 --------*/

CREATE INDEX IDX_TBAUTORIZA_COMPRAITEM_REC
ON TBAUTORIZA_COMPRAITEM (CONFIRMADO_RECEBIMENTO);




/*------ SYSDBA 13/05/2014 14:01:09 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD RECEBEDOR_FUNCAO DMN_VCHAR_50;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_FUNCAO IS
'Recebedor (Funcao)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 20;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;



/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBPRODUTO
    ADD CUST_DESP_OFIC DMN_MONEY,
    ADD CUST_DESP_GERAIS DMN_MONEY,
    ADD CUST_DESP_ADM DMN_MONEY,
    ADD CUST_COMISSAO DMN_MONEY,
    ADD CUST_IMPOSTO DMN_MONEY,
    ADD FI_RET_FINANC DMN_MONEY,
    ADD FI_RET_PLANO DMN_MONEY;

/*------ 13/05/2014 14:29:22 --------*/

CREATE DOMAIN DMN_COMISSAOVALOR AS
NUMERIC(6,2)
DEFAULT 0
NOT NULL;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';

/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBVENDEDOR
    ADD COMISSAO_VL DMN_COMISSAOVALOR;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';

/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBVENDEDOR
    ADD ATIVO DMN_LOGICO DEFAULT 1;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';


/*------ SYSDBA 13/05/2014 14:29:38 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Vendedor ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 13/05/2014 15:08:13 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:11:50 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:12:31 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:13:51 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:16:41 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:17:13 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:19:06 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:20:34 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:21:01 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:21:20 --------*/

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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 23:37:31 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD COMPETENCIA DMN_INTEGER_N,
    ADD DATA_FATURA DMN_DATE;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.DATA_FATURA IS
'Data de faturamento (Entrada)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 9;

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 10;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 11;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 12;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 13;

alter table TBAUTORIZA_COMPRA
alter STATUS position 14;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 15;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 17;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 18;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 19;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 20;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 21;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 22;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 23;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 24;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 25;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 26;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 27;




/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 9;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 10;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;


/*------ SYSDBA 13/05/2014 23:37:42 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;


/*------ SYSDBA 13/05/2014 23:37:50 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia de faturamento';




/*------ SYSDBA 13/05/2014 23:38:14 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';




/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 9;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 10;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;


/*------ SYSDBA 13/05/2014 23:38:26 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;


/*------ SYSDBA 13/05/2014 23:40:29 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_competencia for tbautoriza_compra
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

SET TERM ; ^




/*------ SYSDBA 13/05/2014 23:42:43 --------*/

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

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_COMPETENCIA IS 'Trigger Competencia Autorizacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por identificar a competencia da autorizacao quando esta nao for informada, baseando-se na data de
emissao.';




/*------ SYSDBA 13/05/2014 23:43:15 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_COMPET
FOREIGN KEY (COMPETENCIA)
REFERENCES TBCOMPETENCIA(CMP_NUM);




/*------ SYSDBA 13/05/2014 23:44:04 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD NUMERO DMN_VCHAR_20;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NUMERO IS
'Numero da Autorizacao (Livre)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 10;

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 11;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 12;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 13;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 14;

alter table TBAUTORIZA_COMPRA
alter STATUS position 15;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 16;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 17;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 18;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 19;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 20;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 21;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 22;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 23;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 24;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 25;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 26;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 27;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 28;




/*------ SYSDBA 13/05/2014 23:44:22 --------*/

CREATE INDEX IDX_TBAUTORIZA_COMPRA_NUMERO
ON TBAUTORIZA_COMPRA (NUMERO);




/*------ SYSDBA 13/05/2014 23:45:12 --------*/

CREATE DOMAIN DMN_VCHAR_20_NN AS
VARCHAR(20)
NOT NULL;


/*------ SYSDBA 13/05/2014 23:45:24 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_20_NN'
where (RDB$FIELD_NAME = 'NUMERO') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRA')
;




/*------ SYSDBA 13/05/2014 23:46:20 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
    ADD UNIDADE DMN_SMALLINT_N;

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.UNIDADE IS
'Unidade de Medida';

alter table TBAUTORIZA_COMPRAITEM
alter ANO position 1;

alter table TBAUTORIZA_COMPRAITEM
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRAITEM
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRAITEM
alter SEQ position 4;

alter table TBAUTORIZA_COMPRAITEM
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRAITEM
alter PRODUTO position 6;

alter table TBAUTORIZA_COMPRAITEM
alter QUANTIDADE position 7;

alter table TBAUTORIZA_COMPRAITEM
alter UNIDADE position 8;

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_UNITARIO position 9;

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_TOTAL position 10;

alter table TBAUTORIZA_COMPRAITEM
alter CONFIRMADO_RECEBIMENTO position 11;




/*------ SYSDBA 13/05/2014 23:46:37 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT FK_TBAUTORIZA_COMPRAITEM_UND
FOREIGN KEY (UNIDADE)
REFERENCES TBUNIDADEPROD(UNP_COD);




/*------ SYSDBA 13/05/2014 23:48:47 --------*/

CREATE INDEX IDX_TBUNIDADEPROD_SIGLA
ON TBUNIDADEPROD (UNP_SIGLA);




/*------ SYSDBA 14/05/2014 00:38:58 --------*/

ALTER TABLE TBCOMPRAS
    ADD AUTORIZACAO_ANO DMN_SMALLINT_N,
    ADD AUTORIZACAO_CODIGO DMN_BIGINT_N;

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_ANO IS
'Autorizacao - Ano.';

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_CODIGO IS
'Autorizacao - Codigo.';




/*------ SYSDBA 14/05/2014 00:39:59 --------*/

ALTER TABLE TBCOMPRAS
    ADD AUTORIZACAO_EMPRESA INTEGER;

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_EMPRESA IS
'Autorizacao - Empresa.';




/*------ SYSDBA 14/05/2014 00:40:31 --------*/

ALTER TABLE TBCOMPRAS
    ALTER AUTORIZACAO_EMPRESA TYPE DMN_CNPJ;




/*------ SYSDBA 14/05/2014 00:41:01 --------*/

ALTER TABLE TBCOMPRAS
ADD CONSTRAINT FK_TBCOMPRAS_AUTORIZACAO
FOREIGN KEY (AUTORIZACAO_ANO,AUTORIZACAO_CODIGO,AUTORIZACAO_EMPRESA)
REFERENCES TBAUTORIZA_COMPRA(ANO,CODIGO,EMPRESA);




/*------ SYSDBA 14/05/2014 00:41:35 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada
4 - Cancelada';




/*------ SYSDBA 14/05/2014 00:42:06 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada (NF/NFS registrada no sistema referente a autorizacao)
4 - Cancelada';




/*------ SYSDBA 15/05/2014 14:41:35 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD INSERCAO_DATA DMN_DATETIME;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.INSERCAO_DATA IS
'Data/hora de insercao';




/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column NUMERO position 4;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 5;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 6;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column INSERCAO_DATA position 7;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 8;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 9;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 10;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 11;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 12;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 13;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 14;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 15;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 16;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 17;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 18;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 19;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 20;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 21;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 22;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 23;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 24;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 25;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 26;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 27;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 28;


/*------ SYSDBA 15/05/2014 14:41:56 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 29;


/*------ SYSDBA 15/05/2014 15:15:29 --------*/

create view vw_tipo_autorizacao (Codigo, Descricao)
as
Select 1 as Codigo , 'Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Compra/Serviço' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_AUTORIZACAO TO "PUBLIC";



/*------ SYSDBA 15/05/2014 23:48:03 --------*/

DROP VIEW VW_TIPO_AUTORIZACAO;

CREATE VIEW VW_TIPO_AUTORIZACAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Autorização de Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Autorização de Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Autorização de Compra/Serviço' as Descricao from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_AUTORIZACAO TO "PUBLIC";


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 7, column 6.
join.

*/



/*------ SYSDBA 16/05/2014 00:34:32 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
    ADD USUARIO DMN_USUARIO;

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.USUARIO IS
'Usuario de lancamento';




/*------ SYSDBA 16/05/2014 04:34:40 --------*/

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

SET TERM ; ^




/*------ SYSDBA 16/05/2014 08:49:54 --------*/

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

SET TERM ; ^




/*------ SYSDBA 16/05/2014 08:52:31 --------*/

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

SET TERM ; ^




/*------ SYSDBA 16/05/2014 08:54:57 --------*/

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

SET TERM ; ^




/*------ SYSDBA 16/05/2014 10:29:29 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD CLIENTE_PERMITIR_DUPLICAR_CNPJ DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCONFIGURACAO.CLIENTE_PERMITIR_DUPLICAR_CNPJ IS
'Cliente: Permitir da duplicacao de CPF/CNPJ no Cadastro:
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
alter NFE_SOLICITA_DH_SAIDA position 11;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 12;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 14;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 15;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 17;

alter table TBCONFIGURACAO
alter USUARIO position 18;




/*------ SYSDBA 16/05/2014 10:30:55 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.CLIENTE_PERMITIR_DUPLICAR_CNPJ IS
'Cliente: Permitir duplicar CPF/CNPJ no Cadastro:
0 - Nao
1 - Sim';




/*------ SYSDBA 16/05/2014 11:00:57 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    16/05/2014 - IMR : Criacao do campo';




/*------ SYSDBA 16/05/2014 11:05:07 --------*/

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




/*------ SYSDBA 16/05/2014 11:42:37 --------*/

COMMENT ON TABLE SYS_LICENCA IS 'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes referentes a Licenca de Uso do sistema.';




/*------ SYSDBA 16/05/2014 11:42:58 --------*/

COMMENT ON COLUMN SYS_LICENCA.LINHA_CONTROLE IS
'Dados criptografados.';




/*------ SYSDBA 20/05/2014 10:19:46 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
    ADD IPI_PERCENTUAL DMN_PERCENTUAL,
    ADD IPI_VALOR_TOTAL DMN_MONEY;

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.IPI_PERCENTUAL IS
'Percentual IPI';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.IPI_VALOR_TOTAL IS
'Valor Total do IPI';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario) + Valor Total IPI';

alter table TBAUTORIZA_COMPRAITEM
alter ANO position 1;

alter table TBAUTORIZA_COMPRAITEM
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRAITEM
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRAITEM
alter SEQ position 4;

alter table TBAUTORIZA_COMPRAITEM
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRAITEM
alter PRODUTO position 6;

alter table TBAUTORIZA_COMPRAITEM
alter QUANTIDADE position 7;

alter table TBAUTORIZA_COMPRAITEM
alter UNIDADE position 8;

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_UNITARIO position 9;

alter table TBAUTORIZA_COMPRAITEM
alter IPI_PERCENTUAL position 10;

alter table TBAUTORIZA_COMPRAITEM
alter IPI_VALOR_TOTAL position 11;

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_TOTAL position 12;

alter table TBAUTORIZA_COMPRAITEM
alter CONFIRMADO_RECEBIMENTO position 13;

alter table TBAUTORIZA_COMPRAITEM
alter USUARIO position 14;




/*------ SYSDBA 20/05/2014 10:21:09 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD VALOR_TOTAL_FRETE DMN_MONEY,
    ADD VALOR_TOTAL_IPI DMN_MONEY;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL_FRETE IS
'Valor Total Frete';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL_IPI IS
'Valor Total IPI';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total = (Valor Bruto - Valor Desconto) + Valor Total Frete + Valor Total IPI';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 7;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 8;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 9;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 10;

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 11;

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 12;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 13;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 14;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 15;

alter table TBAUTORIZA_COMPRA
alter STATUS position 16;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 17;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 18;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 19;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 20;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 21;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 22;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 23;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 24;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 25;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 26;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 27;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 28;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 29;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 30;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 31;




/*------ SYSDBA 20/05/2014 10:21:14 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total = (Quantidade * Valor Unitario) + Valor Total IPI';




/*------ SYSDBA 20/05/2014 10:22:37 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD TRANSPORTADOR DMN_INTEGER_N;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TRANSPORTADOR IS
'Transportador';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 7;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 8;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 9;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 10;

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 11;

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 12;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 13;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 14;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 15;

alter table TBAUTORIZA_COMPRA
alter STATUS position 16;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 17;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 18;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 19;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 20;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 21;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 22;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 23;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 24;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 25;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 26;

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 27;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 28;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 29;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 30;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 31;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 32;




/*------ SYSDBA 20/05/2014 10:22:57 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_TRANSP
FOREIGN KEY (TRANSPORTADOR)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 20/05/2014 12:01:36 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD NOME_CONTATO DMN_VCHAR_100;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NOME_CONTATO IS
'Nome do Contato';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter NOME_CONTATO position 6;

alter table TBAUTORIZA_COMPRA
alter TIPO position 7;

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 8;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 9;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 10;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 11;

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 12;

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 13;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 14;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 15;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 16;

alter table TBAUTORIZA_COMPRA
alter STATUS position 17;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 18;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 19;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 20;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 21;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 22;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 23;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 24;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 25;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 26;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 27;

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 28;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 29;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 30;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 31;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 32;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 33;




/*------ SYSDBA 20/05/2014 16:27:25 --------*/

ALTER TABLE TBCOMPRAS
    ADD TIPO_DESPESA DMN_SMALLINT_N;

COMMENT ON COLUMN TBCOMPRAS.TIPO_DESPESA IS
'Tipo de Despesa.';

alter table TBCOMPRAS
alter ANO position 1;

alter table TBCOMPRAS
alter CODCONTROL position 2;

alter table TBCOMPRAS
alter CODEMP position 3;

alter table TBCOMPRAS
alter CODFORN position 4;

alter table TBCOMPRAS
alter NF position 5;

alter table TBCOMPRAS
alter NFSERIE position 6;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 7;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 8;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 9;

alter table TBCOMPRAS
alter NFE_ENVIADA position 10;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 11;

alter table TBCOMPRAS
alter XML_NFE position 12;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 13;

alter table TBCOMPRAS
alter DTLANCAMENTO position 14;

alter table TBCOMPRAS
alter DTEMISS position 15;

alter table TBCOMPRAS
alter HREMISS position 16;

alter table TBCOMPRAS
alter DTENT position 17;

alter table TBCOMPRAS
alter NFCFOP position 18;

alter table TBCOMPRAS
alter NATUREZA position 19;

alter table TBCOMPRAS
alter STATUS position 20;

alter table TBCOMPRAS
alter IPI position 21;

alter table TBCOMPRAS
alter ICMSBASE position 22;

alter table TBCOMPRAS
alter ICMSVALOR position 23;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 24;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 25;

alter table TBCOMPRAS
alter FRETE position 26;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 27;

alter table TBCOMPRAS
alter DESCONTO position 28;

alter table TBCOMPRAS
alter VALORSEGURO position 29;

alter table TBCOMPRAS
alter VALORTOTAL_II position 30;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 31;

alter table TBCOMPRAS
alter VALORPIS position 32;

alter table TBCOMPRAS
alter VALORCOFINS position 33;

alter table TBCOMPRAS
alter TOTALPROD position 34;

alter table TBCOMPRAS
alter TOTALNF position 35;

alter table TBCOMPRAS
alter OBS position 36;

alter table TBCOMPRAS
alter USUARIO position 37;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 38;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 39;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 40;

alter table TBCOMPRAS
alter PRAZO_01 position 41;

alter table TBCOMPRAS
alter PRAZO_02 position 42;

alter table TBCOMPRAS
alter PRAZO_03 position 43;

alter table TBCOMPRAS
alter PRAZO_04 position 44;

alter table TBCOMPRAS
alter PRAZO_05 position 45;

alter table TBCOMPRAS
alter PRAZO_06 position 46;

alter table TBCOMPRAS
alter PRAZO_07 position 47;

alter table TBCOMPRAS
alter PRAZO_08 position 48;

alter table TBCOMPRAS
alter PRAZO_09 position 49;

alter table TBCOMPRAS
alter PRAZO_10 position 50;

alter table TBCOMPRAS
alter PRAZO_11 position 51;

alter table TBCOMPRAS
alter PRAZO_12 position 52;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 53;

alter table TBCOMPRAS
alter TIPO_DESPESA position 54;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 55;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 56;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 57;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 58;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 59;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 60;




/*------ SYSDBA 20/05/2014 16:28:12 --------*/

ALTER TABLE TBCOMPRAS
ADD CONSTRAINT FK_TBCOMPRAS_TIPO_DESPESA
FOREIGN KEY (TIPO_DESPESA)
REFERENCES TBTPDESPESA(COD);




/*------ SYSDBA 20/05/2014 16:48:21 --------*/

COMMENT ON COLUMN TBCONTPAG.CODTPDESP IS
'Tipo Despesa';




/*------ SYSDBA 20/05/2014 16:48:37 --------*/

ALTER TABLE TBCONTPAG DROP CONSTRAINT FK_TBCONTPAG_1;

ALTER TABLE TBCONTPAG
ADD CONSTRAINT FK_TBCONTPAG_TPDESPESA
FOREIGN KEY (CODTPDESP)
REFERENCES TBTPDESPESA(COD)
USING INDEX FK_TBCONTPAG_1;




/*------ SYSDBA 20/05/2014 16:48:59 --------*/

COMMENT ON COLUMN TBCONTPAG.QUITADO IS
'Quitado:
0 - Nao
1 - Sim';




/*------ SYSDBA 20/05/2014 16:49:20 --------*/

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

SET TERM ; ^




/*------ SYSDBA 20/05/2014 16:50:46 --------*/

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

SET TERM ; ^




/*------ SYSDBA 20/05/2014 16:55:08 --------*/

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




/*------ SYSDBA 20/05/2014 16:55:48 --------*/

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




/*------ SYSDBA 20/05/2014 16:57:43 --------*/

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




/*------ SYSDBA 20/05/2014 16:58:15 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total = (Valor Bruto - Valor Desconto) + Valor Total IPI';




/*------ SYSDBA 20/05/2014 16:58:35 --------*/

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




/*------ SYSDBA 20/05/2014 16:59:11 --------*/

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

