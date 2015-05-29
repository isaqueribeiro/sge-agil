unit UGeFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoCadastro, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.ImgList, IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmGeFuncionario = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    Bevel5: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeFuncionario: TfrmGeFuncionario;

implementation

uses
  UConstantesDGE, UDMBusiness, UGrPadrao,
  UGeBairro, UGeCidade, UGeDistrito, UGeEstado, UGeLogradouro;

{$R *.dfm}

initialization
  FormFunction.RegisterForm('frmGeFuncionario', TfrmGeFuncionario);

end.
