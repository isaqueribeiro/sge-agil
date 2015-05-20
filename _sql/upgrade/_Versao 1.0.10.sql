


/*------ SYSDBA 06/04/2015 22:53:55 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COMPETENCIA (
    NUMERO integer,
    DESCRICAO varchar(50))
as
begin
  if ( (trim(coalesce(:descricao, '')) = '') and (:numero > 200000) ) then
  begin
    descricao = Case Cast(substring(:numero from 5 for 2) as Smallint)
                  when  1 then 'JAN/' || substring(:numero from 1 for 4)
                  when  2 then 'FEV/' || substring(:numero from 1 for 4)
                  when  3 then 'MAR/' || substring(:numero from 1 for 4)
                  when  4 then 'ABR/' || substring(:numero from 1 for 4)
                  when  5 then 'MAI/' || substring(:numero from 1 for 4)
                  when  6 then 'JUN/' || substring(:numero from 1 for 4)
                  when  7 then 'JUL/' || substring(:numero from 1 for 4)
                  when  8 then 'AGO/' || substring(:numero from 1 for 4)
                  when  9 then 'SET/' || substring(:numero from 1 for 4)
                  when 10 then 'OUT/' || substring(:numero from 1 for 4)
                  when 11 then 'NOV/' || substring(:numero from 1 for 4)
                  when 12 then 'DEZ/' || substring(:numero from 1 for 4)
                  else
                    :descricao
                end;
  end
   
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

SET TERM ; ^

COMMENT ON PROCEDURE SET_COMPETENCIA IS 'Store Procedure Registrar Competencia.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   --/--/2014

Procedure reponsavel por cadastrar o registro de competencia das movimentacoes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/04/2015 - IMR :
        * Documentacao da store procedure.';







/*------ SYSDBA 20/04/2015 11:31:58 --------*/

CREATE DOMAIN DMN_VCHAR_12 AS
VARCHAR(10);


/*------ SYSDBA 20/04/2015 11:32:32 --------*/

ALTER DOMAIN DMN_VCHAR_12
TYPE VARCHAR(12) CHARACTER SET ISO8859_2;




/*------ SYSDBA 20/04/2015 12:11:25 --------*/

ALTER TABLE TBVENDAS
    ADD DNFE_COMPRA_ANO DMN_SMALLINT_N,
    ADD DNFE_COMPRA_COD DMN_BIGINT_N,
    ADD DNFE_FORMA DMN_SMALLINT_N,
    ADD DNFE_UF DMN_UF,
    ADD DNFE_CNPJ_CPF DMN_CNPJ,
    ADD DNFE_IE DMN_VCHAR_20,
    ADD DNFE_COMPETENCIA DMN_VCHAR_04,
    ADD DNFE_SERIE DMN_VCHAR_04,
    ADD DNFE_NUMERO DMN_BIGINT_N,
    ADD DNFE_MODELO DMN_SMALLINT_N,
    ADD DNFE_CHAVE DMN_VCHAR_250,
    ADD DECF_MODELO DMN_SMALLINT_N,
    ADD DECF_NUMERO DMN_BIGINT_N,
    ADD DECF_COO DMN_BIGINT_N;

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_ANO IS
'Devolucao -> Ano Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_COD IS
'Devolucao -> Codigo Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_FORMA IS
'Devolucao -> Forma/modelo de devolucao:
0 - NFe Eletronica
1 - NFe Modelo 1/1A
2 - NF produtor Rural
3 - Cupom Fiscal';

COMMENT ON COLUMN TBVENDAS.DNFE_UF IS
'Devolucao -> UF da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CNPJ_CPF IS
'Devolucao -> CPF/CNPJ da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_IE IS
'Devolucao -> IE da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPETENCIA IS
'Devolucao -> Competencia de emissao da NF devolvida
Obs.: Formato AAMM.';

