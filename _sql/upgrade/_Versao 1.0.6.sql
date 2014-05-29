


/*------ SYSDBA 28/05/2014 20:54:48 --------*/

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

SET TERM ; ^




/*------ SYSDBA 28/05/2014 20:56:50 --------*/

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




/*------ SYSDBA 28/05/2014 21:02:44 --------*/

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

SET TERM ; ^




/*------ SYSDBA 28/05/2014 21:16:40 --------*/

ALTER TABLE TBBANCO DROP AGENCIA;




/*------ SYSDBA 28/05/2014 21:16:42 --------*/

ALTER TABLE TBBANCO DROP ENDER;




/*------ SYSDBA 28/05/2014 21:16:44 --------*/

ALTER TABLE TBBANCO DROP FONE;




/*------ SYSDBA 28/05/2014 21:16:46 --------*/

ALTER TABLE TBBANCO DROP DTCAD;




/*------ SYSDBA 28/05/2014 21:17:13 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10_KEY'
where (RDB$FIELD_NAME = 'COD') and
(RDB$RELATION_NAME = 'TBBANCO')
;




/*------ SYSDBA 28/05/2014 21:17:30 --------*/

ALTER TABLE TBBANCO
ADD CONSTRAINT PK_TBBANCO
PRIMARY KEY (COD);




/*------ SYSDBA 28/05/2014 21:19:33 --------*/

COMMENT ON TABLE TBBANCO IS 'Tabela de Bancos FEBRABAN.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/05/2014

Tabela responsavel por armazenar a lista atualizada de bancos de acordo com a FEBRABAN.';




/*------ SYSDBA 28/05/2014 21:30:21 --------*/

ALTER TABLE TBBANCO
    ADD HOME_PAGE DMN_VCHAR_100;

COMMENT ON COLUMN TBBANCO.COD IS
'Codigo de Compensacao';

COMMENT ON COLUMN TBBANCO.NOME IS
'Nome do Banco';

COMMENT ON COLUMN TBBANCO.HOME_PAGE IS
'Pagina Web';




/*------ SYSDBA 28/05/2014 21:40:56 --------*/

ALTER TABLE TBCLIENTE
    ADD BANCO DMN_VCHAR_10,
    ADD AGENCIA DMN_VCHAR_10,
    ADD CC DMN_VCHAR_10,
    ADD PRACA DMN_VCHAR_250,
    ADD OBSERVACAO DMN_TEXTO;

COMMENT ON COLUMN TBCLIENTE.BANCO IS
'Dados Financeiros - Banco';

COMMENT ON COLUMN TBCLIENTE.AGENCIA IS
'Dados Financeiros - Agencia';

COMMENT ON COLUMN TBCLIENTE.CC IS
'Dados Financeiros - Conta';

COMMENT ON COLUMN TBCLIENTE.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca';

COMMENT ON COLUMN TBCLIENTE.OBSERVACAO IS
'Observacoes Gerais';



/*------ 28/05/2014 21:41:48 --------*/

ALTER TABLE TBFORNECEDOR
    ADD BANCO DMN_VCHAR_10,
    ADD AGENCIA DMN_VCHAR_10,
    ADD CC DMN_VCHAR_10,
    ADD PRACA DMN_VCHAR_250,
    ADD OBSERVACAO DMN_TEXTO;

/*------ 28/05/2014 21:41:48 --------*/

COMMENT ON COLUMN TBFORNECEDOR.BANCO IS
'Dados Financeiros - Banco';

/*------ 28/05/2014 21:41:48 --------*/

COMMENT ON COLUMN TBFORNECEDOR.AGENCIA IS
'Dados Financeiros - Agencia';

/*------ 28/05/2014 21:41:48 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CC IS
'Dados Financeiros - Conta';

/*------ 28/05/2014 21:41:48 --------*/

COMMENT ON COLUMN TBFORNECEDOR.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca';

/*------ 28/05/2014 21:41:48 --------*/

COMMENT ON COLUMN TBFORNECEDOR.OBSERVACAO IS
'Observacoes Gerais';


