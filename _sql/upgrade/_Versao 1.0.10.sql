


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