COMMENT ON COLUMN TBVENDAS.DNFE_SERIE IS
'Devolucao -> Serie da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_MODELO IS
'Devolucao -> Modelo da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CHAVE IS
'Devolucao -> Chave da NF-e devolvida';

COMMENT ON COLUMN TBVENDAS.DECF_MODELO IS
'Devolucao -> Modelo do cupom fiscal devolvido:
0 - (ECFModRefVazio)
1 - 2B = Cupom Fiscal emitido por maquina registradora (ECFModRef2B)
2 - 2C = Cupom Fiscal PDV (ECFModRef2C)
3 - 2D = Cupom Fiscal emitido por ECF (ECFModRef2D)';

COMMENT ON COLUMN TBVENDAS.DECF_NUMERO IS
'Devolucao -> Numero da ECF do cupom fiscal devolvido';

COMMENT ON COLUMN TBVENDAS.DECF_COO IS
'Devolucao -> Numero COO do cupom fiscal devolvido';




/*------ SYSDBA 20/04/2015 12:12:21 --------*/

ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_DEVOLVER_COMPRA
FOREIGN KEY (DNFE_COMPRA_ANO,DNFE_COMPRA_COD,CODEMP)
REFERENCES TBCOMPRAS(ANO,CODCONTROL,CODEMP);




/*------ SYSDBA 20/04/2015 12:13:51 --------*/

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero DF da NF devolvida:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';




/*------ SYSDBA 20/04/2015 12:15:36 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 12:17:08 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;



/*------ SYSDBA 20/04/2015 19:25:04 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 4, column 44.

*/


/*------ SYSDBA 20/04/2015 19:25:26 --------*/

CREATE OR ALTER VIEW vw_forma_devolucao ( Codigo, Descricao )
as
Select 0 as Codigo, 'NF Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'NF Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'NF Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_FORMA_DEVOLUCAO TO "PUBLIC";



/*------ SYSDBA 20/04/2015 19:32:17 --------*/

CREATE OR ALTER VIEW VW_FORMA_DEVOLUCAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo, 'Nota Fiscal Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'Nota Fiscal Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'Nota Fiscal Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 20:13:45 --------*/

create view vw_modelo_cupom_fiscal ( codigo, descricao )
as
Select 0 as Codigo, 'Vazio' as Descricao from RDB$DATABASE Union
Select 1 as Codigo, '2B - Cupom Fiscal emitido por Maquina Registradora' as Descricao from RDB$DATABASE Union
Select 2 as Codigo, '2C - Cupom Fiscal PDV'             as Descricao from RDB$DATABASE Union
Select 3 as Codigo, '2D - Cupom Fiscal emitido por ECF' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_MODELO_CUPOM_FISCAL TO "PUBLIC";



/*------ SYSDBA 23/04/2015 18:40:20 --------*/

ALTER TABLE TBPRODUTO
    ADD ESTOQUE_APROP_LOTE DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.ESTOQUE_APROP_LOTE IS
'Produto com Estoque Apropriado gerenciado por Lotes:
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
alter CADASTRO_ATIVO position 61;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 62;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 63;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 64;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 65;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 66;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 67;

alter table TBPRODUTO
alter CUST_DESP_ADM position 68;

alter table TBPRODUTO
alter CUST_COMISSAO position 69;

alter table TBPRODUTO
alter CUST_IMPOSTO position 70;

alter table TBPRODUTO
alter FI_RET_FINANC position 71;

alter table TBPRODUTO
alter FI_RET_PLANO position 72;




/*------ SYSDBA 23/04/2015 18:40:58 --------*/

COMMENT ON COLUMN TBPRODUTO.ESTOQUE_APROP_LOTE IS
'Produto com Estoque Apropriado gerenciado por Lotes (SGI):
0 - Nao
1 - Sim';




