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
  ComCtrls;

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
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    btbtnCancelar: TcxButton;
    btbtnSalvar: TcxButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
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
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeInventario', TfrmGeInventario);

end.
 