/*------ SYSDBA 28/05/2014 21:44:37 --------*/

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

SET TERM ; ^




/*------ SYSDBA 28/05/2014 21:46:59 --------*/

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




/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CODFORN position 1;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column TIPO position 2;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column PESSOA_FISICA position 3;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column NOMEFORN position 4;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column NOMEFANT position 5;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CNPJ position 6;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column INSCEST position 7;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column INSCMUN position 8;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column ENDER position 9;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column COMPLEMENTO position 10;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column NUMERO_END position 11;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CEP position 12;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CIDADE position 13;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column UF position 14;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CONTATO position 15;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column FONE position 16;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column FONECEL position 17;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column FONEFAX position 18;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column EMAIL position 19;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column SITE position 20;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column TLG_TIPO position 21;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column LOG_COD position 22;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column BAI_COD position 23;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CID_COD position 24;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column EST_COD position 25;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column PAIS_ID position 26;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column GRF_COD position 27;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column TRANSPORTADORA position 28;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column BANCO position 29;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column AGENCIA position 30;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CC position 31;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column PRACA position 32;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column OBSERVACAO position 33;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column DTCAD position 34;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CLIENTE_ORIGEM position 35;


/*------ SYSDBA 28/05/2014 21:47:26 --------*/

alter table TBFORNECEDOR
alter column CLIENTE_ORIGEM_COD position 36;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CODIGO position 1;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column TIPO position 2;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column PESSOA_FISICA position 3;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CNPJ position 4;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column NOME position 5;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column INSCEST position 6;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column INSCMUN position 7;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column ENDER position 8;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column COMPLEMENTO position 9;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BAIRRO position 10;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CEP position 11;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CIDADE position 12;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column UF position 13;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column FONE position 14;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column FONECEL position 15;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column FONECOMERC position 16;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column EMAIL position 17;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column SITE position 18;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column TLG_TIPO position 19;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column LOG_COD position 20;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BAI_COD position 21;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CID_COD position 22;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column EST_COD position 23;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column NUMERO_END position 24;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column PAIS_ID position 25;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column VALOR_LIMITE_COMPRA position 26;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BLOQUEADO position 27;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_DATA position 28;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_MOTIVO position 29;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_USUARIO position 30;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column DESBLOQUEADO_DATA position 31;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column VENDEDOR_COD position 32;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column USUARIO position 33;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column EMITIR_NFE_DEVOLUCAO position 34;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_PERCENTUAL position 35;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_FRETE position 36;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_OUTROS position 37;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column ENTREGA_FRACIONADA_VENDA position 38;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column BANCO position 39;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column AGENCIA position 40;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column CC position 41;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column PRACA position 42;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column OBSERVACAO position 43;


/*------ SYSDBA 28/05/2014 21:47:43 --------*/

alter table TBCLIENTE
alter column DTCAD position 44;


/*------ SYSDBA 28/05/2014 21:48:25 --------*/

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




/*------ SYSDBA 28/05/2014 21:49:08 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_BANCO
FOREIGN KEY (BANCO)
REFERENCES TBBANCO(COD);




/*------ SYSDBA 28/05/2014 21:49:35 --------*/

ALTER TABLE TBFORNECEDOR
ADD CONSTRAINT FK_TBFORNECEDOR_BANCO
FOREIGN KEY (BANCO)
REFERENCES TBBANCO(COD);




/*------ SYSDBA 28/05/2014 21:53:07 --------*/

create view vw_banco_febraban ( codigo, nome, codigo_nome, nome_codigo )
as
Select
    b.cod  as codigo
  , b.nome as nome
  , b.cod || ' - ' || b.nome as codigo_nome
  , b.nome || ' (' || b.cod || ')' as nome_codigo
from TBBANCO b
;

GRANT ALL ON VW_BANCO_FEBRABAN TO "PUBLIC";



/*------ SYSDBA 28/05/2014 23:09:24 --------*/

DROP VIEW VW_BANCO_FEBRABAN;

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
from TBBANCO b
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_BANCO_FEBRABAN TO "PUBLIC";

