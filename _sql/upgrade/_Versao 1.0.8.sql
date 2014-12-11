


/*------ SYSDBA 11/12/2014 19:28:28 --------*/

ALTER TABLE TBEMPRESA
    ADD SERIE_NFCE DMN_SMALLINT_N,
    ADD NUMERO_NFCE DMN_INTEGER_N;

COMMENT ON COLUMN TBEMPRESA.SERIE_NFCE IS
'NFC-e : Serie da nota fiscal do Consumidor.';

COMMENT ON COLUMN TBEMPRESA.NUMERO_NFCE IS
'NFC-e : Numero da ultima nota fiscal do consumidor emitida.';

alter table TBEMPRESA
alter CODIGO position 1;

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

alter table TBEMPRESA
alter CNPJ position 3;

alter table TBEMPRESA
alter RZSOC position 4;

alter table TBEMPRESA
alter NMFANT position 5;

alter table TBEMPRESA
alter IE position 6;

alter table TBEMPRESA
alter IM position 7;

alter table TBEMPRESA
alter SEGMENTO position 8;

alter table TBEMPRESA
alter CNAE position 9;

alter table TBEMPRESA
alter ENDER position 10;

alter table TBEMPRESA
alter COMPLEMENTO position 11;

alter table TBEMPRESA
alter BAIRRO position 12;

alter table TBEMPRESA
alter CEP position 13;

alter table TBEMPRESA
alter CIDADE position 14;

alter table TBEMPRESA
alter UF position 15;

alter table TBEMPRESA
alter FONE position 16;

alter table TBEMPRESA
alter FONE2 position 17;

alter table TBEMPRESA
alter LOGO position 18;

alter table TBEMPRESA
alter TLG_TIPO position 19;

alter table TBEMPRESA
alter LOG_COD position 20;

alter table TBEMPRESA
alter BAI_COD position 21;

alter table TBEMPRESA
alter CID_COD position 22;

alter table TBEMPRESA
alter EST_COD position 23;

alter table TBEMPRESA
alter NUMERO_END position 24;

alter table TBEMPRESA
alter EMAIL position 25;

alter table TBEMPRESA
alter HOME_PAGE position 26;

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

alter table TBEMPRESA
alter PAIS_ID position 28;

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

alter table TBEMPRESA
alter SERIE_NFE position 30;

alter table TBEMPRESA
alter NUMERO_NFE position 31;

alter table TBEMPRESA
alter SERIE_NFCE position 32;

alter table TBEMPRESA
alter NUMERO_NFCE position 33;

alter table TBEMPRESA
alter LOTE_ANO_NFE position 34;

alter table TBEMPRESA
alter LOTE_NUM_NFE position 35;

alter table TBEMPRESA
alter CARTA_CORRECAO_NFE position 36;

alter table TBEMPRESA
alter USUARIO position 37;




/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CODIGO position 1;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column PESSOA_FISICA position 2;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CNPJ position 3;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column RZSOC position 4;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NMFANT position 5;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column IE position 6;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column IM position 7;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SEGMENTO position 8;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CNAE position 9;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column ENDER position 10;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column COMPLEMENTO position 11;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column BAIRRO position 12;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CEP position 13;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CIDADE position 14;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column UF position 15;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column FONE position 16;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column FONE2 position 17;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOGO position 18;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column TLG_TIPO position 19;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOG_COD position 20;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column BAI_COD position 21;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CID_COD position 22;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column EST_COD position 23;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_END position 24;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column EMAIL position 25;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column HOME_PAGE position 26;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CHAVE_ACESSO_NFE position 27;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column PAIS_ID position 28;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column TIPO_REGIME_NFE position 29;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SERIE_NFE position 30;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_NFE position 31;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOTE_ANO_NFE position 32;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOTE_NUM_NFE position 33;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CARTA_CORRECAO_NFE position 34;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SERIE_NFCE position 35;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_NFCE position 36;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column USUARIO position 37;


/*------ SYSDBA 11/12/2014 20:16:32 --------*/

COMMENT ON TABLE TBEMPRESA IS 'Tabela Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar o registro da empresa e demais dados necessarios e emissao de documentos fiscais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/12/2014 - IMR :
        + Criação dos campos .';




/*------ SYSDBA 11/12/2014 20:17:28 --------*/

COMMENT ON TABLE TBEMPRESA IS 'Tabela Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar o registro da empresa e demais dados necessarios e emissao de documentos fiscais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/12/2014 - IMR :
        + Criação dos campos SERIE_NFCE e NUMERO_NFCE para controle dos numeros sequenciais de emissao de NFC-e (Nota
          Fiscal do Consumidor eletronica).';

