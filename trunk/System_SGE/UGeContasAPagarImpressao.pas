unit UGeContasAPagarImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ComCtrls, Mask, frxClass, frxDBSet,
  DBClient, Provider, DB, IBCustomDataSet, IBQuery, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeContasAPagarImpressao = class(TfrmGrPadraoImpressao)
    lblData: TLabel;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    frRelacaoAPagarVSintetico: TfrxReport;
    QryRelacaoAPagarVSintetico: TIBQuery;
    DspRelacaoAPagarVSintetico: TDataSetProvider;
    CdsRelacaoAPagarVSintetico: TClientDataSet;
    FrdsRelacaoAPagarVSintetico: TfrxDBDataset;
    QryRelacaoAPagarVAnalitico: TIBQuery;
    DspRelacaoAPagarVAnalitico: TDataSetProvider;
    CdsRelacaoAPagarVAnalitico: TClientDataSet;
    FrdsRelacaoAPagarVAnalitico: TfrxDBDataset;
    frRelacaoAPagarVAnalitico: TfrxReport;
    lblTipoDespesa: TLabel;
    edTipoDespesa: TComboBox;
    QryTipoDespesa: TIBQuery;
    DspTipoDespesa: TDataSetProvider;
    CdsTipoDespesa: TClientDataSet;
    lblFornecedor: TLabel;
    edFornecedor: TComboBox;
    QryFornecedor: TIBQuery;
    DspFornecedor: TDataSetProvider;
    CdsFornecedor: TClientDataSet;
    frRelacaoAPagarESintetico: TfrxReport;
    QryRelacaoAPagarESintetico: TIBQuery;
    DspRelacaoAPagarESintetico: TDataSetProvider;
    CdsRelacaoAPagarESintetico: TClientDataSet;
    FrdsRelacaoAPagarESintetico: TfrxDBDataset;
    frRelacaoAPagarEAnalitico: TfrxReport;
    frRelacaoAPagarBSintetico: TfrxReport;
    QryRelacaoAPagarBSintetico: TIBQuery;
    DspRelacaoAPagarBSintetico: TDataSetProvider;
    CdsRelacaoAPagarBSintetico: TClientDataSet;
    FrdsRelacaoAPagarBSintetico: TfrxDBDataset;
    frRelacaoAPagarBAnalitico: TfrxReport;
    frRelacaoAPagarTPDespesaSintetico: TfrxReport;
    frRelacaoAPagarTPDespesaAnalitico: TfrxReport;
    dbDespesaParticular: TCheckBox;
    frRelacaoAPagarVFornecedor: TfrxReport;
    QryRelacaoAPagarVFornecedor: TIBQuery;
    DspRelacaoAPagarVFornecedor: TDataSetProvider;
    CdsRelacaoAPagarVFornecedor: TClientDataSet;
    FrdsRelacaoAPagarVFornecedor: TfrxDBDataset;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure edTipoDespesaChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoAPagarAnalit          ,
    FSQL_RelacaoAPagarEmissaoSintet   ,
    FSQL_RelacaoAPagarVencimentoSintet,
    FSQL_RelacaoAPagarVencimentoFornec,
    FSQL_RelacaoAPagarBaixaSintet     : TStringList;
    IEmpresa : Array of String;
    ITipoDespesa : Array of Integer;
    IFornecedor  : Array of Integer;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarTipoDespesa;
    procedure CarregarCliente;

    procedure MontarRelacaoAPagarPorEmissaoSintetico;
    procedure MontarRelacaoAPagarPorEmissaoAnalitico;
    procedure MontarRelacaoAPagarPorVencimentoSintetico;
    procedure MontarRelacaoAPagarPorVencimentoAnalitico;
    procedure MontarRelacaoAPagarPorVencimentoFornecedor;
    procedure MontarRelacaoAPagarPorBaixaSintetico;
    procedure MontarRelacaoAPagarPorBaixaAnalitico;
    procedure MontarRelacaoAPagarPorTPDespesaSintetico;
    procedure MontarRelacaoAPagarPorTPDespesaAnalitico;
  public
    { Public declarations }
  end;

var
  frmGeContasAPagarImpressao: TfrmGeContasAPagarImpressao;

