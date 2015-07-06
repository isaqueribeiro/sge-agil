unit UGeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons, JvExMask, JvToolEdit,
  JvDBControls, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TAliquota = (taICMS, taISS);
  TfrmGeProduto = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaCOD: TIBStringField;
    IbDtstTabelaDESCRI: TIBStringField;
    IbDtstTabelaMODELO: TIBStringField;
    IbDtstTabelaPRECO: TIBBCDField;
    IbDtstTabelaREFERENCIA: TIBStringField;
    IbDtstTabelaSECAO: TIBStringField;
    IbDtstTabelaCODGRUPO: TSmallintField;
    IbDtstTabelaCUSTOMEDIO: TIBBCDField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODSECAO: TSmallintField;
    IbDtstTabelaCODORIGEM: TIBStringField;
    IbDtstTabelaCODTRIBUTACAO: TIBStringField;
    IbDtstTabelaCST: TIBStringField;
    IbDtstTabelaCODCFOP: TIntegerField;
    IbDtstTabelaCODBARRA_EAN: TIBStringField;
    IbDtstTabelaCODUNIDADE: TSmallintField;
    IbDtstTabelaDESCRICAO_GRUPO: TIBStringField;
    IbDtstTabelaDESCRICAO_SECAO: TIBStringField;
    IbDtstTabelaDESCRICAO_UNIDADE: TIBStringField;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblSecao: TLabel;
    lblGrupo: TLabel;
    IbDtstTabelaALIQUOTA: TIBBCDField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    Bevel5: TBevel;
    tblOrigem: TIBTable;
    dtsOrigem: TDataSource;
    tblTributacaoNM: TIBTable;
    dtsTributacaoNM: TDataSource;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsHistoricoVeiculo: TTabSheet;
    IbDtstTabelaUNP_SIGLA: TIBStringField;
    GrpBxDadosEstoque: TGroupBox;
    lblEstoqueQtde: TLabel;
    dbEstoqueQtde: TDBEdit;
    lblEstoqueMinimo: TLabel;
    dbEstoqueMinimo: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCusto: TLabel;
    dbCusto: TDBEdit;
    lblPreco: TLabel;
    dbPreco: TDBEdit;
    lblCodigoEAN: TLabel;
    dbCodigoEAN: TDBEdit;
    tblAliquota: TIBTable;
    dtsAliquota: TDataSource;
    IbDtstTabelaALIQUOTA_TIPO: TSmallintField;
    IbDtstTabelaVALOR_IPI: TIBBCDField;
    lblReserva: TLabel;
    dbReserva: TDBEdit;
    IbDtstTabelaNCM_SH: TIBStringField;
    tblTributacaoSN: TIBTable;
    dtsTributacaoSN: TDataSource;
    IbDtstTabelaCSOSN: TIBStringField;
    IbDtstTabelaALIQUOTA_CSOSN: TIBBCDField;
    IbDtstTabelaPRECO_PROMOCAO: TIBBCDField;
    lblPrecoPromocao: TLabel;
    dbPrecoPromocao: TDBEdit;
    lblProdutoPromocao: TLabel;
    lblProdutoSemEstoque: TLabel;
    lblProdutoDesativado: TLabel;
    lblFabricante: TLabel;
    IbDtstTabelaCODFABRICANTE: TIntegerField;
    IbDtstTabelaNOME_FABRICANTE: TIBStringField;
    IbDtstTabelaAPRESENTACAO: TIBStringField;
    IbDtstTabelaDESCRI_APRESENTACAO: TIBStringField;
    IbDtstTabelaPRODUTO_NOVO: TSmallintField;
    TbsEspecificacao: TTabSheet;
    lblApresentacao: TLabel;
    dbApresentacao: TDBEdit;
    IbDtstTabelaCOR_VEICULO: TIBStringField;
    IbDtstTabelaCOMBUSTIVEL_VEICULO: TIBStringField;
    IbDtstTabelaTIPO_VEICULO: TIBStringField;
    IbDtstTabelaRENAVAM_VEICULO: TIBStringField;
    IbDtstTabelaCHASSI_VEICULO: TIBStringField;
    IbDtstTabelaANO_MODELO_VEICULO: TSmallintField;
    IbDtstTabelaANO_FABRICACAO_VEICULO: TSmallintField;
    IbDtstTabelaKILOMETRAGEM_VEICULO: TIntegerField;
    IbDtstTabelaDESCRICAO_COR: TIBStringField;
    IbDtstTabelaDESCRICAO_COMBUSTIVEL: TIBStringField;
    IbDtstTabelaMODELO_FABRICACAO: TIBStringField;
    tblCor: TIBTable;
    dtsCor: TDataSource;
    tblCombustivel: TIBTable;
    dtsCombustivel: TDataSource;
    tblTipoVeiculo: TIBTable;
    dtsTipoVeiculo: TDataSource;
    IbDtstTabelaSITUACAO_ATUAL_VEICULO: TIBStringField;
    IbDtstTabelaSITUACAO_HISTORICO_VEICULO: TMemoField;
    lblSituacaoVeiculo: TLabel;
    dbSituacaoVeiculo: TDBEdit;
    lblHistoricoSituacaoVeiculo: TLabel;
    dbHistoricoSituacaoVeiculo: TDBMemo;
    tbsTributacao: TTabSheet;
    IbDtstTabelaPERCENTUAL_REDUCAO_BC: TIBBCDField;
    GrpBxDadosTributoICMS: TGroupBox;
    lblOrigem: TLabel;
    lblTipoTributacaoNM: TLabel;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    lblIPI: TLabel;
    lblAliquotaTipo: TLabel;
    lblNCM_SH: TLabel;
    lblTipoTributacaoSN: TLabel;
    lblAliquotaSN: TLabel;
    lblPercentualReducaoBC: TLabel;
    dbOrigem: TDBLookupComboBox;
    dbTipoTributacaoNM: TDBLookupComboBox;
    dbAliquota: TDBEdit;
    dbIPI: TDBEdit;
    dbAliquotaTipo: TDBLookupComboBox;
    dbTipoTributacaoSN: TDBLookupComboBox;
    dbAliquotaSN: TDBEdit;
    dbPercentualReducaoBC: TDBEdit;
    Bevel6: TBevel;
    GrpBxDadosTributoPIS: TGroupBox;
    Bevel7: TBevel;
    lblCSTPIS: TLabel;
    dbCSTPIS: TDBLookupComboBox;
    lblCSTCOFINS: TLabel;
    dbCSTCOFINS: TDBLookupComboBox;
    chkProdutoComEstoque: TCheckBox;
    IbDtstTabelaCST_PIS: TIBStringField;
    IbDtstTabelaCST_COFINS: TIBStringField;
    IbDtstTabelaALIQUOTA_PIS: TIBBCDField;
    IbDtstTabelaALIQUOTA_COFINS: TIBBCDField;
    lblAliquotaCOFINS: TLabel;
    dbAliquotaCOFINS: TDBEdit;
    lblAliquotaPIS: TLabel;
    dbAliquotaPIS: TDBEdit;
    dtsAliquotaPIS: TDataSource;
    dtsAliquotaCOFINS: TDataSource;
    qryAliquotaPIS: TIBDataSet;
    qryAliquotaCOFINS: TIBDataSet;
    lblPercentualMarckup: TLabel;
    dbPercentualMarckup: TDBEdit;
    lblPrecoVendaSugestao: TLabel;
    dbPrecoVendaSugestao: TDBEdit;
    IbDtstTabelaPRECO_SUGERIDO: TIBBCDField;
    IbDtstTabelaPERCENTUAL_MARCKUP: TIBBCDField;
    CmbBxFiltrarTipo: TComboBox;
    lblLucroValor: TLabel;
    dbLucroValor: TDBEdit;
    IbDtstTabelaLUCRO_CALCULADO: TIBBCDField;
    ShpLucroZerado: TShape;
    lblLucroZerado: TLabel;
    ShpLucroNegativo: TShape;
    lblLucroNegativo: TLabel;
    IbDtstTabelaLUCRO_VALOR: TIBBCDField;
    IbDtstTabelaPERCENTUAL_MARGEM: TIBBCDField;
    IbDtstTabelaFRACIONADOR: TIBBCDField;
    IbDtstTabelaVENDA_FRACIONADA: TSmallintField;
    IbDtstTabelaCODUNIDADE_FRACIONADA: TSmallintField;
    IbDtstTabelaDESCRICAO_UNIDADE_FRAC: TIBStringField;
    IbDtstTabelaUNP_SIGLA_FRAC: TIBStringField;
    GrpBxFracionamentoPreco: TGroupBox;
    lblPrecoFrac: TLabel;
    dbPrecoFrac: TDBEdit;
    dbPrecoPromocaoFrac: TDBEdit;
    lblPrecoPromocaoFrac: TLabel;
    lblPrecoSugeridoFrac: TLabel;
    dbPrecoSugeridoFrac: TDBEdit;
    lblFracionador: TLabel;
    dbFracionador: TDBEdit;
    dbVendaFracionada: TDBCheckBox;
    lblUnidadeFracao: TLabel;
    pnlVeiculo: TPanel;
    pnlVolume: TPanel;
    GrpVolume: TGroupBox;
    lblPesoBruto: TLabel;
    dbPesoBruto: TDBEdit;
    GrpVeiculo: TGroupBox;
    lblTipoVeiculo: TLabel;
    dbTipoVeiculo: TDBLookupComboBox;
    lblRenavam: TLabel;
    dbRenavam: TDBEdit;
    lblCorVeiculo: TLabel;
    dbCorVeiculo: TDBLookupComboBox;
    lblChassi: TLabel;
    dbChassi: TDBEdit;
    lblTipoCombustivel: TLabel;
    dbTipoCombustivel: TDBLookupComboBox;
    lblAnoFabricacao: TLabel;
    dbAnoFabricacao: TDBEdit;
    lblAnoModelo: TLabel;
    dbAnoModelo: TDBEdit;
    lblKilometragem: TLabel;
    dbKilometragem: TDBEdit;
    lblPesoLiquido: TLabel;
    dbPesoLiquido: TDBEdit;
    lblCubagem: TLabel;
    dbCubagem: TDBEdit;
    IbDtstTabelaPESO_BRUTO: TIBBCDField;
    IbDtstTabelaPESO_LIQUIDO: TIBBCDField;
    IbDtstTabelaCUBAGEM: TIBBCDField;
    IbDtstTabelaUSUARIO: TIBStringField;
    lblNVE: TLabel;
    dbNVE: TDBEdit;
    IbDtstTabelaCODIGO_NVE: TIBStringField;
    IbDtstTabelaQTDE: TIBBCDField;
    IbDtstTabelaDISPONIVEL: TIBBCDField;
    IbDtstTabelaRESERVA: TIBBCDField;
    IbDtstTabelaESTOQMIN: TIBBCDField;
    IbDtstTabelaMOVIMENTA_ESTOQUE: TSmallintField;
    IbDtstTabelaPRECO_FRAC: TFMTBCDField;
    IbDtstTabelaPRECO_PROMOCAO_FRAC: TFMTBCDField;
    IbDtstTabelaPRECO_SUGERIDO_FRAC: TFMTBCDField;
    lblUnidade: TLabel;
    lblTipoCadastro: TLabel;
    dbTipoCadastro: TDBLookupComboBox;
    IbDtstTabelaCOMPOR_FATURAMENTO: TSmallintField;
    IbDtstTabelaMETAFONEMA: TIBStringField;
    IbDtstTabelaESPECIFICACAO: TBlobField;
    pnlEspecificacao: TPanel;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    Bevel9: TBevel;
    popFerramentas: TPopupMenu;
    ppMnAtualizarMetafonema: TMenuItem;
    ppImprimir: TPopupMenu;
    nmProdutoLista: TMenuItem;
    nmProdutoFicha: TMenuItem;
    nmProdutoEtiqueta: TMenuItem;
    IbDtstTabelaCADASTRO_ATIVO: TSmallintField;
    IbDtstTabelaPRODUTO_IMOBILIZADO: TSmallintField;
    dbCFOP: TJvDBComboEdit;
    dbGrupo: TJvDBComboEdit;
    dbFabricante: TJvDBComboEdit;
    dbUnidade: TJvDBComboEdit;
    dbUnidadeFracao: TJvDBComboEdit;
    dbSecao: TJvDBComboEdit;
    tbsCustoVeiculo: TTabSheet;
    grpCustosVeiculo: TGroupBox;
    lblValorCompraVeiculo: TLabel;
    lblOutros: TLabel;
    lblValorOficinaVeiculo: TLabel;
    lblValorComissaoVeiculo: TLabel;
    lblImpostos: TLabel;
    lblAdm: TLabel;
    dbValorCompraVeiculo: TDBEdit;
    dbValorComissaoVeiculo: TDBEdit;
    dbValorOficinaVeiculo: TDBEdit;
    dbImpostos: TDBEdit;
    dbAdm: TDBEdit;
    dbOutros: TDBEdit;
    grpFIVeiculo: TGroupBox;
    lblRetPlano: TLabel;
    lblFinanciadora: TLabel;
    lvlValorRetornoVeiculo: TLabel;
    dbFinanciadora: TDBEdit;
    dbPorPlano: TDBEdit;
    dbValorRetornoVeiculo: TDBEdit;
    GrpBxParametroGeral: TGroupBox;
    GrpBxParametroProdudo: TGroupBox;
    IbDtstTabelaUNIDADE: TIBStringField;
    dbCadastroAtivo: TDBCheckBox;
    dbProdutoNovo: TDBCheckBox;
    dbComporFaturamento: TDBCheckBox;
    dbProdutoMovEstoque: TDBCheckBox;
    dbProdutoEhImobilizado: TDBCheckBox;
    dbProdutoPorLote: TDBCheckBox;
    IbDtstTabelaESTOQUE_APROP_LOTE: TSmallintField;
    ppMnAtualizarTabelaIBPT: TMenuItem;
    IbDtstTabelaTABELA_IBPT: TIntegerField;
    dbNCM_SH: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbGrupoButtonClick(Sender: TObject);
    procedure dbSecaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbUnidadeButtonClick(Sender: TObject);
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbFabricanteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkProdutoComEstoqueClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbUnidadeFracaoButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ppMnAtualizarMetafonemaClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure dbProdutoMovEstoqueClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure dbNCM_SHButtonClick(Sender: TObject);
  private
    { Private declarations }
    fOrdenado : Boolean;
    fAliquota : TAliquota;
    fApenasProdutos ,
    fApenasServicos : Boolean;
    Procedure ControleCampos;
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa : Integer); overload;
  end;

