unit UGeInutilizarNumeroNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB,
  IBCustomDataSet, IBUpdateSQL, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeInutilizarNumeroNFe = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblHoraEmissao: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosInutilizacao: TGroupBox;
    lblUsuario: TLabel;
    lblDataHora: TLabel;
    lblJustificativa: TLabel;
    dbJustificativa: TMemo;
    dbUsuario: TEdit;
    dbDataHora: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    cdsLOG: TIBDataSet;
    updLOG: TIBUpdateSQL;
    qryEmpresa: TIBQuery;
    dtsEmpresa: TDataSource;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    qryEmpresaSERIE_NFE: TSmallintField;
    qryEmpresaNUMERO_NFE: TIntegerField;
    qryEmpresaLOTE_ANO_NFE: TSmallintField;
    qryEmpresaLOTE_NUM_NFE: TIntegerField;
    lblAno: TLabel;
    edAno: TEdit;
    qryEmpresaMODELO_NFE: TIntegerField;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblNumeroInicial: TLabel;
    edNumeroInicial: TEdit;
    lblNumeroFinal: TLabel;
    edNumeroFinal: TEdit;
    qryNFeEmitida: TIBQuery;
    cdsLOGUSUARIO: TIBStringField;
    cdsLOGDATA_HORA: TDateTimeField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TIBStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure qryEmpresaMODELO_NFEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure Auditar;
    function IntervaloValido(iSerie, iInicio, iFinal : Integer; var sRetorno : String) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeInutilizarNumeroNFe: TfrmGeInutilizarNumeroNFe;

implementation

uses UDMBusiness, UDMNFe, UConstantesDGE;

{$R *.dfm}

procedure TfrmGeInutilizarNumeroNFe.Auditar;
begin
  dbUsuario.Text  := Trim(GetUserApp);
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmGeInutilizarNumeroNFe.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeInutilizarNumeroNFe.FormCreate(Sender: TObject);
begin
  inherited;
  
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := gUsuarioLogado.Empresa;
    Open;
  end;

  Auditar;
  edAno.Text := FormatDateTime('yyyy', Date);
end;

procedure TfrmGeInutilizarNumeroNFe.qryEmpresaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeInutilizarNumeroNFe.btnConfirmarClick(Sender: TObject);
var
  sJustific,
  sRetorno : String;
  iAno       ,
  iModelo    ,
  iSerie     ,
  iNroInicial,
  iNroFinal  : Integer;
begin
  iAno        := StrToIntDef(Trim(edAno.Text), 0);
  iModelo     := StrToIntDef(Trim(dbModelo.Text), 0);
  iSerie      := StrToIntDef(Trim(dbSerie.Text), 0);
  iNroInicial := StrToIntDef(Trim(edNumeroInicial.Text), 0);
  iNroFinal   := StrToIntDef(Trim(edNumeroFinal.Text), 0);
  sJustific   := Trim(dbJustificativa.Lines.Text);

  if (iAno <= 0) or (iNroInicial <= 0) or (iNroFinal <= 0) then
    ShowError('Os valores dos campos "Ano", "N�mero Inicial" e "N�mero Final" n�o podem possuir dados negativos ou zerados!')
  else
  if ( iNroFinal < iNroInicial ) then
    ShowError('O valor do campo "N�mero Final" n�o pode ser menor que valor do campo "N�mero Inicial"!')
  else
  if ( (iNroInicial > qryEmpresaNUMERO_NFE.AsInteger) or (iNroFinal > qryEmpresaNUMERO_NFE.AsInteger) ) then
    ShowError('A inutiliza��o n�o pode ocorrer em numera��es ainda n�o utilizadas pelo sistema!')
  else
  if ( Length(Trim(dbJustificativa.Lines.Text)) < 15 ) then
  begin
    ShowWarning('A justificativa de inutiliza��o de numera��es de NF-e deve possuir 15 caracteres no m�nimo.');
    dbJustificativa.SetFocus;
  end
  else
  if not IntervaloValido(iSerie, iNroInicial, iNroFinal, sRetorno) then
    ShowWarning('O intervalo informado para inutiliza��o � inv�lido:' + #13#13 + 'Motivo:' + #13 + sRetorno)
  else
  if ShowConfirm('Confirma a initiliza��o do intervalor de numera��o de NF-e informado?') then
  begin

    if not DMNFe.GetValidadeCertificado then
      Exit;

    sRetorno := EmptyStr;
    if DMNFe.InutilizaNumeroNFeACBr(gUsuarioLogado.Empresa, iAno, iModelo, iSerie, iNroInicial, iNroFinal, sJustific, sRetorno ) then
    begin

      with cdsLOG do
      begin
        Auditar;

        Open;
        Append;

        cdsLOGUSUARIO.AsString       := dbUsuario.Text;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := DESC_LOG_INUTILIZA_NRO_NFE;
        cdsLOGESPECIFICACAO.AsString := sRetorno;

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;

    end;

  end;
end;

procedure TfrmGeInutilizarNumeroNFe.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeInutilizarNumeroNFe.qryEmpresaMODELO_NFEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := IntToStr(MODELO_NFE);
end;

function TfrmGeInutilizarNumeroNFe.IntervaloValido(iSerie, iInicio,
  iFinal: Integer; var sRetorno : String): Boolean;
begin
  with qryNFeEmitida do
  begin
    Close;
    ParamByName('empresa1').AsString := gUsuarioLogado.Empresa;
    ParamByName('serie1').AsInteger  := iSerie;
    ParamByName('inicio1').AsInteger := iInicio;
    ParamByName('final1').AsInteger  := iFinal;

    ParamByName('empresa2').AsString := gUsuarioLogado.Empresa;
    ParamByName('serie2').AsInteger  := iSerie;
    ParamByName('inicio2').AsInteger := iInicio;
    ParamByName('final2').AsInteger  := iFinal;
    Open;

    Result := IsEmpty;

    if (not Result) then
    begin
      sRetorno := '� Nota(s) emitida(s) : ';

      First;
      while not Eof do
      begin
        sRetorno := sRetorno +
          FormatFloat('0000000"/"', FieldByName('nfe').AsInteger) +
          FieldByName('serie').AsString + '(' + Trim(FieldByName('tipo').AsString) + '), ';

        Next;
      end;

      sRetorno := Copy(Trim(sRetorno), 1, Length(Trim(sRetorno)) - 1);
    end;
  end;

end;

procedure TfrmGeInutilizarNumeroNFe.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeInutilizarNumeroNFe', TfrmGeInutilizarNumeroNFe);

end.
