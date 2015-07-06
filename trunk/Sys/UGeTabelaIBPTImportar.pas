unit UGeTabelaIBPTImportar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons, ACBrBase,
  ACBrSocket, ACBrIBPTax, Data.DB, Datasnap.DBClient, ACBrNCMs, Vcl.ComCtrls;

type
  TfrmGeTabelaIBPTImportar = class(TfrmGrPadrao)
    pnlConfirmacao: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    bvlConfirmacao: TBevel;
    GrpBxDownload: TGroupBox;
    ACBrIBPT: TACBrIBPTax;
    lblURL: TLabel;
    edURL: TEdit;
    tmpCadastro: TClientDataSet;
    tmpCadastroNCM: TStringField;
    tmpCadastroEx: TIntegerField;
    tmpCadastroTabela: TIntegerField;
    tmpCadastroDescricao: TStringField;
    tmpCadastroAliqFedNacional: TFloatField;
    tmpCadastroAliqFedImportado: TFloatField;
    tmpCadastroAliqEstadual: TFloatField;
    tmpCadastroAliqMunicipal: TFloatField;
    dtsCadastro: TDataSource;
    btnDownload: TcxButton;
    lblInformacaoDownload: TLabel;
    ACBrNcms: TACBrNCMs;
    Bevel8: TBevel;
    GrpBxImportacao: TGroupBox;
    lblArquivo: TLabel;
    lblInformacaoImportacao: TLabel;
    edArquivo: TEdit;
    btnImportar: TcxButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    lblVigencia: TLabel;
    lblFonte: TLabel;
    lblChave: TLabel;
    lblQtdeItem: TLabel;
    lblVersao: TLabel;
    opdImportar: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    prgImportacao: TProgressBar;
    procedure btnDownloadClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure ACBrIBPTErroImportacao(const ALinha, AErro: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeTabelaIBPTImportar: TfrmGeTabelaIBPTImportar;

implementation

{$R *.dfm}

uses
  UConstantesDGE, UDMRecursos, UDMBusiness;

procedure TfrmGeTabelaIBPTImportar.ACBrIBPTErroImportacao(const ALinha,
  AErro: string);
begin
  lblInformacaoDownload.Caption    := ALinha + ' - ' + AErro;
  lblInformacaoDownload.Font.Color := clRed;
end;

procedure TfrmGeTabelaIBPTImportar.btnDownloadClick(Sender: TObject);
begin
  if Trim(edURL.Text) = EmptyStr then
  begin
    ShowWarning('Favor informar a URL para download do arquivo.');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
     ACBrIBPT.Arquivo.Clear;

    lblInformacaoDownload.Font.Color := clNavy;
    lblInformacaoDownload.Caption := 'Download em execução.... Aguarde!';
    lblInformacaoDownload.Visible := True;
    btnDownload.Enabled := False;
    Application.ProcessMessages;

    ACBrIBPT.URLDownload := Trim(edURL.Text);
    if ACBrIBPT.DownloadTabela then
      btnImportar.Click;
  finally
    Screen.Cursor := crDefault;
    lblInformacaoDownload.Visible := False;
    btnDownload.Enabled := True;
  end;
end;

procedure TfrmGeTabelaIBPTImportar.btnImportarClick(Sender: TObject);
var
  I  : Integer;
  ok : Boolean;
  s  : String;
begin
  ok := (ACBrIBPT.Arquivo.Count > 0);
  s  := EmptyStr;

  if not ok then
  begin
    ok := opdImportar.Execute;
    if ok then
      s := Trim(opdImportar.FileName);
  end;

  with ACBrIBPT do
    if ok then
    begin
      edArquivo.Text := s;
      if AbrirTabela(edArquivo.Text) then
      begin
        lblVersao.Caption   := VersaoArquivo;
        lblVigencia.Caption := Format('%s a %s', [DateToStr(VigenciaInicio), DateToStr(VigenciaFim)]);
        lblChave.Caption    := ChaveArquivo;
        lblFonte.Caption    := Fonte;

        tmpCadastro.Close;
        tmpCadastro.CreateDataSet;
        tmpCadastro.DisableControls;
        try
          for I := 0 to ACBrIBPT.Itens.Count - 1 do
          begin
            tmpCadastro.Append;
            tmpCadastroNCM.AsString             := Itens[I].NCM;
            tmpCadastroDescricao.AsString       := Itens[I].Descricao;
            tmpCadastroEx.AsString              := Itens[I].Excecao;
            tmpCadastroTabela.AsInteger         := Integer(Itens[I].Tabela);
            tmpCadastroAliqFedNacional.AsFloat  := Itens[I].FederalNacional;
            tmpCadastroAliqFedImportado.AsFloat := Itens[I].FederalImportado;
            tmpCadastroAliqEstadual.AsFloat     := Itens[I].Estadual;
            tmpCadastroAliqMunicipal.AsFloat    := Itens[I].Municipal;
            tmpCadastro.Post;
          end;
        finally
          tmpCadastro.First;
          tmpCadastro.EnableControls;

          lblQtdeItem.Caption    := IntToStr(tmpCadastro.RecordCount);
          btnConfirmar.Enabled   := (tmpCadastro.RecordCount > 0);
          prgImportacao.Position := 0;
          prgImportacao.Max      := tmpCadastro.RecordCount;
          prgImportacao.Visible  := True;
        end;
      end;
    end;
end;

end.
