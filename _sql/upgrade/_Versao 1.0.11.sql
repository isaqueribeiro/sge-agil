


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




/*------ SYSDBA 30/07/2015 19:34:26 --------*/

ALTER TABLE TBCONFIGURACAO DROP NFE_EMITIR_NFE;




/*------ SYSDBA 30/07/2015 19:43:17 --------*/

ALTER TABLE TBCOMPRAS
    ADD CALCULAR_TOTAIS DMN_LOGICO;

COMMENT ON COLUMN TBCOMPRAS.CALCULAR_TOTAIS IS
'Permitir que o sistema calcule automaticamente os valores totais da Entrada:
0 - Nao
1 - Sim';

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
alter NFE_DENEGADA position 14;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 15;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 16;

alter table TBCOMPRAS
alter XML_NFE position 17;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 18;

alter table TBCOMPRAS
alter DTLANCAMENTO position 19;

alter table TBCOMPRAS
alter DTEMISS position 20;

alter table TBCOMPRAS
alter HREMISS position 21;

alter table TBCOMPRAS
alter DTENT position 22;

alter table TBCOMPRAS
alter NFCFOP position 23;

alter table TBCOMPRAS
alter NATUREZA position 24;

alter table TBCOMPRAS
alter STATUS position 25;

alter table TBCOMPRAS
alter CALCULAR_TOTAIS position 26;

alter table TBCOMPRAS
alter IPI position 27;

alter table TBCOMPRAS
alter ICMSBASE position 28;

alter table TBCOMPRAS
alter ICMSVALOR position 29;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 30;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 31;

alter table TBCOMPRAS
alter FRETE position 32;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 33;

alter table TBCOMPRAS
alter DESCONTO position 34;

alter table TBCOMPRAS
alter VALORSEGURO position 35;

alter table TBCOMPRAS
alter VALORTOTAL_II position 36;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 37;

alter table TBCOMPRAS
alter VALORPIS position 38;

alter table TBCOMPRAS
alter VALORCOFINS position 39;

alter table TBCOMPRAS
alter TOTALPROD position 40;

alter table TBCOMPRAS
alter TOTALNF position 41;

alter table TBCOMPRAS
alter OBS position 42;

alter table TBCOMPRAS
alter USUARIO position 43;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 44;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 45;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 46;

alter table TBCOMPRAS
alter PRAZO_01 position 47;

alter table TBCOMPRAS
alter PRAZO_02 position 48;

alter table TBCOMPRAS
alter PRAZO_03 position 49;

alter table TBCOMPRAS
alter PRAZO_04 position 50;

alter table TBCOMPRAS
alter PRAZO_05 position 51;

alter table TBCOMPRAS
alter PRAZO_06 position 52;

alter table TBCOMPRAS
alter PRAZO_07 position 53;

alter table TBCOMPRAS
alter PRAZO_08 position 54;

alter table TBCOMPRAS
alter PRAZO_09 position 55;

alter table TBCOMPRAS
alter PRAZO_10 position 56;

alter table TBCOMPRAS
alter PRAZO_11 position 57;

alter table TBCOMPRAS
alter PRAZO_12 position 58;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 59;

alter table TBCOMPRAS
alter TIPO_DESPESA position 60;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 61;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 62;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 63;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 64;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 65;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 66;

alter table TBCOMPRAS
alter DNFE_ENTRADA_ANO position 67;

alter table TBCOMPRAS
alter DNFE_ENTRADA_COD position 68;

alter table TBCOMPRAS
alter DNFE_FORMA position 69;

alter table TBCOMPRAS
alter DNFE_UF position 70;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 71;

alter table TBCOMPRAS
alter DNFE_IE position 72;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 73;

alter table TBCOMPRAS
alter DNFE_SERIE position 74;

alter table TBCOMPRAS
alter DNFE_NUMERO position 75;

alter table TBCOMPRAS
alter DNFE_MODELO position 76;

alter table TBCOMPRAS
alter DNFE_CHAVE position 77;

alter table TBCOMPRAS
alter DECF_MODELO position 78;

alter table TBCOMPRAS
alter DECF_NUMERO position 79;

alter table TBCOMPRAS
alter DECF_COO position 80;




/*------ SYSDBA 30/07/2015 19:44:49 --------*/

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
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    30/07/2015 - IMR:
        + Criacao do campo CALCULAR_TOTAIS para que o sistema possa, atraves dele, calcular de forma automatica os valores
          totais que compoem o registro de entrada de Produtos e/ou Servicos.';




/*------ SYSDBA 30/07/2015 19:46:45 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2014

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.

    12/12/2014 - IMR:
        + Criacao dos campos NFCE_TOKEN_ID e NFCE_TOKEN parameter validar a geracao do QRCODE na emissao das NFC-e.

    30/07/2015 - IMR:
        + Criacao do campo NFE_EMITIR_ENTRADA que funcionara como controle para que a aplicacao permita ou nao a
          emissao de NF-e de entrada de produtos para terceiros.';




/*------ SYSDBA 30/07/2015 23:24:40 --------*/

ALTER TABLE TBPRODUTO
    ADD NOME_AMIGO DMN_VCHAR_100;

COMMENT ON COLUMN TBPRODUTO.NOME_AMIGO IS
'Nome amigo do servico/produto.

Descricao de como o produto/servico sera usualmente reconhecido internamento
na empresa pelos usuarios do sistema.';

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
alter NOME_AMIGO position 8;

