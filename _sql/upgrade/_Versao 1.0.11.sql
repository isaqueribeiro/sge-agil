


/*------ SYSDBA 28/07/2015 17:24:32 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_EMITIR_ENTRADA DMN_LOGICO;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_EMITIR_ENTRADA IS
'NF-e: Emitir Nota Fiscal Eletronica para Entrada:
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
alter NFE_EMITIR position 11;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 12;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 13;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 14;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 15;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 16;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 17;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 18;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 19;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 20;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 21;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 22;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 23;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 24;

alter table TBCONFIGURACAO
alter USUARIO position 25;

alter table TBCONFIGURACAO
alter NFE_EMITIR_NFE position 26;

