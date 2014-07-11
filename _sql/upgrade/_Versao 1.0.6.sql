


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


/*------ SYSDBA 04/06/2014 12:46:31 --------*/

ALTER TABLE TBCOMPRAS
    ADD TIPO_MOVIMENTO DMN_SMALLINT_N DEFAULT 0;

COMMENT ON COLUMN TBCOMPRAS.TIPO_MOVIMENTO IS
'Tipo Movimento:
0 - Entrada de Produtos
1 - Entrada de Servicos';

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
alter VERIFICADOR_NFE position 14;

alter table TBCOMPRAS
alter XML_NFE position 15;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 16;

alter table TBCOMPRAS
alter DTLANCAMENTO position 17;

alter table TBCOMPRAS
alter DTEMISS position 18;

alter table TBCOMPRAS
alter HREMISS position 19;

alter table TBCOMPRAS
alter DTENT position 20;

alter table TBCOMPRAS
alter NFCFOP position 21;

alter table TBCOMPRAS
alter NATUREZA position 22;

alter table TBCOMPRAS
alter STATUS position 23;

alter table TBCOMPRAS
alter IPI position 24;

alter table TBCOMPRAS
alter ICMSBASE position 25;

alter table TBCOMPRAS
alter ICMSVALOR position 26;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 27;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 28;

alter table TBCOMPRAS
alter FRETE position 29;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 30;

alter table TBCOMPRAS
alter DESCONTO position 31;

alter table TBCOMPRAS
alter VALORSEGURO position 32;

alter table TBCOMPRAS
alter VALORTOTAL_II position 33;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 34;

alter table TBCOMPRAS
alter VALORPIS position 35;

alter table TBCOMPRAS
alter VALORCOFINS position 36;

alter table TBCOMPRAS
alter TOTALPROD position 37;

alter table TBCOMPRAS
alter TOTALNF position 38;

alter table TBCOMPRAS
alter OBS position 39;

alter table TBCOMPRAS
alter USUARIO position 40;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 41;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 42;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 43;

alter table TBCOMPRAS
alter PRAZO_01 position 44;

alter table TBCOMPRAS
alter PRAZO_02 position 45;

alter table TBCOMPRAS
alter PRAZO_03 position 46;

alter table TBCOMPRAS
alter PRAZO_04 position 47;

alter table TBCOMPRAS
alter PRAZO_05 position 48;

alter table TBCOMPRAS
alter PRAZO_06 position 49;

alter table TBCOMPRAS
alter PRAZO_07 position 50;

alter table TBCOMPRAS
alter PRAZO_08 position 51;

alter table TBCOMPRAS
alter PRAZO_09 position 52;

alter table TBCOMPRAS
alter PRAZO_10 position 53;

alter table TBCOMPRAS
alter PRAZO_11 position 54;

alter table TBCOMPRAS
alter PRAZO_12 position 55;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 56;

alter table TBCOMPRAS
alter TIPO_DESPESA position 57;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 58;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 59;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 60;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 61;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 62;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 63;




/*------ SYSDBA 04/06/2014 13:16:17 --------*/

COMMENT ON COLUMN TBCOMPRAS.ICMSBASE IS
'Valor Base ICMS/ISS.';




/*------ SYSDBA 04/06/2014 13:16:26 --------*/

COMMENT ON COLUMN TBCOMPRAS.ICMSVALOR IS
'Valor ICMS/ISS.';




/*------ SYSDBA 04/06/2014 13:16:45 --------*/

COMMENT ON COLUMN TBCOMPRAS.TOTALPROD IS
'Valor Total Produto/Servico.';




/*------ SYSDBA 06/06/2014 09:51:51 --------*/

CREATE DOMAIN DMN_VCHAR_60 AS
VARCHAR(60);


/*------ SYSDBA 06/06/2014 09:53:22 --------*/

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

SET TERM ; ^




/*------ SYSDBA 11/06/2014 12:54:26 --------*/

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

SET TERM ; ^




/*------ SYSDBA 12/06/2014 20:08:48 --------*/

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_FUN;

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_ROT;

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_SIS;

SET STATISTICS INDEX FK_SYS_ROTINA_PAI;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_EMP;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_AUT;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_EMP;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_FRN;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_PRD;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_UND;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_COMPET;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_CPAGTO;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FPAGTO;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FRN;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_TRANSP;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_AUT;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_CANCEL;

SET STATISTICS INDEX FK_TBBAIRRO_CID;

SET STATISTICS INDEX FK_TBBAIRRO_DIS;

SET STATISTICS INDEX FK_TBBANCO_BOLETO_EMPRESA;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO_FP;

SET STATISTICS INDEX FK_TBCAIXA_CONTA_CORRENTE;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CL;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CM;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CX;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_EP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FN;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_PG;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_RC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_US;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_VD;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO_CANCEL;

SET STATISTICS INDEX FK_TBCIDADE_UF;

SET STATISTICS INDEX FK_TBCLIENTE_BAI;

SET STATISTICS INDEX FK_TBCLIENTE_BANCO;

SET STATISTICS INDEX FK_TBCLIENTE_CID;

SET STATISTICS INDEX FK_TBCLIENTE_EST;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_PRD;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_VND;

SET STATISTICS INDEX FK_TBCLIENTE_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_PAIS;

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_EMP;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_EMP;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_PRD;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_REQ;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_UND;

SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_VENDEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;

SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;

SET STATISTICS INDEX FK_TBCOMPRAS_AUTORIZACAO;

SET STATISTICS INDEX FK_TBCOMPRAS_CFOP;

SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCOMPRAS_TIPO_DESPESA;

SET STATISTICS INDEX FK_TBCONFIGURACAO_EMPRESA;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_BANCO;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX FK_TBCONTPAG_1;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_BANCO;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTPAG_BANCO;

SET STATISTICS INDEX FK_TBCONTPAG_COMPRA;

SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_EMPRESA;

SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_BANCO;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTREC_BANCO;

SET STATISTICS INDEX FK_TBCONTREC_CLIENTE_COD;

SET STATISTICS INDEX FK_TBCONTREC_EMPRESA;

SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;

SET STATISTICS INDEX FK_TBCONTREC_VND;

SET STATISTICS INDEX FK_TBEMPRESA_BAI;

SET STATISTICS INDEX FK_TBEMPRESA_CID;

SET STATISTICS INDEX FK_TBEMPRESA_EST;

SET STATISTICS INDEX FK_TBEMPRESA_LOG;

SET STATISTICS INDEX FK_TBEMPRESA_PAIS;

SET STATISTICS INDEX FK_TBEMPRESA_SEGMENTO;

SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;

SET STATISTICS INDEX FK_TBFORMPAGTO_CCORRENTE;

SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;

SET STATISTICS INDEX FK_TBFORNECEDOR_BANCO;

SET STATISTICS INDEX FK_TBFORNECEDOR_CID;

SET STATISTICS INDEX FK_TBFORNECEDOR_CLIENTE_COD;

SET STATISTICS INDEX FK_TBFORNECEDOR_EST;

SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;

SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;

SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;

SET STATISTICS INDEX FK_TBLANCDEPOS_BANCO;

