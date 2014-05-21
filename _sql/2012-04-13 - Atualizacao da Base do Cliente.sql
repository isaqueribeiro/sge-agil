


/*------ 09/02/2012 10:23:41: Creating domain DMN_MONEY_DESCONTO... --------*/

CREATE DOMAIN DMN_MONEY_DESCONTO AS
  NUMERIC(15, 3)
  DEFAULT 0;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
POSITION 11;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN PFINAL
POSITION 12;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN QTDEFINAL
POSITION 13;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN UNID_COD
POSITION 14;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN CFOP_COD
POSITION 15;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA
POSITION 16;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA_CSOSN
POSITION 17;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN VALOR_IPI
POSITION 18;



/*------ 09/02/2012 12:54:56: Setting description for DESCONTO_VALOR... --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TVENDASITENS');


/*------ 09/02/2012 13:22:35: Changing domain for field DESCONTO_VALOR... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
TYPE DMN_MONEY;


SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;
SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;
SET STATISTICS INDEX FK_TBBAIRRO_CID;
SET STATISTICS INDEX FK_TBBAIRRO_DIS;
SET STATISTICS INDEX FK_TBCIDADE_UF;
SET STATISTICS INDEX FK_TBCLIENTE_BAI;
SET STATISTICS INDEX FK_TBCLIENTE_CID;
SET STATISTICS INDEX FK_TBCLIENTE_EST;
SET STATISTICS INDEX FK_TBCLIENTE_LOG;
SET STATISTICS INDEX FK_TBCLIENTE_PAIS;
SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;
SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;
SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;
SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;
SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;
SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;
SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;
SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;
SET STATISTICS INDEX FK_TBCONTPAG_1;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_BANCO;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_BANCO;
SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;
SET STATISTICS INDEX FK_TBCONTREC_1;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_BANCO;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;
SET STATISTICS INDEX FK_TBCONTREC_BANCO;
SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;
SET STATISTICS INDEX FK_TBCONTREC_VND;
SET STATISTICS INDEX FK_TBEMPRESA_BAI;
SET STATISTICS INDEX FK_TBEMPRESA_CID;
SET STATISTICS INDEX FK_TBEMPRESA_EST;
SET STATISTICS INDEX FK_TBEMPRESA_LOG;
SET STATISTICS INDEX FK_TBEMPRESA_PAIS;
SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;
SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;
SET STATISTICS INDEX FK_TBFORNECEDOR_CID;
SET STATISTICS INDEX FK_TBFORNECEDOR_EST;
SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;
SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;
SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;
SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;
SET STATISTICS INDEX FK_TBLANCDEPOS_1;
SET STATISTICS INDEX FK_TBLOGRADOURO_CID;
SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;
SET STATISTICS INDEX FK_TBPEDIDOITENS_1;
SET STATISTICS INDEX FK_TBPEDIDOS_1;
SET STATISTICS INDEX FK_TBPEDIDOS_2;
SET STATISTICS INDEX FK_TBPEDIDOS_3;
SET STATISTICS INDEX FK_TBPRODHIST_1;
SET STATISTICS INDEX FK_TBPRODHIST_EMP;
SET STATISTICS INDEX FK_TBPRODUTO_1;
SET STATISTICS INDEX FK_TBPRODUTO_2;
SET STATISTICS INDEX FK_TBPRODUTO_CFOP;
SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;
SET STATISTICS INDEX FK_TBPRODUTO_SECAO;
SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;
SET STATISTICS INDEX FK_TBUSERS_1;
SET STATISTICS INDEX FK_TBVENDAS_CFOP;
SET STATISTICS INDEX FK_TBVENDAS_CLIENTE;
SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;
SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;
SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;
SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;
SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE;
SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;
SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;
SET STATISTICS INDEX FK_TVENDASITENS_VENDA;
SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;
SET STATISTICS INDEX PK_TBBAIRRO;
SET STATISTICS INDEX PK_TBBANCO;
SET STATISTICS INDEX PK_TBBANCO_BOLETO;
SET STATISTICS INDEX PK_TBCFOP;
SET STATISTICS INDEX PK_TBCIDADE;
SET STATISTICS INDEX PK_TBCLIENTE;
SET STATISTICS INDEX PK_TBCOMPRAS;
SET STATISTICS INDEX PK_TBCOMPRASITENS;
SET STATISTICS INDEX PK_TBCONDICAOPAGTO;
SET STATISTICS INDEX PK_TBCONTPAG;
SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;
SET STATISTICS INDEX PK_TBCONTREC;
SET STATISTICS INDEX PK_TBCONTREC_BAIXA;
SET STATISTICS INDEX PK_TBDISTRITO;
SET STATISTICS INDEX PK_TBEMPRESA;
SET STATISTICS INDEX PK_TBESTADO;
SET STATISTICS INDEX PK_TBFORMPAGTO;
SET STATISTICS INDEX PK_TBFORNECEDOR;
SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;
SET STATISTICS INDEX PK_TBFUNCAO;
SET STATISTICS INDEX PK_TBGRUPOPROD;
SET STATISTICS INDEX PK_TBLANCDEPOS;
SET STATISTICS INDEX PK_TBLOGRADOURO;
SET STATISTICS INDEX PK_TBNFE_ENVIADA;
SET STATISTICS INDEX PK_TBORIGEMPROD;
SET STATISTICS INDEX PK_TBPAIS;
SET STATISTICS INDEX PK_TBPEDIDOITENS;
SET STATISTICS INDEX PK_TBPEDIDOS;
SET STATISTICS INDEX PK_TBPRODUTO;
SET STATISTICS INDEX PK_TBSECAOPROD;
SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;
SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;
SET STATISTICS INDEX PK_TBTPDESPESA;
SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;
SET STATISTICS INDEX PK_TBUNIDADEPROD;
SET STATISTICS INDEX PK_TBUSERS;
SET STATISTICS INDEX PK_TBVENDAS;
SET STATISTICS INDEX PK_TBVENDEDOR;
SET STATISTICS INDEX PK_TB_TESTE;
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
SET STATISTICS INDEX UNQ1_TBFUNCAO;
SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;
SET STATISTICS INDEX UNQ_TBCLIENTE_CODIGO;
SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;
SET STATISTICS INDEX UNQ_TBVENDAS_NFE;


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
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sábado */
    Dia_util = :Dia_util + 2;

  suspend;
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
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
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
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end