var
  frmGeProduto: TfrmGeProduto;

  procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);

  function SelecionarProdutoParaAjuste(const AOwner : TComponent; const Empresa : String;
    var Codigo : Integer;
    var CodigoAlfa, Nome : String) : Boolean;

  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, CodigoEAN, Nome, Unidade : String;
    var ValorVenda : Currency) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, CST : String;
    var iUnidade, CFOP : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, Unidade : String;
    var ValorVenda, ValorPromocao : Currency) : Boolean; overload;

  function SelecionarProdutoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC, ValorCusto : Currency;
    var Estoque, Reserva : Currency) : Boolean;
  function SelecionarServicoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CNAE : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao : Currency) : Boolean;
  function SelecionarProdutoServicoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP_CNAE : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;

  function SelecionarProdutoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP : Integer;
    var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;
  function SelecionarServicoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CNAE : Integer;
    var ValorCusto, ValorVenda, ValorPromocao : Currency) : Boolean;
  function SelecionarProdutoServicoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP_CNAE : Integer;
    var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;

implementation

uses
  UDMBusiness, UGeSecaoProduto, UGeGrupoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFabricante, UConstantesDGE, UFuncoes, UGrPadrao,
  UGeTabelaIBPT;

{$R *.dfm}

const
  COLUMN_LUCRO = 12;
  COLUMN_GRUPO = 13;

procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    if not GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa) then
      frm.WhereAdditional := '(p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')'
    else
      frm.WhereAdditional := '(1 = 1)';

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    // Carregar apenas produtos com estoque e servi�os em geral
    if frm.chkProdutoComEstoque.Checked then
      frm.WhereAdditional := frm.WhereAdditional + ' and ((p.Qtde > 0) or (p.Aliquota_tipo = 1))';

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaAjuste(const AOwner : TComponent; const Empresa : String;
  var Codigo : Integer;
  var CodigoAlfa, Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled      := False;
    frm.dbAliquotaTipo.Enabled       := False;

    whr := '(p.codemp = ' + QuotedStr(Empresa) + ') and (p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota)) + ')';

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and (p.Qtde > 0)';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, CodigoEAN, Nome, Unidade : String;
  var ValorVenda : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
      CodigoEAN  := frm.IbDtstTabelaCODBARRA_EAN.Value;
      Unidade    := frm.IbDtstTabelaUNIDADE.Value;
      
      if ( frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency = 0 ) then
        ValorVenda := frm.IbDtstTabelaPRECO.AsCurrency
      else
        ValorVenda := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, CST : String;
  var iUnidade, CFOP : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CFOP       := frm.IbDtstTabelaCODCFOP.AsInteger;
      Aliquota       := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      AliquotaPIS    := frm.IbDtstTabelaALIQUOTA_PIS.AsCurrency;
      AliquotaCOFINS := frm.IbDtstTabelaALIQUOTA_COFINS.AsCurrency;
      ValorVenda     := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao  := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI       := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsCurrency;
      Reserva := frm.IbDtstTabelaRESERVA.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC, ValorCusto : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CFOP       := frm.IbDtstTabelaCODCFOP.AsInteger;
      Aliquota       := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      AliquotaPIS    := frm.IbDtstTabelaALIQUOTA_PIS.AsCurrency;
      AliquotaCOFINS := frm.IbDtstTabelaALIQUOTA_COFINS.AsCurrency;
      ValorVenda     := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao  := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI       := frm.IbDtstTabelaVALOR_IPI.AsCurrency;
      ValorCusto     := frm.IbDtstTabelaCUSTOMEDIO.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsCurrency;
      Reserva := frm.IbDtstTabelaRESERVA.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarServicoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CNAE : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CNAE       := 0; //frm.IbDtstTabelaCODCFOP.AsInteger;
      Aliquota       := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      AliquotaPIS    := frm.IbDtstTabelaALIQUOTA_PIS.AsCurrency;
      AliquotaCOFINS := frm.IbDtstTabelaALIQUOTA_COFINS.AsCurrency;
      ValorVenda     := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao  := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoServicoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP_CNAE : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;

      if ( TAliquota(frm.IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taICMS ) then
        CFOP_CNAE  := frm.IbDtstTabelaCODCFOP.AsInteger
      else
        CFOP_CNAE  := 0;

      Aliquota       := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      AliquotaPIS    := frm.IbDtstTabelaALIQUOTA_PIS.AsCurrency;
      AliquotaCOFINS := frm.IbDtstTabelaALIQUOTA_COFINS.AsCurrency;
      ValorVenda     := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao  := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI       := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsCurrency;
      Reserva := frm.IbDtstTabelaRESERVA.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP : Integer;
  var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CFOP       := frm.IbDtstTabelaCODCFOP.AsInteger;
      ValorCusto    := frm.IbDtstTabelaCUSTOMEDIO.AsCurrency;
      ValorVenda    := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI      := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsCurrency;
      Reserva := frm.IbDtstTabelaRESERVA.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarServicoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CNAE : Integer;
  var ValorCusto, ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CNAE       := 0; //frm.IbDtstTabelaCODCFOP.AsInteger;
      ValorCusto    := frm.IbDtstTabelaCUSTOMEDIO.AsCurrency;
      ValorVenda    := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoServicoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP_CNAE : Integer;
  var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      sNCM_SH    := frm.IbDtstTabelaNCM_SH.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;

      if ( TAliquota(frm.IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taICMS ) then
        CFOP_CNAE  := frm.IbDtstTabelaCODCFOP.AsInteger
      else
        CFOP_CNAE  := 0;

      ValorCusto    := frm.IbDtstTabelaCUSTOMEDIO.AsCurrency;
      ValorVenda    := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI      := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsCurrency;
      Reserva := frm.IbDtstTabelaRESERVA.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, Unidade : String;
  var ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      Unidade    := frm.IbDtstTabelaUNIDADE.AsString;
      ValorVenda := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeProduto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_PRODUTO_ID;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
  fAliquota := taICMS;

  fApenasProdutos := False;
  fApenasServicos := False;

  tblEmpresa.Open;
  tblOrigem.Open;
  tblTributacaoNM.Open;
  tblTributacaoSN.Open;
  tblAliquota.Open;
  qryAliquotaPIS.Open;
  qryAliquotaCOFINS.Open;

  if ( GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID ) then
  begin
    tblCor.Open;
    tblCombustivel.Open;
    tblTipoVeiculo.Open;
  end;

  DisplayFormatCodigo := '###0000000';

  NomeTabela         := 'TBPRODUTO';
  CampoCodigo        := 'p.Codigo';
  CampoDescricao     := 'p.Descri';
  CampoCadastroAtivo := 'p.cadastro_ativo';
  {$IFNDEF DGE}
  CampoDescricao := 'p.Descri_apresentacao';
  {$ENDIF}

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;

  {$IFNDEF DGE}
  dbPercentualMarckup.Color    := clWindow;
  dbPercentualMarckup.ReadOnly := False;
  dbPercentualMarckup.TabStop  := True;

  lblPrecoVendaSugestao.Visible := True;
  dbPrecoVendaSugestao.Visible  := True;
  {$ENDIF}

  tbsCadastro.TabVisible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnIncluir.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnAlterar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnExcluir.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnCancelar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnSalvar.Visible    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);

  ShpLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  lblLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  ShpLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  lblLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);

  nmProdutoLista.Caption    := 'Lista de ' + StrDescricaoProduto;
  nmProdutoFicha.Caption    := 'Ficha de ' + StrDescricaoProduto;
  nmProdutoEtiqueta.Caption := 'Etiqueta de ' + StrDescricaoProduto;

  lblProdutoPromocao.Caption   := Format('* %s em Promo��o', [StrDescricaoProduto]);
  lblProdutoSemEstoque.Caption := Format('* %s sem Estoque', [StrDescricaoProduto]);
  lblProdutoDesativado.Caption := Format('* %s desativado', [StrDescricaoProduto]);

  dbProdutoEhImobilizado.Enabled := (gSistema.Codigo = SISTEMA_GESTAO_IND);
