


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




/*------ SYSDBA 29/05/2014 15:36:38 --------*/

COMMENT ON COLUMN TBCLIENTE.NOME IS
'Nome (Razao Social)';




/*------ SYSDBA 29/05/2014 15:37:08 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_100'
where (RDB$FIELD_NAME = 'NOMEFORN') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 29/05/2014 15:37:27 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_100'
where (RDB$FIELD_NAME = 'NOME') and
(RDB$RELATION_NAME = 'TBCLIENTE')
;




/*------ SYSDBA 29/05/2014 15:37:57 --------*/

ALTER TABLE TBCLIENTE
    ADD NOMEFANT DMN_VCHAR_100;

COMMENT ON COLUMN TBCLIENTE.NOMEFANT IS
'Nome Fantasia';

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
alter NOMEFANT position 6;

alter table TBCLIENTE
alter INSCEST position 7;

alter table TBCLIENTE
alter INSCMUN position 8;

alter table TBCLIENTE
alter ENDER position 9;

alter table TBCLIENTE
alter COMPLEMENTO position 10;

alter table TBCLIENTE
alter BAIRRO position 11;

alter table TBCLIENTE
alter CEP position 12;

alter table TBCLIENTE
alter CIDADE position 13;

alter table TBCLIENTE
alter UF position 14;

alter table TBCLIENTE
alter FONE position 15;

alter table TBCLIENTE
alter FONECEL position 16;

alter table TBCLIENTE
alter FONECOMERC position 17;

alter table TBCLIENTE
alter EMAIL position 18;

alter table TBCLIENTE
alter SITE position 19;

alter table TBCLIENTE
alter TLG_TIPO position 20;

alter table TBCLIENTE
alter LOG_COD position 21;

alter table TBCLIENTE
alter BAI_COD position 22;

alter table TBCLIENTE
alter CID_COD position 23;

alter table TBCLIENTE
alter EST_COD position 24;

alter table TBCLIENTE
alter NUMERO_END position 25;

alter table TBCLIENTE
alter PAIS_ID position 26;

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 27;

alter table TBCLIENTE
alter BLOQUEADO position 28;

alter table TBCLIENTE
alter BLOQUEADO_DATA position 29;

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 30;

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 31;

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 32;

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

alter table TBCLIENTE
alter BANCO position 40;

alter table TBCLIENTE
alter AGENCIA position 41;

alter table TBCLIENTE
alter CC position 42;

alter table TBCLIENTE
alter PRACA position 43;

alter table TBCLIENTE
alter OBSERVACAO position 44;

alter table TBCLIENTE
alter DTCAD position 45;




/*------ SYSDBA 29/05/2014 15:38:42 --------*/

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




/*------ SYSDBA 29/05/2014 15:40:15 --------*/

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

SET TERM ; ^




/*------ SYSDBA 29/05/2014 17:44:55 --------*/

create view VW_TIPO_DOCUMENTO_ENTRADA ( TPD_CODIGO, TPD_DESCRICAO )
as
Select 0 as TPD_CODIGO , 'Avulso'       as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal' as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D' as TPD_DESCRICAO from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_DOCUMENTO_ENTRADA TO "PUBLIC";



/*------ SYSDBA 29/05/2014 17:50:05 --------*/

create view VW_TIPO_ENTRADA ( TPE_CODIGO, TPE_DESCRICAO )
as
Select 0 as TPE_CODIGO , '* Indefinido'         as TPE_DESCRICAO from RDB$DATABASE union
Select 1 as TPE_CODIGO , 'Consumo Interno'      as TPE_DESCRICAO from RDB$DATABASE union
Select 2 as TPE_CODIGO , 'Produção/Faturamento' as TPE_DESCRICAO from RDB$DATABASE union
Select 3 as TPE_CODIGO , 'Imobilizado'          as TPE_DESCRICAO from RDB$DATABASE;

GRANT ALL ON VW_TIPO_ENTRADA TO "PUBLIC";



/*------ SYSDBA 29/05/2014 17:52:19 --------*/

DROP VIEW VW_TIPO_ENTRADA;

CREATE VIEW VW_TIPO_ENTRADA(
    TPE_CODIGO,
    TPE_DESCRICAO)