^

SET TERM ; ^

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
declare variable valor_total_parcelas numeric(15,2);
begin
  for
    Select
        c.Codforn
      , c.Nf
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
        , :Parcela) d
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
    CLIENTE VARCHAR(18),
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
        v.Codcli
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
      , v.Totalvenda
      , v.Formapagto_cod
      , v.Dtfinalizacao_venda
    from TBVENDAS v
    where v.Ano        = :Anovenda
      and v.Codcontrol = :Numvenda
    into
        cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
        , :Cliente
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
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_TITULO_RECEBER(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER,
    CLIENTE VARCHAR(18),
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
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Cliente
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
  );

  suspend;
end

^

SET TERM ; ^



DROP TRIGGER TG_VENDAS_CANCELAR;

CREATE OR ALTER Trigger Tg_vendas_cancelar For Tbvendas
Active After Update Position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then
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

      -- Gerar histórico
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
        , user
        , 'Venda no valor de R$ ' || :Valor_produto
      );

      -- Cancelar Contas A Receber
      Update TBCONTREC r Set
        r.status = 'CANCELADA'
      where r.anovenda = new.ano
        and r.numvenda = new.codcontrol;
    end
     
  end 
end

CREATE OR ALTER Trigger Tg_vendas_atualizar_estoque For Tbvendas
Active After Update Position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
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

      -- Gerar histórico
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
        , user
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end



COMMENT ON COLUMN TVENDASITENS.DESCONTO IS
'Percentual desconto.';

