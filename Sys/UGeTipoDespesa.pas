unit UGeTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeTipoDespesa = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaTIPODESP: TIBStringField;
    IbDtstTabelaTIPO_PARTICULAR: TSmallintField;
    dbTipoParticular: TDBCheckBox;
    IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeTipoDespesa: TfrmGeTipoDespesa;

  procedure MostrarTipoDespesas(const AOwner : TComponent);
  function SelecionarTipoDespesa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTipoDespesas(const AOwner : TComponent);
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoDespesa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_TIPO_DESPESA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##00';
  NomeTabela     := 'TBTPDESPESA';
  CampoCodigo    := 'COD';
  CampoDescricao := 'TIPODESP';
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value                 := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaTIPO_PARTICULAR.AsInteger := 0;
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaTIPO_PARTICULAR_DESC.AsString := IfThen(IbDtstTabelaTIPO_PARTICULAR.AsInteger = 1, 'S', EmptyStr);
end;

initialization
  FormFunction.RegisterForm('frmGeTipoDespesa', TfrmGeTipoDespesa);

end.