AS
Select 0 as TPE_CODIGO , '* Indefinido'         as TPE_DESCRICAO from RDB$DATABASE union
Select 1 as TPE_CODIGO , 'Consumo Interno'      as TPE_DESCRICAO from RDB$DATABASE union
Select 2 as TPE_CODIGO , 'Produção/Faturamento' as TPE_DESCRICAO from RDB$DATABASE union
Select 3 as TPE_CODIGO , 'Imobilizado'          as TPE_DESCRICAO from RDB$DATABASE union
Select 4 as TPE_CODIGO , 'Outras'               as TPE_DESCRICAO from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_ENTRADA TO "PUBLIC";




/*------ SYSDBA 29/05/2014 17:55:24 --------*/

ALTER TABLE TBCOMPRAS
    ADD TIPO_ENTRADA DMN_SMALLINT_NN DEFAULT 0,
    ADD TIPO_DOCUMENTO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBCOMPRAS.TIPO_ENTRADA IS
'Tipo de Entrada.

View VW_TIPO_ENTRADA responsavel pelo dominio desse dados.';

COMMENT ON COLUMN TBCOMPRAS.TIPO_DOCUMENTO IS
'Tipo de Docuento de Entrada.

View VW_TIPO_DOCUMENTO_ENTRADA responsavel pelo dominio desse dados.';

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
alter NF position 7;

alter table TBCOMPRAS
alter NFSERIE position 8;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 9;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 10;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 11;

alter table TBCOMPRAS
alter NFE_ENVIADA position 12;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 13;

alter table TBCOMPRAS
alter XML_NFE position 14;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 15;

alter table TBCOMPRAS
alter DTLANCAMENTO position 16;

alter table TBCOMPRAS
alter DTEMISS position 17;

alter table TBCOMPRAS
alter HREMISS position 18;

alter table TBCOMPRAS
alter DTENT position 19;

alter table TBCOMPRAS
alter NFCFOP position 20;

alter table TBCOMPRAS
alter NATUREZA position 21;

alter table TBCOMPRAS
alter STATUS position 22;

alter table TBCOMPRAS
alter IPI position 23;

alter table TBCOMPRAS
alter ICMSBASE position 24;

alter table TBCOMPRAS
alter ICMSVALOR position 25;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 26;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 27;

alter table TBCOMPRAS
alter FRETE position 28;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 29;

alter table TBCOMPRAS
alter DESCONTO position 30;

alter table TBCOMPRAS
alter VALORSEGURO position 31;

alter table TBCOMPRAS
alter VALORTOTAL_II position 32;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 33;

alter table TBCOMPRAS
alter VALORPIS position 34;

alter table TBCOMPRAS
alter VALORCOFINS position 35;

alter table TBCOMPRAS
alter TOTALPROD position 36;

alter table TBCOMPRAS
alter TOTALNF position 37;

alter table TBCOMPRAS
alter OBS position 38;

alter table TBCOMPRAS
alter USUARIO position 39;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 40;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 41;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 42;

alter table TBCOMPRAS
alter PRAZO_01 position 43;

alter table TBCOMPRAS
alter PRAZO_02 position 44;

alter table TBCOMPRAS
alter PRAZO_03 position 45;

alter table TBCOMPRAS
alter PRAZO_04 position 46;

alter table TBCOMPRAS
alter PRAZO_05 position 47;

alter table TBCOMPRAS
alter PRAZO_06 position 48;

alter table TBCOMPRAS
alter PRAZO_07 position 49;

alter table TBCOMPRAS
alter PRAZO_08 position 50;

alter table TBCOMPRAS
alter PRAZO_09 position 51;

alter table TBCOMPRAS
alter PRAZO_10 position 52;

alter table TBCOMPRAS
alter PRAZO_11 position 53;

alter table TBCOMPRAS
alter PRAZO_12 position 54;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 55;

alter table TBCOMPRAS
alter TIPO_DESPESA position 56;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 57;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 58;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 59;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 60;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 61;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 62;




/*------ SYSDBA 29/05/2014 17:55:40 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_SMALLINT_N'
where (RDB$FIELD_NAME = 'TIPO_ENTRADA') and
(RDB$RELATION_NAME = 'TBCOMPRAS')
;




/*------ SYSDBA 29/05/2014 17:55:47 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_SMALLINT_N'
where (RDB$FIELD_NAME = 'TIPO_DOCUMENTO') and
(RDB$RELATION_NAME = 'TBCOMPRAS')
;




/*------ SYSDBA 29/05/2014 17:57:56 --------*/

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