COMMENT ON COLUMN TVENDASITENS.DESCONTO_VALOR IS
'Valor desconto (Unitario).';

GRANT ALL ON MON$ATTACHMENTS TO PUBLIC;

GRANT ALL ON MON$CALL_STACK TO PUBLIC;

GRANT ALL ON MON$DATABASE TO PUBLIC;

GRANT ALL ON MON$IO_STATS TO PUBLIC;

GRANT ALL ON MON$RECORD_STATS TO PUBLIC;

GRANT ALL ON MON$STATEMENTS TO PUBLIC;

GRANT ALL ON MON$TRANSACTIONS TO PUBLIC;

ALTER TABLE TBPRODUTO
    ADD PRECO_PROMOCAO DMN_MONEY;
COMMENT ON COLUMN TBPRODUTO.PRECO_PROMOCAO IS
'Preco Venda (Promocao).';
alter table TBPRODUTO
alter CODIGO position 1;
alter table TBPRODUTO
alter COD position 2;
alter table TBPRODUTO
alter DESCRI position 3;
alter table TBPRODUTO
alter MODELO position 4;
alter table TBPRODUTO
alter PRECO position 5;
alter table TBPRODUTO
alter PRECO_PROMOCAO position 6;
alter table TBPRODUTO
alter REFERENCIA position 7;
alter table TBPRODUTO
alter SECAO position 8;
alter table TBPRODUTO
alter QTDE position 9;
alter table TBPRODUTO
alter UNIDADE position 10;
alter table TBPRODUTO
alter ESTOQMIN position 11;
alter table TBPRODUTO
alter CODGRUPO position 12;
alter table TBPRODUTO
alter CUSTOMEDIO position 13;
alter table TBPRODUTO
alter CODEMP position 14;
alter table TBPRODUTO
alter CODSECAO position 15;
alter table TBPRODUTO
alter CODORIGEM position 16;
alter table TBPRODUTO
alter CODTRIBUTACAO position 17;
alter table TBPRODUTO
alter CST position 18;
alter table TBPRODUTO
alter CSOSN position 19;
alter table TBPRODUTO
alter NCM_SH position 20;
alter table TBPRODUTO
alter CODCFOP position 21;
alter table TBPRODUTO
alter CODBARRA_EAN position 22;
alter table TBPRODUTO
alter CODUNIDADE position 23;
alter table TBPRODUTO
alter ALIQUOTA_TIPO position 24;
alter table TBPRODUTO
alter ALIQUOTA position 25;
alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 26;
alter table TBPRODUTO
alter VALOR_IPI position 27;
alter table TBPRODUTO
alter RESERVA position 28;


CREATE DOMAIN DMN_VCHAR_50 AS
VARCHAR(50);;


CREATE DOMAIN DMN_DATE AS
DATE;;
CREATE DOMAIN DMN_TIME AS
TIME;;
CREATE DOMAIN DMN_DATETIME AS
TIMESTAMP;;


CREATE TABLE TBPROMOCAO (
    CODIGO DMN_BIGINT_NN NOT NULL,
    DESCRICAO DMN_VCHAR_50,
    DATA_INICIO DMN_DATE,
    DATA_FINAL DMN_DATE,
    PERCENTUAL_DESCONTO DMN_MONEY);
