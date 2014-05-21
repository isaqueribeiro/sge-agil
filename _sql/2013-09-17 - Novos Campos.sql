/* Server version: WI-V6.3.4.18393 Firebird 2.1 
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */
SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll';
SET NAMES ISO8859_2;

SET SQL DIALECT 3;

CONNECT 'localhost:NORTEMIX' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

ALTER TABLE TBCONTREC ADD EMPRESA DMN_CNPJ;

DESCRIBE FIELD EMPRESA TABLE TBCONTREC
'Empresa.';

ALTER TABLE TBPRODUTO ADD PESO_BRUTO DMN_MONEY_DESCONTO;

DESCRIBE FIELD PESO_BRUTO TABLE TBPRODUTO
'Peso bruto (Kg).';

ALTER TABLE TBPRODUTO ADD PESO_LIQUIDO DMN_MONEY_DESCONTO;

DESCRIBE FIELD PESO_LIQUIDO TABLE TBPRODUTO
'Peso liquido (Kg).';

ALTER TABLE TBPRODUTO ADD CUBAGEM DMN_MONEY_DESCONTO_4;

DESCRIBE FIELD CUBAGEM TABLE TBPRODUTO
'Cubagem (m3).';

/* Create Foreign Key... */
RECONNECT;

ALTER TABLE TBCONTREC ADD CONSTRAINT FK_TBCONTREC_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*  Empty SET_GERAR_TITULOS for SET_TITULO_RECEBER(param list change)  */
SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_TITULOS(ANOVENDA SMALLINT,
NUMVENDA INTEGER)
 RETURNS(CLIENTE VARCHAR(18),
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
 BEGIN SUSPEND; END
^

/* Alter empty procedure SET_TITULO_RECEBER with new param-list */
ALTER PROCEDURE SET_TITULO_RECEBER(ANOVENDA SMALLINT,
NUMVENDA INTEGER,
EMPRESA VARCHAR(18),
CLIENTE VARCHAR(18),
FORMA_PAGTO SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
PARCELA SMALLINT)
 RETURNS(ANOLANCAMENTO SMALLINT,
NUMLANCAMENTO INTEGER)
 AS
 BEGIN SUSPEND; END
^

/* Alter Procedure... */
ALTER PROCEDURE SET_TITULO_RECEBER(ANOVENDA SMALLINT,
NUMVENDA INTEGER,
EMPRESA VARCHAR(18),
CLIENTE VARCHAR(18),
FORMA_PAGTO SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
PARCELA SMALLINT)
 RETURNS(ANOLANCAMENTO SMALLINT,
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
    , 1
  );

  suspend;
end
^

/* Alter (SET_GERAR_TITULOS) */
ALTER PROCEDURE SET_GERAR_TITULOS(ANOVENDA SMALLINT,
NUMVENDA INTEGER)
 RETURNS(EMPRESA VARCHAR(18),
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
        x.codemp
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
      , cliente
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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
        , :Empresa
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

ALTER TABLE TBCONTREC ALTER COLUMN ANOLANC POSITION 1;

ALTER TABLE TBCONTREC ALTER COLUMN NUMLANC POSITION 2;

ALTER TABLE TBCONTREC ALTER COLUMN EMPRESA POSITION 3;

ALTER TABLE TBCONTREC ALTER COLUMN CNPJ POSITION 4;

ALTER TABLE TBCONTREC ALTER COLUMN FORMA_PAGTO POSITION 5;

ALTER TABLE TBCONTREC ALTER COLUMN TIPPAG POSITION 6;

ALTER TABLE TBCONTREC ALTER COLUMN HISTORIC POSITION 7;

ALTER TABLE TBCONTREC ALTER COLUMN NUMREC POSITION 8;

ALTER TABLE TBCONTREC ALTER COLUMN DTEMISS POSITION 9;

ALTER TABLE TBCONTREC ALTER COLUMN DTVENC POSITION 10;

ALTER TABLE TBCONTREC ALTER COLUMN DTREC POSITION 11;

ALTER TABLE TBCONTREC ALTER COLUMN DOCBAIX POSITION 12;

ALTER TABLE TBCONTREC ALTER COLUMN VALORREC POSITION 13;

ALTER TABLE TBCONTREC ALTER COLUMN VALORMULTA POSITION 14;

ALTER TABLE TBCONTREC ALTER COLUMN VALORRECTOT POSITION 15;

ALTER TABLE TBCONTREC ALTER COLUMN NUMCONTRATO POSITION 16;

ALTER TABLE TBCONTREC ALTER COLUMN PARCELA POSITION 17;

ALTER TABLE TBCONTREC ALTER COLUMN STATUS POSITION 18;

ALTER TABLE TBCONTREC ALTER COLUMN CODBANCO POSITION 19;

ALTER TABLE TBCONTREC ALTER COLUMN NOSSONUMERO POSITION 20;

ALTER TABLE TBCONTREC ALTER COLUMN REMESSA POSITION 21;

ALTER TABLE TBCONTREC ALTER COLUMN VALORSALDO POSITION 22;

ALTER TABLE TBCONTREC ALTER COLUMN PERCENTJUROS POSITION 23;

ALTER TABLE TBCONTREC ALTER COLUMN PERCENTMULTA POSITION 24;

ALTER TABLE TBCONTREC ALTER COLUMN PERCENTDESCONTO POSITION 25;

ALTER TABLE TBCONTREC ALTER COLUMN DATAPROCESSOBOLETO POSITION 26;

ALTER TABLE TBCONTREC ALTER COLUMN BAIXADO POSITION 27;

ALTER TABLE TBCONTREC ALTER COLUMN ENVIADO POSITION 28;

ALTER TABLE TBCONTREC ALTER COLUMN ANOVENDA POSITION 29;

ALTER TABLE TBCONTREC ALTER COLUMN NUMVENDA POSITION 30;

ALTER TABLE TBCONTREC ALTER COLUMN SITUACAO POSITION 31;

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

ALTER TABLE TBPRODUTO ALTER COLUMN CODCFOP POSITION 35;

ALTER TABLE TBPRODUTO ALTER COLUMN CODBARRA_EAN POSITION 36;

ALTER TABLE TBPRODUTO ALTER COLUMN CODUNIDADE POSITION 37;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_TIPO POSITION 38;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA POSITION 39;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_CSOSN POSITION 40;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_PIS POSITION 41;

ALTER TABLE TBPRODUTO ALTER COLUMN ALIQUOTA_COFINS POSITION 42;

ALTER TABLE TBPRODUTO ALTER COLUMN VALOR_IPI POSITION 43;

ALTER TABLE TBPRODUTO ALTER COLUMN RESERVA POSITION 44;

ALTER TABLE TBPRODUTO ALTER COLUMN PRODUTO_NOVO POSITION 45;

ALTER TABLE TBPRODUTO ALTER COLUMN COR_VEICULO POSITION 46;

ALTER TABLE TBPRODUTO ALTER COLUMN COMBUSTIVEL_VEICULO POSITION 47;

ALTER TABLE TBPRODUTO ALTER COLUMN TIPO_VEICULO POSITION 48;

ALTER TABLE TBPRODUTO ALTER COLUMN ANO_MODELO_VEICULO POSITION 49;

ALTER TABLE TBPRODUTO ALTER COLUMN ANO_FABRICACAO_VEICULO POSITION 50;

ALTER TABLE TBPRODUTO ALTER COLUMN RENAVAM_VEICULO POSITION 51;

ALTER TABLE TBPRODUTO ALTER COLUMN CHASSI_VEICULO POSITION 52;

ALTER TABLE TBPRODUTO ALTER COLUMN KILOMETRAGEM_VEICULO POSITION 53;

ALTER TABLE TBPRODUTO ALTER COLUMN SITUACAO_ATUAL_VEICULO POSITION 54;

ALTER TABLE TBPRODUTO ALTER COLUMN SITUACAO_HISTORICO_VEICULO POSITION 55;

ALTER TABLE TBPRODUTO ALTER COLUMN PERCENTUAL_REDUCAO_BC POSITION 56;

ALTER TABLE TBPRODUTO ALTER COLUMN USUARIO POSITION 57;

/* Altering existing trigger... */
SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CANCELAR
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