(*
  lblTipoTributacaoSN.Enabled := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  dbTipoTributacaoSN.Enabled  := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  lblAliquotaSN.Enabled := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  dbAliquotaSN.Enabled  := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
*)  
end;

procedure TfrmGeProduto.dbGrupoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarGrupoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODGRUPO.AsInteger       := iCodigo;
      IbDtstTabelaDESCRICAO_GRUPO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.dbNCM_SHButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sCodigo    ,
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCodigoIBPT(Self, iCodigo, sCodigo, sDescricao) ) then
    begin
      IbDtstTabelaTABELA_IBPT.AsInteger := iCodigo;
      IbDtstTabelaNCM_SH.AsString       := sCodigo;
    end;
end;

procedure TfrmGeProduto.dbProdutoMovEstoqueClick(Sender: TObject);
begin
  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
    if Assigned(dbProdutoPorLote.Field) then
      if (dbProdutoMovEstoque.Field.AsInteger = 0) then
        dbProdutoPorLote.Field.AsInteger := 0;
end;

procedure TfrmGeProduto.dbSecaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarSecaoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODSECAO.AsInteger       := iCodigo;
      IbDtstTabelaSECAO.AsString           := sDescricao;
      IbDtstTabelaDESCRICAO_SECAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  IbDtstTabelaFRACIONADOR.Required           := (IbDtstTabelaVENDA_FRACIONADA.AsInteger = 1);
  IbDtstTabelaCODUNIDADE_FRACIONADA.Required := (IbDtstTabelaVENDA_FRACIONADA.AsInteger = 1);

  inherited;

  IbDtstTabelaDESCRI_APRESENTACAO.AsString := AnsiUpperCase(Trim(IbDtstTabelaDESCRI.AsString + ' ' + IbDtstTabelaAPRESENTACAO.AsString));
  IbDtstTabelaMETAFONEMA.AsString          := Metafonema(IbDtstTabelaDESCRI_APRESENTACAO.AsString);
  IbDtstTabelaUSUARIO.AsString             := gUsuarioLogado.Login;

  if (TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taISS) then
    IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger := 0;
    
  if ( IbDtstTabelaQTDE.AsCurrency < 0 ) then
    IbDtstTabelaQTDE.Value := 0;

  if ( (IbDtstTabelaRESERVA.AsCurrency < 0) or (IbDtstTabelaRESERVA.AsCurrency > IbDtstTabelaQTDE.AsCurrency) ) then
    IbDtstTabelaRESERVA.Value := 0;

  if ( IbDtstTabelaPRODUTO_NOVO.IsNull ) then
    IbDtstTabelaPRODUTO_NOVO.Value := 0;

  if ( IbDtstTabelaMOVIMENTA_ESTOQUE.IsNull ) then
    IbDtstTabelaMOVIMENTA_ESTOQUE.Value := 1;

  if ( IbDtstTabelaCOMPOR_FATURAMENTO.IsNull ) then
    IbDtstTabelaCOMPOR_FATURAMENTO.Value := StrToInt(IfThen(GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));

  if ( (IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency < 0) or (IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency > 100) ) then
    IbDtstTabelaPERCENTUAL_REDUCAO_BC.Value := 0;

  IbDtstTabelaDISPONIVEL.AsCurrency := IbDtstTabelaQTDE.AsCurrency - IbDtstTabelaRESERVA.AsCurrency;

  IbDtstTabelaCST.Value := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;

  if ( IbDtstTabelaCOMPOR_FATURAMENTO.AsInteger = 0 ) then
  begin
    IbDtstTabelaPERCENTUAL_MARGEM.AsCurrency  := 0.0;
    IbDtstTabelaPERCENTUAL_MARCKUP.AsCurrency := 0.0;
  end
  else
  if ( IbDtstTabelaPERCENTUAL_MARGEM.IsNull and (not IbDtstTabelaPERCENTUAL_MARCKUP.IsNull) ) then
    IbDtstTabelaPERCENTUAL_MARGEM.AsCurrency := IbDtstTabelaPERCENTUAL_MARCKUP.Value;

  if ( IbDtstTabela.State = dsInsert ) then
    if ( Trim(IbDtstTabelaCOD.AsString) = EmptyStr ) then
      IbDtstTabelaCOD.Value := FormatFloat(DisplayFormatCodigo, IbDtstTabelaCODIGO.AsInteger);

  if Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) then
    if (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> EmptyStr) and (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) <> EmptyStr) then
      IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString :=
        FormatDateTime('dd/mm/yyyy hh:mm', GetDateTimeDB)           + ' - '  +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) + ' -> ' +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) + ' (' + gUsuarioLogado.Login + ')' + #13 +
        Trim(IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString);

  IbDtstTabelaDESCRICAO_COR.AsString         := dbCorVeiculo.Text;
  IbDtstTabelaDESCRICAO_COMBUSTIVEL.AsString := dbTipoCombustivel.Text;
  IbDtstTabelaMODELO_FABRICACAO.AsString     := dbAnoFabricacao.Text + '/' + dbAnoModelo.Text;

  if ( IbDtstTabelaFRACIONADOR.AsCurrency <= 0 ) then
    IbDtstTabelaFRACIONADOR.AsCurrency := 1;