/*------ SYSDBA 06/05/2015 13:53:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ibpt_cod for sys_ibpt
active before insert position 0
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(GEN_IBPT_ID, 1);
end^

SET TERM ; ^




/*------ SYSDBA 06/05/2015 14:43:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_20'
where (RDB$FIELD_NAME = 'UNIDADE') and
(RDB$RELATION_NAME = 'TBPRODUTO');




/*------ SYSDBA 15/05/2015 17:04:38 --------*/

ALTER TABLE SYS_ESTACAO DROP CONSTRAINT PK_SYS_ESTACAO;




/*------ SYSDBA 15/05/2015 17:05:31 --------*/

CREATE DOMAIN DMN_VCHAR_60_NN AS
VARCHAR(60)
NOT NULL;


/*------ SYSDBA 15/05/2015 17:05:45 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_60_NN'
where (RDB$FIELD_NAME = 'EST_NOME') and
(RDB$RELATION_NAME = 'SYS_ESTACAO');




/*------ SYSDBA 15/05/2015 17:06:00 --------*/

ALTER TABLE SYS_ESTACAO
ADD CONSTRAINT PK_SYS_ESTACAO
PRIMARY KEY (EST_NOME);




/*------ SYSDBA 15/05/2015 17:06:18 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_250'
where (RDB$FIELD_NAME = 'EST_REGISTRO') and
(RDB$RELATION_NAME = 'SYS_ESTACAO');



/*------ 18/05/2015 11:07:15 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_PRODUTO (
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
returns (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY,
    LOTE_ID DMN_GUID_38)
as
declare variable ESTOQUE_UNICO DMN_SMALLINT_N;
begin
  Select
    coalesce(c.estoque_unico_empresas, 0)
  from TBCONFIGURACAO c
  where c.empresa = :in_empresa
  Into
    estoque_unico;

  estoque_unico = coalesce(:estoque_unico, 0);

  if ( coalesce(:in_centro_custo, 0) = 0 ) then
  begin

    /* Buscar no Estoque de Venda */
    Select first 1
        p.cod
      , p.qtde
      , 1.0
      , p.codunidade
      , p.customedio
      , null
    from TBPRODUTO p
    where (p.cod     = :in_produto)
      and ((p.codemp = :in_empresa) or (:estoque_unico = 1))
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio
      , lote_id;

  end
  else
  begin

    /* Buscar no Estoque Apropriado do Centro de Custo */
    Select first 1
        g.produto
      , g.estoque
      , g.fracionador
      , g.unidade
      , g.custo_total / (Case when g.estoque > 0.0 then g.estoque else 1.0 end)
      , g.lote_id
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio
      , lote_id;

    if (:unidade is null) then
    begin
      Select
        p.codunidade_fracionada
      from TBPRODUTO p
      where p.cod = :in_produto
      Into
        unidade;
    end

  end

  suspend;
end^

/*------ 18/05/2015 11:07:15 --------*/

SET TERM ; ^

