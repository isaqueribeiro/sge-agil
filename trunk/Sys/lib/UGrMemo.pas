unit UGrMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, ToolWin, ComCtrls;

type
  TfrmGrMemo = class(TfrmGrPadrao)
    Bevel1: TBevel;
    Bevel3: TBevel;
    edObservacao: TMemo;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    BtnConfirmar: TcxButton;
    bvlTool4: TBevel;
    BtnCancelar: TcxButton;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;
  function SetMemoMotivo(const AOnwer : TComponent; var sMotivo : TStringList) : Boolean;

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
    AForm.Caption := 'Observa��es:';
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

function SetMemoMotivo(const AOnwer : TComponent; var sMotivo : TStringList) : Boolean;
var
  AForm : TfrmGrMemo;
begin
  AForm := TfrmGrMemo.Create(AOnwer);
  try
    AForm.Caption := 'Motivo:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.Lines.AddStrings( sMotivo );

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sMotivo.Clear;
      sMotivo.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGrMemo.BtnConfirmarClick(Sender: TObject);
begin
  if ( Length(Trim(edObservacao.Lines.Text)) < 15 ) then
    ShowWarning('Favor informar texto com, no m�nimo, 15 caracteres!')
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