SET STATISTICS INDEX FK_TBLOGRADOURO_CID;

SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;

SET STATISTICS INDEX FK_TBPEDIDOITENS_1;

SET STATISTICS INDEX FK_TBPEDIDOS_2;

SET STATISTICS INDEX FK_TBPEDIDOS_3;

SET STATISTICS INDEX FK_TBPRODHIST_1;

SET STATISTICS INDEX FK_TBPRODHIST_EMP;

SET STATISTICS INDEX FK_TBPRODUTO_1;

SET STATISTICS INDEX FK_TBPRODUTO_2;

SET STATISTICS INDEX FK_TBPRODUTO_CFOP;

SET STATISTICS INDEX FK_TBPRODUTO_COMBUSTIVEL;

SET STATISTICS INDEX FK_TBPRODUTO_COR;

SET STATISTICS INDEX FK_TBPRODUTO_FABRICANTE;

SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;

SET STATISTICS INDEX FK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX FK_TBPRODUTO_SECAO;

SET STATISTICS INDEX FK_TBPRODUTO_TIPO_VEI;

SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROD;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROM;

SET STATISTICS INDEX FK_TBTPDESPESA_PLANO_CONTA;

SET STATISTICS INDEX FK_TBUSERS_1;

SET STATISTICS INDEX FK_TBVENDAS_CFOP;

SET STATISTICS INDEX FK_TBVENDAS_CLIENTE_COD;

SET STATISTICS INDEX FK_TBVENDAS_COMPETENCIA;

SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;

SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_CPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_FPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;

SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;

SET STATISTICS INDEX FK_TBVENDAS_VOLUME;

SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE_COD;

SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;

SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;

SET STATISTICS INDEX FK_TVENDASITENS_VENDA;

SET STATISTICS INDEX IBE$LOG_BLOB_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_KEYS_IDX1;

SET STATISTICS INDEX IDX_PLANO_CONTA_EXERCICIO;

SET STATISTICS INDEX IDX_PLANO_CONTA_GRUPO;

SET STATISTICS INDEX IDX_PRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRAITEM_REC;

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRA_NUMERO;

SET STATISTICS INDEX IDX_TBCAIXA_MOVIMENTO_CNPJ;

SET STATISTICS INDEX IDX_TBCLIENTE_BLOQUEADO;

SET STATISTICS INDEX IDX_TBCLIENTE_CNPJ;

SET STATISTICS INDEX IDX_TBCOMPRAS_NFE;

SET STATISTICS INDEX IDX_TBCOMPRAS_RECIBO;

SET STATISTICS INDEX IDX_TBCOMPRAS_TIPOS;

SET STATISTICS INDEX IDX_TBCONTPAG_SITUACAO;

SET STATISTICS INDEX IDX_TBCONTREC_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;

SET STATISTICS INDEX IDX_TBCONTREC_SITUACAO;

SET STATISTICS INDEX IDX_TBFORNECEDOR_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBUNIDADEPROD_SIGLA;

SET STATISTICS INDEX IDX_TBUSERALLOW;

SET STATISTICS INDEX IDX_TBVENDAS_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBVENDAS_RECIBO;

SET STATISTICS INDEX IDX_TVENDASITENS_CLI_CNPJ;

SET STATISTICS INDEX PK_RENAVAM_COBUSTIVEL;

SET STATISTICS INDEX PK_RENAVAM_COR;

SET STATISTICS INDEX PK_RENAVAM_TIPOVEICULO;

SET STATISTICS INDEX PK_SYS_FUNCAO_PERMISSAO;

SET STATISTICS INDEX PK_SYS_LICENCA;

SET STATISTICS INDEX PK_SYS_ROTINA;

SET STATISTICS INDEX PK_SYS_SISTEMA;

SET STATISTICS INDEX PK_TBAJUSTESTOQ;

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRA;

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRAITEM;

SET STATISTICS INDEX PK_TBBAIRRO;

SET STATISTICS INDEX PK_TBBANCO;

SET STATISTICS INDEX PK_TBBANCO_BOLETO;

SET STATISTICS INDEX PK_TBCAIXA;

SET STATISTICS INDEX PK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX PK_TBCAIXA_MOVIMENTO;

SET STATISTICS INDEX PK_TBCFOP;

SET STATISTICS INDEX PK_TBCIDADE;

SET STATISTICS INDEX PK_TBCLIENTE;

SET STATISTICS INDEX PK_TBCLIENTE_ESTOQUE;

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO;

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO_ITEM;

SET STATISTICS INDEX PK_TBCOMPETENCIA;

SET STATISTICS INDEX PK_TBCOMPRAS;

SET STATISTICS INDEX PK_TBCOMPRASITENS;

SET STATISTICS INDEX PK_TBCONDICAOPAGTO;

SET STATISTICS INDEX PK_TBCONFIGURACAO;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX PK_TBCONTPAG;

SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;

SET STATISTICS INDEX PK_TBCONTREC;

SET STATISTICS INDEX PK_TBCONTREC_BAIXA;

SET STATISTICS INDEX PK_TBCST_COFINS;

SET STATISTICS INDEX PK_TBCST_PIS;

SET STATISTICS INDEX PK_TBDISTRITO;

SET STATISTICS INDEX PK_TBEMPRESA;

SET STATISTICS INDEX PK_TBESTADO;

SET STATISTICS INDEX PK_TBFABRICANTE;

SET STATISTICS INDEX PK_TBFORMPAGTO;

SET STATISTICS INDEX PK_TBFORNECEDOR;

SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX PK_TBFUNCAO;

SET STATISTICS INDEX PK_TBGRUPOPROD;

SET STATISTICS INDEX PK_TBLANCDEPOS;

SET STATISTICS INDEX PK_TBLOGRADOURO;

SET STATISTICS INDEX PK_TBLOG_TRANSACAO;

SET STATISTICS INDEX PK_TBNFE_ENVIADA;

SET STATISTICS INDEX PK_TBORIGEMPROD;

SET STATISTICS INDEX PK_TBPAIS;

SET STATISTICS INDEX PK_TBPEDIDOITENS;

SET STATISTICS INDEX PK_TBPEDIDOS;

SET STATISTICS INDEX PK_TBPLANO_CONTA;

SET STATISTICS INDEX PK_TBPRODUTO;

SET STATISTICS INDEX PK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX PK_TBPROMOCAO;

SET STATISTICS INDEX PK_TBPROMOCAO_PRODUTO;

SET STATISTICS INDEX PK_TBSECAOPROD;

SET STATISTICS INDEX PK_TBSEGMENTO;

SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;

SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;

SET STATISTICS INDEX PK_TBTPDESPESA;

SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;

SET STATISTICS INDEX PK_TBUNIDADEPROD;

SET STATISTICS INDEX PK_TBUSERALLOW;

SET STATISTICS INDEX PK_TBUSERS;

SET STATISTICS INDEX PK_TBVENDAS;

SET STATISTICS INDEX PK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX PK_TBVENDAS_VOLUME;

SET STATISTICS INDEX PK_TBVENDEDOR;