/*------ 18/05/2015 11:18:27 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
AS
  declare variable empresa   varchar(18);
  declare variable cc_origem Integer;
  declare variable item      DMN_SMALLINT_NN;
  declare variable produto varchar(10);
  declare variable lote        DMN_INTEGER_N;
  declare variable lote_guid   DMN_GUID_38;
  declare variable data_fabricacao DMN_DATE;
  declare variable data_validade   DMN_DATE;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_medio     DMN_MONEY;
  declare variable tipo_requisicao DMN_SMALLINT_NN;
begin
  if ( (old.status <> new.status) and (new.status = 4) ) then /* Atendida */
  begin

    empresa    = new.empresa;
    cc_origem  = new.ccusto_origem;  /* Requisitante */
    tipo_requisicao = new.tipo;

    -- Listar Produtos requisitados ao almoxarifado
    for
      Select
          i.item
        , i.produto
        , i.qtde_atendida
        , e.lote
        , e.id
        , e.data_fabricacao
        , e.data_validade
        , coalesce(e.qtde, 0)
        , coalesce(e.custo_medio, 0)
        , coalesce(nullif(e.fracionador, 0), 1)
      from TBREQUISICAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.cod = i.produto)
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento) -- Lote identificado pela aplicacao
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 2 /* Atendido */
      into
          item
        , produto
        , quantidade
        , lote
        , lote_guid
        , data_fabricacao
        , data_validade
        , estoque
        , custo_medio
        , fracionador
    do
    begin

      estoque     = (:estoque - :quantidade);
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque do centro de custo atendente
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo requisitante
        Select
            ea.id
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :cc_origem
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            lote_guid;

        if ( :lote_guid is null ) then
        begin

          Select
            g.hex_uuid_format
          from GET_GUID_UUID_HEX g
          Into
            lote_guid;

          Insert Into TBESTOQUE_ALMOX (
              empresa
            , centro_custo
            , produto
            , lote
            , data_fabricacao
            , data_validade
            , qtde
            , fracionador
            , custo_medio
            , id
          ) values (
              :empresa
            , :cc_origem
            , :produto
            , :lote
            , :data_fabricacao
            , :data_validade
            , :quantidade
            , :fracionador
            , :custo_medio
            , :lote_guid
          );
            
        end
        else
        begin

          Update TBESTOQUE_ALMOX ea Set
              ea.qtde = coalesce(ea.qtde, 0.0) + :quantidade
          where ea.id = :lote_guid;

        end 

      end 

      -- Marcar item/produto como atendido
      Update TBREQUISICAO_ALMOX_ITEM i Set
          i.status            = 2 /* Atendido */
        , i.lote_requisitante = :lote_guid
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.item     = :item
        and i.status   = 1; /* Aguardando */

    end

  end
end^

/*------ 18/05/2015 11:18:27 --------*/

SET TERM ; ^

/*------ 18/05/2015 13:38:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_REQUISICAO_ALMOX_CUSTO (
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
declare variable ITEM DMN_SMALLINT_NN;
declare variable CUSTO_MEDIO DMN_MONEY_4;
declare variable SITUACAO DMN_STATUS;
declare variable QTDE DMN_QUANTIDADE_D3;
declare variable QTDE_ATEND DMN_QUANTIDADE_D3;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  -- 1. Buscar valores atualizados de custo para os produtos e atualiza-los na requisicao
  for
    Select
        ri.item
      , ri.qtde
      , ri.qtde_atendida
      , Cast(
          Case when ep.custo_medio > 0.0
            then ep.custo_medio
            else (p.customedio / (Case when coalesce(p.fracionador, 1.0) < 1 then 1.0 else coalesce(p.fracionador, 1.0) end))
          end
        as DMN_MONEY_4)
      , ri.status
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
      inner join TBESTOQUE_ALMOX ep on (ep.id = ri.lote_atendimento)
      inner join TBPRODUTO p on (p.cod = ri.produto)
    where r.ano      = :ano
      and r.controle = :controle
      and r.empresa  = :empresa
    Into
        item
      , qtde
      , qtde_atend
      , custo_medio
      , situacao
  do
  begin

    Update TBREQUISICAO_ALMOX_ITEM ri Set
        ri.custo = :custo_medio
      , ri.total =
            Case :situacao
              when 0 then :qtde * :custo_medio       -- Pendente
              when 1 then :qtde * :custo_medio       -- Aguardando
              when 2 then :qtde_atend * :custo_medio -- Atendido
              when 3 then :qtde_atend * :custo_medio -- Entregue
              when 4 then 0.0                        -- Cancelado
              else 0.0
            end
    where ri.ano      = :ano
      and ri.controle = :controle
      and ri.item     = :item;

  end

  -- 2. Atualizar o custo total da requisicao
  Select
    sum(ri.total)
  from TBREQUISICAO_ALMOX_ITEM ri
  where ri.ano      = :ano
    and ri.controle = :controle
  Into
    valor_total;

  Update TBREQUISICAO_ALMOX r Set
    r.valor_total = :valor_total
  where r.ano      = :ano
    and r.controle = :controle
    and r.empresa  = :empresa;

end^

/*------ 18/05/2015 13:38:06 --------*/