alter table TBPRODUTO
alter PRECO position 9;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 10;

alter table TBPRODUTO
alter REFERENCIA position 11;

alter table TBPRODUTO
alter ESPECIFICACAO position 12;

alter table TBPRODUTO
alter SECAO position 13;

alter table TBPRODUTO
alter QTDE position 14;

alter table TBPRODUTO
alter FRACIONADOR position 15;

alter table TBPRODUTO
alter PESO_BRUTO position 16;

alter table TBPRODUTO
alter PESO_LIQUIDO position 17;

alter table TBPRODUTO
alter CUBAGEM position 18;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 19;

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
alter TABELA_IBPT position 36;

alter table TBPRODUTO
alter NCM_SH position 37;

alter table TBPRODUTO
alter CODIGO_NVE position 38;

alter table TBPRODUTO
alter CODCFOP position 39;

alter table TBPRODUTO
alter CODBARRA_EAN position 40;

alter table TBPRODUTO
alter CODUNIDADE position 41;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 42;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 43;

alter table TBPRODUTO
alter ALIQUOTA position 44;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 45;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 46;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 47;

alter table TBPRODUTO
alter VALOR_IPI position 48;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 49;

alter table TBPRODUTO
alter RESERVA position 50;

alter table TBPRODUTO
alter PRODUTO_NOVO position 51;

alter table TBPRODUTO
alter COR_VEICULO position 52;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 53;

alter table TBPRODUTO
alter TIPO_VEICULO position 54;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 55;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 56;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 57;

alter table TBPRODUTO
alter CHASSI_VEICULO position 58;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 59;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 60;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 61;

alter table TBPRODUTO
alter USUARIO position 62;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 63;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 64;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 65;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 66;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 67;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 68;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 69;

alter table TBPRODUTO
alter CUST_DESP_ADM position 70;

alter table TBPRODUTO
alter CUST_COMISSAO position 71;

alter table TBPRODUTO
alter CUST_IMPOSTO position 72;

alter table TBPRODUTO
alter FI_RET_FINANC position 73;

alter table TBPRODUTO
alter FI_RET_PLANO position 74;




/*------ SYSDBA 30/07/2015 23:25:02 --------*/

DROP INDEX IDX_TBPRODUTO_DESCRICAO;

CREATE INDEX IDX_TBPRODUTO_DESCRICAO
ON TBPRODUTO (DESCRI,APRESENTACAO,DESCRI_APRESENTACAO,METAFONEMA,NOME_AMIGO);




/*------ SYSDBA 30/07/2015 23:27:35 --------*/

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
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico, muito utilizado em processos de cotacao.

    10/02/2014 - IMR :
        + Criacao dos campos CADASTRO_ATIVO e PRODUTO_IMOBILIZADO para permitir que apenas os cadastro ativos sejam
          utilizados nos processos e para designar os produtos que sao imobilizados para futuras implementacoes de
          controles patrimoniais.

    30/07/2015 - IMR :
        + Criacao do campo NOME_AMIGO para facilitar a identificacao interna do produto/servico dentro da empresa
          pelos usuarios do sistema. Esse dados e necessario por existir muitas situacoes onde o nome comercial do
          servico/produto e muito diferente do nome usualmente conhecimento pelos usuarios.';




/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COD position 2;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column METAFONEMA position 6;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column MODELO position 7;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 8;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column NOME_AMIGO position 9;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESPECIFICACAO position 10;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO position 11;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 12;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SECAO position 13;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column QTDE position 14;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FRACIONADOR position 15;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PESO_BRUTO position 16;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PESO_LIQUIDO position 17;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUBAGEM position 18;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 19;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column UNIDADE position 20;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 21;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 22;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 23;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 24;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 25;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 26;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 27;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODEMP position 28;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODSECAO position 29;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 30;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 31;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST position 32;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CSOSN position 33;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST_PIS position 34;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST_COFINS position 35;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column TABELA_IBPT position 36;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column NCM_SH position 37;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODIGO_NVE position 38;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODCFOP position 39;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 40;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 41;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 42;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 43;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 44;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 45;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 46;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 47;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 48;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 49;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column RESERVA position 50;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRODUTO_NOVO position 51;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COR_VEICULO position 52;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 53;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column TIPO_VEICULO position 54;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 55;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 56;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 57;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CHASSI_VEICULO position 58;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 59;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 60;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 61;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column USUARIO position 62;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 63;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 64;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 65;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 66;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 67;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 68;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 69;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_ADM position 70;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_COMISSAO position 71;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_IMPOSTO position 72;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FI_RET_FINANC position 73;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FI_RET_PLANO position 74;


/*------ SYSDBA 07/08/2015 15:39:09 --------*/

COMMENT ON COLUMN TBPRODUTO.MODELO IS
'Modelo';




/*------ SYSDBA 07/08/2015 15:39:23 --------*/

COMMENT ON COLUMN TBPRODUTO.REFERENCIA IS
'Codigo de referencia';




/*------ SYSDBA 11/08/2015 16:47:01 --------*/

CREATE INDEX IDX_TBPRODUTO_METAFONEMA
ON TBPRODUTO (METAFONEMA);

CREATE INDEX IDX_TBPRODUTO_NOMEAMIGO
ON TBPRODUTO (NOME_AMIGO);

