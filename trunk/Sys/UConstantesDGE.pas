unit UConstantesDGE;

interface

Uses
  SysUtils, Classes, ExtCtrls;

  Type
    TPermissaoLista = Array [0..43] of String;

const
  VERSION_NUMBER = '1.0.5.1';

  SISTEMA_GESTAO = 0;
  SISTEMA_PDV    = 1;

  ROTINA_LENGTH_ID     = 10;
  ROTINA_TIPO_MENU     = 0;
  ROTINA_TIPO_TELA     = 1;
  ROTINA_TIPO_FUNCAO   = 2;
  ROTINA_TIPO_PROCESSO = 3;

  // Constantes FR3

  CATEGORY_VAR = 'Local';
  VAR_TITLE    = 'Titulo';
  VAR_SUBTITLE = 'SubTitulo';
  VAR_PERIODO  = 'Periodo';
  VAR_TODOS    = 'Todos';
  VAR_APENASCONSOLIDADO = 'ApenasConsolidado';
  VAR_SYSTEM            = 'Sistema';
  VAR_USER              = 'Usuario';
  VAR_EMPRESA           = 'Entidade';
  VAR_DEPARTAMENTO      = 'Depto';
  VAR_FILTROS           = 'Filtros';

  // Perfis de Acesso ao Sistema

  FUNCTION_USER_ID_DIRETORIA   =  1;
  FUNCTION_USER_ID_GERENTE_VND =  2;
  FUNCTION_USER_ID_GERENTE_FIN =  3;
  FUNCTION_USER_ID_VENDEDOR    =  4;
  FUNCTION_USER_ID_GERENTE_ADM =  5;
  FUNCTION_USER_ID_CAIXA       =  6;
  FUNCTION_USER_ID_AUX_FINANC1 =  7;
  FUNCTION_USER_ID_AUX_FINANC2 =  8;
  FUNCTION_USER_ID_SUPERV_CX   =  9;
  FUNCTION_USER_ID_ESTOQUISTA  = 10;
  FUNCTION_USER_ID_SUPORTE_TI  = 11;
  FUNCTION_USER_ID_SYSTEM_ADM  = 12;

  // Menu Principal -> Identificacores de rotinas no sistema

  ROTINA_MENU_CADASTRO_ID     = '0010000000';
  ROTINA_MENU_ENTRADA_ID      = '0020000000';
  ROTINA_MENU_MOVIMENTO_ID    = '0030000000';
  ROTINA_MENU_NOTAFISCAL_ID   = '0040000000';
  ROTINA_MENU_CONSULTA_ID     = '0050000000';
  ROTINA_MENU_FINANCEIRO_ID   = '0060000000';
  ROTINA_MENU_RELATORIO_ID    = '0070000000';
  ROTINA_MENU_TAB_AUXILIAR_ID    = '0080000000';
  ROTINA_MENU_REL_ESTOQUE_ID     = '0090000000';
  ROTINA_MENU_REL_FATURAMENTO_ID = '0100000000';
  ROTINA_MENU_REL_FINANCEIRO_ID  = '0110000000';

  // Menu Cadastro -> Tabelas Auxiliares

  ROTINA_CAD_ESTADO_ID     = '0080010000';
  ROTINA_CAD_CIDADE_ID     = '0080020000';
  ROTINA_CAD_DISTRITO_ID   = '0080030000';
  ROTINA_CAD_BAIRRO_ID     = '0080040000';
  ROTINA_CAD_TIPO_LOG_ID   = '0080050000';
  ROTINA_CAD_LOGRADOURO_ID = '0080060000';
  ROTINA_CAD_CFOP_ID           = '0080070000';
  ROTINA_CAD_TRIBUTACAO_ID     = '0080080000';
  ROTINA_CAD_CONTA_CORRENTE_ID = '0080090000';
  ROTINA_CAD_TIPO_DESPESA_ID   = '0080100000';
  ROTINA_CAD_FORMA_PAGTO_ID    = '0080110000';
  ROTINA_CAD_CONDICAO_PAGTO_ID = '0080120000';

  // Menu Cadastro

  ROTINA_CAD_EMPRESA_ID    = '0010010000';
  ROTINA_CAD_CLIENTE_ID    = '0010020000';
  ROTINA_CAD_FORNECEDOR_ID = '0010030000';
  ROTINA_CAD_VENDEDOR_ID   = '0010040000';
  ROTINA_CAD_BANCO_ID      = '0010050000';
  ROTINA_CAD_GRUPO_PROD_ID = '0010060000';
  ROTINA_CAD_SECAO_PROD_ID = '0010070000';
  ROTINA_CAD_FABRI_PROD_ID = '0010080000';
  ROTINA_CAD_UNIDA_PROD_ID = '0010090000';
  ROTINA_CAD_PRODUTO_ID    = '0010100000';
  ROTINA_CAD_PROMOCAO_ID   = '0010110000';
  ROTINA_CAD_CONFIG_EMP_ID = '0010120000';
  ROTINA_CAD_CONFIG_NFE_ID = '0010130000';
  ROTINA_CAD_CONFIG_AMB_ID = '0010140000';
  ROTINA_CAD_GERAR_SENH_ID = '0010150000';
  ROTINA_CAD_PERFIL_ID     = '0010160000';
  ROTINA_CAD_USUARIO_ID    = '0010170000';

  // Menu Entradas

  ROTINA_ENT_PRODUTO_ID    = '0020010000';
  ROTINA_ENT_AJUSTE_ID     = '0020020000';
  ROTINA_ENT_KARDEX_ID     = '0020030000';
  ROTINA_ENT_SERVICO_ID    = '0020040000';

  // Permiss�es

  PERMISSAO_SYSTEM_ADMINISTRATOR : TPermissaoLista =  (
    // Menus
      ROTINA_MENU_CADASTRO_ID
    , ROTINA_MENU_ENTRADA_ID
    , ROTINA_MENU_MOVIMENTO_ID
    , ROTINA_MENU_NOTAFISCAL_ID
    , ROTINA_MENU_CONSULTA_ID
    , ROTINA_MENU_FINANCEIRO_ID
    , ROTINA_MENU_RELATORIO_ID
    , ROTINA_MENU_TAB_AUXILIAR_ID
    , ROTINA_MENU_REL_ESTOQUE_ID
    , ROTINA_MENU_REL_FATURAMENTO_ID
    , ROTINA_MENU_REL_FINANCEIRO_ID

    // Menu Tabela Auxiliar
    , ROTINA_CAD_ESTADO_ID
    , ROTINA_CAD_CIDADE_ID
    , ROTINA_CAD_DISTRITO_ID
    , ROTINA_CAD_BAIRRO_ID
    , ROTINA_CAD_TIPO_LOG_ID
    , ROTINA_CAD_LOGRADOURO_ID
    , ROTINA_CAD_CFOP_ID
    , ROTINA_CAD_TRIBUTACAO_ID
    , ROTINA_CAD_CONTA_CORRENTE_ID
    , ROTINA_CAD_TIPO_DESPESA_ID
    , ROTINA_CAD_FORMA_PAGTO_ID
    , ROTINA_CAD_CONDICAO_PAGTO_ID

    // Menu Cadastro
    , ROTINA_CAD_EMPRESA_ID
    , ROTINA_CAD_CLIENTE_ID
    , ROTINA_CAD_FORNECEDOR_ID
    , ROTINA_CAD_VENDEDOR_ID
    , ROTINA_CAD_BANCO_ID
    , ROTINA_CAD_GRUPO_PROD_ID
    , ROTINA_CAD_SECAO_PROD_ID
    , ROTINA_CAD_FABRI_PROD_ID
    , ROTINA_CAD_UNIDA_PROD_ID
    , ROTINA_CAD_PRODUTO_ID
    , ROTINA_CAD_PROMOCAO_ID
    , ROTINA_CAD_CONFIG_EMP_ID
    , ROTINA_CAD_CONFIG_NFE_ID
    , ROTINA_CAD_CONFIG_AMB_ID
    , ROTINA_CAD_GERAR_SENH_ID
    , ROTINA_CAD_PERFIL_ID
    , ROTINA_CAD_USUARIO_ID

    // Menu Entradas
    , ROTINA_ENT_PRODUTO_ID
    , ROTINA_ENT_AJUSTE_ID
    , ROTINA_ENT_KARDEX_ID
    , ROTINA_ENT_SERVICO_ID

  );
  
  // Tipos de Documentos de Entrada

  TIPO_DOCUMENTO_ENTRADA_AVULSA = 0;
  TIPO_DOCUMENTO_ENTRADA_NF     = 1;
  TIPO_DOCUMENTO_ENTRADA_CUPOM  = 2;
  TIPO_DOCUMENTO_ENTRADA_SERIED = 3;
  TIPO_DOCUMENTO_SERIE_AVULSO   = '99';

  // Rela��o de TAG'S FEET

  NFE_TAG_PROTNFE_ERROR = '</protNFe></protNFe>';
  NFE_TAG_PROTNFE_FEET  = '</protNFe>';

  NFE_TAMANHO_NUMERO_RECIBO = 15;
  NFE_TAMANHO_NUMERO_CHAVE  = 44;

  MODELO_NFE  = 55; // NF-e  (Nota Fiscal Eletr�nica de Venda)
  MODELO_NFCE = 65; // NFC-e (Nota Fiscal Eletr�nica de Venda ao Consumidor Final)

  { DONE -oIsaque -cEmpresa : 22/05/2014 - Inser��o do segmento IND�STRIA para atender meu novo cliente }

  SEGMENTO_PADRAO_ID          = 0;
  SEGMENTO_VAREJO_ATACADO_ID  = 1;
  SEGMENTO_MERCADO_CARRO_ID   = 2;
  SEGMENTO_SERVICOS_ID        = 3;
  SEGMENTO_VAREJO_SERVICOS_ID = 4;
  SEGMENTO_INDUSTRIA_METAL_ID = 8;
  SEGMENTO_INDUSTRIA_GERAL_ID = 9;

  SEGMENTO_PADRAO_DS          = 'Padr�o';
  SEGMENTO_VAREJO_ATACADO_DS  = 'Produtos a Varejo e Atacado';
  SEGMENTO_MERCADO_CARRO_DS   = 'Com�rcio de Ve�culos';
  SEGMENTO_SERVICOS_DS        = 'Servi�os';
  SEGMENTO_VAREJO_SERVICOS_DS = 'Produtos a Varejo e Servi�os';
  SEGMENTO_INDUSTRIA_METAL_DS = 'Ind�stria Metal�rgica';
  SEGMENTO_INDUSTRIA_GERAL_DS = 'Ind�stria';

  TIPO_LOG_TRANS_NOTIFIC = 0;
  TIPO_LOG_TRANS_SEFA    = 1;
  TIPO_LOG_TRANS_SISTEMA = 2;

  DESC_LOG_EVENTO_CANCELAR_NFE_SD = 'Cancelar NF-e de Sa�da';
  DESC_LOG_EVENTO_CANCELAR_NFE_ET = 'Cancelar NF-e de Entrada';
  DESC_LOG_INUTILIZA_NRO_NFE      = 'Inutiliza��o de numer�o para NF-e';
  DESC_LOG_CONSULTAR_NRO_LOTE_NFE = 'Consultar retorno do Lote/Recibo de NF-e';

  CONTA_CORRENTE_TIPO_CAIXA = 1;
  CONTA_CORRENTE_TIPO_BANCO = 2;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif';
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  LAYOUT_BOLETO_ENTREGA = 'Boleto\Boleto.fr3';
  LAYOUT_BOLETO_CARNE   = 'Boleto\BoletoCarne.fr3';

  FILE_WALLPAPER = 'PapelDeParede.jpg';

  CODIGO_BANCO_BRASIL    = 1;
  CODIGO_BANCO_BRADESCO  = 237;
  CODIGO_BANCO_CAIXA     = 104;
  CODIGO_BANCO_HSBC      = 399;
  CODIGO_BANCO_ITAU      = 341;
  CODIGO_BANCO_SANTANDER = 33;

  CONSUMIDOR_FINAL_CODIGO = 1;
  CONSUMIDOR_FINAL_CNPJ   = '99999999999999';
  CONSUMIDOR_FINAL_NOME   = 'CONSUMIDOR FINAL';

  EMPRESA_LICENCA_PADRAO  = 1;

  TRIBUTO_NCM_SH_PADRAO    = '00000000';
  TRIBUTO_ORIGEM_NACIONAL  = '0';
  TRIBUTO_TRIBUTADA_INTEG  = '00';
  TRIBUTO_NAO_TRIBUTADA_SN = '400';

  PORTA_SMTP_PADRAO = 587;

  STR_TAMANHO_NCMSH = 8;

  // Menu Cadastro

  CAD_EMPRESA    = '0100100';
  CAD_CLIENTE    = '0100200';
  CAD_FORNECEDOR = '0100300';
  CAD_VENDEDOR   = '0100400';
  CAD_BANCO      = '0100500';
  CAD_GRUPO_PROD = '0100600';
  CAD_SECAO_PROD = '0100700';
  CAD_FABRICANTE = '0100800';
  CAD_UNIDADE    = '0100900';
  CAD_PRODUTO    = '0101000';
  CAD_PROMOCAO   = '0101100';
  CONFIG_EMPRESA = '0101200';
  CONFIG_NFE     = '0101300';
  GERAR_SENHA    = '0101400';
  CAD_USUARIO    = '0101500';

  // Menu Cadastro -> Tabelas Auxiliares

  TAB_ESTADO     = '0800100';
  TAB_CIDADE     = '0800200';
  TAB_DISTRITO   = '0800300';
  TAB_BAIRRO     = '0800400';
  TAB_TIPO_LOG   = '0800500';
  TAB_LOGRADOURO = '0800600';
  TAB_CFOP       = '0800700';
  TAB_TRIBUTACAO = '0800800';
  TAB_CONTA_CORR = '0800900';
  TAB_FORMA_PGTO = '0801000';
  TAB_COND_PGTO  = '0801100';

  // Menu Estoque

  EST_ENTRADA      = '0200100';
  EST_AJUSTE_ESTOQ = '0200200';
  EST_KARDEX       = '0200300';

  // Menu Movimenta��es

  MOV_VENDA      = '0300100';
  MOV_ORCAMENTO  = '0300200';
  MOV_ORDEM_SERV = '0300300';
  MOV_REQUISICAO = '0300400';

  // Menu Nota Fiscal

  NFE_INUTILIZAR_NUM_NFE = '0400100';
  NFE_CONSULTAR_NFE      = '0400200';
  NFE_EXPORTAR_NFE_GERAD = '0400300';
  NFE_EXPORTAR_CHV_NFE   = '0400400';

  // Chaves e campos de controle do arquivo INI
  
  INI_SECAO_DEFAULT = 'Default';
  INI_KEY_PAIS      = 'PaisID';
  INI_KEY_ESTADO    = 'EstadoID';
  INI_KEY_CIDADE    = 'CidadeID';
  INI_KEY_PAIS_VALUE   = '01058';
  INI_KEY_ESTADO_VALUE = '15';
  INI_KEY_CIDADE_VALUE = '170';
  INI_SECAO_VENDA      = 'Venda';
  INI_KEY_CODIGO_EAN   = 'CarregarPeloCodigoEAN';

  SYS_PATH_REGISTER = {$IFDEF DGE}'MasterDados\'{$ELSE}'�gil Solu��es em Softwares\'{$ENDIF};
  SYS_PASSWD_KEY    = 'TheLordIsGod';
  
  KEY_REG_VERSAO    = 'Vers�o';
  KEY_REG_DATA      = 'Data acesso';

implementation

end.