SET TERM ; ^

/*------ 18/05/2015 14:29:27 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38,
    PRODUTO DMN_VCHAR_10,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio / coalesce(p.fracionador, 1.0) end)
    from TBESTOQUE_ALMOX ea
      inner join TBPRODUTO p on (p.cod = ea.produto)
    where (ea.id = :out_lote_guid)
      or (( ea.empresa        = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (:out_produto is null))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
    Into
        lote_id
      , produto
      , fracionador
      , unidade
      , estoque
      , custo_total
  do
  begin

    Select
      coalesce(sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
        end
      ), 0.0)
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status < 2)
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

/*------ 18/05/2015 14:29:27 --------*/

SET TERM ; ^


/*------ SYSDBA 19/05/2015 18:42:29 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_NOME'
where (RDB$FIELD_NAME = 'NOMEEMP') and
(RDB$RELATION_NAME = 'TBCONTPAG')
;




/*------ SYSDBA 19/05/2015 19:01:29 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
  login = replace(:login, ' ',     '');
  login = trim(substring(trim(:login) from 1 for 12));

  if (not exists(
    Select
      u.nomecompleto
    from TBUSERS u
    where u.nome = :login
  )) then
  begin
    -- Padronizador perfil de usuario comum
    if (exists(
      Select
        f.cod
      from TBFUNCAO f
      where f.cod = :common_user
    )) then
      Update TBFUNCAO f Set
        f.funcao = 'USUARIO COMUM'
      where f.cod = :common_user;
    else
      Insert Into TBFUNCAO (
          cod
        , funcao
      ) values (
          :common_user
        , 'USUARIO COMUM'
      );

    Insert Into TBUSERS (
        nome
      , senha
      , nomecompleto
      , codfuncao
      , ativo
    ) values (
        :login
      , 'x|xxx'
      , :nome_completo
      , :common_user
      , :ativo
    );
  end
  else
  begin
    Update TBUSERS u Set
        u.ativo        = :ativo
      , u.nomecompleto = :nome_completo
    where u.nome = :login;
  end 

  usuario_login = :login;
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:05:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
  login = replace(:login, ' ',     '');
  login = trim(substring(trim(:login) from 1 for 12));

  if (not exists(
    Select
      u.nomecompleto
    from TBUSERS u
    where u.nome = :login
  )) then
  begin
    -- Padronizador perfil de usuario comum
    if (exists(
      Select
        f.cod
      from TBFUNCAO f
      where f.cod = :common_user
    )) then
      Update TBFUNCAO f Set
        f.funcao = 'USUARIO COMUM'
      where f.cod = :common_user;
    else
      Insert Into TBFUNCAO (
          cod
        , funcao
      ) values (
          :common_user
        , 'USUARIO COMUM'
      );

    Insert Into TBUSERS (
        nome
      , senha
      , nomecompleto
      , codfuncao
      , ativo
    ) values (
        :login
      , 'x|QUJDMTIz'
      , :nome_completo
      , :common_user
      , :ativo
    );
  end
  else
  begin
    Update TBUSERS u Set
        u.ativo        = :ativo
      , u.nomecompleto = :nome_completo
    where u.nome = :login;
  end 

  usuario_login = :login;
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:06:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
  login = replace(:login, ' ',     '');
  login = trim(substring(trim(:login) from 1 for 12));

  if (not exists(
    Select
      u.nomecompleto
    from TBUSERS u
    where u.nome = :login
  )) then
  begin
    -- Padronizador perfil de usuario comum
    if (exists(
      Select
        f.cod
      from TBFUNCAO f
      where f.cod = :common_user
    )) then
      Update TBFUNCAO f Set
        f.funcao = 'USUARIO COMUM'
      where f.cod = :common_user;
    else
      Insert Into TBFUNCAO (
          cod
        , funcao
      ) values (
          :common_user
        , 'USUARIO COMUM'
      );

    Insert Into TBUSERS (
        nome
      , senha
      , nomecompleto
      , codfuncao
      , ativo
    ) values (
        :login
      , 'x|QUJDMTIz...'
      , :nome_completo
      , :common_user
      , :ativo
    );
  end
  else
  begin
    Update TBUSERS u Set
        u.ativo        = :ativo
      , u.nomecompleto = :nome_completo
    where u.nome = :login;
  end 

  usuario_login = :login;
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:06:30 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
  login = replace(:login, ' ',     '');
  login = trim(substring(trim(:login) from 1 for 12));

  if (not exists(
    Select
      u.nomecompleto
    from TBUSERS u
    where u.nome = :login
  )) then
  begin
    -- Padronizador perfil de usuario comum
    if (exists(
      Select
        f.cod
      from TBFUNCAO f
      where f.cod = :common_user
    )) then
      Update TBFUNCAO f Set
        f.funcao = 'USUARIO COMUM'
      where f.cod = :common_user;
    else
      Insert Into TBFUNCAO (
          cod
        , funcao
      ) values (
          :common_user
        , 'USUARIO COMUM'
      );

    Insert Into TBUSERS (
        nome
      , senha
      , nomecompleto
      , codfuncao
      , ativo
    ) values (
        :login
      , 'x|QUJDMTIz'
      , :nome_completo
      , :common_user
      , :ativo
    );
  end
  else
  begin
    Update TBUSERS u Set
        u.ativo        = :ativo
      , u.nomecompleto = :nome_completo
    where u.nome = :login;
  end 

  usuario_login = :login;
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:10:54 --------*/

