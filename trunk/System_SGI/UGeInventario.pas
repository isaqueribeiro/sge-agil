unit UGeInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  cxGroupBox, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, IBTable,
  rxToolEdit, RXDBCtrl, cxCheckBox, cxDBEdit, Menus, cxButtons, ToolWin,
  ComCtrls, IBUpdateSQL, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmGeInventario = class(TfrmGrPadrao)
    PnlTitulo: TPanel;
    ImgLogo: TImage;
    GrpBxFiltro: TcxGroupBox;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCentroCusto: TLabel;
    dbCentroCusto: TRxDBComboEdit;
    tblTipoInventario: TIBTable;
    dtsTipoInventario: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblDataApropriacao: TLabel;
    dbDataApropriacao: TDBDateEdit;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    dbUsuario: TDBEdit;
    lblUsuario: TLabel;
    dbProdutoNovo: TcxDBCheckBox;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    BtnImprimir: TcxButton;
    BtnAbrirInventario: TcxButton;
    BtnEncerrarInventario: TcxButton;
    BtnCancelarInventario: TcxButton;
    BtnCancelar: TcxButton;
    BtnSalvar: TcxButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    ppImpressao: TPopupMenu;
    nmImprimirConferenciaMC: TMenuItem;
    nmImprimirConferenciaCC: TMenuItem;
    N1: TMenuItem;
    nmImprimirInventarioLanc: TMenuItem;
    qryInventario: TIBDataSet;
    updInventario: TIBUpdateSQL;
    dtsInventario: TDataSource;
    qryProduto: TIBDataSet;
    BtnOpcao: TcxButton;
    Bevel4: TBevel;
    ppOpcoes: TPopupMenu;
    nmCarregarIA: TMenuItem;
    nmCarregarIE: TMenuItem;
    nmCarregarIC: TMenuItem;
    qryMaterial: TIBDataSet;
    updMaterial: TIBUpdateSQL;
    dtsMaterial: TDataSource;
    qryInventarioANO: TSmallintField;
    qryInventarioCONTROLE: TIntegerField;
    qryInventarioTIPO: TSmallintField;
    qryInventarioEMPRESA: TIBStringField;
    qryInventarioCENTRO_CUSTO: TIntegerField;
    qryInventarioCONFERIR_ESTOQUE_VENDA: TSmallintField;
    qryInventarioDATA: TDateField;
    qryInventarioCOMPETENCIA: TIntegerField;
    qryInventarioSTATUS: TSmallintField;
    qryInventarioOBS: TMemoField;
    qryInventarioINSERCAO_DATAHORA: TDateTimeField;
    qryInventarioINSERCAO_USUARIO: TIBStringField;
    qryInventarioFECH_DATAHORA: TDateTimeField;
    qryInventarioFECH_USUARIO: TIBStringField;
    qryInventarioCANCEL_DATAHORA: TDateTimeField;
    qryInventarioCANCEL_USUARIO: TIBStringField;
    qryInventarioCANCEL_MOVITO: TMemoField;
    qryInventarioBLOQUEAR_MOVIMENTO: TSmallintField;
    PnlMaterial: TPanel;
    PnlMaterialTitulo: TPanel;
    ImgMaterial: TImage;
    BtnConfirmarItem: TcxButton;
    BtnCancelarItem: TcxButton;
    dbgMat: TcxGrid;
    dbgMatTbl: TcxGridDBBandedTableView;
    dbgMatTblPRODUTO: TcxGridDBBandedColumn;
    dbgMatTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn;
    dbgMatLvl: TcxGridLevel;
    qryMaterialANO: TSmallintField;
    qryMaterialCONTROLE: TIntegerField;
    qryMaterialITEM: TIntegerField;
    qryMaterialPRODUTO: TIBStringField;
    qryMaterialQTDE: TIBBCDField;
    qryMaterialESTOQUE: TIBBCDField;
    qryMaterialFRACIONADOR: TIBBCDField;
    qryMaterialUNIDADE: TSmallintField;
    qryMaterialCUSTO: TIBBCDField;
    qryMaterialTOTAL: TIBBCDField;
    qryMaterialUSUARIO: TIBStringField;
    qryMaterialLOTE_CONFERIDO: TIBStringField;
    qryMaterialLOTE_RESULTADO: TIBStringField;
    qryMaterialDESCRI_APRESENTACAO: TIBStringField;
    qryMaterialUNP_DESCRICAO: TIBStringField;
    qryMaterialUNP_SIGLA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure nmCarregarIAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nmCarregarIEClick(Sender: TObject);
    procedure nmCarregarICClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;

    procedure CarregarInventario(Empresa : String; Ano, Codigo : Integer);
    procedure BloquearBotoes;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeInventario: TfrmGeInventario;