const
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SINTETICO  = 0;
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_ANALITICO  = 1;
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_FORNECEDOR = 2;
  REPORT_RELACAO_APAGAR_POR_EMISSAO_SINTETICO     = 3;
  REPORT_RELACAO_APAGAR_POR_EMISSAO_ANALITICO     = 4;
  REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO       = 5;
  REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO       = 6;
  REPORT_RELACAO_APAGAR_POR_TPDESPESA_SINTETICO   = 7;
  REPORT_RELACAO_APAGAR_POR_TPDESPESA_ANALITICO   = 8;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, UDMNFe;

{$R *.dfm}

const
  TITULO_TODOS     = 0;
  TITULO_BAIXADO   = 1;
  TITULO_PENDENTE  = 2;
  TITULO_CANCELADO = 3;

{ TfrmGeContasAReceberImpressao }

procedure TfrmGeContasAPagarImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := TITULO_PENDENTE;

  inherited;

  FSQL_RelacaoAPagarAnalit := TStringList.Create;
  FSQL_RelacaoAPagarAnalit.AddStrings( QryRelacaoAPagarVAnalitico.SQL );

  FSQL_RelacaoAPagarVencimentoSintet := TStringList.Create;
  FSQL_RelacaoAPagarVencimentoSintet.AddStrings( QryRelacaoAPagarVSintetico.SQL );

  FSQL_RelacaoAPagarVencimentoFornec := TStringList.Create;
  FSQL_RelacaoAPagarVencimentoFornec.AddStrings( QryRelacaoAPagarVFornecedor.SQL );

  FSQL_RelacaoAPagarEmissaoSintet := TStringList.Create;
  FSQL_RelacaoAPagarEmissaoSintet.AddStrings( QryRelacaoAPagarESintetico.SQL );

  FSQL_RelacaoAPagarBaixaSintet := TStringList.Create;
  FSQL_RelacaoAPagarBaixaSintet.AddStrings( QryRelacaoAPagarBSintetico.SQL );
end;

procedure TfrmGeContasAPagarImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELAT�RIO: '       + #13 +
    Format('- Per�odo  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situa��o : %s', [edSituacao.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Por Data de Vencimento

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SINTETICO:
      begin
        MontarRelacaoAPagarPorVencimentoSintetico;
        frReport := frRelacaoAPagarVSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_ANALITICO:
      begin
        MontarRelacaoAPagarPorVencimentoAnalitico;
        frReport := frRelacaoAPagarVAnalitico;
      end;

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_FORNECEDOR:
      begin
        MontarRelacaoAPagarPorVencimentoFornecedor;
        frReport := frRelacaoAPagarVFornecedor;
      end;

    // Por Data de Emiss�o

    REPORT_RELACAO_APAGAR_POR_EMISSAO_SINTETICO:
      begin
        MontarRelacaoAPagarPorEmissaoSintetico;
        frReport := frRelacaoAPagarESintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_EMISSAO_ANALITICO:
      begin
        MontarRelacaoAPagarPorEmissaoAnalitico;
        frReport := frRelacaoAPagarEAnalitico;
      end;

    // Por Data de Baixa (Pagamento)

    REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO:
      begin
        MontarRelacaoAPagarPorBaixaSintetico;
        frReport := frRelacaoAPagarBSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO:
      begin
        MontarRelacaoAPagarPorBaixaAnalitico;
        frReport := frRelacaoAPagarBAnalitico;
      end;

    // Por Tipo de Despesas (Data de Vencimento)

    REPORT_RELACAO_APAGAR_POR_TPDESPESA_SINTETICO:
      begin
        MontarRelacaoAPagarPorTPDespesaSintetico;
        frReport := frRelacaoAPagarTPDespesaSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_TPDESPESA_ANALITICO:
      begin
        MontarRelacaoAPagarPorTPDespesaAnalitico;
        frReport := frRelacaoAPagarTPDespesaAnalitico;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio anal�tico de contas a pagar por vencimento/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio sint�tico de contas a pagar por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarTipoDespesa;
var
  X ,
  I : Integer;
begin
  X := 0;
  edTipoDespesa.OnChange := nil;

  with CdsTipoDespesa do
  begin
    Open;

    edTipoDespesa.Clear;
    SetLength(ITipoDespesa, RecordCount + 1);

    edTipoDespesa.Items.Add('(Todas)');
    ITipoDespesa[0] := 0;

    I := 1;

    while not Eof do
    begin
      edTipoDespesa.Items.Add( FieldByName('tipodesp').AsString);
      ITipoDespesa[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edTipoDespesa.OnChange  := edTipoDespesaChange;
  edTipoDespesa.ItemIndex := X;
end;

procedure TfrmGeContasAPagarImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarTipoDespesa;
  CarregarCliente;
end;

procedure TfrmGeContasAPagarImpressao.CarregarCliente;
var
  I : Integer;
const
  NOME_FORNECEDOR = '%s - %s';
begin
  with CdsFornecedor do
  begin
    Open;

    edFornecedor.Clear;
    SetLength(IFornecedor, RecordCount + 1);

    edFornecedor.Items.Add('(Todos)');
    IFornecedor[0] := 0;

    I := 1;

    while not Eof do
    begin
      edFornecedor.Items.Add( Format(NOME_FORNECEDOR, [
        IfThen(FieldByName('pessoa_fisica').AsInteger = 1,
          StrFormatarCpf(FieldByName('cnpj').AsString),
          StrFormatarCnpj(FieldByName('cnpj').AsString)),
        FieldByName('nomeforn').AsString]) );
      IFornecedor[I] := FieldByName('codforn').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edFornecedor.ItemIndex := 0;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorEmissaoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas emitidas no per�odo de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtemiss) || right(''00'' || extract(month from cp.dtemiss), 2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio anal�tico de contas a pagar por emiss�o/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorEmissaoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas emitidas no per�odo de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas emitidas no per�odo de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarESintetico.Close;

    with QryRelacaoAPagarESintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarEmissaoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtemiss)  || right(''00'' || extract(month from cp.dtemiss),  2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , ce.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtemiss)  || right(''00'' || extract(month from cp.dtemiss),  2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio sint�tico de contas a pagar por emiss�o.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorBaixaAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Duplicatas baixadas no per�odo de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtpag >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtpag <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtpag) || right(''00'' || extract(month from cp.dtpag), 2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio anal�tico de contas a pagar por baixa/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorBaixaSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas baixadas no per�odo de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas baixadas no per�odo de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarBSintetico.Close;

    with QryRelacaoAPagarBSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarBaixaSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtpag >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtpag <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtpag)  || right(''00'' || extract(month from cp.dtpag),  2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , mp.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtpag)  || right(''00'' || extract(month from cp.dtpag),  2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio sint�tico de contas a pagar por baixa (pagamento).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  if ( (edRelatorio.ItemIndex = REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO) or (edRelatorio.ItemIndex = REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO) ) then
  begin
    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := TITULO_TODOS;
  end
  else
  begin
    edSituacao.Enabled   := True;
    edSituacao.ItemIndex := TITULO_PENDENTE;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorTPDespesaSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio sint�tico de contas a pagar por tipos de despesas.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorTPDespesaAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio anal�tico de contas a pagar por tipo de despesa/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.edTipoDespesaChange(Sender: TObject);
begin
  if not CdsTipoDespesa.Active then
    CdsTipoDespesa.Open;

  if CdsTipoDespesa.Locate('cod', ITipoDespesa[edTipoDespesa.ItemIndex], []) then
    dbDespesaParticular.Checked := (CdsTipoDespesa.FieldByName('tipo_particular').AsInteger = 0);
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoFornecedor;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no per�odo de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVFornecedor.Close;

    with QryRelacaoAPagarVFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoFornec );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cp.quitado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cp.quitado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cp.situacao = 0');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codforn = ' + IntToStr(IFornecedor[edFornecedor.ItemIndex]) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');
      SQL.Add('  , fn.pessoa_fisica');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relat�rio sint�tico de contas a pagar por vencimento/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarEmpresa;
var
  P ,
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount);

    P := 0;
    I := 0;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      if ( IEmpresa[I] = GetEmpresaIDDefault ) then
        P := I;
        
      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := P;
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagarImpressao', TfrmGeContasAPagarImpressao);

end.