end;

procedure TfrmGeProduto.dbUnidadeButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
    begin
      IbDtstTabelaCODUNIDADE.AsInteger       := iCodigo;
      IbDtstTabelaUNIDADE.AsString           := AnsiUpperCase(Copy(sDescricao, 1, IbDtstTabelaUNIDADE.Size));
      IbDtstTabelaDESCRICAO_UNIDADE.AsString := sDescricao;
      IbDtstTabelaUNP_SIGLA.AsString         := sSigla;

      if ( IbDtstTabelaFRACIONADOR.AsInteger = 1 ) then
      begin
        IbDtstTabelaCODUNIDADE_FRACIONADA.AsInteger := iCodigo;
        IbDtstTabelaDESCRICAO_UNIDADE_FRAC.AsString := sDescricao;
        IbDtstTabelaUNP_SIGLA_FRAC.AsString         := sSigla;
      end;
    end;
end;

procedure TfrmGeProduto.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODCFOP.AsInteger       := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCODEMP.Value := gUsuarioLogado.Empresa;

  if Trim(IbDtstTabelaCODEMP.AsString) = EmptyStr then
    if ( not tblEmpresa.IsEmpty ) then
      IbDtstTabelaCODEMP.Value := tblEmpresa.FieldByName('CNPJ').AsString;

  if ( not tblOrigem.IsEmpty ) then
    IbDtstTabelaCODORIGEM.Value := TRIBUTO_ORIGEM_NACIONAL; // tblOrigem.FieldByName('ORP_COD').AsString;

  if ( not tblTributacaoNM.IsEmpty ) then
    IbDtstTabelaCODTRIBUTACAO.Value := TRIBUTO_TRIBUTADA_INTEG; // tblTributacaoNM.FieldByName('TPT_COD').AsString;

  if ( GetRegimeEmpresa(IbDtstTabelaCODEMP.AsString) = trSimplesNacional ) then
    if ( not tblTributacaoSN.IsEmpty ) then
      IbDtstTabelaCSOSN.Value := TRIBUTO_NAO_TRIBUTADA_SN; // tblTributacaoSN.FieldByName('TPT_COD').AsString;

  IbDtstTabelaCST.Value        := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;
  IbDtstTabelaESTOQMIN.Value   := 0;
  IbDtstTabelaQTDE.Value       := 0;
  IbDtstTabelaESTOQMIN.Value   := 0;
  IbDtstTabelaRESERVA.Value    := 0;
  IbDtstTabelaCUSTOMEDIO.Value := 0;
  IbDtstTabelaPRECO.Value      := 0;
  IbDtstTabelaCODCFOP.Value        := GetCfopIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value := GetCfopNomeDefault;
  IbDtstTabelaALIQUOTA_TIPO.Value  := Ord(fAliquota);
  IbDtstTabelaALIQUOTA.Value       := 0;
  IbDtstTabelaALIQUOTA_CSOSN.Value := 0;
  IbDtstTabelaVALOR_IPI.Value      := 0;
  IbDtstTabelaRESERVA.Value        := 0;
  IbDtstTabelaPRODUTO_NOVO.Value   := 0;
  IbDtstTabelaPERCENTUAL_MARCKUP.Value := 0;
  IbDtstTabelaPRECO_SUGERIDO.Value     := 0;
  IbDtstTabelaPESO_BRUTO.AsCurrency    := 0.0;
  IbDtstTabelaPESO_LIQUIDO.AsCurrency  := 0.0;
  IbDtstTabelaCUBAGEM.AsCurrency       := 0.0;

  IbDtstTabelaFRACIONADOR.Value        := 1;
  IbDtstTabelaVENDA_FRACIONADA.Value   := 0;

  IbDtstTabelaPERCENTUAL_REDUCAO_BC.Value := 0;

  IbDtstTabelaCOR_VEICULO.Clear;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Clear;
  IbDtstTabelaTIPO_VEICULO.Clear;
  IbDtstTabelaRENAVAM_VEICULO.Clear;
  IbDtstTabelaCHASSI_VEICULO.Clear;
  IbDtstTabelaANO_MODELO_VEICULO.Clear;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Clear;

  IbDtstTabelaNCM_SH.AsString       := TRIBUTO_NCM_SH_PADRAO;
  IbDtstTabelaTABELA_IBPT.AsInteger := GetTabelaIBPT_Codigo(TRIBUTO_NCM_SH_PADRAO);
  IbDtstTabelaCST_PIS.AsString    := '99';
  IbDtstTabelaCST_COFINS.AsString := '99';
  IbDtstTabelaALIQUOTA_PIS.AsCurrency      := 0.0;
  IbDtstTabelaALIQUOTA_COFINS.AsCurrency   := 0.0;
  IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger  := 1;
  IbDtstTabelaCADASTRO_ATIVO.Value         := 1;
  IbDtstTabelaPRODUTO_IMOBILIZADO.Value    := 0;
  IbDtstTabelaCOMPOR_FATURAMENTO.AsInteger := StrToInt(IfThen(GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));
  IbDtstTabelaESTOQUE_APROP_LOTE.AsInteger := 0;