ALTER TABLE TBFORNECEDOR
    ADD FORNECEDOR_FUNCIONARIO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBFORNECEDOR.FORNECEDOR_FUNCIONARIO IS
'Fornecedor/Colaborador (Funcionario):
0 - Nao
1 - Sim

(Os registros de flag 1 serao mantidos pelo Cadastro de Funcionarios)';




/*------ SYSDBA 19/05/2015 19:11:39 --------*/

COMMENT ON COLUMN TBFORNECEDOR.PESSOA_FISICA IS
'Pessoa Fisica:
0 - Nao
1 - Sim';




/*------ SYSDBA 19/05/2015 19:11:47 --------*/

COMMENT ON COLUMN TBFORNECEDOR.TIPO IS
'Tipo:
0 - Nao se aplica
1 - Matriz
2 - Filial';




/*------ SYSDBA 19/05/2015 19:11:58 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CODFORN IS
'Codigo';




/*------ SYSDBA 19/05/2015 19:12:11 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CNPJ IS
'CPF/CNPJ.';




/*------ SYSDBA 19/05/2015 19:12:23 --------*/

COMMENT ON COLUMN TBFORNECEDOR.INSCEST IS
'RG/Insc. Estadual';




/*------ SYSDBA 19/05/2015 19:12:32 --------*/

COMMENT ON COLUMN TBFORNECEDOR.INSCMUN IS
'Insc. Municipal.';




/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 6;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 7;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 8;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 9;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 10;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 11;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 12;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 13;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 14;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 15;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CEP position 16;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 17;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column UF position 18;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 19;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 20;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 21;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 22;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 23;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 24;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 25;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 26;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 27;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 28;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 6;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 7;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 8;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 9;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 10;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 11;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 12;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 13;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 14;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 15;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CEP position 16;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 17;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column UF position 18;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 19;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 20;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 21;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 22;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 23;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 24;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 25;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 26;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 27;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 28;


