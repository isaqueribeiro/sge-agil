


/*------ SYSDBA 22/07/2014 20:26:46 --------*/

DROP VIEW VW_TIPO_DOCUMENTO_ENTRADA;

CREATE VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'       as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal' as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D' as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'     as TPD_DESCRICAO from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_DOCUMENTO_ENTRADA TO "PUBLIC";




/*------ SYSDBA 22/07/2014 23:32:44 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_EMITIR_NFE DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_EMITIR_NFE IS
'NF-e: Emitir Nota Fiscal Eletronica:
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
alter NFE_EMITIR_NFE position 11;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 12;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 13;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 14;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 15;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 16;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 18;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 19;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 20;

alter table TBCONFIGURACAO
alter USUARIO position 21;




/*------ SYSDBA 22/07/2014 23:34:13 --------*/

ALTER TABLE TBCONFIGURACAO ALTER NFE_EMITIR_NFE TO NFE_EMITIR;




/*------ SYSDBA 08/08/2014 13:27:13 --------*/

ALTER TABLE TBVENDAS
    ADD DESCONTO_CUPOM DMN_MONEY DEFAULT 0;

COMMENT ON COLUMN TBVENDAS.DESCONTO_CUPOM IS
'Valor Total Desconto no Cupom (Livre).';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLIENTE position 4;

alter table TBVENDAS
alter CODCLI position 5;

alter table TBVENDAS
alter DTVENDA position 6;

alter table TBVENDAS
alter COMPETENCIA position 7;

alter table TBVENDAS
alter STATUS position 8;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

alter table TBVENDAS
alter DESCONTO position 10;

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

alter table TBVENDAS
alter OBS position 15;

alter table TBVENDAS
alter FORMAPAG position 16;

alter table TBVENDAS
alter FATDIAS position 17;

alter table TBVENDAS
alter SERIE position 18;

alter table TBVENDAS
alter NFE position 19;

alter table TBVENDAS
alter DATAEMISSAO position 20;

alter table TBVENDAS
alter HORAEMISSAO position 21;

alter table TBVENDAS
alter CFOP position 22;

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

alter table TBVENDAS
alter XML_NFE position 24;

alter table TBVENDAS
alter VENDEDOR_COD position 25;

alter table TBVENDAS
alter USUARIO position 26;

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

alter table TBVENDAS
alter VENDA_PRAZO position 29;

alter table TBVENDAS
alter PRAZO_01 position 30;

alter table TBVENDAS
alter PRAZO_02 position 31;

alter table TBVENDAS
alter PRAZO_03 position 32;

alter table TBVENDAS
alter PRAZO_04 position 33;

alter table TBVENDAS
alter PRAZO_05 position 34;

alter table TBVENDAS
alter PRAZO_06 position 35;

alter table TBVENDAS
alter PRAZO_07 position 36;

alter table TBVENDAS
alter PRAZO_08 position 37;

alter table TBVENDAS
alter PRAZO_09 position 38;

alter table TBVENDAS
alter PRAZO_10 position 39;

alter table TBVENDAS
alter PRAZO_11 position 40;

alter table TBVENDAS
alter PRAZO_12 position 41;

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

alter table TBVENDAS
alter NFE_ENVIADA position 45;

alter table TBVENDAS
alter CANCEL_USUARIO position 46;

alter table TBVENDAS
alter CANCEL_DATAHORA position 47;

alter table TBVENDAS
alter CANCEL_MOTIVO position 48;

alter table TBVENDAS
alter XML_NFE_FILENAME position 49;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 50;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 51;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 52;

alter table TBVENDAS
alter NFE_PLACA_UF position 53;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 54;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 55;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 56;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 57;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 58;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 59;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 60;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 61;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 62;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 63;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 64;

alter table TBVENDAS
alter NFE_VALOR_PIS position 65;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 66;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 67;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 68;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 69;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 70;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 71;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 72;