end;

procedure TfrmGeProduto.FormShow(Sender: TObject);
var
  S : String;
begin
  S := StrDescricaoProduto;
  Case fAliquota of
    taICMS :
      Caption := 'Cadastro de ' + S;
    taISS :
      Caption := 'Cadastro de Servi�os';
    else
      Caption := 'Cadastro de ' + S + '/Servi�os';
  end;

  if (not fOrdenado) then
  begin
    IbDtstTabela.SelectSQL.Add( 'order by ' + CampoDescricao );
    fOrdenado := True;
  end;

  inherited;

  // Configurar Legendas de acordo com o segmento
  pnlVeiculo.Visible             := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
  tbsHistoricoVeiculo.TabVisible := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
  tbsCustoVeiculo.TabVisible     := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);

  if ( pnlVeiculo.Visible ) then
  begin
    lblDescricao.Caption                  := 'Modelo Ve�culo:';
    IbDtstTabelaDESCRI.DisplayLabel       := 'Modelo Ve�culo';
    lblApresentacao.Caption               := 'Linha:';
    IbDtstTabelaAPRESENTACAO.DisplayLabel := 'Linha';
    lblReferencia.Caption                 := 'Placa:';
    IbDtstTabelaREFERENCIA.DisplayLabel   := 'Placa';
    lblGrupo.Caption                         := 'Fam�lia:';
    IbDtstTabelaDESCRICAO_GRUPO.DisplayLabel := 'Fam�lia';
  end;

  IbDtstTabelaCOR_VEICULO.Required            := pnlVeiculo.Visible;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Required    := pnlVeiculo.Visible;
  IbDtstTabelaTIPO_VEICULO.Required           := pnlVeiculo.Visible;
  IbDtstTabelaRENAVAM_VEICULO.Required        := pnlVeiculo.Visible;
  IbDtstTabelaCHASSI_VEICULO.Required         := pnlVeiculo.Visible;
  IbDtstTabelaKILOMETRAGEM_VEICULO.Required   := pnlVeiculo.Visible;
  IbDtstTabelaANO_MODELO_VEICULO.Required     := pnlVeiculo.Visible;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Required := pnlVeiculo.Visible;

  with dbgDados do
  begin
    Columns[2].Visible  := not pnlVeiculo.Visible;
    Columns[4].Visible  := pnlVeiculo.Visible;
    Columns[5].Visible  := pnlVeiculo.Visible;
    Columns[6].Visible  := pnlVeiculo.Visible;
    Columns[7].Visible  := pnlVeiculo.Visible;
    Columns[8].Visible  := pnlVeiculo.Visible;
    Columns[9].Visible  := not pnlVeiculo.Visible;
    Columns[COLUMN_GRUPO].Visible := not pnlVeiculo.Visible;
  end;