/*------ SYSDBA 19/05/2015 19:13:58 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'COMPLEMENTO') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:14:11 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'NUMERO_END') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:15:02 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CEP'
where (RDB$FIELD_NAME = 'CEP') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:19:47 --------*/

CREATE DOMAIN DMN_RG_GERAL AS
VARCHAR(20);COMMENT ON DOMAIN DMN_RG_GERAL IS 'Registro Geral:
Numero e/ou Orgao emissor';




/*------ SYSDBA 19/05/2015 19:20:13 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD CPF DMN_CPF,
    ADD RG_NUMERO DMN_RG_GERAL,
    ADD RG_ORGAO_EMISSOR DMN_RG_GERAL;

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Registro Geral:
Numero e/ou Orgao emissor';

COMMENT ON COLUMN TBFUNCIONARIO.RG_ORGAO_EMISSOR IS
'Registro Geral:
Numero e/ou Orgao emissor';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter METAFONEMA position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter CPF position 6;

alter table TBFUNCIONARIO
alter RG_NUMERO position 7;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 8;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 9;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 10;

alter table TBFUNCIONARIO
alter ATIVO position 11;

alter table TBFUNCIONARIO
alter USUARIO position 12;

alter table TBFUNCIONARIO
alter VENDEDOR position 13;

alter table TBFUNCIONARIO
alter FORNECEDOR position 14;

alter table TBFUNCIONARIO
alter ENDER position 15;

alter table TBFUNCIONARIO
alter NUMERO_END position 16;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 17;

alter table TBFUNCIONARIO
alter BAIRRO position 18;

alter table TBFUNCIONARIO
alter CEP position 19;

alter table TBFUNCIONARIO
alter CIDADE position 20;

alter table TBFUNCIONARIO
alter UF position 21;

alter table TBFUNCIONARIO
alter TLG_TIPO position 22;

alter table TBFUNCIONARIO
alter LOG_COD position 23;

alter table TBFUNCIONARIO
alter BAI_COD position 24;

alter table TBFUNCIONARIO
alter CID_COD position 25;

alter table TBFUNCIONARIO
alter EST_COD position 26;

alter table TBFUNCIONARIO
alter PAIS_ID position 27;

alter table TBFUNCIONARIO
alter FONE_FIXO position 28;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 29;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 30;

alter table TBFUNCIONARIO
alter EMAIL position 31;




/*------ SYSDBA 19/05/2015 19:21:04 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_RG
ON TBFUNCIONARIO (RG_NUMERO,RG_ORGAO_EMISSOR);

CREATE INDEX IDX_TBFUNCIONARIO_CPF
ON TBFUNCIONARIO (CPF);




/*------ SYSDBA 19/05/2015 19:21:57 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_fornecedor_cod for tbfornecedor
active before insert position 0
As
Begin
  new.fornecedor_funcionario = coalesce(new.fornecedor_funcionario, 0);
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CPF position 6;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 7;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 8;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 9;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 10;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 11;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 12;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 13;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 14;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 15;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 16;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CEP position 17;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 18;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column UF position 19;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 20;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 21;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 22;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 23;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 24;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 25;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 26;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 27;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 28;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 29;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column RG_NUMERO position 30;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column RG_ORGAO_EMISSOR position 31;


/*------ SYSDBA 19/05/2015 19:25:21 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Documentacao -> Registro Geral:
Numero e/ou Orgao emissor';




/*------ SYSDBA 19/05/2015 19:25:28 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_ORGAO_EMISSOR IS
'Documentacao -> Registro Geral: Orgao emissor';




/*------ SYSDBA 19/05/2015 19:25:36 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Documentacao -> Registro Geral: Numero';




/*------ SYSDBA 19/05/2015 19:54:14 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'GRF_DESCRICAO') and
(RDB$RELATION_NAME = 'TBFORNECEDOR_GRUPO')
;




/*------ SYSDBA 19/05/2015 20:13:15 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.SEXO IS
'Sexo:
M - Masculino
F - Feminino';




/*------ SYSDBA 19/05/2015 21:04:46 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD OBSERVACAO DMN_TEXTO;

COMMENT ON COLUMN TBFUNCIONARIO.OBSERVACAO IS
'Observacoes gerais';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter METAFONEMA position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter CPF position 6;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 7;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 8;

alter table TBFUNCIONARIO
alter ATIVO position 9;

alter table TBFUNCIONARIO
alter USUARIO position 10;

alter table TBFUNCIONARIO
alter VENDEDOR position 11;

alter table TBFUNCIONARIO
alter FORNECEDOR position 12;

alter table TBFUNCIONARIO
alter ENDER position 13;

alter table TBFUNCIONARIO
alter NUMERO_END position 14;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 15;

alter table TBFUNCIONARIO
alter BAIRRO position 16;

alter table TBFUNCIONARIO
alter CEP position 17;

alter table TBFUNCIONARIO
alter CIDADE position 18;

alter table TBFUNCIONARIO
alter UF position 19;

alter table TBFUNCIONARIO
alter TLG_TIPO position 20;

alter table TBFUNCIONARIO
alter LOG_COD position 21;

alter table TBFUNCIONARIO
alter BAI_COD position 22;

alter table TBFUNCIONARIO
alter CID_COD position 23;

alter table TBFUNCIONARIO
alter EST_COD position 24;

alter table TBFUNCIONARIO
alter PAIS_ID position 25;

alter table TBFUNCIONARIO
alter FONE_FIXO position 26;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 27;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 28;

alter table TBFUNCIONARIO
alter EMAIL position 29;

alter table TBFUNCIONARIO
alter OBSERVACAO position 30;

alter table TBFUNCIONARIO
alter RG_NUMERO position 31;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 32;




/*------ SYSDBA 19/05/2015 21:05:38 --------*/