SET STATISTICS INDEX RDB$INDEX_0;

SET STATISTICS INDEX RDB$INDEX_1;

SET STATISTICS INDEX RDB$INDEX_10;

SET STATISTICS INDEX RDB$INDEX_11;

SET STATISTICS INDEX RDB$INDEX_12;

SET STATISTICS INDEX RDB$INDEX_13;

SET STATISTICS INDEX RDB$INDEX_14;

SET STATISTICS INDEX RDB$INDEX_15;

SET STATISTICS INDEX RDB$INDEX_16;

SET STATISTICS INDEX RDB$INDEX_17;

SET STATISTICS INDEX RDB$INDEX_18;

SET STATISTICS INDEX RDB$INDEX_19;

SET STATISTICS INDEX RDB$INDEX_2;

SET STATISTICS INDEX RDB$INDEX_20;

SET STATISTICS INDEX RDB$INDEX_21;

SET STATISTICS INDEX RDB$INDEX_22;

SET STATISTICS INDEX RDB$INDEX_23;

SET STATISTICS INDEX RDB$INDEX_24;

SET STATISTICS INDEX RDB$INDEX_25;

SET STATISTICS INDEX RDB$INDEX_26;

SET STATISTICS INDEX RDB$INDEX_27;

SET STATISTICS INDEX RDB$INDEX_28;

SET STATISTICS INDEX RDB$INDEX_29;

SET STATISTICS INDEX RDB$INDEX_3;

SET STATISTICS INDEX RDB$INDEX_30;

SET STATISTICS INDEX RDB$INDEX_31;

SET STATISTICS INDEX RDB$INDEX_32;

SET STATISTICS INDEX RDB$INDEX_33;

SET STATISTICS INDEX RDB$INDEX_34;

SET STATISTICS INDEX RDB$INDEX_35;

SET STATISTICS INDEX RDB$INDEX_36;

SET STATISTICS INDEX RDB$INDEX_37;

SET STATISTICS INDEX RDB$INDEX_38;

SET STATISTICS INDEX RDB$INDEX_39;

SET STATISTICS INDEX RDB$INDEX_4;

SET STATISTICS INDEX RDB$INDEX_40;

SET STATISTICS INDEX RDB$INDEX_41;

SET STATISTICS INDEX RDB$INDEX_42;

SET STATISTICS INDEX RDB$INDEX_43;

SET STATISTICS INDEX RDB$INDEX_44;

SET STATISTICS INDEX RDB$INDEX_45;

SET STATISTICS INDEX RDB$INDEX_5;

SET STATISTICS INDEX RDB$INDEX_6;

SET STATISTICS INDEX RDB$INDEX_7;

SET STATISTICS INDEX RDB$INDEX_8;

SET STATISTICS INDEX RDB$INDEX_9;

SET STATISTICS INDEX RDB$PRIMARY1;

SET STATISTICS INDEX UNQ1_TBFUNCAO;

SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;

SET STATISTICS INDEX UNQ_SYS_SISTEMA;

SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;

SET STATISTICS INDEX UNQ_TBVENDAS_NFE;




/*------ SYSDBA 12/06/2014 20:08:56 --------*/

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

end 
^

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

end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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

end
^

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

end
^

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

end
^

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

end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

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
end
^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Codigo do Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Codigo da Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Codigo da Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Permissao de Acesso (0 - Nao, 1 - Sim)';

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
end
^

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
end
^

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
end
^

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

end
^

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
end
^

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
end
^

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
end
^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';

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
end
^

SET TERM ; ^




