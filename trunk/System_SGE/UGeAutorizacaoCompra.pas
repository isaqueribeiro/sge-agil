unit UGeAutorizacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfrmGeAutorizacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusAutorizacao: TRadioGroup;
    lblAutorizacaoAberta: TLabel;
    lblAutorizacaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    lblFornecedor: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    Bevel12: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirAutorizacao: TMenuItem;
    qryProduto: TIBDataSet;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsFormaPagto: TTabSheet;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaEMISSAO_DATA: TDateField;
    IbDtstTabelaEMISSAO_USUARIO: TIBStringField;
    IbDtstTabelaVALIDADE: TDateField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaMOVITO: TMemoField;
    IbDtstTabelaOBSERVACAO: TMemoField;
    IbDtstTabelaENDERECO_ENTREGA: TMemoField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaRECEBEDOR_NOME: TIBStringField;
    IbDtstTabelaRECEBEDOR_CPF: TIBStringField;
    IbDtstTabelaRECEBEDOR_FUNCAO: TIBStringField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaCONDICAO_PAGTO: TSmallintField;
    IbDtstTabelaVALOR_BRUTO: TIBBCDField;
    IbDtstTabelaVALOR_DESCONTO: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL: TIBBCDField;
    IbDtstTabelaAUTORIZADO_DATA: TDateField;
    IbDtstTabelaDATA_FATURA: TDateField;
    IbDtstTabelaAUTORIZADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_DATA: TDateField;
    IbDtstTabelaCANCELADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_MOTIVO: TMemoField;
    IbDtstTabelaITENS: TIntegerField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    tblTipoAutorizacao: TIBTable;
    dtsTipoAutorizacao: TDataSource;
    lblDataValidade: TLabel;
    GrpBxPagamento: TGroupBox;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensEMPRESA: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensFORNECEDOR: TIntegerField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensVALOR_UNITARIO: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL: TIBBCDField;
    cdsTabelaItensCONFIRMADO_RECEBIMENTO: TSmallintField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    cdsTabelaItensUSUARIO: TIBStringField;
    lblTotalDesconto: TLabel;
    dbTotalDesconto: TDBEdit;
    dbTotalLiquido: TDBEdit;
    lblTotalLiquido: TLabel;
    IbDtstTabelaTRANSPORTADOR: TIntegerField;
    IbDtstTabelaVALOR_TOTAL_FRETE: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL_IPI: TIBBCDField;
    IbDtstTabelaTRANSPORTADOR_NOME: TIBStringField;
    IbDtstTabelaTRANSPORTADOR_CPF_CNPJ: TIBStringField;
    lblTotalFrete: TLabel;
    dbTotalFrete: TDBEdit;
    lblTotalIPI: TLabel;
    dbTotalIPI: TDBEdit;
    lblValorTotalIPI: TLabel;
    dbValorTotalIPI: TDBEdit;
    cdsTabelaItensIPI_PERCENTUAL: TIBBCDField;
    cdsTabelaItensIPI_VALOR_TOTAL: TIBBCDField;
    lblPercentualIPI: TLabel;
    dbPercentualIPI: TDBEdit;
    lblTotalBruto: TLabel;
    dbTotalBruto: TDBEdit;
    tbsRetirada: TTabSheet;
    GrpBxRetirada: TGroupBox;
    lblRecebedorNome: TLabel;
    lblRecebedorCPF: TLabel;
    lblRecebedorFuncao: TLabel;
    lblTransportador: TLabel;
    dbRecebedorNome: TDBEdit;
    dbRecebedorCPF: TDBEdit;
    dbRecebedorFuncao: TDBEdit;
    dbTransportador: TDBLookupComboBox;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
    cdsTransportador: TIBDataSet;
    dtsTransportador: TDataSource;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    IbDtstTabelaNOME_CONTATO: TIBStringField;
    lblAutorizacaoEmEdicao: TLabel;
    PgcTextoAutorizacao: TPageControl;
    TbsAutorizacaoMotivo: TTabSheet;
    TbsAutorizacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    dbMotivo: TDBMemo;
    IbDtstTabelaCLIENTE: TIntegerField;
    lblCliente: TLabel;
    IbDtstTabelaNOMECLIENTE: TIBStringField;
    TbsAutorizacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    IbDtstTabelaFATURAMENTO_MINIMO: TIBBCDField;
    lblCentroCusto: TLabel;
    IbDtstTabelaCENTRO_CUSTO: TIntegerField;
    IbDtstTabelaDESCRICAO_CENTRO_CUSTO: TIBStringField;
    btnFinalizarAutorizacao: TcxButton;
    btnAutorizarCompra: TcxButton;
    btnCancelarAutorizacao: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    dbFornecedor: TJvDBComboEdit;
    dbCliente: TJvDBComboEdit;
    dbCentroCusto: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaINSERCAO_DATAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btnAutorizarCompraClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirAutorizacaoClick(Sender: TObject);
    procedure btnCancelarAutorizacaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarAutorizacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbCentroCustoButtonClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iTipoAutorizacao : Integer;
    iFornecedor : Integer;
    procedure AbrirTabelaItens(const AnoAutorizacao : Smallint; const CodigoAutorizacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarAutorizacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarAutorizacaoID : String read GetRotinaCancelarAutorizacaoID;
  end;

var
  frmGeAutorizacaoCompra: TfrmGeAutorizacaoCompra;

  procedure MostrarControleAutorizacao(const AOwner : TComponent);

  function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;
  function SelecionarAutorizacaoParaApropriacao(const AOwner : TComponent; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeFornecedor, UGeProduto, UGeAutorizacaoCompraCancelar, UGeCliente,
  UGeCentroCusto;

{$R *.dfm}

procedure MostrarControleAutorizacao(const AOwner : TComponent);
var
  frm : TfrmGeAutorizacaoCompra;
  whr : String;
begin
  frm := TfrmGeAutorizacaoCompra.Create(AOwner);
  try
    whr := 'cast(a.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusAutorizacao.ItemIndex > 0) then
      whr := whr + ' and (a.status = ' + IntToStr(frm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeAutorizacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeAutorizacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarAutorizacao.Visible := False;
    frm.btnAutorizarCompra.Visible      := False;
    frm.btnCancelarAutorizacao.Visible  := False;

    frm.RdgStatusAutorizacao.ItemIndex := STATUS_AUTORIZACAO_AUT + 1;

    for I := 0 to frm.RdgStatusAutorizacao.Items.Count - 1 do
      frm.RdgStatusAutorizacao.Controls[I].Enabled := False;

    frm.iFornecedor := Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := '(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(a.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusAutorizacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (a.status = ' + IntToStr(frm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.IbDtstTabelaANO.AsInteger;
      Codigo  := frm.IbDtstTabelaCODIGO.AsInteger;
      Empresa := frm.IbDtstTabelaEMPRESA.AsString;
    end;
  finally
    frm.Destroy;
  end;

end;

function SelecionarAutorizacaoParaApropriacao(const AOwner : TComponent; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeAutorizacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeAutorizacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarAutorizacao.Visible := False;
    frm.btnAutorizarCompra.Visible      := False;
    frm.btnCancelarAutorizacao.Visible  := False;

    frm.RdgStatusAutorizacao.ItemIndex := STATUS_AUTORIZACAO_AUT + 1;

    for I := 0 to frm.RdgStatusAutorizacao.Items.Count - 1 do
      frm.RdgStatusAutorizacao.Controls[I].Enabled := False;

    frm.iTipoAutorizacao := TIPO_AUTORIZACAO_COMPRA;
    frm.e1Data.Date      := DataInicial;
    frm.WhereAdditional  := '(a.tipo in (' + IntToStr(TIPO_AUTORIZACAO_COMPRA) + ', ' + IntToStr(TIPO_AUTORIZACAO_COMPRA_SERVICO) + ')) and ' +
            'cast(a.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusAutorizacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (a.status = ' + IntToStr(frm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.IbDtstTabelaANO.AsInteger;
      Codigo  := frm.IbDtstTabelaCODIGO.AsInteger;
      Empresa := frm.IbDtstTabelaEMPRESA.AsString;
    end;
  finally
    frm.Destroy;
  end;

end;

procedure TfrmGeAutorizacaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_AUTORIZA_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'codigo';

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iTipoAutorizacao := -1;
  iFornecedor      := 0;

  tblEmpresa.Open;
  tblTipoAutorizacao.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  cdsTransportador.Open;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_AUTORIZACAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBAUTORIZA_COMPRA';
  CampoCodigo    := 'a.codigo';
  CampoDescricao := 'f.nomeforn';
  CampoOrdenacao := 'a.emissao_data, f.nomeforn';

  WhereAdditional :=  'cast(a.emissao_data as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );

  lblCliente.Visible := GetAutorizacaoInformarCliente( GetEmpresaIDDefault );
  dbCliente.Visible  := lblCliente.Visible;
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value          := GetEmpresaIDDefault;
  IbDtstTabelaTIPO.Value             := TIPO_AUTORIZACAO_COMPRA;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateTimeDB;
  IbDtstTabelaEMISSAO_DATA.Value     := GetDateDB;
  IbDtstTabelaEMISSAO_USUARIO.Value  := GetUserApp;
  IbDtstTabelaVALIDADE.Value         := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(IbDtstTabelaEMPRESA.AsString);
  IbDtstTabelaSTATUS.AsInteger       := STATUS_AUTORIZACAO_EDC;

  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAO_PAGTO.Value := GetCondicaoPagtoIDDefault;

  IbDtstTabelaVALOR_TOTAL_FRETE.AsCurrency := 0.0;
  IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency   := 0.0;
  IbDtstTabelaVALOR_DESCONTO.AsCurrency    := 0.0;

  IbDtstTabelaFORNECEDOR.Clear;
  IbDtstTabelaNOMEFORN.Clear;
  IbDtstTabelaTRANSPORTADOR.Clear;
  IbDtstTabelaRECEBEDOR_NOME.Clear;
  IbDtstTabelaRECEBEDOR_FUNCAO.Clear;
  IbDtstTabelaRECEBEDOR_CPF.Clear;
  IbDtstTabelaAUTORIZADO_DATA.Clear;
  IbDtstTabelaAUTORIZADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_DATA.Clear;
  IbDtstTabelaCANCELADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_MOTIVO.Clear;
  IbDtstTabelaCLIENTE.Clear;
  IbDtstTabelaCENTRO_CUSTO.Clear;
end;

procedure TfrmGeAutorizacaoCompra.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger    := iAno;
    IbDtstTabelaCODIGO.AsInteger := iNum;
    IbDtstTabelaNUMERO.AsString  := FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  end;
end;

procedure TfrmGeAutorizacaoCompra.AbrirTabelaItens(
  const AnoAutorizacao: Smallint; const CodigoAutorizacao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoAutorizacao));
    Add('  and i.codigo = ' + IntToStr(CodigoAutorizacao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeAutorizacaoCompra.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarAutorizacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_EDC) and (not cdsTabelaItens.IsEmpty);
    btnAutorizarCompra.Enabled      := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarAutorizacao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_AUT);

    nmImprimirAutorizacao.Enabled   := (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_AUT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_FAT);
  end
  else
  begin
    btnFinalizarAutorizacao.Enabled := False;
    btnAutorizarCompra.Enabled      := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarAutorizacao.Enabled  := False;

    nmImprimirAutorizacao.Enabled   := (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_AUT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_FAT);
  end;
end;

procedure TfrmGeAutorizacaoCompra.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCODIGO.AsInteger;

    if ( not IbDtstTabelaEMISSAO_DATA.IsNull ) then
    begin
      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;

      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeAutorizacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_AUTORIZACAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_AUTORIZACAO_AUT : sMsg := 'Esta autoriza��o n�o pode ser alterada porque j� est� autorizada.';
      STATUS_AUTORIZACAO_FAT : sMsg := 'Esta autoriza��o n�o pode ser alterada porque j� est� faturada.';
      STATUS_AUTORIZACAO_CAN : sMsg := 'Esta autoriza��o n�o pode ser alterada porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR) then
      if not ShowConfirm('A edi��o da autoriza��o selecionada est� finalizada.' + #13 + 'Deseja coloc�-la em edi��o novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.Value := STATUS_AUTORIZACAO_EDC;
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;
  end;
end;

procedure TfrmGeAutorizacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_AUTORIZACAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_AUTORIZACAO_AUT : sMsg := 'Esta autoriza��o n�o pode ser alterada porque j� est� autorizada.';
      STATUS_AUTORIZACAO_FAT : sMsg := 'Esta autoriza��o n�o pode ser alterada porque j� est� faturada.';
      STATUS_AUTORIZACAO_CAN : sMsg := 'Esta autoriza��o n�o pode ser alterada porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  end;
end;

procedure TfrmGeAutorizacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeAutorizacaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( IbDtstTabelaFORNECEDOR.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o fornecedor para a autoriza��o!');
    dbFornecedor.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeAutorizacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeAutorizacaoCompra.btnProdutoExcluirClick(Sender: TObject);
(*
  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;
*)
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cDescontos, cTotalLiquido);

      IbDtstTabelaDESCONTO.AsCurrency   := cDescontos;
      IbDtstTabelaTOTALVENDA.AsCurrency := cTotalLiquido;

      if ( IbDtstTabelaDESCONTO.AsCurrency < 0 ) then
        IbDtstTabelaDESCONTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTALVENDA.AsCurrency < 0 ) then
        IbDtstTabelaTOTALVENDA.AsCurrency := 0;
*)
    end;
end;

procedure TfrmGeAutorizacaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensSEQ.AsInteger;

    Total_Bruto    := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    Total_Desconto := IbDtstTabelaVALOR_DESCONTO.AsCurrency;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto := Total_Bruto + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      Total_IPI   := Total_IPI   + cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalFrete   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o c�digo do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensVALOR_UNITARIO.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor Unit�rio inv�lido.');
      dbValorUn.SetFocus;
    end
    else
    if ( (cdsTabelaItensIPI_PERCENTUAL.AsCurrency < 0) or (cdsTabelaItensIPI_PERCENTUAL.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual do IPI inv�lido.');
      dbPercentualIPI.Field.AsCurrency := 0.0;
      dbPercentualIPI.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      IbDtstTabelaVALOR_BRUTO.AsCurrency     := cTotalBruto;
      IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency := cTotalIPI;
      IbDtstTabelaVALOR_DESCONTO.AsCurrency  := cTotalDesconto;
      IbDtstTabelaVALOR_TOTAL.AsCurrency     := cTotalLiquido;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeAutorizacaoCompra.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODIGO.Value     := IbDtstTabelaCODIGO.Value;
  cdsTabelaItensEMPRESA.Value    := IbDtstTabelaEMPRESA.Value;
  cdsTabelaItensFORNECEDOR.Value := IbDtstTabelaFORNECEDOR.Value;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensCONFIRMADO_RECEBIMENTO.Value := 0;
  cdsTabelaItensVALOR_UNITARIO.AsCurrency    := 0.0;
  cdsTabelaItensIPI_PERCENTUAL.AsCurrency    := 0.0;
  cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency   := 0.0;
  cdsTabelaItensUSUARIO.Value                := GetUserApp;
  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
end;

procedure TfrmGeAutorizacaoCompra.btnAutorizarCompraClick(
  Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_AUT) then
  begin
    ShowWarning('A Autoriza��o j� foi realizada!');
    Abort;
  end;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

  if ( IbDtstTabelaVALOR_TOTAL.AsCurrency <> cTotalLiquido ) then
  begin
    ShowWarning('A soma dos valores totais dos itens (' +
      FormatFloat('"R$ ",0.00', cTotalLiquido) +
      ') n�o confere com o Valor Total da Autoriza��o.' + #13#13 +
      'Favor excute os seguintes procedimentos:' + #13 +
      '1. Altere o registro para corre��o.'      + #13 +
      '2. Salve a altera��o realizada.'          + #13 +
      '3. Finalize-o novamente.');
    Abort;
  end;

  if ( ShowConfirm('Confirma a autoriza��o do registro selecionado?') ) then
  begin
    if ( cTotalLiquido < IbDtstTabelaFATURAMENTO_MINIMO.AsCurrency ) then
    begin
      ShowWarning(Format('O Faturamento M�nimo (%s) deste fornecedor n�o permite que essa autoriza��o de compra/servi�o seja autorizada!',
        [FormatFloat('"R$ ",0.00', IbDtstTabelaFATURAMENTO_MINIMO.AsCurrency)]));
      Exit;
    end;

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value             := STATUS_AUTORIZACAO_AUT;
    IbDtstTabelaAUTORIZADO_DATA.Value    := GetDateDB;
    IbDtstTabelaAUTORIZADO_USUARIO.Value := GetUserApp;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Autoriza��o realizada com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusAutorizacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeAutorizacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoAutorizacao.ActivePage := TbsAutorizacaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_AUTORIZACAO_AUT );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeAutorizacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (cdsTabelaItens.State in [dsEdit, dsInsert]);

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeAutorizacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  pgcMaisDados.ActivePage := tbsFormaPagto;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeAutorizacaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    IfThen(iTipoAutorizacao = -1, '',
      IfThen(iTipoAutorizacao = TIPO_AUTORIZACAO_SERVICO,
        '(a.tipo = ' + IntToStr(TIPO_AUTORIZACAO_SERVICO) + ') and ',
        '(a.tipo in (' + IntToStr(TIPO_AUTORIZACAO_COMPRA) + ', ' + IntToStr(TIPO_AUTORIZACAO_COMPRA_SERVICO) + ')) and ')) +
    IfThen(iFornecedor = 0, '', '(a.fornecedor = ' + IntToStr(iFornecedor) + ') and ') +
    'cast(a.emissao_data as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusAutorizacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (a.status = ' + IntToStr(RdgStatusAutorizacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeAutorizacaoCompra.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaFORNECEDOR.AsInteger := iCodigo;
      IbDtstTabelaNOMEFORN.AsString    := sNome;
    end;
end;

procedure TfrmGeAutorizacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o c�digo do produto');
    Exit;
  end;

  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensPRODUTO.AsString             := FieldByName('cod').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGeAutorizacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autoriza��o.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar altera��o em andamento no �tem da autoriza��o!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger);

    if GetExisteNumeroAutorizacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('N�mero de autoriza��o j� existe!');
      Abort;
    end;

    IbDtstTabelaMOVITO.AsString     := Trim(AnsiUpperCase(IbDtstTabelaMOVITO.AsString));
    IbDtstTabelaOBSERVACAO.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACAO.AsString));
    IbDtstTabelaENDERECO_ENTREGA.AsString := Trim(AnsiUpperCase(IbDtstTabelaENDERECO_ENTREGA.AsString));

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens da Base

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCODIGO.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(GetCampoCodigoLimpo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeAutorizacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      IbDtstTabelaVALIDADE.Value := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(IbDtstTabelaEMPRESA.AsString);

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) or (Sender = dbPercentualIPI) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_TOTAL.AsCurrency     := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO.AsCurrency;
      cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency := (cdsTabelaItensVALOR_TOTAL.AsCurrency * cdsTabelaItensIPI_PERCENTUAL.AsCurrency) / 100;
    end;

  if ( Sender = dbValorTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeAutorizacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeAutorizacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;                            
  if ( Sender = dbgDados ) then
  begin
    // Destacar autoriza��o em edi��o
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblAutorizacaoEmEdicao.Color
    else
    // Destacar autoriza��o aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblAutorizacaoAberta.Font.Color
    else
    // Destacar autoriza��o cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblAutorizacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos n�o confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
      dbgProdutos.Canvas.Font.Color := lblAutorizacaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeAutorizacaoCompra.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo    ,
  iCFOP_CNAE ,
  iUnidade   : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorVenda,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    ,
  cValorCusto   : Currency;
begin
  if ( IbDtstTabelaFORNECEDOR.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o fornecedor para a autoriza��o!');
    dbFornecedor.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case IbDtstTabelaTIPO.AsInteger of
      TIPO_AUTORIZACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
                          iEstoque, iReserva);

      TIPO_AUTORIZACAO_SERVICO:
        bSelecionado := SelecionarServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao);

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString             := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString           := sUnidade;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;
    
  end;
end;

procedure TfrmGeAutorizacaoCompra.nmImprimirAutorizacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetFornecedorEmail(IbDtstTabelaFORNECEDOR.AsInteger), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryFornecedorDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaFORNECEDOR.AsInteger;
      Open;
    end;

    with qryAutorizacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCODIGO.AsInteger;
      Open;
    end;

    frrAutorizacaoCompra.ShowReport;
  end;
end;

procedure TfrmGeAutorizacaoCompra.btnCancelarAutorizacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_CAN) then
  begin
    ShowWarning('Lan�amento de Autoriza��o j� est� cancelado!');
    Abort;
  end;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_AUTORIZACAO_AUT ) then
    ShowInformation('Apenas registros autorizados podem ser cancelados!')
  else
  if ( CancelarAUT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODIGO.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Autoriza��o cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_AUTORIZACAO_EDC : Text := 'Em Edi��o';
    STATUS_AUTORIZACAO_ABR : Text := 'Aberta';
    STATUS_AUTORIZACAO_AUT : Text := 'Autorizada';
    STATUS_AUTORIZACAO_FAT : Text := 'Faturada';
    STATUS_AUTORIZACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeAutorizacaoCompra.btnFinalizarAutorizacaoClick(
  Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR) then
  begin
    ShowWarning('Lan�amento de Autoriza��o j� est� finalizado!');
    Abort;
  end;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ShowConfirm('Confirma a finaliza��o da edi��o do autoriza��o?') then
  begin
    ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

    if ( cTotalLiquido < IbDtstTabelaFATURAMENTO_MINIMO.AsCurrency ) then
    begin
      ShowWarning(Format('O Faturamento M�nimo (%s) deste fornecedor n�o permite que essa autoriza��o de compra/servi�o seja emitida!',
        [FormatFloat('"R$ ",0.00', IbDtstTabelaFATURAMENTO_MINIMO.AsCurrency)]) + #13 +
        'Apenas autoriza��es com valores iguais ou acima do faturamento m�nimo poder�o ser emitidas.');
      Exit;
    end;

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value               := STATUS_AUTORIZACAO_ABR;
    IbDtstTabelaVALOR_BRUTO.AsCurrency     := cTotalBruto;
    IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency := cTotalIPI;
    IbDtstTabelaVALOR_DESCONTO.AsCurrency  := cTotalDesconto;
    IbDtstTabelaVALOR_TOTAL.AsCurrency     := cTotalLiquido;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Autoriza��o finalizada com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusAutorizacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeAutorizacaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQUANTIDADE) or (Field = cdsTabelaItensVALOR_UNITARIO) or (Field = cdsTabelaItensIPI_PERCENTUAL) ) then
    begin
      cdsTabelaItensVALOR_TOTAL.AsCurrency     := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO.AsCurrency;
      cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency := (cdsTabelaItensVALOR_TOTAL.AsCurrency * cdsTabelaItensIPI_PERCENTUAL.AsCurrency) / 100;
    end;
