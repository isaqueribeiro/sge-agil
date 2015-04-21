unit UGeVendaDevolucaoNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxButtons, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, JvExMask, JvToolEdit, JvDBControls,
  IBX.IBTable;

type
  TfrmGeVendaDevolucaoNF = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    Bevel1: TBevel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    cdsVenda: TIBDataSet;
    updVenda: TIBUpdateSQL;
    dtsVenda: TDataSource;
    lblCompra: TLabel;
    dbCompra: TJvDBComboEdit;
    tblFormaDevolucao: TIBTable;
    dtsFormaDevolucao: TDataSource;
    dbFormaDevolucao: TDBLookupComboBox;
    lblFormaDevolucao: TLabel;
    GrpBxDados: TGroupBox;
    lblNFeChave: TLabel;
    dbNFeChave: TDBEdit;
    lblNFSerie: TLabel;
    dbNFSerie: TDBEdit;
    lblNF: TLabel;
    lblNFNumero: TLabel;
    dbNFNumero: TDBEdit;
    lblNFModelo: TLabel;
    dbNFModelo: TDBEdit;
    lblNFe: TLabel;
    tblUF: TIBTable;
    dtsUF: TDataSource;
    lblNFUF: TLabel;
    dbNFUF: TDBLookupComboBox;
    qryCompetencia: TIBDataSet;
    dtsCompetencia: TDataSource;
    lblNFCompetencia: TLabel;
    dbNFCompetencia: TDBLookupComboBox;
    lblNFCnpjCpf: TLabel;
    dbNFCnpjCpf: TDBEdit;
    lblCupomFiscal: TLabel;
    lblCPModelo: TLabel;
    dbCPModelo: TDBLookupComboBox;
    lblCPNumeroECF: TLabel;
    dbCPNumeroECF: TDBEdit;
    lblCPNumeroCOO: TLabel;
    dbCPNumeroCOO: TDBEdit;
    lblNFIE: TLabel;
    dbNFIE: TDBEdit;
    tblModeloCupom: TIBTable;
    dtsModeloCupom: TDataSource;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaCODEMP: TIBStringField;
    cdsVendaDNFE_COMPRA_ANO: TSmallintField;
    cdsVendaDNFE_COMPRA_COD: TIntegerField;
    cdsVendaDNFE_FORMA: TSmallintField;
    cdsVendaDNFE_CHAVE: TIBStringField;
    cdsVendaDNFE_UF: TIBStringField;
    cdsVendaDNFE_CNPJ_CPF: TIBStringField;
    cdsVendaDNFE_IE: TIBStringField;
    cdsVendaDNFE_COMPETENCIA: TIBStringField;
    cdsVendaDNFE_SERIE: TIBStringField;
    cdsVendaDNFE_NUMERO: TIntegerField;
    cdsVendaDNFE_MODELO: TSmallintField;
    cdsVendaDECF_MODELO: TSmallintField;
    cdsVendaDECF_NUMERO: TIntegerField;
    cdsVendaDECF_COO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cdsVendaCODCONTROLGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsVendaDNFE_COMPRA_CODGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtsVendaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  AForm : TfrmGeVendaDevolucaoNF;
begin
  AForm := TfrmGeVendaDevolucaoNF.Create(AOwer);
  try
    with AForm do
    begin
      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsShort   := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      if not cdsVenda.IsEmpty then
      begin
        cdsVenda.Edit;
        if cdsVendaDNFE_FORMA.IsNull then
          cdsVendaDNFE_FORMA.AsInteger := Ord(fdNFeEletronica);
      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeVendaDevolucaoNF.cdsVendaCODCONTROLGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := cdsVendaANO.AsString + '/' + FormatFloat('0000000', Sender.AsInteger);
end;

procedure TfrmGeVendaDevolucaoNF.cdsVendaDNFE_COMPRA_CODGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := cdsVendaDNFE_COMPRA_ANO.AsString + '/' + FormatFloat('0000000', Sender.AsInteger);
end;

procedure TfrmGeVendaDevolucaoNF.dtsVendaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = dbFormaDevolucao.Field ) then
  begin
    // Títulos principais
    lblNFe.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);
    lblNF.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblCupomFiscal.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    // Campos

  end;
end;

procedure TfrmGeVendaDevolucaoNF.FormCreate(Sender: TObject);
begin
  inherited;
  tblFormaDevolucao.Open;
  tblUF.Open;
  qryCompetencia.Open;
  tblModeloCupom.Open;
end;

procedure TfrmGeVendaDevolucaoNF.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeVendaDevolucaoNF', TfrmGeVendaDevolucaoNF);

end.