end;

procedure TfrmGeProduto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeProduto.FormActivate(Sender: TObject);
begin
  inherited;
  {$IFDEF DGE}
  EvUA.UserID := GetUserFunctionID;

  Case GetUserFunctionID of
    FUNCTION_USER_ID_ESTOQUISTA ,
    FUNCTION_USER_ID_VENDEDOR   ,
    FUNCTION_USER_ID_CAIXA      ,
    FUNCTION_USER_ID_AUX_FINANC1,
    FUNCTION_USER_ID_AUX_FINANC2:
      begin
        btbtnIncluir.Visible  := False;
        btbtnAlterar.Visible  := False;
        btbtnExcluir.Visible  := False;
        btbtnCancelar.Visible := False;
        btbtnSalvar.Visible   := False;

        DtSrcTabela.AutoEdit := False;

        lblCusto.Visible := False;
        dbCusto.Visible  := False;

        lblPercentualMarckup.Visible := False;
        dbPercentualMarckup.Visible  := False;

        lblLucroValor.Visible := False;
        dbLucroValor.Visible  := False;
      end;
  end;
  {$ENDIF}

  if pgcGuias.ActivePage = tbsTabela then
  begin
    FiltarDados;
    if ( edtFiltrar.Visible and edtFiltrar.Enabled ) then
      edtFiltrar.SetFocus;
  end;

  dbgDados.Columns[COLUMN_LUCRO].Visible := ( gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA..FUNCTION_USER_ID_GERENTE_FIN,
    FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SUPORTE_TI, FUNCTION_USER_ID_SYSTEM_ADM] )
    and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
end;

procedure TfrmGeProduto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // Destacar produtos sem Estoque
  if ( TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taICMS ) then
    if ( IbDtstTabelaQTDE.AsCurrency <= 0 ) then
      dbgDados.Canvas.Font.Color := lblProdutoSemEstoque.Font.Color;

  // Destacar produtos em Promocao
  if ( IbDtstTabelaPRECO_PROMOCAO.AsCurrency > 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoPromocao.Font.Color;
    
  // Destacar servi�os/produtos desativados
  if ( IbDtstTabelaCADASTRO_ATIVO.AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoDesativado.Font.Color;

  // Destacar alerta de lucros
  if ( IbDtstTabelaCOMPOR_FATURAMENTO.AsInteger = 1 ) then
    if (not IbDtstTabelaLUCRO_CALCULADO.IsNull) then
    begin
      if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger = 0 ) then
        dbgDados.Canvas.Brush.Color := ShpLucroZerado.Brush.Color
      else
      if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger < 0 ) then
        dbgDados.Canvas.Brush.Color := ShpLucroNegativo.Brush.Color;
    end;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeProduto.dbFabricanteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFabricante(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCODFABRICANTE.AsInteger  := iCodigo;
      IbDtstTabelaNOME_FABRICANTE.AsString := sNome;
    end;
end;

procedure TfrmGeProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if ( (ActiveControl = dbComporFaturamento) and GrpBxParametroProdudo.Enabled ) then
    begin
      if dbProdutoEhImobilizado.Enabled then
        dbProdutoEhImobilizado.SetFocus
      else
      if dbProdutoMovEstoque.Enabled then
        dbProdutoMovEstoque.SetFocus;
      Exit;
    end
    else
    if ( ((ActiveControl = dbComporFaturamento) or (ActiveControl = dbProdutoPorLote)) and tbsCustoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsCustoVeiculo;
      dbValorCompraVeiculo.SetFocus;
      Exit;
    end
    else
    if ( ((ActiveControl = dbComporFaturamento) or (ActiveControl = dbProdutoPorLote)) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbProdutoMovEstoque) and (dbProdutoMovEstoque.Checked and (not dbProdutoPorLote.Enabled)) ) then
    begin
      dbProdutoPorLote.Enabled := True;
      dbProdutoPorLote.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbProdutoMovEstoque) and ((not dbProdutoMovEstoque.Checked) or (not dbProdutoPorLote.Enabled)) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbValorRetornoVeiculo) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbAliquotaCOFINS) and TbsEspecificacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := TbsEspecificacao;
      if pnlVeiculo.Visible then
        dbTipoVeiculo.SetFocus
      else
        dbPesoBruto.SetFocus;  
      Exit;
    end
    else
    if ( (ActiveControl = dbKilometragem) and tbsHistoricoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsHistoricoVeiculo;
      dbSituacaoVeiculo.SetFocus;
      Exit;
    end;

  inherited;

end;

procedure TfrmGeProduto.chkProdutoComEstoqueClick(Sender: TObject);
begin
  if ( Showing and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible and edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TfrmGeProduto.ControleCampos;
begin
  GrpBxParametroProdudo.Enabled := (TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taICMS);
end;

procedure TfrmGeProduto.btnFiltrarClick(Sender: TObject);
begin
  if not GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa) then
    WhereAdditional := '(p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')'
  else
    WhereAdditional := '(1 = 1)';

  if fApenasProdutos then
    WhereAdditional := WhereAdditional + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taICMS)) + ')'
  else
  if fApenasServicos then
    WhereAdditional := WhereAdditional + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taISS)) + ')';

  if chkProdutoComEstoque.Visible then
    if chkProdutoComEstoque.Checked then
      WhereAdditional := WhereAdditional + ' and ((p.Qtde > 0) or (p.Aliquota_tipo = 1))';

  // inherited;
  FiltarDados(CmbBxFiltrarTipo.ItemIndex);
