unit UGeEfetuarPagtoREC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBUpdateSQL, IBTable, Buttons, IBStoredProc, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmGeEfetuarPagtoREC = class(TfrmGrPadrao)
    GrpBxPagamento: TGroupBox;
    Bevel1: TBevel;
    GrpBxLancamento: TGroupBox;
    lblAnoLanc: TLabel;
    Label3: TLabel;
    lblCliente: TLabel;
    edAnoLanc: TEdit;
    edNumLanc: TEdit;
    edCliente: TEdit;
    Bevel2: TBevel;
    cdsPagamentos: TIBDataSet;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TIBStringField;
    cdsPagamentosVALOR_BAIXA: TIBBCDField;
    cdsPagamentosNUMERO_CHEQUE: TIBStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBCO_NOME: TIBStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    updPagamentos: TIBUpdateSQL;
    dtsPagamentos: TDataSource;
    tblBanco: TIBTable;
    dtsBanco: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    lblDataPagto: TLabel;
    dbValorPago: TDBEdit;
    lblValorPago: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblDocBaixa: TLabel;
    dbDocBaixa: TDBEdit;
    lblNoCheque: TLabel;
    dbNoCheque: TDBEdit;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    cdsPagamentosUSUARIO: TIBStringField;
    lblInforme: TLabel;
    tmrAlerta: TTimer;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    dbDataPagto: TJvDBDateEdit;
    procedure dtsPagamentosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsPagamentosNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tmrAlertaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeEfetuarPagtoREC: TfrmGeEfetuarPagtoREC;

  function PagamentoConfirmado(const AOwner : TComponent; const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
    var DataPagto : TDateTime; var AReceber : Currency) : Boolean;
  function RegistrarPagamento(LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency; VendaAno, VendaNumero : Integer) : Boolean;

implementation

uses UDMBusiness;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
  var DataPagto : TDateTime; var AReceber : Currency) : Boolean;
var
  frm : TfrmGeEfetuarPagtoREC;
begin
  frm := TfrmGeEfetuarPagtoREC.Create(AOwner);
  try

    with frm do
    begin
      edAnoLanc.Text := FormatFloat('0000', Ano);
      edNumLanc.Text := FormatFloat('###0000000', Lancamento);
      edCliente.Text := Cliente;

      cdsPagamentos.Close;

      with cdsPagamentos, SelectSQL do
      begin
        Add('where p.Anolanc = ' + IntToStr(Ano));
        Add('  and p.Numlanc = ' + IntToStr(Lancamento));
      end;

      cdsPagamentos.Open;
      cdsPagamentos.Append;
      cdsPagamentosFORMA_PAGTO.AsInteger  := FormaPagto;
      cdsPagamentosVALOR_BAIXA.AsCurrency := AReceber;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
        DataPagto := cdsPagamentosDATA_PAGTO.AsDateTime;

        SetMovimentoCaixa(
          GetUserApp,
          cdsPagamentosDATA_PAGTO.AsDateTime + Time,
          cdsPagamentosFORMA_PAGTO.AsInteger,
          cdsPagamentosANOLANC.AsInteger,
          cdsPagamentosNUMLANC.AsInteger,
          cdsPagamentosSEQ.AsInteger,
          cdsPagamentosVALOR_BAIXA.AsCurrency,
          tmcxCredito);
      end;
    end;

  finally
    frm.Free;
  end;
end;

function RegistrarPagamento(LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency; VendaAno, VendaNumero : Integer) : Boolean;
var
  frm : TfrmGeEfetuarPagtoREC;