alter table TBPROMOCAO
add constraint PK_TBPROMOCAO
primary key (CODIGO);
GRANT ALL ON MON$ATTACHMENTS TO "PUBLIC";
GRANT ALL ON MON$CALL_STACK TO "PUBLIC";
GRANT ALL ON MON$DATABASE TO "PUBLIC";
GRANT ALL ON MON$IO_STATS TO "PUBLIC";
GRANT ALL ON MON$RECORD_STATS TO "PUBLIC";
GRANT ALL ON MON$STATEMENTS TO "PUBLIC";
GRANT ALL ON MON$TRANSACTIONS TO "PUBLIC";
GRANT ALL ON TBAJUSTESTOQ TO "PUBLIC";
GRANT ALL ON TBBAIRRO TO "PUBLIC";
GRANT ALL ON TBBANCO TO "PUBLIC";
GRANT ALL ON TBBANCO_BOLETO TO "PUBLIC";
GRANT ALL ON TBCFOP TO "PUBLIC";
GRANT ALL ON TBCIDADE TO "PUBLIC";
GRANT ALL ON TBCLIENTE TO "PUBLIC";
GRANT ALL ON TBCOMPRAS TO "PUBLIC";
GRANT ALL ON TBCOMPRASITENS TO "PUBLIC";
GRANT ALL ON TBCONDICAOPAGTO TO "PUBLIC";
GRANT ALL ON TBCONTPAG TO "PUBLIC";
GRANT ALL ON TBCONTPAG_BAIXA TO "PUBLIC";
GRANT ALL ON TBCONTREC TO "PUBLIC";
GRANT ALL ON TBCONTREC_BAIXA TO "PUBLIC";
GRANT ALL ON TBDISTRITO TO "PUBLIC";
GRANT ALL ON TBEMPRESA TO "PUBLIC";
GRANT ALL ON TBESTADO TO "PUBLIC";
GRANT ALL ON TBFORMPAGTO TO "PUBLIC";
GRANT ALL ON TBFORNECEDOR TO "PUBLIC";
GRANT ALL ON TBFORNECEDOR_GRUPO TO "PUBLIC";
GRANT ALL ON TBFUNCAO TO "PUBLIC";
GRANT ALL ON TBGRUPOPROD TO "PUBLIC";
GRANT ALL ON TBLANCDEPOS TO "PUBLIC";
GRANT ALL ON TBLOGRADOURO TO "PUBLIC";
GRANT ALL ON TBNFE_ENVIADA TO "PUBLIC";
GRANT ALL ON TBORIGEMPROD TO "PUBLIC";
GRANT ALL ON TBPAIS TO "PUBLIC";
GRANT ALL ON TBPEDIDOITENS TO "PUBLIC";
GRANT ALL ON TBPEDIDOS TO "PUBLIC";
GRANT ALL ON TBPRODHIST TO "PUBLIC";
GRANT ALL ON TBPRODUTO TO "PUBLIC";
GRANT ALL ON TBPROMOCAO TO "PUBLIC";
GRANT ALL ON TBSECAOPROD TO "PUBLIC";
GRANT ALL ON TBSENHA_AUTORIZACAO TO "PUBLIC";
GRANT ALL ON TBTIPO_LOGRADOURO TO "PUBLIC";
GRANT ALL ON TBTPDESPESA TO "PUBLIC";
GRANT ALL ON TBTRIBUTACAO_TIPO TO "PUBLIC";
GRANT ALL ON TBUNIDADEPROD TO "PUBLIC";
GRANT ALL ON TBUSERS TO "PUBLIC";
GRANT ALL ON TBVENDAS TO "PUBLIC";
GRANT ALL ON TBVENDEDOR TO "PUBLIC";
GRANT ALL ON TB_TESTE TO "PUBLIC";
GRANT ALL ON TVENDASITENS TO "PUBLIC";
GRANT ALL ON VW_CONDICAOPAGTO TO "PUBLIC";
GRANT ALL ON VW_ORIGEM_PRODUTO TO "PUBLIC";
GRANT ALL ON VW_TIPO_ALIQUOTA TO "PUBLIC";
GRANT ALL ON VW_TIPO_REGIME_NFE TO "PUBLIC";
GRANT ALL ON VW_TIPO_TRIBUTACAO TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE GET_DIA_UTIL TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SET_DUPLICATA_PAGAR TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SET_GERAR_DUPLICATAS TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SET_GERAR_TITULOS TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SET_TITULO_RECEBER TO "PUBLIC";


CREATE DOMAIN DMN_VCHAR_10_KEY AS
VARCHAR(10)
NOT NULL;;
CREATE DOMAIN DMN_VCHAR_10 AS
VARCHAR(10);;