end;

procedure TfrmGeProduto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if ( Field = IbDtstTabelaALIQUOTA_TIPO ) then
    begin
      if (TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taISS) then
      begin
        IbDtstTabelaPRODUTO_NOVO.AsInteger        := 0;
        IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger   := 0;
        IbDtstTabelaPRODUTO_IMOBILIZADO.AsInteger := 0;
        IbDtstTabelaESTOQUE_APROP_LOTE.AsInteger  := 0;
      end
      else
        IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger := 1;

      GrpBxParametroProdudo.Enabled := (TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taICMS);
    end;

    if ( Field = IbDtstTabelaPERCENTUAL_MARCKUP ) then
      IbDtstTabelaPERCENTUAL_MARGEM.AsCurrency := IbDtstTabelaPERCENTUAL_MARCKUP.AsCurrency;

    if ( Field = IbDtstTabelaPERCENTUAL_MARGEM ) then
      IbDtstTabelaPRECO_SUGERIDO.AsCurrency := IbDtstTabelaCUSTOMEDIO.AsCurrency +
        (IbDtstTabelaCUSTOMEDIO.AsCurrency * IbDtstTabelaPERCENTUAL_MARGEM.AsCurrency / 100);

    if ( Field = IbDtstTabelaMOVIMENTA_ESTOQUE ) then
      dbProdutoPorLote.Enabled := (IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger = 1);
  end;
end;

procedure TfrmGeProduto.FiltarDados(const iTipoPesquisa : Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descri��o n�o foram informados');
      Abort;
    end;

    with IbDtstTabela, SelectSQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        Case iTipoPesquisa of
          // Por C�digo, Descri��o
          0:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') +
                   '    or upper(p.metafonema) like ' + QuotedStr(Metafonema(edtFiltrar.Text) + '%') + ')');

          // Por Refer�ncia
          1:
            Add( 'where p.Referencia = ' + QuotedStr(Trim(edtFiltrar.Text)) );

          // Por Fabricante
          2:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where p.Codfabricante = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(f.Nome) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );

          // Por Grupo
          3:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where p.Codgrupo = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(g.Descri) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );
        end;

      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SelectSQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try
      
        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('N�o existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + IbDtstTabela.SelectSQL.Text);
  end;
end;

procedure TfrmGeProduto.dbUnidadeFracaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
    begin
      IbDtstTabelaCODUNIDADE_FRACIONADA.AsInteger := iCodigo;
      IbDtstTabelaDESCRICAO_UNIDADE_FRAC.AsString := sDescricao;
      IbDtstTabelaUNP_SIGLA_FRAC.AsString         := sSigla;
    end;
end;

procedure TfrmGeProduto.btbtnSalvarClick(Sender: TObject);
begin
  // Valida��es de Dados

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if (IbDtstTabelaTABELA_IBPT.AsInteger = 0) then
      IbDtstTabelaTABELA_IBPT.Clear;

    //if ( Length(Trim(IbDtstTabelaNCM_SH.AsString)) < STR_TAMANHO_NCMSH ) then
    //begin
    //  ShowWarning('Favor informar um c�digo v�lido para o campo "NCM/SH"!');
    //  Exit;
    //end
    //else
    if ( IbDtstTabelaFRACIONADOR.AsInteger = 1 ) then
    begin
      if ( IbDtstTabelaCODUNIDADE.AsInteger <> IbDtstTabelaCODUNIDADE_FRACIONADA.AsInteger ) then
      begin
        ShowWarning('A "Unidade da Fra��o" selecionada deve ser igual a informada no campo "Unidade"!');
        Exit;
      end;
    end
    else
    if ( IbDtstTabelaFRACIONADOR.AsInteger > 1 ) then
    begin
      if ( IbDtstTabelaCODUNIDADE.AsInteger = IbDtstTabelaCODUNIDADE_FRACIONADA.AsInteger ) then
      begin
        ShowWarning('A "Unidade da Fra��o" selecionada deve ser diferente na informada no campo "Unidade"!');
        Exit;
      end;
    end;

    if (TAliquota(IbDtstTabelaALIQUOTA_TIPO.AsInteger) = taISS) then
    begin
      IbDtstTabelaPRODUTO_NOVO.AsInteger        := 0;
      IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger   := 0;
      IbDtstTabelaPRODUTO_IMOBILIZADO.AsInteger := 0;
      IbDtstTabelaESTOQUE_APROP_LOTE.AsInteger  := 0;
    end
    else
    if (IbDtstTabelaMOVIMENTA_ESTOQUE.AsInteger = 0) then
      IbDtstTabelaESTOQUE_APROP_LOTE.AsInteger  := 0;
  end;

  inherited;
end;

procedure TfrmGeProduto.ppMnAtualizarMetafonemaClick(Sender: TObject);
var
  sUpdate : String;
begin
  if IbDtstTabela.IsEmpty then
    Exit;

  IbDtstTabela.First;
  IbDtstTabela.DisableControls;
  Screen.Cursor := crSQLWait;
  try
    while not IbDtstTabela.Eof do
    begin
      sUpdate := 'Update TBPRODUTO Set metafonema = %s where cod = %s';
      sUpdate := Format(sUpdate, [
        QuotedStr(Metafonema(IbDtstTabelaDESCRI_APRESENTACAO.AsString)),
        QuotedStr(IbDtstTabelaCOD.AsString)]);
      ExecuteScriptSQL( sUpdate );

      IbDtstTabela.Next;
    end;
  finally
    IbDtstTabela.First;
    IbDtstTabela.EnableControls;
    Screen.Cursor := crDefault;

    ShowInformation('Atualiza��o', 'C�digo metaf�nico dos registros atualizados com sucesso!');
  end;
end;

procedure TfrmGeProduto.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

end.
