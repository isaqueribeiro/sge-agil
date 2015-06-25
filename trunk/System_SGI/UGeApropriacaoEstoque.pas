unit UGeApropriacaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, 
  IBTable, Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask, dxSkinsCore, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeApropriacaoEstoque = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusApropriacao: TRadioGroup;
    lblApropriacaoAberta: TLabel;
    lblApropriacaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataApropriacao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    Bevel12: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirApropriacao: TMenuItem;
    qryProduto: TIBDataSet;
    lblCustoTotal: TLabel;
    dbCustoTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsObservacoes: TTabSheet;
    lblCustoUn: TLabel;
    dbCustoUn: TDBEdit;
    PnlObservacoes: TPanel;
    lblApropriacaoEmEdicao: TLabel;
    PgcTextoApropriacao: TPageControl;
    TbsApropriacaoMotivo: TTabSheet;
    dbMotivo: TDBMemo;
    TbsApropriacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCusto: TLabel;
    dbObservacao: TDBMemo;
    lblEntrada: TLabel;
    PnlValores: TPanel;
    lblCompetencia: TLabel;
    dbCompetencia: TDBEdit;
    lblValorTotalAprop: TLabel;
    dbValorTotalAprop: TDBEdit;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCONTROLE: TIntegerField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaCENTRO_CUSTO: TIntegerField;
    IbDtstTabelaCOMPRA_ANO: TSmallintField;
    IbDtstTabelaCOMPRA_NUM: TIntegerField;
    IbDtstTabelaCOMPRA_EMP: TIBStringField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    IbDtstTabelaDATA_APROPRIACAO: TDateField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaMOTIVO: TMemoField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaVALOR_TOTAL: TIBBCDField;
    IbDtstTabelaCANCEL_USUARIO: TIBStringField;
    IbDtstTabelaCANCEL_DATAHORA: TDateTimeField;
    IbDtstTabelaCANCEL_MOTIVO: TMemoField;
    IbDtstTabelaITENS: TIntegerField;
    IbDtstTabelaEMPRESA_NOME: TIBStringField;
    IbDtstTabelaCC_DESCRICAO: TIBStringField;
    IbDtstTabelaCC_CLIENTE_NOME: TIBStringField;
    IbDtstTabelaCC_CLIENTE_CNPJ: TIBStringField;
    IbDtstTabelaCC_CLIENTE_TIPO: TSmallintField;
    IbDtstTabelaENTRADA: TIBStringField;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCONTROLE: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensCUSTO_UNITARIO: TIBBCDField;
    cdsTabelaItensCUSTO_TOTAL: TIBBCDField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensAPRESENTACAO: TIBStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensUNIDADE_SIGLA: TIBStringField;
    IbDtstTabelaCC_CLIENTE_CODIGO: TIntegerField;
    IbDtstTabelaTIPO: TSmallintField;
    tblTipoApropriacao: TIBTable;
    dtsTipoApropriacao: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    LblAjuda: TLabel;
    btnFinalizarLancamento: TcxButton;
    btnEncerrarApropriacao: TcxButton;
    btnCancelarApropriacao: TcxButton;
    cdsTabelaItensESTOQUE: TIBBCDField;
    cdsTabelaItensRESERVA: TIBBCDField;
    cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField;
    qryEntradaProduto: TIBDataSet;
    cdsTabelaItensQTDE: TIBBCDField;
    lblAutorizacao: TLabel;
    IbDtstTabelaAUTORIZACAO_ANO: TSmallintField;
    IbDtstTabelaAUTORIZACAO_NUM: TIntegerField;
    IbDtstTabelaAUTORIZACAO_EMP: TIBStringField;
    IbDtstTabelaAUTORIZACAO: TIBStringField;
    qryAutorizacaoProduto: TIBDataSet;
    dbCentroCusto: TJvDBComboEdit;
    dbEntrada: TJvDBComboEdit;
    dbAutorizacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataApropriacao: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    cdsTabelaItensFRACIONADOR: TIBBCDField;
    cdsTabelaItensUNIDADE_FRACAO: TSmallintField;
    cdsTabelaItensUNIDADE_FRACIONADA: TIBStringField;
    cdsTabelaItensQTDE_FRACIONADA: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaINSERCAO_DATAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btnEncerrarApropriacaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirApropriacaoClick(Sender: TObject);
    procedure btnCancelarApropriacaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarLancamentoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbCentroCustoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbEntradaButtonClick(Sender: TObject);
    procedure dbAutorizacaoButtonClick(Sender: TObject);
    procedure cdsTabelaItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCusto : Integer;
    procedure AbrirTabelaItens(const AnoApropriacao : Smallint; const CodigoApropriacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure CarregarProdutosEntrada(const iEntradaAno, iEntradaCod : Integer; sEntradaEmp : String);
    procedure CarregarProdutosAutorizacao(const iAutorizacaoAno, iAutorizacaoCod : Integer; sAutorizacaoEmp : String);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Custo : Currency);

    function GetRotinaFinalizarID : String;
    function GetRotinaEncerrarID  : String;
    function GetRotinaCancelarApropriacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaEncerrarID  : String read GetRotinaEncerrarID;
    property RotinaCancelarApropriacaoID : String read GetRotinaCancelarApropriacaoID;
    procedure pgcGuiasOnChange; override;
  end;

