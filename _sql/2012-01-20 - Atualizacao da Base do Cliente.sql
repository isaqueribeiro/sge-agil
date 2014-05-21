/* Server version: WI-V6.3.4.18393 Firebird 2.1 
SET CLIENTLIB 'fbclient.dll';
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */

SET NAMES ISO8859_2;

SET SQL DIALECT 3;

CONNECT 'E:\Projetos\Dorivaldo\DGESTAO\db\BUSINESS_CLIENTE.FDB' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

RECONNECT;

ALTER TABLE TBCOMPRAS DROP CONSTRAINT UNQ_TBCOMPRAS_CONTROLE;

/* Drop Trigger... */
DROP TRIGGER TG_PRODUTO_ZERAR_RESERVA;


/* Create Table... */
CREATE TABLE TBCONTREC_BAIXA(ANOLANC SMALLINT NOT NULL,
NUMLANC INTEGER NOT NULL,
SEQ SMALLINT NOT NULL,
HISTORICO DMN_TEXTO,
DATA_PAGTO DATE,
FORMA_PAGTO SMALLINT,
VALOR_BAIXA DMN_MONEY,
NUMERO_CHEQUE VARCHAR(10),
BANCO SMALLINT,
DOCUMENTO_BAIXA VARCHAR(10));



/* WARNING:
Cannot perform safe conversion of TBCONTREC.CODBANCO datatype from INTEGER to SMALLINT */
/* Create Primary Key... */
ALTER TABLE TBCONTREC_BAIXA ADD CONSTRAINT PK_TBCONTREC_BAIXA PRIMARY KEY (ANOLANC, NUMLANC, SEQ);

/* Create Foreign Key... */
RECONNECT;

ALTER TABLE TBCONTREC_BAIXA ADD CONSTRAINT FK_TBCONTREC_BAIXA_BANCO FOREIGN KEY (BANCO) REFERENCES TBBANCO_BOLETO (BCO_COD);

ALTER TABLE TBCONTREC_BAIXA ADD CONSTRAINT FK_TBCONTREC_BAIXA_CREC FOREIGN KEY (ANOLANC, NUMLANC) REFERENCES TBCONTREC (ANOLANC, NUMLANC);

ALTER TABLE TBCONTREC_BAIXA ADD CONSTRAINT FK_TBCONTREC_BAIXA_FPAGTO FOREIGN KEY (FORMA_PAGTO) REFERENCES TBFORMPAGTO (COD);

ALTER TABLE TBCONTREC ADD CONSTRAINT FK_TBCONTREC_BANCO FOREIGN KEY (CODBANCO) REFERENCES TBBANCO_BOLETO (BCO_COD);

/* Create trigger... */
SET TERM ^ ;

CREATE TRIGGER TG_CONTREC_QUITAR FOR TBCONTREC_BAIXA
ACTIVE AFTER INSERT OR UPDATE POSITION 1 
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
end
^


/* Alter exist trigger... */
ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
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
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = :Custo_medio
          p.Customedio = :Custo_compra
        , p.Qtde       = :Estoque + :Quantidade
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
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
        , 'ENTRADA - COMPRA'
        , Current_time
        , null
        , :Quantidade
        , :Estoque
        , user
        , 'Custo Médio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end
^

/* Create(Add) Crant */
SET TERM ; ^

GRANT ALL ON TBCONTREC_BAIXA TO SYSDBA WITH GRANT OPTION;


