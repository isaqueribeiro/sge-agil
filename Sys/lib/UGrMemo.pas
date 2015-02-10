unit UGrMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, ToolWin, ComCtrls;

type
  TfrmGrMemo = class(TfrmGrPadrao)
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    BtnConfirmar: TcxButton;
    bvlTool4: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    BtnCancelar: TcxButton;
    edObservacao: TMemo;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;

implementation

uses
  UDMBusiness;

{$R *.dfm}

function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;
var
  AForm : TfrmGrMemo;
begin
  AForm := TfrmGrMemo.Create(AOnwer);
  try
    AForm.Caption := 'Observações:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.Lines.AddStrings( sObservacao );

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sObservacao.Clear;
      sObservacao.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGrMemo.BtnConfirmarClick(Sender: TObject);
begin
  if Trim(edObservacao.Lines.Text) = EmptyStr then
    ShowWarning('Favor informar texto!')
  else
    ModalResult := mrOk;  
end;

procedure TfrmGrMemo.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrMemo.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