end;

procedure TfrmGeAutorizacaoCompra.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  { DONE -oIsaque -cAutorizacao : 22/05/2014 - Preenchimento autom�tico ENDERE�O DE ENTREGA E OBSERVA��ES no momento da inser��o }

  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
  begin
    if ( Field = IbDtstTabelaEMPRESA ) then
    begin
      if ( IbDtstTabela.State = dsInsert ) then
      begin
        IbDtstTabelaENDERECO_ENTREGA.AsString := GetEmpresaEndereco(IbDtstTabelaEMPRESA.AsString);
        IbDtstTabelaOBSERVACAO.AsString       := 'NF. EM NOME DA ' + GetEmpresaNomeDefault;
      end;
    end
    else
    if ( (Field = IbDtstTabelaVALOR_BRUTO) or (Field = IbDtstTabelaVALOR_TOTAL_FRETE) or (Field = IbDtstTabelaVALOR_DESCONTO) ) then
      IbDtstTabelaVALOR_TOTAL.AsCurrency :=
        (IbDtstTabelaVALOR_BRUTO.AsCurrency + IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency) - IbDtstTabelaVALOR_DESCONTO.AsCurrency;
  end;
end;

procedure TfrmGeAutorizacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    if (IbDtstTabela.State in [dsEdit, dsInsert])  then
    begin

      if dbNumero.Focused then
        if ( Length(Trim(dbNumero.Text)) > 0 ) then
          if GetExisteNumeroAutorizacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('N�mero de autoriza��o j� existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emiss�o da Autoriza��o }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emiss�o da autoriza��o est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( dbCliente.Focused ) then
      begin
        IbDtstTabelaCLIENTE.Clear;
        IbDtstTabelaNOMECLIENTE.Clear;
      end
      else
      if ( dbCentroCusto.Focused ) then
      begin
        IbDtstTabelaCENTRO_CUSTO.Clear;
        IbDtstTabelaDESCRICAO_CENTRO_CUSTO.Clear;
      end;
      
  end;

  inherited;
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_AUTORIZACAO_COMPRA :
        Text := 'Compra';

      TIPO_AUTORIZACAO_SERVICO:
        Text := 'Servi�o';

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        Text := 'Compra/Servi�o';
    end;
end;

function TfrmGeAutorizacaoCompra.GetRotinaAutorizarID: String;
begin
  Result := GetRotinaInternaID(btnAutorizarCompra);
end;

function TfrmGeAutorizacaoCompra.GetRotinaCancelarAutorizacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarAutorizacao);
end;

function TfrmGeAutorizacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarAutorizacao);
end;

procedure TfrmGeAutorizacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarAutorizacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarAutorizacao.Caption, RotinaID);

    if btnAutorizarCompra.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAutorizarID, btnAutorizarCompra.Caption, RotinaID);

    if btnCancelarAutorizacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarAutorizacaoID, btnCancelarAutorizacao.Caption, RotinaID);
  end;
end;

procedure TfrmGeAutorizacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeAutorizacaoCompra.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCLIENTE.AsInteger    := iCodigo;
      IbDtstTabelaNOMECLIENTE.AsString := sNome;
    end;
end;

procedure TfrmGeAutorizacaoCompra.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsAutorizacaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_CAN);
end;

procedure TfrmGeAutorizacaoCompra.ValidarToTais(var Total_Bruto, Total_IPI,
  Total_Desconto, Total_Liquido: Currency);
var
  Item : Integer;
begin
  Item := cdsTabelaItensSEQ.AsInteger;

  Total_Bruto    := 0.0;
  Total_IPI      := 0.0;
  Total_Liquido  := 0.0;
  Total_Desconto := IbDtstTabelaVALOR_DESCONTO.AsCurrency;

  cdsTabelaItens.First;

  try
    cdsTabelaItens.DisableControls;
    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto := Total_Bruto + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      Total_IPI   := Total_IPI   + cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_Desconto;
  finally
    cdsTabelaItens.Locate('SEQ', Item, []);
    cdsTabelaItens.EnableControls;
  end;
end;

procedure TfrmGeAutorizacaoCompra.dbCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarDepartamento(Self, IbDtstTabelaCLIENTE.AsInteger, IbDtstTabelaEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
    begin
      IbDtstTabelaCENTRO_CUSTO.AsInteger          := iCodigo;
      IbDtstTabelaDESCRICAO_CENTRO_CUSTO.AsString := sNome;
    end;
end;

initialization
  FormFunction.RegisterForm('frmGeAutorizacaoCompra', TfrmGeAutorizacaoCompra);

end.