/*------ SYSDBA 12/06/2014 20:09:06 --------*/

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TB_TESTE_CODIGO
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_tb_teste_codigo, 1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_BAIRRO_COD
As
Begin
  If (New.Bai_cod Is Null) Then
    New.Bai_cod = Gen_id(Gen_bairro_id,1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_COD
As
Begin
  If (New.Cid_cod Is Null) Then
    New.Cid_cod = Gen_id(Gen_cidade_id,1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(GEN_CLIENTE_ID, 1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONDICAOPAGTO_COD
As
Begin
  If (New.Cond_cod Is Null) Then
    New.Cond_cod = Gen_id(Gen_condicaopagto_cod, 1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_DISTRITO_BI
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_EMPRESA_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_empresa_id, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FABRICANTE_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FORNECEDOR_COD
As
Begin
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_GRUPOPRODUTO_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_GRUPOPRODUTO_COD,1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_LOGRADOURO_COD
As
Begin
  If (New.Log_cod Is Null) Then
    New.Log_cod = Gen_id(Gen_logradouro_id,1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PLANO_CONTA_NOVO
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_produto_id,1);
End^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_NOVA
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
    NEW.CODIGO = GEN_ID(GEN_TBPROMOCAO_ID, 1);
END^

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

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SECAOPRODUTO_COD
As
Begin
  If (New.Scp_cod Is Null) Then
    New.Scp_cod = Gen_id(GEN_SECAOPRODUTO_ID,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TBCONTREC_SALDO
AS
begin
  new.valorsaldo = ( coalesce(new.valorrec, 0) + coalesce(new.valormulta, 0) - ( coalesce(new.valorrec, 0) * coalesce(new.percentdesconto, 0) / 100 ) ) - coalesce(new.valorrectot, 0);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TIPO_LOGRADOURO_COD
As
Begin
  If (New.Tlg_cod Is Null) Then
    New.Tlg_cod = Gen_id(Gen_tipo_logradouro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_UNIDADEPRODUTO_COD
As
Begin
  If (New.Unp_cod Is Null) Then
    New.Unp_cod = Gen_id(Gen_unidadeproduto_id,1);
End^

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

SET TERM ; ^




/*------ SYSDBA 13/06/2014 09:37:13 --------*/

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

SET TERM ; ^




/*------ SYSDBA 17/06/2014 19:18:11 --------*/

CREATE TABLE SYS_SISTEMA_ROTINA (
    SIS_COD DMN_SMALLINT_NN NOT NULL,
    ROT_COD DMN_VCHAR_10_KEY NOT NULL,
    ACESSO DMN_LOGICO);

ALTER TABLE SYS_SISTEMA_ROTINA
ADD CONSTRAINT PK_SYS_SISTEMA_ROTINA
PRIMARY KEY (SIS_COD,ROT_COD);

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.SIS_COD IS
'Sistema.';

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.ROT_COD IS
'Rotina.';

COMMENT ON COLUMN SYS_SISTEMA_ROTINA.ACESSO IS
'Rotina Liberada para o Sistema:
0 - Nao
1 - Sim';

GRANT ALL ON SYS_SISTEMA_ROTINA TO "PUBLIC";



/*------ SYSDBA 17/06/2014 19:19:01 --------*/

ALTER TABLE SYS_SISTEMA_ROTINA
ADD CONSTRAINT FK_SYS_SISTEMA_ROTINA_SIS
FOREIGN KEY (SIS_COD)
REFERENCES SYS_SISTEMA(SIS_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE SYS_SISTEMA_ROTINA
ADD CONSTRAINT FK_SYS_SISTEMA_ROTINA_ROT
FOREIGN KEY (ROT_COD)
REFERENCES SYS_ROTINA(ROT_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 17/06/2014 19:19:12 --------*/

ALTER TABLE SYS_SISTEMA_ROTINA ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 1
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'SYS_SISTEMA_ROTINA') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'SYS_SISTEMA_ROTINA') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'SYS_SISTEMA_ROTINA') AND
      (F1.RDB$FIELD_NAME = 'ACESSO');

ALTER TABLE SYS_SISTEMA_ROTINA DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 17/06/2014 19:20:20 --------*/

COMMENT ON TABLE SYS_SISTEMA_ROTINA IS 'Tabela Sistema x Rotina.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/06/2014

Tabela responsavel por associar o(s) com a(s) rotina(s) que o sistema pode acessar.';




/*------ SYSDBA 17/06/2014 19:21:00 --------*/

COMMENT ON TABLE SYS_ROTINA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar as rotinas de acesso disponiveis para o sistema e seu controle de acesso.';




/*------ SYSDBA 17/06/2014 19:24:51 --------*/

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

SET TERM ; ^




/*------ SYSDBA 17/06/2014 19:32:11 --------*/

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

SET TERM ; ^




/*------ SYSDBA 18/06/2014 13:47:34 --------*/

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

SET TERM ; ^




/*------ SYSDBA 18/06/2014 15:57:48 --------*/

ALTER TABLE TBTPDESPESA
    ADD TIPO_PARTICULAR DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBTPDESPESA.TIPO_PARTICULAR IS
'Despesa Particular:
0 - Nao
1 - Sim';

alter table TBTPDESPESA
alter COD position 1;

alter table TBTPDESPESA
alter TIPODESP position 2;

alter table TBTPDESPESA
alter TIPO_PARTICULAR position 3;

alter table TBTPDESPESA
alter PLANO_CONTA position 4;




/*------ SYSDBA 25/06/2014 01:35:51 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_COD IS
'Codigo';




/*------ SYSDBA 25/06/2014 01:35:59 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_DESCRICAO IS
'Descricao';




/*------ SYSDBA 25/06/2014 01:36:08 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_ESPECIFICACAO IS
'Especificacao';




/*------ SYSDBA 25/06/2014 01:37:14 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_INFORMACAO_FISCO DMN_VCHAR_250;

COMMENT ON COLUMN TBCFOP.CFOP_INFORMACAO_FISCO IS
'Informacao ao Fisco na NF-e';

alter table TBCFOP
alter CFOP_COD position 1;

alter table TBCFOP
alter CFOP_DESCRICAO position 2;

alter table TBCFOP
alter CFOP_ESPECIFICACAO position 3;

alter table TBCFOP
alter CFOP_INFORMACAO_FISCO position 4;

alter table TBCFOP
alter CFOP_ALTERA_CUSTO_PRODUTO position 5;

alter table TBCFOP
alter CFOP_CST_PADRAO_ENTRADA position 6;

alter table TBCFOP
alter CFOP_CST_PADRAO_SAIDA position 7;




/*------ SYSDBA 25/06/2014 01:42:33 --------*/

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




/*------ SYSDBA 25/06/2014 01:43:59 --------*/

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




/*------ SYSDBA 26/06/2014 12:01:35 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD AUTORIZA_INFORMA_CLIENTE DMN_LOGICO;

COMMENT ON COLUMN TBCONFIGURACAO.AUTORIZA_INFORMA_CLIENTE IS
'Autorizacao de Compra/Servico: Disponibilizar Controle p/ Informar o Cliente:
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
alter VENDA_CARREGA_PRODUTO_EAN position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

alter table TBCONFIGURACAO
alter USUARIO position 20;




/*------ SYSDBA 26/06/2014 12:02:13 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD CLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CLIENTE IS
'Cliente';

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
alter CLIENTE position 16;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 17;

alter table TBAUTORIZA_COMPRA
alter STATUS position 18;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 19;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 20;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 21;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 22;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 23;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 24;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 25;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 26;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 27;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 28;

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 29;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 30;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 31;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 32;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 33;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 34;




/*------ SYSDBA 26/06/2014 12:02:32 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_CLIENTE
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 26/06/2014 12:07:56 --------*/

ALTER TABLE TBCONFIGURACAO ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBCONFIGURACAO') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBCONFIGURACAO') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBCONFIGURACAO') AND
      (F1.RDB$FIELD_NAME = 'AUTORIZA_INFORMA_CLIENTE');

ALTER TABLE TBCONFIGURACAO DROP IBE$$TEMP_COLUMN;



/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2014;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2015;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2016;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2017;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2018;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2019;

/*------ 26/06/2014 17:15:29 --------*/

CREATE GENERATOR GEN_COTACAO_COMPRA_2020;

/*------ 26/06/2014 17:15:29 --------*/

CREATE TABLE TBCOTACAO_COMPRA (
    ANO                 DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CODIGO              DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA             DMN_CNPJ_NN NOT NULL /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    NUMERO              DMN_VCHAR_20_NN /* DMN_VCHAR_20_NN = VARCHAR(20) NOT NULL */,
    TIPO                DMN_SMALLINT_NN DEFAULT 0 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    INSERCAO_DATA       DMN_DATETIME /* DMN_DATETIME = TIMESTAMP */,
    EMISSAO_DATA        DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    EMISSAO_USUARIO     DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    VALIDADE            DMN_DATE /* DMN_DATE = DATE */,
    COMPETENCIA         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    MOVITO              DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    OBSERVACAO          DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    LOG_EVENTO          DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    STATUS              DMN_SMALLINT_NN DEFAULT 0 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    FINALIZADA_DATA     DMN_DATE /* DMN_DATE = DATE */,
    FINALIZADA_USUARIO  DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    CANCELADO_DATA      DMN_DATE /* DMN_DATE = DATE */,
    CANCELADO_USUARIO   DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    CANCELADO_MOTIVO    DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    VALOR_MAX_BRUTO     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MAX_DESCONTO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MAX_TOTAL     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MIN_BRUTO     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MIN_DESCONTO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MIN_TOTAL     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MEDIA_BRUTO     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MEDIA_DESCONTO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_MEDIA_TOTAL     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */
);

/*------ 26/06/2014 17:15:29 --------*/

ALTER TABLE TBCOTACAO_COMPRA ADD CONSTRAINT PK_TBCOTACAO_COMPRA PRIMARY KEY (ANO, CODIGO, EMPRESA);

/*------ 26/06/2014 17:15:29 --------*/

ALTER TABLE TBCOTACAO_COMPRA ADD CONSTRAINT FK_TBCOTACAO_COMPRA_COMPET FOREIGN KEY (COMPETENCIA) REFERENCES TBCOMPETENCIA (CMP_NUM);

/*------ 26/06/2014 17:15:30 --------*/

ALTER TABLE TBCOTACAO_COMPRA ADD CONSTRAINT FK_TBCOTACAO_COMPRA_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 26/06/2014 17:15:30 --------*/

ALTER TABLE TBCOTACAO_COMPRA ADD CONSTRAINT FK_TBCOTACAO_COMPRA_USR_CANCEL FOREIGN KEY (CANCELADO_USUARIO) REFERENCES TBUSERS (NOME);

/*------ 26/06/2014 17:15:30 --------*/

ALTER TABLE TBCOTACAO_COMPRA ADD CONSTRAINT FK_TBCOTACAO_COMPRA_USR_EMISS FOREIGN KEY (EMISSAO_USUARIO) REFERENCES TBUSERS (NOME)
  USING INDEX FK_TBCOTACAO_COMPRA_EMISSOR;

/*------ 26/06/2014 17:15:30 --------*/

CREATE INDEX IDX_TBCOTACAO_COMPRA_NUMERO ON TBCOTACAO_COMPRA (NUMERO);

/*------ 26/06/2014 17:15:30 --------*/

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

/*------ 26/06/2014 17:15:30 --------*/

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

/*------ 26/06/2014 17:15:30 --------*/

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

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON TRIGGER TG_COTACAO_COMPRA_CODIGO IS 
'Trigger Nova Cotacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/06/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de cotacao de compra/servico no ano.';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON TRIGGER TG_COTACAO_COMPRA_COMPETENCIA IS 
'Trigger Competencia Cotacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   26/06/2014

Trigger responsavel por identificar a competencia da cotacao quando esta nao for informada, baseando-se na data de
emissao.';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.ANO IS 
'Ano';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CODIGO IS 
'Codigo';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMPRESA IS 
'Empresa';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.NUMERO IS 
'Numero da Autorizacao (Livre)';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.TIPO IS 
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.INSERCAO_DATA IS 
'Data/hora de insercao';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMISSAO_DATA IS 
'Data de Emissao';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.EMISSAO_USUARIO IS 
'Usuario de Emissao';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALIDADE IS 
'Data de Validade';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.COMPETENCIA IS 
'Competencia';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.MOVITO IS 
'Motivo';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.OBSERVACAO IS 
'Observacoes';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS 
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada (NF/NFS registrada no sistema referente a autorizacao)
4 - Cancelada';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_DATA IS 
'Data de Cancelamento';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_USUARIO IS 
'Usuario de Cancelamento';

/*------ 26/06/2014 17:15:30 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.CANCELADO_MOTIVO IS 
'Motivo de Cancelamento';

/*------ 26/06/2014 17:15:31 --------*/

GRANT ALL ON TBCOTACAO_COMPRA TO PUBLIC;


/*------ SYSDBA 26/06/2014 17:20:20 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.LOG_EVENTO IS
'Log de Eventos';




/*------ SYSDBA 26/06/2014 17:23:03 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Em Cotacao (Recebendo respostas dos fornecedores)
4 - Encerrada
5 - Cancelada';




/*------ SYSDBA 26/06/2014 17:23:16 --------*/

ALTER TABLE TBCOTACAO_COMPRA ALTER FINALIZADA_DATA TO AUTORIZADA_DATA;




/*------ SYSDBA 26/06/2014 17:23:23 --------*/

ALTER TABLE TBCOTACAO_COMPRA ALTER FINALIZADA_USUARIO TO AUTORIZADA_USUARIO;




/*------ SYSDBA 26/06/2014 17:28:28 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_BRUTO IS
'Maximo: Valor Bruto';




/*------ SYSDBA 26/06/2014 17:28:36 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_DESCONTO IS
'Maximo: Descontos';




/*------ SYSDBA 26/06/2014 17:28:46 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MAX_TOTAL IS
'Maximo: Valor Total Liquido';




/*------ SYSDBA 26/06/2014 17:28:55 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_TOTAL IS
'Minimo: Valor Total Liquido';




/*------ SYSDBA 26/06/2014 17:29:05 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_TOTAL IS
'Media: Valor Total Liquido';




/*------ SYSDBA 26/06/2014 17:29:17 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_BRUTO IS
'Minimo: Valor Bruto';




/*------ SYSDBA 26/06/2014 17:29:26 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_BRUTO IS
'Media: Valor Bruto';




/*------ SYSDBA 26/06/2014 17:29:40 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MIN_DESCONTO IS
'Minimo: Descontos';




/*------ SYSDBA 26/06/2014 17:29:46 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_MEDIA_DESCONTO IS
'Media: Descontos';




/*------ SYSDBA 26/06/2014 17:30:35 --------*/

ALTER TABLE TBCOTACAO_COMPRA
ADD CONSTRAINT FK_TBCOTACAO_COMPRA_USR_AUT
FOREIGN KEY (AUTORIZADA_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 26/06/2014 17:37:59 --------*/

ALTER TABLE TBCOTACAO_COMPRA
    ADD ENCERRADA_DATA DMN_DATE,
    ADD ENCERRADA_USUARIO DMN_USUARIO;

COMMENT ON COLUMN TBCOTACAO_COMPRA.AUTORIZADA_DATA IS
'Data de Autorizacao';

COMMENT ON COLUMN TBCOTACAO_COMPRA.AUTORIZADA_USUARIO IS
'Usuario da Autorizacao';

COMMENT ON COLUMN TBCOTACAO_COMPRA.ENCERRADA_DATA IS
'Data de Encerramento';

COMMENT ON COLUMN TBCOTACAO_COMPRA.ENCERRADA_USUARIO IS
'Usuario de Encerramento';

alter table TBCOTACAO_COMPRA
alter ANO position 1;

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 15;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 16;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 17;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 18;

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 19;

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 20;

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 21;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 22;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 23;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 24;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 25;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 26;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 27;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 28;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 29;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 30;




/*------ SYSDBA 26/06/2014 17:38:33 --------*/

ALTER TABLE TBCOTACAO_COMPRA
ADD CONSTRAINT FK_TBCOTACAO_COMPRA_USR_ENCERR
FOREIGN KEY (ENCERRADA_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 26/06/2014 17:41:42 --------*/

ALTER TABLE TBCOTACAO_COMPRA
    ADD VALOR_REF_TOTAL DMN_MONEY;

COMMENT ON COLUMN TBCOTACAO_COMPRA.VALOR_REF_TOTAL IS
'Valor Total Liquido de Referencia';

alter table TBCOTACAO_COMPRA
alter ANO position 1;

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 15;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 16;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 17;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 18;

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 19;

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 20;

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 21;

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 22;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 23;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 24;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 25;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 26;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 27;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 28;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 29;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 30;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 31;



/*------ 27/06/2014 15:56:52 --------*/

CREATE TABLE TBCOTACAO_COMPRAITEM (
    ANO                     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CODIGO                  DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA                 DMN_CNPJ_NN NOT NULL /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    SEQ                     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    PRODUTO                 DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    QUANTIDADE              DMN_QUANTIDADE_D3 /* DMN_QUANTIDADE_D3 = NUMERIC(18,3) DEFAULT 0 NOT NULL */,
    UNIDADE                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    VALOR_UNITARIO_REF      DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_REF         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_UNITARIO_MIN      DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_MIN         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_UNITARIO_MAX      DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_MAX         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_UNITARIO_MEDIA    DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_TOTAL_MEDIA       DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    USUARIO                 DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */
);

/*------ 27/06/2014 15:56:52 --------*/

ALTER TABLE TBCOTACAO_COMPRAITEM ADD CONSTRAINT PK_TBCOTACAO_COMPRAITEM PRIMARY KEY (ANO, CODIGO, EMPRESA, SEQ);

/*------ 27/06/2014 15:56:53 --------*/

ALTER TABLE TBCOTACAO_COMPRAITEM ADD CONSTRAINT FK_TBCOTACAO_COMPRAITEM_AUT FOREIGN KEY (ANO, CODIGO, EMPRESA) REFERENCES TBCOTACAO_COMPRA (ANO, CODIGO, EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 27/06/2014 15:56:53 --------*/

ALTER TABLE TBCOTACAO_COMPRAITEM ADD CONSTRAINT FK_TBCOTACAO_COMPRAITEM_EMP FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 27/06/2014 15:56:53 --------*/

ALTER TABLE TBCOTACAO_COMPRAITEM ADD CONSTRAINT FK_TBCOTACAO_COMPRAITEM_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO (COD);

/*------ 27/06/2014 15:56:53 --------*/

ALTER TABLE TBCOTACAO_COMPRAITEM ADD CONSTRAINT FK_TBCOTACAO_COMPRAITEM_UND FOREIGN KEY (UNIDADE) REFERENCES TBUNIDADEPROD (UNP_COD);

/*------ 27/06/2014 15:56:53 --------*/

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

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.ANO IS 
'Ano da Cotacao';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.CODIGO IS 
'Codigo da Cotacao';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.EMPRESA IS 
'Empresa da Cotacao';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.SEQ IS 
'Sequencial';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.QUANTIDADE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.UNIDADE IS 
'Unidade de Medida';

/*------ 27/06/2014 15:56:53 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.USUARIO IS
'Usuario de lancamento';

/*------ 27/06/2014 15:56:53 --------*/

GRANT ALL ON TBCOTACAO_COMPRAITEM TO PUBLIC;

/*------ 27/06/2014 15:57:13 --------*/

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

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.ANO IS 
'Ano da Cotacao';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.CODIGO IS 
'Codigo da Cotacao';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.EMPRESA IS 
'Empresa da Cotacao';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.SEQ IS 
'Sequencial';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.QUANTIDADE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.UNIDADE IS 
'Unidade de Medida';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_REF IS
'Valor Unitario de Referencia';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_REF IS
'Valor Total de Referencia = (Quantidade * Valor Unitario de Referencia)';

/*------ 27/06/2014 15:57:13 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.USUARIO IS
'Usuario de lancamento';

/*------ 27/06/2014 15:57:13 --------*/

GRANT ALL ON TBCOTACAO_COMPRAITEM TO PUBLIC;


/*------ SYSDBA 27/06/2014 16:44:12 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MIN IS
'Valor Unitario Minimo';




/*------ SYSDBA 27/06/2014 16:44:19 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MAX IS
'Valor Unitario Maximo';




/*------ SYSDBA 27/06/2014 16:44:27 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_UNITARIO_MEDIA IS
'Valor Unitario Medio';




/*------ SYSDBA 27/06/2014 16:44:45 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MIN IS
'Valor Total Minimo = (Quantidade * Valor Unitario Minimo)';




/*------ SYSDBA 27/06/2014 16:44:56 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MAX IS
'Valor Total Maximo = (Quantidade * Valor Unitario Maximo)';




/*------ SYSDBA 27/06/2014 16:45:08 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAITEM.VALOR_TOTAL_MEDIA IS
'Valor Total Medio = (Quantidade * Valor Unitario Medio)';




/*------ SYSDBA 27/06/2014 17:28:45 --------*/

ALTER TABLE TBCOTACAO_COMPRA
    ADD NUMERO_MINIMO_FORNECEDOR DMN_SMALLINT_NN DEFAULT 3;

COMMENT ON COLUMN TBCOTACAO_COMPRA.NUMERO_MINIMO_FORNECEDOR IS
'Numero Minimo de Fornecedores para Cotacao';

alter table TBCOTACAO_COMPRA
alter ANO position 1;

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 6;

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 7;

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBCOTACAO_COMPRA
alter VALIDADE position 9;

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 10;

alter table TBCOTACAO_COMPRA
alter MOVITO position 11;

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 12;

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 13;

alter table TBCOTACAO_COMPRA
alter STATUS position 14;

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 15;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 16;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 17;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 18;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 19;

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 20;

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 21;

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 22;

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 23;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 24;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 25;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 26;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 27;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 28;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 29;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 30;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 31;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 32;




/*------ SYSDBA 27/06/2014 18:33:50 --------*/

CREATE TABLE TBCOTACAO_COMPRAFORN (
    ANO DMN_SMALLINT_NN NOT NULL,
    NUMERO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN NOT NULL,
    FORNECEDOR DMN_INTEGER_NN NOT NULL,
    OBSERVACAO DMN_TEXTO,
    ATIVO DMN_LOGICO DEFAULT 1);

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT PK_TBCOTACAO_COMPRAFORN
PRIMARY KEY (ANO,NUMERO,EMPRESA,FORNECEDOR);

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ANO IS
'Ano da Cotacao';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.NUMERO IS
'Numero da Cotacao';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.OBSERVACAO IS
'Observacoes';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ATIVO IS
'Fornecedor ativo paara Cotacao:
0 - Nao
1 - Sim';

GRANT ALL ON TBCOTACAO_COMPRAFORN TO "PUBLIC";



/*------ SYSDBA 27/06/2014 18:34:33 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_COT
FOREIGN KEY (ANO,NUMERO,EMPRESA)
REFERENCES TBCOTACAO_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_FOR
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 27/06/2014 18:34:57 --------*/

CREATE INDEX IDX_TBCOTACAO_COMPRAFORN_ATIVO
ON TBCOTACAO_COMPRAFORN (ATIVO);




/*------ SYSDBA 27/06/2014 18:35:33 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD USUARIO DMN_USUARIO;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.USUARIO IS
'Usuario de lancamento';




/*------ SYSDBA 27/06/2014 18:35:57 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_USR
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 27/06/2014 18:40:57 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD FORMA_PAGTO DMN_SMALLINT_N,
    ADD CONDICAO_PAGTO DMN_SMALLINT_N,
    ADD PRAZO_ENTREGA_DATA DMN_DATE,
    ADD PRAZO_ENTREDA_DIA DMN_SMALLINT_N;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.FORMA_PAGTO IS
'Forma de Pagamento';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.CONDICAO_PAGTO IS
'Condicao de Pagamento';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.PRAZO_ENTREGA_DATA IS
'Prazo de Entrega (Data)';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.PRAZO_ENTREDA_DIA IS
'Prazo de Entrega (Em dias apos faturamento)';

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

alter table TBCOTACAO_COMPRAFORN
alter NUMERO position 2;

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 5;

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 6;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 7;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 8;

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 9;

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 10;

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 11;




/*------ SYSDBA 27/06/2014 19:01:36 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_FPG
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD);

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_CPG
FOREIGN KEY (CONDICAO_PAGTO)
REFERENCES TBCONDICAOPAGTO(COND_COD);




/*------ SYSDBA 27/06/2014 19:03:10 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD NOME_CONTATO DMN_NOME,
    ADD EMAIL_ENVIO DMN_VCHAR_100;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.NOME_CONTATO IS
'Nome de Contato';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.EMAIL_ENVIO IS
'E-mail';

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

alter table TBCOTACAO_COMPRAFORN
alter NUMERO position 2;

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 9;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 10;

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 11;

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 12;

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 13;




/*------ SYSDBA 30/06/2014 20:36:27 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.ATIVO IS
'Fornecedor ativo para Cotacao:
0 - Nao
1 - Sim';




/*------ SYSDBA 30/06/2014 20:42:16 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN DROP CONSTRAINT FK_TBCOTACAO_COMPRAFORN_COT;




/*------ SYSDBA 30/06/2014 20:42:22 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN DROP CONSTRAINT PK_TBCOTACAO_COMPRAFORN;




/*------ SYSDBA 30/06/2014 20:42:30 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN ALTER NUMERO TO CODIGO;




/*------ SYSDBA 30/06/2014 20:42:40 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT PK_TBCOTACAO_COMPRAFORN
PRIMARY KEY (ANO,CODIGO,EMPRESA,FORNECEDOR);




/*------ SYSDBA 30/06/2014 20:43:04 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_COT
FOREIGN KEY (ANO,CODIGO,EMPRESA)
REFERENCES TBCOTACAO_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 30/06/2014 20:48:24 --------*/

SET TERM ^ ;

CREATE trigger tg_cotacao_compraforn_cotar for tbcotacao_compraforn
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

SET TERM ; ^




/*------ SYSDBA 30/06/2014 20:50:38 --------*/

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

SET TERM ; ^

COMMENT ON TRIGGER TG_COTACAO_COMPRAFORN_COTAR IS 'Trigger Colocar Registro em Cotacao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/06/2014

Trigger responsavel por alterar o status do registro de Cotacao de Compra/Servico quando os dados referentes aos
fornecedores pertencentes a esta sao trabalhados.';




/*------ SYSDBA 30/06/2014 20:51:42 --------*/

CREATE INDEX IDX_TBCOTACAO_COMPRA_STATUS
ON TBCOTACAO_COMPRA (STATUS);




/*------ SYSDBA 30/06/2014 22:05:38 --------*/

ALTER TABLE TBCOTACAO_COMPRA
    ADD DESCRICAO_RESUMO DMN_VCHAR_100;

COMMENT ON COLUMN TBCOTACAO_COMPRA.DESCRICAO_RESUMO IS
'Descricao resumo';

alter table TBCOTACAO_COMPRA
alter ANO position 1;

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

alter table TBCOTACAO_COMPRA
alter DESCRICAO_RESUMO position 6;

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 7;

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 8;

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 9;

alter table TBCOTACAO_COMPRA
alter VALIDADE position 10;

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 11;

alter table TBCOTACAO_COMPRA
alter MOVITO position 12;

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 13;

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 14;

alter table TBCOTACAO_COMPRA
alter STATUS position 15;

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 16;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 17;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 18;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 19;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 20;

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 21;

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 22;

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 23;

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 24;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 25;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 26;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 27;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 28;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 29;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 30;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 31;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 32;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 33;




/*------ SYSDBA 30/06/2014 22:28:36 --------*/

ALTER TABLE TBCOTACAO_COMPRA
    ADD NOME_CONTATO_INT DMN_VCHAR_100;

COMMENT ON COLUMN TBCOTACAO_COMPRA.NOME_CONTATO_INT IS
'Nome de Contato Interno';

alter table TBCOTACAO_COMPRA
alter ANO position 1;

alter table TBCOTACAO_COMPRA
alter CODIGO position 2;

alter table TBCOTACAO_COMPRA
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRA
alter NUMERO position 4;

alter table TBCOTACAO_COMPRA
alter TIPO position 5;

alter table TBCOTACAO_COMPRA
alter DESCRICAO_RESUMO position 6;

alter table TBCOTACAO_COMPRA
alter NOME_CONTATO_INT position 7;

alter table TBCOTACAO_COMPRA
alter INSERCAO_DATA position 8;

alter table TBCOTACAO_COMPRA
alter EMISSAO_DATA position 9;

alter table TBCOTACAO_COMPRA
alter EMISSAO_USUARIO position 10;

alter table TBCOTACAO_COMPRA
alter VALIDADE position 11;

alter table TBCOTACAO_COMPRA
alter COMPETENCIA position 12;

alter table TBCOTACAO_COMPRA
alter MOVITO position 13;

alter table TBCOTACAO_COMPRA
alter OBSERVACAO position 14;

alter table TBCOTACAO_COMPRA
alter LOG_EVENTO position 15;

alter table TBCOTACAO_COMPRA
alter STATUS position 16;

alter table TBCOTACAO_COMPRA
alter NUMERO_MINIMO_FORNECEDOR position 17;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_DATA position 18;

alter table TBCOTACAO_COMPRA
alter AUTORIZADA_USUARIO position 19;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_DATA position 20;

alter table TBCOTACAO_COMPRA
alter ENCERRADA_USUARIO position 21;

alter table TBCOTACAO_COMPRA
alter CANCELADO_DATA position 22;

alter table TBCOTACAO_COMPRA
alter CANCELADO_USUARIO position 23;

alter table TBCOTACAO_COMPRA
alter CANCELADO_MOTIVO position 24;

alter table TBCOTACAO_COMPRA
alter VALOR_REF_TOTAL position 25;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_BRUTO position 26;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_DESCONTO position 27;

alter table TBCOTACAO_COMPRA
alter VALOR_MAX_TOTAL position 28;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_BRUTO position 29;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_DESCONTO position 30;

alter table TBCOTACAO_COMPRA
alter VALOR_MIN_TOTAL position 31;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_BRUTO position 32;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_DESCONTO position 33;

alter table TBCOTACAO_COMPRA
alter VALOR_MEDIA_TOTAL position 34;



/*------ 01/07/2014 00:27:05 --------*/

CREATE VIEW VW_TIPO_COTACAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Cotação de Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Cotação de Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Cotação de Compra/Serviço' as Descricao from RDB$DATABASE;

/*------ 01/07/2014 00:27:05 --------*/

GRANT ALL ON VW_TIPO_COTACAO TO PUBLIC;


/*------ SYSDBA 01/07/2014 01:21:01 --------*/

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

SET TERM ; ^




/*------ SYSDBA 01/07/2014 12:56:41 --------*/

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

SET TERM ; ^




/*------ SYSDBA 01/07/2014 13:00:43 --------*/

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

SET TERM ; ^




/*------ SYSDBA 01/07/2014 13:01:33 --------*/

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

SET TERM ; ^


/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.AUTORIZADO_DATA.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.AUTORIZADO_DATA.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.AUTORIZADO_DATA.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.AUTORIZADO_DATA.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.AUTORIZADO_DATA.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.TRANSPORTADOR.
At line 65, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.RECEBEDOR_NOME.
At line 63, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.VALOR_TOTAL_FRETE.
At line 52, column 9.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
I.VALOR_UNITARIO.
At line 57, column 9.

*/



/*------ SYSDBA 01/07/2014 22:36:26 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD DATA_RESPOSTA DMN_DATE;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.DATA_RESPOSTA IS
'Data de Resposta';

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 9;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 10;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 11;

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 12;

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 13;

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 14;




/*------ SYSDBA 01/07/2014 22:42:52 --------*/

CREATE TABLE TBCOTACAO_COMPRAFORN_ITEM (
    ANO DMN_SMALLINT_NN NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN NOT NULL,
    FORNECEDOR DMN_INTEGER_NN NOT NULL,
    ITEM DMN_SMALLINT_NN NOT NULL,
    VALOR_UNITARIO DMN_MONEY,
    VALOR_TOTAL DMN_MONEY);

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT PK_TBCOTACAO_COMPRAFORN_ITEM
PRIMARY KEY (ANO,CODIGO,EMPRESA,FORNECEDOR,ITEM);

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.ANO IS
'Ano';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.ITEM IS
'Item';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.VALOR_UNITARIO IS
'Valor Unitario (R$)';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN_ITEM.VALOR_TOTAL IS
'Valor Total (R$)';




/*------ SYSDBA 01/07/2014 22:42:53 --------*/

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

GRANT ALL ON TBCOTACAO_COMPRAFORN_ITEM TO "PUBLIC";



/*------ SYSDBA 01/07/2014 22:44:30 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_ITM_COT
FOREIGN KEY (ANO,CODIGO,EMPRESA)
REFERENCES TBCOTACAO_COMPRA(ANO,CODIGO,EMPRESA)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_ITM_FOR
FOREIGN KEY (ANO,CODIGO,EMPRESA,FORNECEDOR)
REFERENCES TBCOTACAO_COMPRAFORN(ANO,CODIGO,EMPRESA,FORNECEDOR)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_ITM_ITM
FOREIGN KEY (ANO,CODIGO,EMPRESA,ITEM)
REFERENCES TBCOTACAO_COMPRAITEM(ANO,CODIGO,EMPRESA,SEQ)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 01/07/2014 22:45:10 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_ITM_FRN
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 01/07/2014 22:45:32 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN_ITEM
ADD CONSTRAINT FK_TBCOTACAO_COMPRAFORN_ITM_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);




/*------ SYSDBA 01/07/2014 22:50:15 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD VALOR_TOTAL_BRUTO DMN_MONEY DEFAULT 0,
    ADD VALOR_TOTAL_DESCONTO DMN_MONEY DEFAULT 0,
    ADD VALOR_TOTAL_LIQUIDO DMN_MONEY DEFAULT 0;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_BRUTO IS
'Total Bruto da Proposta (R$)';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_DESCONTO IS
'Total Descontos da Proposta (R$)';

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VALOR_TOTAL_LIQUIDO IS
'Total Liquido da Proposta (R$)';

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_BRUTO position 9;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_DESCONTO position 10;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_LIQUIDO position 11;

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 12;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 13;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 14;

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 15;

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 16;

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 17;




/*------ SYSDBA 01/07/2014 23:01:44 --------*/

SET TERM ^ ;

CREATE trigger tg_cotacao_compraforn_item_vlr for tbcotacao_compraforn_item
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

SET TERM ; ^




/*------ SYSDBA 01/07/2014 23:03:05 --------*/

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




/*------ SYSDBA 01/07/2014 23:04:30 --------*/

ALTER TABLE TBCOTACAO_COMPRAFORN
    ADD VENCEDOR DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCOTACAO_COMPRAFORN.VENCEDOR IS
'Fornecedor vencedor da Cotacao:
0 - Nao
1 - Sim';

alter table TBCOTACAO_COMPRAFORN
alter ANO position 1;

alter table TBCOTACAO_COMPRAFORN
alter CODIGO position 2;

alter table TBCOTACAO_COMPRAFORN
alter EMPRESA position 3;

alter table TBCOTACAO_COMPRAFORN
alter FORNECEDOR position 4;

alter table TBCOTACAO_COMPRAFORN
alter NOME_CONTATO position 5;

alter table TBCOTACAO_COMPRAFORN
alter EMAIL_ENVIO position 6;

alter table TBCOTACAO_COMPRAFORN
alter FORMA_PAGTO position 7;

alter table TBCOTACAO_COMPRAFORN
alter CONDICAO_PAGTO position 8;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_BRUTO position 9;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_DESCONTO position 10;

alter table TBCOTACAO_COMPRAFORN
alter VALOR_TOTAL_LIQUIDO position 11;

alter table TBCOTACAO_COMPRAFORN
alter VENCEDOR position 12;

alter table TBCOTACAO_COMPRAFORN
alter DATA_RESPOSTA position 13;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREGA_DATA position 14;

alter table TBCOTACAO_COMPRAFORN
alter PRAZO_ENTREDA_DIA position 15;

alter table TBCOTACAO_COMPRAFORN
alter OBSERVACAO position 16;

alter table TBCOTACAO_COMPRAFORN
alter ATIVO position 17;

alter table TBCOTACAO_COMPRAFORN
alter USUARIO position 18;




/*------ SYSDBA 01/07/2014 23:14:05 --------*/

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

SET TERM ; ^

COMMENT ON TRIGGER TG_COTACAO_COMPRAFORN_ITEM_VLR IS 'Trigger Totalizar Resposta Fornecedor/Cotacao.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/07/2014

Trigger responsavel por totalizar os valores referentes a resposta dos fornecedores em relacao as cotacoes.';




/*------ SYSDBA 02/07/2014 00:25:24 --------*/

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

SET TERM ; ^




/*------ SYSDBA 02/07/2014 14:15:51 --------*/

COMMENT ON COLUMN TBCOTACAO_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Em Cotacao (Recebendo respostas dos fornecedores)
4 - Autorizada/Encerrada
5 - Cancelada';




/*------ SYSDBA 02/07/2014 14:17:25 --------*/

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

SET TERM ; ^




/*------ SYSDBA 07/07/2014 10:20:56 --------*/

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

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_COTACAO_COMPRAFORN_ITEM TO "PUBLIC";



/*------ SYSDBA 07/07/2014 17:39:57 --------*/

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

SET TERM ; ^




/*------ SYSDBA 07/07/2014 17:42:24 --------*/

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

SET TERM ; ^




/*------ SYSDBA 07/07/2014 17:42:40 --------*/

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

SET TERM ; ^




/*------ SYSDBA 07/07/2014 17:43:14 --------*/

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

SET TERM ; ^




/*------ SYSDBA 07/07/2014 20:42:13 --------*/

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

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_COTACAO_COMPRAFORN_PROCESSA TO "PUBLIC";



/*------ SYSDBA 07/07/2014 20:42:24 --------*/

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

SET TERM ; ^




/*------ SYSDBA 08/07/2014 08:47:56 --------*/

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

SET TERM ; ^




/*------ SYSDBA 08/07/2014 08:48:46 --------*/

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

SET TERM ; ^




/*------ SYSDBA 11/07/2014 15:59:12 --------*/

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

SET TERM ; ^