CREATE INDEX IDX_TBFORNECEDOR_FUNC
ON TBFORNECEDOR (PESSOA_FISICA,CNPJ,GRF_COD);




/*------ SYSDBA 19/05/2015 21:12:25 --------*/

SET TERM ^ ;

CREATE trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
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
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 21:13:52 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
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
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".';




/*------ SYSDBA 19/05/2015 21:15:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
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
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/05/2015 - IMR :
        * Documentacao da trigger.';




/*------ SYSDBA 19/05/2015 21:18:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
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
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , 0.0
        , 1
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.fornecedor_funcionario = 1
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 20/05/2015 19:28:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
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
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , 0.0
        , 1
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest  = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.ender    = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.fornecedor_funcionario = 1
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 20/05/2015 19:29:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
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
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , 0.0
        , 1
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest  = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.ender    = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.fornecedor_funcionario = 1
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/05/2015 - IMR :
        * Documentacao da trigger.

    20/05/2015 - IMR :
        * Ajustes pontuais para otimizacao do codigo.';




/*------ SYSDBA 20/05/2015 19:31:08 --------*/

COMMENT ON TABLE TBFUNCIONARIO IS 'Tabela de FUncionarios (SGI).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Tabela responsavel por armazenar o cadastro simplificado dos funcionarios da(s) empresa(s) registros pelo SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/03/2015 - IMR :
        * Documentacao da procedure.

    19/05/2015 - IMR:
        + Cricao da trigger TG_FUNCIONARIO_GERAR_FORNECEDOR para gerar o registro
          de fornecedor correspondente ao funcionario quando este for marcado
          como tal.';




/*------ SYSDBA 20/05/2015 19:32:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( (new.flag_fornecedor = 1) and (trim(coalesce(new.cpf, '')) <> '') ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf) -- Cpf informado
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
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
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , 0.0
        , 1
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest  = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.ender    = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.fornecedor_funcionario = 1
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