implementation

uses
  UDMBusiness, UFuncoes, UGeProduto,  DateUtils, UDMNFe, SysConst,  UConstantesDGE;

{$R *.dfm}

{ TfrmGrPadrao1 }

procedure TfrmGeInventario.CarregarInventario(Empresa: String; Ano,
  Codigo: Integer);
begin
  with qryInventario do
  begin
    Close;
    ParamByName('ano').AsInteger := Ano;
    ParamByName('cod').AsInteger := Codigo;
    ParamByName('emp').AsString  := Empresa;
    Open;
  end;

  with qryMaterial do
  begin
    Close;
    ParamByName('ano').AsInteger := qryInventarioANO.AsInteger;
    ParamByName('cod').AsInteger := qryInventarioCONTROLE.AsInteger;
    Open;
  end;

  BloquearBotoes;
end;

procedure TfrmGeInventario.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_INVENTARIO_ALMOX_' + FormatFloat('0000', YearOf(GetDateDB));

  inherited;

  RotinaID          := ROTINA_MOV_INVENTARIO_ESTOQU_ID;
  PnlTitulo.Caption := StringofChar(' ', 8)+ AnsiUpperCase(Self.Caption);

  tblEmpresa.Open;
  tblTipoInventario.Open;
end;

procedure TfrmGeInventario.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if BtnAbrirInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnAbrirInventario), BtnAbrirInventario.Caption, RotinaID);

    if BtnEncerrarInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnEncerrarInventario), BtnEncerrarInventario.Caption, RotinaID);

    if BtnCancelarInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnCancelarInventario), BtnCancelarInventario.Caption, RotinaID);

    if BtnImprimir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnImprimir), BtnImprimir.Caption, RotinaID);
  end;
end;

procedure TfrmGeInventario.nmCarregarIAClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status in (' + IntToStr(STATUS_INVENTARIO_ALMOX_EML) + ', ' + IntToStr(STATUS_INVENTARIO_ALMOX_EMC) + ')');
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if Sender = nmCarregarIA then
      if qryInventario.IsEmpty then
        ShowInformation('N�o existe invent�rio aberto para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.FormShow(Sender: TObject);
begin
  inherited;
  nmCarregarIAClick(Self);
end;

procedure TfrmGeInventario.nmCarregarIEClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status  = ' + IntToStr(STATUS_INVENTARIO_ALMOX_ENC));
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if qryInventario.IsEmpty then
      ShowInformation('N�o existe invent�rio encerrado para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.nmCarregarICClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status  = ' + IntToStr(STATUS_INVENTARIO_ALMOX_CAN));
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if qryInventario.IsEmpty then
      ShowInformation('N�o existe invent�rio cancelado para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.BloquearBotoes;
begin
  BtnOpcao.Enabled    := (not PnlMaterial.Visible);
  BtnCancelar.Enabled := (not PnlMaterial.Visible) and (qryInventario.State in [dsEdit, dsInsert]);
  BtnSalvar.Enabled   := (not PnlMaterial.Visible) and (qryInventario.State in [dsEdit, dsInsert]);
  BtnImprimir.Enabled := (not PnlMaterial.Visible) and (not (qryInventario.State in [dsEdit, dsInsert]));
  
  nmImprimirInventarioLanc := (not PnlMaterial.Visible) and (not (qryInventario.State in [dsEdit, dsInsert]));
end;

procedure TfrmGeInventario.BtnCancelarItemClick(Sender: TObject);
begin
  if (qryMaterial.State in [dsEdit, dsInsert]) then
    qryMaterial.Cancel;

  PnlMaterial.Visible := False;
  BloquearBotoes;  
end;

initialization
  FormFunction.RegisterForm('frmGeInventario', TfrmGeInventario);

end.
 