begin
  frm := TfrmGeEfetuarPagtoREC.Create(Application);
  try

    with frm do
    begin
      edAnoLanc.Text := FormatFloat('0000', LancAno);
      edNumLanc.Text := FormatFloat('###0000000', LanNumero);

      cdsPagamentos.Close;

      with cdsPagamentos, SelectSQL do
      begin
        Add('where p.Anolanc = ' + IntToStr(LancAno));
        Add('  and p.Numlanc = ' + IntToStr(LanNumero));
      end;

      cdsPagamentos.Open;
      cdsPagamentos.Append;

      cdsPagamentosDATA_PAGTO.AsDateTime  := DataPagto;
      cdsPagamentosFORMA_PAGTO.AsInteger  := FormaPagto;
      cdsPagamentosVALOR_BAIXA.AsCurrency := ValorPago;
      cdsPagamentosDOCUMENTO_BAIXA.AsString := FormatFloat('0000', VendaAno) + FormatFloat('000000', VendaNumero);
      cdsPagamentosHISTORICO.AsString       := 'BAIXA AUTOMATICA NA CONFIRMACAO DA VENDA No. ' + FormatFloat('0000', VendaAno) + '/' + FormatFloat('000000', VendaNumero);

      cdsPagamentos.Post;
      cdsPagamentos.ApplyUpdates;

      CommitTransaction;

      cdsPagamentos.Close;

      SetMovimentoCaixa(
        GetUserApp,
        DataPagto + Time,
        FormaPagto,
        LancAno,   // Ano do lan�amento do T�tulo
        LanNumero, // N�mero do lan�amento do T�tulo
        0,
        ValorPago,
        tmcxCredito);

    end;

  finally
    frm.Free;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.dtsPagamentosStateChange(Sender: TObject);
begin
  inherited;
  dtsPagamentos.AutoEdit := ( cdsPagamentos.State in [dsEdit, dsInsert] );
end;

procedure TfrmGeEfetuarPagtoREC.FormCreate(Sender: TObject);
begin
  inherited;
  tblBanco.Open;
  tblFormaPagto.Open;
end;

procedure TfrmGeEfetuarPagtoREC.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if ( cdsPagamentos.State in [dsEdit, dsInsert] ) then
  begin
    if ( cdsPagamentosVALOR_BAIXA.AsCurrency <= 0 ) then
    begin
      ShowWarning('Favor informar o valor recebido!');
      dbValorPago.SetFocus;
    end
    else
    if ( cdsPagamentosDATA_PAGTO.AsDateTime > GetDateTimeDB ) then
    begin
      ShowWarning('N�o � permitido do registro de recebimentos futuros!');
      dbDataPagto.SetFocus;
    end
    else
    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) = EmptyStr) ) then
    begin
      ShowWarning('Favor informar o N�mero do Cheque!');
      dbNoCheque.SetFocus;
    end
    else
    if ( (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) <> EmptyStr) and (cdsPagamentosBANCO.AsInteger = 0) ) then
    begin
      ShowWarning('Favor informar o Banco!');
      dbBanco.SetFocus;
    end
    else
    if ( Trim(cdsPagamentosHISTORICO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar hist�rico (referente �) do recebimento!');
      dbHistorico.SetFocus;
    end
    else
    if ( ShowConfirm('Confirma a efetua��o do recebimento?') ) then
    begin
      cdsPagamentosHISTORICO.AsString := AnsiUpperCase(Trim(cdsPagamentosHISTORICO.AsString));

      if (Copy(cdsPagamentosHISTORICO.AsString, Length(cdsPagamentosHISTORICO.AsString), 1) = '.') then
        cdsPagamentosHISTORICO.AsString := Copy(cdsPagamentosHISTORICO.AsString, 1, Length(cdsPagamentosHISTORICO.AsString) - 1);

      cdsPagamentos.Post;
      cdsPagamentos.ApplyUpdates;
      CommitTransaction;

      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmGeEfetuarPagtoREC.cdsPagamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsPagamentosANOLANC.Value    := StrToInt(edAnoLanc.Text);
  cdsPagamentosNUMLANC.Value    := StrToInt(edNumLanc.Text);
  cdsPagamentosSEQ.Value        := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where anolanc = ' + edAnoLanc.Text + ' and numlanc = ' + edNumLanc.Text);
  cdsPagamentosDATA_PAGTO.Value := GetDateDB;
  cdsPagamentosUSUARIO.Value    := GetUserApp;
  cdsPagamentosFORMA_PAGTO.Value      := GetFormaPagtoIDDefault;
  cdsPagamentosFORMA_PAGTO_DESC.Value := GetFormaPagtoNomeDefault;
end;

procedure TfrmGeEfetuarPagtoREC.FormShow(Sender: TObject);
begin
  inherited;
  if ( dtsPagamentos.AutoEdit ) then
    dbDataPagto.SetFocus;
end;

procedure TfrmGeEfetuarPagtoREC.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeEfetuarPagtoREC.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