var
  frmGeApropriacaoEstoque: TfrmGeApropriacaoEstoque;

  procedure MostrarControleApropriacao(const AOwner : TComponent);

  function SelecionarApropriacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeProduto, UGeApropriacaoEstoqueCancelar, 
  UGeCentroCusto, UGeEntradaEstoque, UGeAutorizacaoCompra;

{$R *.dfm}

procedure MostrarControleApropriacao(const AOwner : TComponent);
var
  frm : TfrmGeApropriacaoEstoque;
  whr : String;
begin
  frm := TfrmGeApropriacaoEstoque.Create(AOwner);
  try
    whr := 'cast(a.data_apropriacao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusApropriacao.ItemIndex > 0) then
      whr := whr + ' and (a.status = ' + IntToStr(frm.RdgStatusApropriacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarApropriacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
//  frm : TfrmGeApropriacaoEstoque;
  sNome : String;
  I : Integer;
begin (*
  frm := TfrmGeApropriacaoEstoque.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarAutorizacao.Visible := False;
    frm.btnAutorizarCompra.Visible      := False;
    frm.btnCancelarAutorizacao.Visible  := False;

    frm.RdgStatusAutorizacao.ItemIndex := STATUS_APROPRIACAO_ESTOQUE_AUT + 1;

    frm.RdgStatusAutorizacao.Enabled := False;
    //for I := 0 to frm.RdgStatusAutorizacao.Items.Count - 1 do
    //  frm.RdgStatusAutorizacao.Controls[I].Enabled := False;

    frm.iFornecedor := Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := '(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(a.data_apropriacao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusAutorizacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (a.status = ' + IntToStr(frm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.IbDtstTabelaANO.AsInteger;
      Codigo  := frm.IbDtstTabelaCODIGO.AsInteger;
      Empresa := frm.IbDtstTabelaEMPRESA.AsString;
    end;
  finally
    frm.Destroy;
  end;
       *)
end;

procedure TfrmGeApropriacaoEstoque.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_APROPRIACAO_ALMOX_' + FormatFloat('0000', YearOf(GetDateDB));
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'controle';

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iCentroCusto     := 0;

  tblEmpresa.Open;
  tblTipoApropriacao.Open;

  RotinaID            := ROTINA_ENT_APROPRIACAO_ESTOQ_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBAPROPRIACAO_ALMOX';
  CampoCodigo    := 'a.controle';
  CampoDescricao := 'c.descricao';                      // Descri��o do centro de custo
  CampoOrdenacao := 'a.ano, a.controle, c.descricao';

  WhereAdditional :=  'cast(a.data_apropriacao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value          := gUsuarioLogado.Empresa;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateTimeDB;
  IbDtstTabelaDATA_APROPRIACAO.Value := GetDateDB;
  IbDtstTabelaUSUARIO.Value          := gUsuarioLogado.Login;
  IbDtstTabelaSTATUS.AsInteger       := STATUS_APROPRIACAO_ESTOQUE_EDC;
  IbDtstTabelaTIPO.AsInteger         := TIPO_APROPRIACAO_GERAL;

  IbDtstTabelaVALOR_TOTAL.AsCurrency := 0.0;

  IbDtstTabelaCENTRO_CUSTO.Clear;
  IbDtstTabelaCOMPRA_ANO.Clear;
  IbDtstTabelaCOMPRA_NUM.Clear;
  IbDtstTabelaCOMPRA_EMP.Clear;
  IbDtstTabelaAUTORIZACAO_ANO.Clear;
  IbDtstTabelaAUTORIZACAO_NUM.Clear;
  IbDtstTabelaAUTORIZACAO_EMP.Clear;
  IbDtstTabelaCOMPETENCIA.Clear;
  IbDtstTabelaMOTIVO.Clear;
  IbDtstTabelaOBS.Clear;
  IbDtstTabelaCANCEL_USUARIO.Clear;
  IbDtstTabelaCANCEL_DATAHORA.Clear;
  IbDtstTabelaCANCEL_MOTIVO.Clear;
end;

procedure TfrmGeApropriacaoEstoque.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger      := iAno;
    IbDtstTabelaCONTROLE.AsInteger := iNum;
    IbDtstTabelaNUMERO.AsString    := FormatFloat('###0000000', IbDtstTabelaCONTROLE.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeApropriacaoEstoque.AbrirTabelaItens(
  const AnoApropriacao : Smallint; const CodigoApropriacao : Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano      = ' + IntToStr(AnoApropriacao));
    Add('  and i.controle = ' + IntToStr(CodigoApropriacao));
    Add('order by i.ano, i.controle, i.item');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarLancamento.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_EDC) and (not cdsTabelaItens.IsEmpty);
    btnEncerrarApropriacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarApropriacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);

    nmImprimirApropriacao.Enabled   := (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);
  end
  else
  begin
    btnFinalizarLancamento.Enabled := False;
    btnEncerrarApropriacao.Enabled := False;
    btnCancelarApropriacao.Enabled := False;

    nmImprimirApropriacao.Enabled  := (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);
  end;
end;

procedure TfrmGeApropriacaoEstoque.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCONTROLE.AsInteger;

    if ( not IbDtstTabelaDATA_APROPRIACAO.IsNull ) then
    begin
      if ( IbDtstTabelaDATA_APROPRIACAO.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaDATA_APROPRIACAO.AsDateTime;

      if ( IbDtstTabelaDATA_APROPRIACAO.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaDATA_APROPRIACAO.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_APROPRIACAO_ESTOQUE_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_APROPRIACAO_ESTOQUE_ENC : sMsg := 'Esta apropria��o n�o pode ser alterada porque j� est� encerrada.';
      STATUS_APROPRIACAO_ESTOQUE_CAN : sMsg := 'Esta apropria��o n�o pode ser alterada porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) then
      if not ShowConfirm('A edi��o da apropria��o selecionada est� finalizada.' + #13 + 'Deseja coloc�-la em edi��o novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.Value := STATUS_APROPRIACAO_ESTOQUE_EDC;
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_APROPRIACAO_ESTOQUE_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_APROPRIACAO_ESTOQUE_ENC : sMsg := 'Esta apropria��o n�o pode ser exclu�da porque j� est� encerrada.';
      STATUS_APROPRIACAO_ESTOQUE_CAN : sMsg := 'Esta apropria��o n�o pode ser exclu�da porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('ITEM', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_ENTRADA) and (IbDtstTabelaCOMPRA_ANO.AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar o Movimento de Entrada para a apropria��o!');
    dbEntrada.SetFocus;
  end
  else
  if ( (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_AUTORIZ) and (IbDtstTabelaAUTORIZACAO_ANO.AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar a Autoriza�ao de Compra para a apropria��o!');
    dbAutorizacao.SetFocus;
  end
  else
  if ( IbDtstTabelaCENTRO_CUSTO.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo para a apropria��o!');
    dbCentroCusto.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensITEM.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoExcluirClick(Sender: TObject);
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Custo : Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensITEM.AsInteger;

    Total_Custo := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Custo := Total_Custo + cdsTabelaItensCUSTO_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('ITEM', Item, []);
  end;

var
  cTotalCusto : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o c�digo do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensCUSTO_UNITARIO.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor de Custo Unit�rio inv�lido.');
      dbCustoUn.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalCusto);

      IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus
      else
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      begin
        btnProdutoEditar.SetFocus;
        if (IbDtstTabelaTIPO.AsInteger in [TIPO_APROPRIACAO_ENTRADA, TIPO_APROPRIACAO_AUTORIZ]) then
          cdsTabelaItens.Next;
      end;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.cdsTabelaItensCalcFields(DataSet: TDataSet);
begin
  cdsTabelaItensQTDE_FRACIONADA.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensFRACIONADOR.AsCurrency;
end;

procedure TfrmGeApropriacaoEstoque.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value         := IbDtstTabelaANO.Value;
  cdsTabelaItensCONTROLE.Value    := IbDtstTabelaCONTROLE.Value;
  cdsTabelaItensQTDE.Value        := 1;
  cdsTabelaItensFRACIONADOR.Value := 1;
  cdsTabelaItensCUSTO_UNITARIO.AsCurrency := 0.0;
  cdsTabelaItensCUSTO_TOTAL.AsCurrency    := 0.0;
  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNIDADE_FRACAO.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
  cdsTabelaItensUNIDADE_FRACIONADA.Clear;
end;

procedure TfrmGeApropriacaoEstoque.btnEncerrarApropriacaoClick(
  Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try

      cdsTabelaItens.First;
      cdsTabelaItens.DisableControls;
      while not cdsTabelaItens.Eof do
      begin
        if ( (cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger = 0) or (IbDtstTabelaAUTORIZACAO_ANO.AsInteger > 0) ) then // Produto n�o movimenta estoque ou autoriza��o informada
          Return := False
        else
          Return := ( (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensESTOQUE.AsCurrency - cdsTabelaItensRESERVA.AsCurrency)) or (cdsTabelaItensESTOQUE.AsCurrency <= 0) );

        if ( Return ) then
          Break;
        cdsTabelaItens.Next;
      end;

    finally
      cdsTabelaItens.EnableControls;
      Result := Return;
    end;
  end;

var
  cTotalCusto : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC) then
  begin
    ShowWarning('Lan�amento de Apropria��o j� est� encerrado!');
    Abort;
  end;

  ValidarToTais(cTotalCusto);

  if ( IbDtstTabelaVALOR_TOTAL.AsCurrency <> cTotalCusto ) then
  begin
    ShowWarning('A soma dos valores totais dos itens (' +
      FormatFloat('"R$ ",0.00', cTotalCusto) +
      ') n�o confere com o Custo Total da Apropria��o.' + #13#13 +
      'Favor excute os seguintes procedimentos:' + #13 +
      '1. Altere o registro para corre��o.'      + #13 +
      '2. Salve a altera��o realizada.'          + #13 +
      '3. Finalize-o novamente.');
    Abort;
  end;

  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o �tem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' est� acima da quantidade dispon�vel no estoque.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma o encerramento da apropria��o selecionada?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value  := STATUS_APROPRIACAO_ESTOQUE_ENC;
    IbDtstTabelaUSUARIO.Value := gUsuarioLogado.Login;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Encerramento realizado com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusApropriacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoApropriacao.ActivePage := TbsApropriacaoMotivo;

  dbEntrada.Button.Enabled     := (IbDtstTabela.State = dsInsert);
  dbAutorizacao.Button.Enabled := (IbDtstTabela.State = dsInsert);

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_APROPRIACAO_ESTOQUE_ENC );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) ) and ( IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_GERAL );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (cdsTabelaItens.State in [dsEdit, dsInsert]);

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeApropriacaoEstoque.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

  pgcMaisDados.ActivePage := tbsObservacoes;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iCentroCusto = 0, '', '(a.centro_custo = ' + IntToStr(iCentroCusto) + ') and ') +
    'cast(a.data_apropriacao as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusApropriacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (a.status = ' + IntToStr(RdgStatusApropriacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeApropriacaoEstoque.CarregarDadosProduto(Codigo: Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o c�digo do produto');
    Exit;
  end;

  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensPRODUTO.AsString             := FieldByName('cod').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensFRACIONADOR.AsCurrency       := FieldByName('fracionador').AsCurrency;
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensUNIDADE_FRACIONADA.AsString  := FieldByName('Unidade_fracionada').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;

        if ( FieldByName('Codunidade_fracionada').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE_FRACAO.AsInteger := FieldByName('Codunidade_fracionada').AsInteger;
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
end;

procedure TfrmGeApropriacaoEstoque.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autoriza��o.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar altera��o em andamento no �tem da autoriza��o!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := FormatFloat('###0000000', IbDtstTabelaCONTROLE.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    if GetExisteNumeroApropriacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('N�mero de apropria��o j� existe!');
      Abort;
    end;
    
    IbDtstTabelaMOTIVO.AsString      := Trim(AnsiUpperCase(IbDtstTabelaMOTIVO.AsString));
    IbDtstTabelaOBS.AsString         := Trim(AnsiUpperCase(IbDtstTabelaOBS.AsString));
    IbDtstTabelaENTRADA.Required     := (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_ENTRADA);
    IbDtstTabelaAUTORIZACAO.Required := (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_AUTORIZ);

    if (IbDtstTabelaCOMPRA_ANO.AsInteger = 0) or (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_GERAL) then
    begin
      IbDtstTabelaCOMPRA_ANO.Clear;
      IbDtstTabelaCOMPRA_NUM.Clear;
      IbDtstTabelaCOMPRA_EMP.Clear;
      IbDtstTabelaENTRADA.Clear;
    end;

    if (IbDtstTabelaAUTORIZACAO_ANO.AsInteger = 0) or (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_GERAL) then
    begin
      IbDtstTabelaAUTORIZACAO_ANO.Clear;
      IbDtstTabelaAUTORIZACAO_NUM.Clear;
      IbDtstTabelaAUTORIZACAO_EMP.Clear;
      IbDtstTabelaAUTORIZACAO.Clear;
    end;

    if ( cdsTabelaItens.RecordCount > 0 ) then
      IbDtstTabelaITENS.AsInteger := cdsTabelaItens.RecordCount
    else
      IbDtstTabelaITENS.Clear;

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens da Base

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCONTROLE.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(GetCampoCodigoLimpo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeApropriacaoEstoque.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_GERAL ) then
          CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQuantidade) or (Sender = dbCustoUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;

  if ( Sender = dbCustoTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeApropriacaoEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not IbDtstTabelaSTATUS.IsNull) then
      // Destacar autoriza��o em edi��o
      if ( IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_EDC ) then
        dbgDados.Canvas.Brush.Color := lblApropriacaoEmEdicao.Color
      else
      // Destacar autoriza��o aberta
      if ( IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR ) then
        dbgDados.Canvas.Font.Color := lblApropriacaoAberta.Font.Color
      else
      // Destacar autoriza��o cancelada
      if ( IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN ) then
        dbgDados.Canvas.Font.Color := lblApropriacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos n�o confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC) and (cdsTabelaItensQTDE.AsCurrency <= 0) ) then
      dbgProdutos.Canvas.Font.Color := lblApropriacaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeApropriacaoEstoque.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo    ,
  iCFOP_CNAE ,
  iUnidade   : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorVenda,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    ,
  cValorCusto   : Currency;
begin
  if ( (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_ENTRADA) and (IbDtstTabelaCOMPRA_ANO.AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar o Movimento de Entrada para a apropria��o!');
    dbEntrada.SetFocus;
  end
  else
  if ( (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_AUTORIZ) and (IbDtstTabelaAUTORIZACAO_ANO.AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar a Autoriza��o de Compra para a apropria��o!');
    dbAutorizacao.SetFocus;
  end
  else
  if ( IbDtstTabelaCENTRO_CUSTO.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo para a apropria��o!');
    dbCentroCusto.SetFocus;
  end
  else
  if ( dbProduto.Button.Enabled and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    bSelecionado := SelecionarProdutoParaEntrada(Self,
      iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
      cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
      iEstoque, iReserva);

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString             := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString           := sUnidade;
      cdsTabelaItensCUSTO_UNITARIO.AsCurrency    := cValorCusto;

      CarregarDadosProduto( iCodigo );
    end;

  end;
end;

procedure TfrmGeApropriacaoEstoque.nmImprimirApropriacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa, GetEmailEmpresa(IbDtstTabelaEMPRESA.AsString), 'Apropria��o de Estoque', EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaCC_CLIENTE_CODIGO.AsInteger;
      Open;
    end;

    with qryApropriacaoEstoque do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCONTROLE.AsInteger;
      Open;
    end;

    frrApropriacaoEstoque.ShowReport;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnCancelarApropriacaoClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN) then
  begin
    ShowWarning('Lan�amento de Apropria��o j� est� cancelado!');
    Abort;
  end;

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_APROPRIACAO_ESTOQUE_ENC ) then
    ShowInformation('Apenas registros encerrados podem ser cancelados!')
  else
  if ( CancelarAPROP(Self, IbDtstTabelaANO.Value, IbDtstTabelaCONTROLE.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Apropria��o cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_APROPRIACAO_ESTOQUE_EDC : Text := 'Em Edi��o';
    STATUS_APROPRIACAO_ESTOQUE_ABR : Text := 'Aberta';
    STATUS_APROPRIACAO_ESTOQUE_ENC : Text := 'Encerrada';
    STATUS_APROPRIACAO_ESTOQUE_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnFinalizarLancamentoClick(
  Sender: TObject);
var
  cTotalCusto : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) then
  begin
    ShowWarning('Lan�amento de Apropria��o j� est� finalizado!');
    Abort;
  end;

  if ShowConfirm('Confirma a finaliza��o do lan�amento da apropria��o de estoque?') then
  begin
    ValidarToTais(cTotalCusto);

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value  := STATUS_APROPRIACAO_ESTOQUE_ABR;
    IbDtstTabelaUSUARIO.Value := gUsuarioLogado.Login;
    IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Apropria��o com lan�amento finalizado com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusApropriacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQTDE) or (Field = cdsTabelaItensCUSTO_UNITARIO) ) then
      cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_TOTAL.AsCurrency;
end;

procedure TfrmGeApropriacaoEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    if (IbDtstTabela.State in [dsEdit, dsInsert])  then
    begin

      if dbNumero.Focused then
        if ( Length(Trim(dbNumero.Text)) > 0 ) then
          if GetExisteNumeroApropriacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('N�mero de apropria��o j� existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cApropria��o : 13/01/2015 - Verificar a Data da Autoriza��o }

      if dbDataApropriacao.Focused then
        if ( dbDataApropriacao.Date > GetDateTimeDB ) then
            ShowWarning('A Data da apropria��o est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( dbEntrada.Focused ) then
      begin
        IbDtstTabelaCOMPRA_ANO.Clear;
        IbDtstTabelaCOMPRA_NUM.Clear;
        IbDtstTabelaCOMPRA_EMP.Clear;
        IbDtstTabelaENTRADA.Clear;
      end
      else
      if ( dbAutorizacao.Focused ) then
      begin
        IbDtstTabelaAUTORIZACAO_ANO.Clear;
        IbDtstTabelaAUTORIZACAO_NUM.Clear;
        IbDtstTabelaAUTORIZACAO_EMP.Clear;
        IbDtstTabelaAUTORIZACAO.Clear;
      end
      else
      if ( dbCentroCusto.Focused ) then
      begin
        IbDtstTabelaCENTRO_CUSTO.Clear;
        IbDtstTabelaCC_DESCRICAO.Clear;
      end;
      
  end;

  inherited;  
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_APROPRIACAO_GERAL :
        Text := 'Geral';

      TIPO_APROPRIACAO_ENTRADA:
        Text := 'Por Entrada';

      TIPO_APROPRIACAO_AUTORIZ:
        Text := 'Por Autoriza��o';

      else
        Text := Sender.AsString;
    end;
end;

function TfrmGeApropriacaoEstoque.GetRotinaEncerrarID: String;
begin
  Result := GetRotinaInternaID(btnEncerrarApropriacao);
end;

function TfrmGeApropriacaoEstoque.GetRotinaCancelarApropriacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarApropriacao);
end;

function TfrmGeApropriacaoEstoque.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarLancamento);
end;

procedure TfrmGeApropriacaoEstoque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarLancamento.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarLancamento.Caption, RotinaID);

    if btnEncerrarApropriacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEncerrarID, btnEncerrarApropriacao.Caption, RotinaID);

    if btnCancelarApropriacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarApropriacaoID, btnCancelarApropriacao.Caption, RotinaID);
  end;
end;

procedure TfrmGeApropriacaoEstoque.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeApropriacaoEstoque.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsApropriacaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN);
end;

procedure TfrmGeApropriacaoEstoque.ValidarToTais(var Total_Custo : Currency);
var
  Item : Integer;
begin
  Item := cdsTabelaItensITEM.AsInteger;

  Total_Custo := 0.0;

  cdsTabelaItens.First;

  try
    cdsTabelaItens.DisableControls;
    while not cdsTabelaItens.Eof do
    begin
      Total_Custo := Total_Custo + cdsTabelaItensCUSTO_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

  finally
    cdsTabelaItens.Locate('ITEM', Item, []);
    cdsTabelaItens.EnableControls;
  end;
end;

procedure TfrmGeApropriacaoEstoque.dbCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarDepartamento(Self, 0, IbDtstTabelaEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
    begin
      IbDtstTabelaCENTRO_CUSTO.AsInteger      := iCodigo;
      IbDtstTabelaCC_DESCRICAO.AsString       := sNome;
      IbDtstTabelaCC_CLIENTE_CODIGO.AsInteger := iCliente;
    end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = IbDtstTabelaTIPO ) then
  begin
    dbEntrada.Button.Enabled     := (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_ENTRADA);
    dbAutorizacao.Button.Enabled := (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_AUTORIZ);
    dbProduto.Button.Enabled := (IbDtstTabelaTIPO.AsInteger = TIPO_APROPRIACAO_GERAL);
    dbProduto.ReadOnly       := (IbDtstTabelaTIPO.AsInteger > TIPO_APROPRIACAO_GERAL);

    DtSrcTabelaItensStateChange( DtSrcTabelaItens );
  end;
end;

procedure TfrmGeApropriacaoEstoque.dbEntradaButtonClick(Sender: TObject);
var
  iEntradaAno ,
  iEntradaCod : Integer;
  sEntradaEmp : String;
begin
  if ( dbEntrada.Button.Enabled and (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
    if SelecionarEntrada(Self, iEntradaAno, iEntradaCod, sEntradaEmp) then
    begin
      IbDtstTabelaCOMPRA_ANO.AsInteger := iEntradaAno;
      IbDtstTabelaCOMPRA_NUM.AsInteger := iEntradaCod;
      IbDtstTabelaCOMPRA_EMP.AsString  := sEntradaEmp;
      IbDtstTabelaENTRADA.AsString     := FormatFloat('0000"/"', iEntradaAno) + FormatFloat('0000000', iEntradaCod);

      CarregarProdutosEntrada(iEntradaAno, iEntradaCod, sEntradaEmp);
      cdsTabelaItens.First;
      
      dbEntrada.SetFocus;
    end;
end;

procedure TfrmGeApropriacaoEstoque.CarregarProdutosEntrada(
  const iEntradaAno, iEntradaCod: Integer; sEntradaEmp: String);
var
  I : Integer;
  cTotalCusto : Currency;
begin
  with qryEntradaProduto do
  begin
    Close;
    ParamByName('ano').AsInteger := iEntradaAno;
    ParamByName('cod').AsInteger := iEntradaCod;
    ParamByName('emp').AsString  := sEntradaEmp;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    cTotalCusto := 0.0;
    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensITEM.AsInteger := I;
        cdsTabelaItensPRODUTO.Assign       ( FieldByName('produto') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensFRACIONADOR.Assign   ( FieldByName('fracionador') );
        cdsTabelaItensUNIDADE.Assign       ( FieldByName('unidade') );
        cdsTabelaItensUNIDADE_FRACAO.Assign( FieldByName('unidade_fracao') );
        cdsTabelaItensCUSTO_UNITARIO.Assign( FieldByName('valor_unitario') );

        cdsTabelaItensDESCRI.Assign             ( FieldByName('DESCRI') );
        cdsTabelaItensAPRESENTACAO.Assign       ( FieldByName('apresentacao') );
        cdsTabelaItensDESCRI_APRESENTACAO.Assign( FieldByName('DESCRI_APRESENTACAO') );
        cdsTabelaItensUNP_DESCRICAO.Assign      ( FieldByName('UNP_DESCRICAO') );
        cdsTabelaItensUNP_SIGLA.Assign          ( FieldByName('UNP_SIGLA') );
        cdsTabelaItensUNIDADE_SIGLA.Assign      ( FieldByName('UNIDADE_SIGLA') );
        cdsTabelaItensUNIDADE_FRACIONADA.Assign ( FieldByName('unidade_fracionada') );
        cdsTabelaItensESTOQUE.Assign            ( FieldByName('ESTOQUE') );
        cdsTabelaItensRESERVA.Assign            ( FieldByName('RESERVA') );
        cdsTabelaItensMOVIMENTA_ESTOQUE.Assign  ( FieldByName('MOVIMENTA_ESTOQUE') );

        cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;

        cdsTabelaItens.Post;

        cTotalCusto := cTotalCusto + cdsTabelaItensCUSTO_TOTAL.AsCurrency;
        Inc(I);
      end;

      Next;
    end;

    IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;
  end;
end;

procedure TfrmGeApropriacaoEstoque.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.dbAutorizacaoButtonClick(
  Sender: TObject);
var
  iAutorizacaoAno ,
  iAutorizacaoCod : Integer;
  sAutorizacaoEmp : String;
begin
  if ( dbAutorizacao.Button.Enabled and (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
    if SelecionarAutorizacaoParaApropriacao(Self, e1Data.Date - 30, iAutorizacaoAno, iAutorizacaoCod, sAutorizacaoEmp) then
    begin
      IbDtstTabelaAUTORIZACAO_ANO.AsInteger := iAutorizacaoAno;
      IbDtstTabelaAUTORIZACAO_NUM.AsInteger := iAutorizacaoCod;
      IbDtstTabelaAUTORIZACAO_EMP.AsString  := sAutorizacaoEmp;
      IbDtstTabelaAUTORIZACAO.AsString      := FormatFloat('0000"/"', iAutorizacaoAno) + FormatFloat('0000000', iAutorizacaoCod);

      CarregarProdutosAutorizacao(iAutorizacaoAno, iAutorizacaoCod, sAutorizacaoEmp);
      cdsTabelaItens.First;

      dbAutorizacao.SetFocus;
    end;
end;

procedure TfrmGeApropriacaoEstoque.CarregarProdutosAutorizacao(
  const iAutorizacaoAno, iAutorizacaoCod: Integer;
  sAutorizacaoEmp: String);
var
  I : Integer;
  cTotalCusto : Currency;
begin
  with qryAutorizacaoProduto do
  begin
    Close;
    ParamByName('ano').AsInteger := iAutorizacaoAno;
    ParamByName('cod').AsInteger := iAutorizacaoCod;
    ParamByName('emp').AsString  := sAutorizacaoEmp;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    cTotalCusto := 0.0;
    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensITEM.AsInteger := I;
        cdsTabelaItensPRODUTO.Assign       ( FieldByName('produto') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensFRACIONADOR.Assign   ( FieldByName('fracionador') );
        cdsTabelaItensUNIDADE.Assign       ( FieldByName('unidade') );
        cdsTabelaItensUNIDADE_FRACAO.Assign( FieldByName('unidade_fracao') );
        cdsTabelaItensCUSTO_UNITARIO.Assign( FieldByName('valor_unitario') );

        cdsTabelaItensDESCRI.Assign             ( FieldByName('DESCRI') );
        cdsTabelaItensAPRESENTACAO.Assign       ( FieldByName('apresentacao') );
        cdsTabelaItensDESCRI_APRESENTACAO.Assign( FieldByName('DESCRI_APRESENTACAO') );
        cdsTabelaItensUNP_DESCRICAO.Assign      ( FieldByName('UNP_DESCRICAO') );
        cdsTabelaItensUNP_SIGLA.Assign          ( FieldByName('UNP_SIGLA') );
        cdsTabelaItensUNIDADE_SIGLA.Assign      ( FieldByName('UNIDADE_SIGLA') );
        cdsTabelaItensUNIDADE_FRACIONADA.Assign ( FieldByName('unidade_fracionada') );
        cdsTabelaItensESTOQUE.Assign            ( FieldByName('ESTOQUE') );
        cdsTabelaItensRESERVA.Assign            ( FieldByName('RESERVA') );
        cdsTabelaItensMOVIMENTA_ESTOQUE.Assign  ( FieldByName('MOVIMENTA_ESTOQUE') );

        cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;

        cdsTabelaItens.Post;

        cTotalCusto := cTotalCusto + cdsTabelaItensCUSTO_TOTAL.AsCurrency;
        Inc(I);
      end;

      Next;
    end;

    IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoque', TfrmGeApropriacaoEstoque);

end.