CREATE TABLE TBPROMOCAO_PRODUTO (
    CODIGO_PROM DMN_BIGINT_NN NOT NULL,
    CODIGO_PROD DMN_VCHAR_10_KEY NOT NULL,
    PRECO_VENDA DMN_MONEY,
    PRECO_PROMOCAO DMN_MONEY,
    DESCONTO DMN_MONEY,
    USUARIO DMN_VCHAR_50);
alter table TBPROMOCAO_PRODUTO
add constraint PK_TBPROMOCAO_PRODUTO
primary key (CODIGO_PROM,CODIGO_PROD);
GRANT ALL ON TBPROMOCAO_PRODUTO TO "PUBLIC";


alter table TBPROMOCAO_PRODUTO
add constraint FK_TBPROMOCAO_PRODUTO_PROM
foreign key (CODIGO_PROM)
references TBPROMOCAO(CODIGO)
on delete CASCADE
on update CASCADE;
alter table TBPROMOCAO_PRODUTO
add constraint FK_TBPROMOCAO_PRODUTO_PROD
foreign key (CODIGO_PROD)
references TBPRODUTO(COD);


SET TERM ^ ;

CREATE Trigger Tg_promocao_produto_retirar For Tbpromocao_produto
Active After Delete Position 1
AS
begin
  /* Retirar Preco de Promocao da Ficha do Produto */
  Update TBPRODUTO p Set
    p.Preco_promocao = null
  where p.Cod = old.Codigo_prod;
end
^

SET TERM ; ^



CREATE SEQUENCE GEN_TBPROMOCAO_ID;
SET TERM ^ ;

CREATE TRIGGER TG_PROMOCAO_NOVA FOR TBPROMOCAO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
    NEW.CODIGO = GEN_ID(GEN_TBPROMOCAO_ID, 1);
END
^

SET TERM ; ^



ALTER TABLE TBPROMOCAO
    ADD ATIVA DMN_LOGICO;


ALTER TABLE TVENDASITENS
    ADD PUNIT_PROMOCAO DMN_MONEY;
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
alter CODCLI position 6;
alter table TVENDASITENS
alter DTVENDA position 7;
alter table TVENDASITENS
alter QTDE position 8;
alter table TVENDASITENS
alter PUNIT position 9;
alter table TVENDASITENS
alter PUNIT_PROMOCAO position 10;
alter table TVENDASITENS
alter DESCONTO position 11;
alter table TVENDASITENS
alter DESCONTO_VALOR position 12;
alter table TVENDASITENS
alter PFINAL position 13;
alter table TVENDASITENS
alter QTDEFINAL position 14;
alter table TVENDASITENS
alter UNID_COD position 15;
alter table TVENDASITENS
alter CFOP_COD position 16;
alter table TVENDASITENS
alter ALIQUOTA position 17;
alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 18;
alter table TVENDASITENS
alter VALOR_IPI position 19;


COMMENT ON COLUMN TVENDASITENS.PUNIT IS
'Valor Unitario.';


COMMENT ON COLUMN TVENDASITENS.PUNIT_PROMOCAO IS
'Valor Unitario (Promocao).';


SET TERM ^ ;

CREATE Trigger Tg_promocao_produto For Tbpromocao
Active After Update Position 10
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
end
^

SET TERM ; ^



ALTER TABLE TBCLIENTE
    ADD VALOR_LIMITE_COMPRA DMN_MONEY;


SET TERM ^ ;

create or alter procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
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
    left join TBCONTREC r on (r.Cnpj = c.Cnpj and r.Baixado = 0)
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_LIMITE_DISPONIVEL_CLIENTE TO "PUBLIC";


SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
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
    left join TBCONTREC r on (r.Cnpj = c.Cnpj and r.Baixado = 0)
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite = coalesce(:Valor_limite, 0);

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
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
    left join TBCONTREC r on (r.Cnpj = c.Cnpj and r.Baixado = 0)
  where c.Cnpj = :Cpf_cnpj
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