/*------ SYSDBA 29/05/2014 17:58:31 --------*/

CREATE INDEX IDX_TBCOMPRAS_TIPOS
ON TBCOMPRAS (TIPO_ENTRADA,TIPO_DOCUMENTO);




/*------ SYSDBA 30/05/2014 08:44:46 --------*/

DROP VIEW VW_TIPO_ALIQUOTA;

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
from TBORIGEMPROD
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_ALIQUOTA TO "PUBLIC";




/*------ SYSDBA 30/05/2014 08:46:33 --------*/

ALTER TABLE TBPRODUTO
    ADD COMPOR_FATURAMENTO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBPRODUTO.COMPOR_FATURAMENTO IS
'Produto/Servico compoe faturamento:
0 - Nao
1 - Sim';

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
alter MODELO position 6;

alter table TBPRODUTO
alter PRECO position 7;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter SECAO position 10;

alter table TBPRODUTO
alter QTDE position 11;

alter table TBPRODUTO
alter FRACIONADOR position 12;

alter table TBPRODUTO
alter PESO_BRUTO position 13;

alter table TBPRODUTO
alter PESO_LIQUIDO position 14;

alter table TBPRODUTO
alter CUBAGEM position 15;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 16;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 17;

alter table TBPRODUTO
alter UNIDADE position 18;

alter table TBPRODUTO
alter ESTOQMIN position 19;

alter table TBPRODUTO
alter CODGRUPO position 20;

alter table TBPRODUTO
alter CODFABRICANTE position 21;

alter table TBPRODUTO
alter CUSTOMEDIO position 22;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 23;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 24;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 25;

alter table TBPRODUTO
alter CODEMP position 26;

alter table TBPRODUTO
alter CODSECAO position 27;

alter table TBPRODUTO
alter CODORIGEM position 28;

alter table TBPRODUTO
alter CODTRIBUTACAO position 29;

alter table TBPRODUTO
alter CST position 30;

alter table TBPRODUTO
alter CSOSN position 31;

alter table TBPRODUTO
alter CST_PIS position 32;

alter table TBPRODUTO
alter CST_COFINS position 33;

alter table TBPRODUTO
alter NCM_SH position 34;

alter table TBPRODUTO
alter CODIGO_NVE position 35;

alter table TBPRODUTO
alter CODCFOP position 36;

alter table TBPRODUTO
alter CODBARRA_EAN position 37;

alter table TBPRODUTO
alter CODUNIDADE position 38;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 39;

alter table TBPRODUTO
alter ALIQUOTA position 40;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 41;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 42;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 43;

alter table TBPRODUTO
alter VALOR_IPI position 44;

alter table TBPRODUTO
alter RESERVA position 45;

alter table TBPRODUTO
alter PRODUTO_NOVO position 46;

alter table TBPRODUTO
alter COR_VEICULO position 47;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 48;

alter table TBPRODUTO
alter TIPO_VEICULO position 49;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 50;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 51;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 52;

alter table TBPRODUTO
alter CHASSI_VEICULO position 53;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 54;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 55;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 56;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 57;

alter table TBPRODUTO
alter USUARIO position 58;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 59;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 60;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 61;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 62;

alter table TBPRODUTO
alter CUST_DESP_ADM position 63;

alter table TBPRODUTO
alter CUST_COMISSAO position 64;

alter table TBPRODUTO
alter CUST_IMPOSTO position 65;

alter table TBPRODUTO
alter FI_RET_FINANC position 66;

alter table TBPRODUTO
alter FI_RET_PLANO position 67;




/*------ SYSDBA 30/05/2014 09:11:59 --------*/

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




/*------ SYSDBA 02/06/2014 13:34:04 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD VENDA_CARREGA_PRODUTO_EAN DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCONFIGURACAO.VENDA_CARREGA_PRODUTO_EAN IS
'Venda: Carregar produto pelo EAN:
0 - Nao
1 - Sim';




/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 11;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 12;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 14;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 15;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 16;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 17;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 18;


/*------ SYSDBA 02/06/2014 13:48:00 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 19;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 11;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 12;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 14;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 15;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 16;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 17;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 18;


/*------ SYSDBA 02/06/2014 13:48:18 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 19;