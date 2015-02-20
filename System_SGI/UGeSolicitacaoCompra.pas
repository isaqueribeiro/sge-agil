unit UGeSolicitacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, IBTable, RXDBCtrl, Menus, IBStoredProc, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

type
  TfrmGeSolicitacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    RdgStatusSolicitacao: TRadioGroup;
    lblSolicitacaoAberta: TLabel;
    lblSolicitacaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBDateEdit;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAprovador: TLabel;
    dbAprovador: TDBEdit;
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
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirCotacao: TMenuItem;
    qryProduto: TIBDataSet;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    tblTipoSolicitacao: TIBTable;
    dtsTipoSolicitacao: TDataSource;
    lblDataValidade: TLabel;
    dbDataValidade: TDBDateEdit;
    tbsEventoLOG: TTabSheet;
    lblSolicitacaoEmEdicao: TLabel;
    PgcTextoSolicitacao: TPageControl;
    TbsSolicitacaoObjeto: TTabSheet;
    TbsSolicitacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    TbsSolicitacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblNomeSolicitante: TLabel;
    dbNomeSolicitante: TDBEdit;
    dbEventoLOG: TDBMemo;
    nmImprimirCotacaoMapa: TMenuItem;
    btnFinalizarCotacao: TcxButton;
    btnAutorizarCotacao: TcxButton;
    btnCancelarCotacao: TcxButton;
    lblCentroCustoSolicitacao: TLabel;
    dbCentroCustoSolicitacao: TRxDBComboEdit;
    lblProdutoNome: TLabel;
    tblUnidade: TIBTable;
    dtsUnidade: TDataSource;
    dbUnidade: TDBLookupComboBox;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaCENTRO_CUSTO: TIntegerField;
    IbDtstTabelaNOME_SOLICITANTE: TIBStringField;
    IbDtstTabelaOBJETO_SOLICITACAO: TMemoField;
    IbDtstTabelaMOVITO: TMemoField;
    IbDtstTabelaOBSERVACAO: TMemoField;
    IbDtstTabelaDATA_EMISSAO: TDateField;
    IbDtstTabelaVALIDADE: TDateField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    IbDtstTabelaINSERCAO_USUARIO: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaAPROVACAO_DATA: TDateField;
    IbDtstTabelaAPROVACAO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_DATA: TDateField;
    IbDtstTabelaCANCELADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_MOTIVO: TMemoField;
    IbDtstTabelaLOG_EVENTO: TMemoField;
    IbDtstTabelaITENS: TIntegerField;
    IbDtstTabelaCENTRO_CUSTO_NOME: TIBStringField;
    TbsSolicitacaoMotivo: TTabSheet;
    dbObjeto: TDBMemo;
    dbMotivo: TDBMemo;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCENTRO_CUSTO: TIntegerField;
    cdsTabelaItensITEM_CODIGO: TIBStringField;
    cdsTabelaItensITEM_DESCRICAO: TIBStringField;
    cdsTabelaItensITEM_CADASTRADO: TSmallintField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUSUARIO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensCENTRO_CUSTO_NOME: TIBStringField;
    lblCentroCustoItem: TLabel;
    dbCentroCustoItem: TRxDBComboEdit;
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
    procedure btnAutorizarCotacaoClick(Sender: TObject);
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
    procedure nmImprimirCotacaoClick(Sender: TObject);
    procedure btnCancelarCotacaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure qryFornecedorVENCEDORGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgFornecedorDblClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCusto    : Integer;
    procedure AbrirTabelaItens(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure AbrirTabelaFornecedores(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);
    procedure SetCotacaoFornecedorItem;
    procedure SetCotacaoFornecedorProcessa(Empresa : String; Ano : Smallint; Codigo : Integer);

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarCotacaoID : String;
    function GetRotinaManterFornecedorID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarCotacaoID : String read GetRotinaCancelarCotacaoID;
    property RotinaManterFornecedorID : String read GetRotinaManterFornecedorID;
  end;

var
  frmGeSolicitacaoCompra: TfrmGeSolicitacaoCompra;

  procedure MostrarSolicitacaoCotacao(const AOwner : TComponent);

  function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeProduto,
  UGeSolicitacaoCompraCancelar;

{$R *.dfm}

procedure MostrarSolicitacaoCotacao(const AOwner : TComponent);
var
  frm : TfrmGeSolicitacaoCompra;
  whr : String;
begin
  frm := TfrmGeSolicitacaoCompra.Create(AOwner);
  try
    whr := 'cast(s.data_emissao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusSolicitacao.ItemIndex > 0) then
      whr := whr + ' and (s.status = ' + IntToStr(frm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

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

function SelecionarCotacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeSolicitacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeSolicitacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible        := False;
    frm.btnFinalizarCotacao.Visible := False;
    frm.btnAutorizarCotacao.Visible := False;
    frm.btnCancelarCotacao.Visible  := False;

    frm.RdgStatusSolicitacao.ItemIndex := STATUS_SOLICITACAO_FIN + 1;

    for I := 0 to frm.RdgStatusSolicitacao.Items.Count - 1 do
      frm.RdgStatusSolicitacao.Controls[I].Enabled := False;

    frm.iCentroCusto := 0;
    frm.e1Data.Date  := DataInicial;
    frm.WhereAdditional := //'(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(s.data_emissao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusSolicitacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (s.status = ' + IntToStr(frm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

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

end;

procedure TfrmGeSolicitacaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_SOLICITACAO_' + FormatFloat('0000', YearOf(GetDateDB));
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'codigo';

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
  tblTipoSolicitacao.Open;
  tblUnidade.Open;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_SOLICITACAO_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBSOLICITACAO';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'c.descricao';
  CampoOrdenacao := 's.numero';

  WhereAdditional :=  'cast(s.data_emissao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value             := gUsuarioLogado.Empresa;
  IbDtstTabelaTIPO.Value                := TIPO_SOLICITACAO_COMPRA;
  IbDtstTabelaINSERCAO_DATA.Value       := GetDateTimeDB;
  IbDtstTabelaINSERCAO_USUARIO.Value    := gUsuarioLogado.Login;
  IbDtstTabelaDATA_EMISSAO.Value        := GetDateDB;
  IbDtstTabelaVALIDADE.Value            := IbDtstTabelaDATA_EMISSAO.Value + GetPrazoValidadeCotacaoCompra(IbDtstTabelaEMPRESA.AsString);
  IbDtstTabelaSTATUS.AsInteger          := STATUS_SOLICITACAO_EDC;
  IbDtstTabelaNOME_SOLICITANTE.AsString := gUsuarioLogado.Nome;

  IbDtstTabelaCENTRO_CUSTO.Clear;
  IbDtstTabelaCENTRO_CUSTO_NOME.Clear;
  IbDtstTabelaAPROVACAO_DATA.Clear;
  IbDtstTabelaAPROVACAO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_DATA.Clear;
  IbDtstTabelaCANCELADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_MOTIVO.Clear;
end;

procedure TfrmGeSolicitacaoCompra.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger    := iAno;
    IbDtstTabelaCODIGO.AsInteger := iNum;
    IbDtstTabelaNUMERO.AsString  := FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  end;
end;

procedure TfrmGeSolicitacaoCompra.AbrirTabelaItens(
  const AnoCotacao: Smallint; const CodigoCotacao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoCotacao));
    Add('  and i.codigo = ' + IntToStr(CodigoCotacao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarCotacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_EDC) and (not cdsTabelaItens.IsEmpty);
    btnAutorizarCotacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) and (not cdsTabelaItens.IsEmpty);
    btnCancelarCotacao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT);

    nmImprimirCotacao.Enabled     := (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ABR) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ENC);
    nmImprimirCotacaoMapa.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ENC);

    dtsFornecedor.AutoEdit := (not IbDtstTabela.IsEmpty) and (IbDtstTabela.State = dsBrowse) and (IbDtstTabelaSTATUS.AsInteger < STATUS_SOLICITACAO_ENC);
    dtsFornecedorStateChange( dtsFornecedor );
  end
  else
  begin
    btnFinalizarCotacao.Enabled := False;
    btnAutorizarCotacao.Enabled := False; //(not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_COT) and (not cdsTabelaItens.IsEmpty);
    btnCancelarCotacao.Enabled  := False;

    nmImprimirCotacao.Enabled     := (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ABR) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ENC);
    nmImprimirCotacaoMapa.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ENC);
  end;
end;

procedure TfrmGeSolicitacaoCompra.RecarregarRegistro;
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
    iCod := IbDtstTabelaCODIGO.AsInteger;

    if ( not IbDtstTabelaEMISSAO_DATA.IsNull ) then
    begin
      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;

      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_SOLICITACAO_COT ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_SOLICITACAO_ENC : sMsg := 'Esta solicitação não pode ser alterada por já está autorizada/encerrada.';
      STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser alterada porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) then
      if not ShowConfirm('A edição da solicitação selecionada está em andamento.' + #13 + 'Deseja colocá-la em edição novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
      AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_SOLICITACAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_SOLICITACAO_COT : sMsg := 'Esta solicitação não pode ser excluída porque já está aguardando encerramento.';
      STATUS_SOLICITACAO_ENC : sMsg := 'Esta solicitação não pode ser excluída por já está autorizada/encerrada.';
      STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser excluída porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
      AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;  
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    if ( cdsTabelaItens.Locate('SEQ', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( Trim(IbDtstTabelaDESCRICAO_RESUMO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descrição resumo para a solicitação!');
    dbDescricao.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoExcluirClick(Sender: TObject);
var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;
*)
    end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Referencia : Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensSEQ.AsInteger;

    Total_Referencia := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Referencia := Total_Referencia + cdsTabelaItensVALOR_TOTAL_REF.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
//    else
//    if ( (cdsTabelaItensIPI_PERCENTUAL.AsCurrency < 0) or (cdsTabelaItensIPI_PERCENTUAL.AsCurrency > 100) ) then
//    begin
//      ShowWarning('Percentual do IPI inválido.');
//      dbPercentualIPI.SetFocus;
//    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODIGO.Value     := IbDtstTabelaCODIGO.Value;
  cdsTabelaItensEMPRESA.Value    := IbDtstTabelaEMPRESA.Value;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency := 0.0;
  cdsTabelaItensVALOR_TOTAL_REF.AsCurrency    := 0.0;
  cdsTabelaItensUSUARIO.Value                 := GetUserApp;

  cdsTabelaItensVALOR_UNITARIO_MAX.AsCurrency   := 0.0;
  cdsTabelaItensVALOR_UNITARIO_MIN.AsCurrency   := 0.0;
  cdsTabelaItensVALOR_UNITARIO_MEDIA.AsCurrency := 0.0;
  cdsTabelaItensVALOR_TOTAL_MAX.AsCurrency      := 0.0;
  cdsTabelaItensVALOR_TOTAL_MIN.AsCurrency      := 0.0;
  cdsTabelaItensVALOR_TOTAL_MEDIA.AsCurrency    := 0.0;

  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
end;

procedure TfrmGeSolicitacaoCompra.btnAutorizarCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);
  AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  if not (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_COT) then
    ShowInformation('Apenas cotações que já possuem respostas de fornecedores poder ser autorizadas/encerradas!')
  else
  if (qryFornecedor.RecordCount < IbDtstTabelaNUMERO_MINIMO_FORNECEDOR.Value) then
    ShowInformation(
      Format('Para que a solicitação possa ser autorizada/encerrada, esta deve possuir respostas de, no mínimo, %s fornecedor(es).',
        [IbDtstTabelaNUMERO_MINIMO_FORNECEDOR.AsString]))
  else
  if ( ShowConfirm('Confirma a autorização do solicitação selecionada?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value             := STATUS_SOLICITACAO_ENC;
    IbDtstTabelaAUTORIZADA_DATA.Value    := GetDateDB;
    IbDtstTabelaAUTORIZADA_USUARIO.Value := GetUserApp;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('solicitação Autorizada/Encerrada realizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusCotacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  PgcTextoCotacao.ActivePage   := TbsCotacaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_SOLICITACAO_ENC );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );

  dtsFornecedor.AutoEdit := (not IbDtstTabela.IsEmpty) and (IbDtstTabela.State = dsBrowse) and (IbDtstTabelaSTATUS.AsInteger < STATUS_SOLICITACAO_ENC);
  dtsFornecedorStateChange( dtsFornecedor );
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeSolicitacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  pgcMaisDados.ActivePage := tbsDadoConsolidado;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iFornecedor = 0, '', '(a.fornecedor = ' + IntToStr(iFornecedor) + ') and ') + 
    'cast(c.emissao_data as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusCotacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (c.status = ' + IntToStr(RdgStatusCotacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeSolicitacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o código do produto');
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
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGeSolicitacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autorização.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da solicitação!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger);

    if GetExisteNumeroCotacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('Número de solicitação já existe!');
      Abort;
    end;

    IbDtstTabelaMOVITO.AsString     := Trim(AnsiUpperCase(IbDtstTabelaMOVITO.AsString));
    IbDtstTabelaOBSERVACAO.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACAO.AsString));

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCODIGO.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(GetCampoCodigoLimpo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
      AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

      SetCotacaoFornecedorItem;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeSolicitacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      IbDtstTabelaVALIDADE.Value := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeCotacaoCompra(IbDtstTabelaEMPRESA.AsString);

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_TOTAL_REF.AsCurrency := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency;
      
    end;

  if ( Sender = dbValorTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeSolicitacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;                            
  if ( Sender = dbgDados ) then
  begin
    // Destacar solicitação em edição
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblCotacaoEmEdicao.Color
    else
    // Destacar solicitação aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblCotacaoAberta.Font.Color
    else
    // Destacar solicitação cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblCotacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos já em solicitação
  if ( Sender = dbgProdutos ) then
  begin
//    if ( (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
//      dbgProdutos.Canvas.Font.Color := lblAutorizacaoCancelada.Font.Color;
//
//    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end
  else
  // Destacar fornecedores
  if ( Sender = dbgFornecedor ) then
  begin
    if (qryFornecedorATIVO.AsInteger = 0) then
      dbgFornecedor.Canvas.Font.Color := lblCotacaoCancelada.Font.Color;

    dbgFornecedor.DefaultDrawDataCell(Rect, dbgFornecedor.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeSolicitacaoCompra.dbProdutoButtonClick(Sender: TObject);
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
  cValorCusto   ,
  cValorVenda   ,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    : Currency;
begin
  if ( Trim(IbDtstTabelaDESCRICAO_RESUMO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descrição resumo para a solicitação!');
    dbDescricao.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case IbDtstTabelaTIPO.AsInteger of
      TIPO_AUTORIZACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_AUTORIZACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString              := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString  := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString            := sUnidade;
      cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency := cValorCusto;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;
    
  end;
end;

procedure TfrmGeSolicitacaoCompra.nmImprimirCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetEmailEmpresa(IbDtstTabelaEMPRESA.AsString), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCODIGO.AsInteger;
      ParamByName('emp').AsString  := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompraFornecedor do
    begin
      Close;
      ParamByName('ano').AsInteger   := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger   := IbDtstTabelaCODIGO.AsInteger;
      ParamByName('emp').AsString    := IbDtstTabelaEMPRESA.AsString;
      ParamByName('frn').AsInteger   := 0;
      ParamByName('todos').AsInteger := 0;
      Open;
    end;

    frrCotacaoCompra.ShowReport;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnCancelarCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);
  AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_AUTORIZACAO_AUT ) then
    ShowInformation('Apenas registros autorizados podem ser cancelados!')
  else
  if ( CancelarCOT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODIGO.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('solicitação cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_SOLICITACAO_EDC : Text := 'Em Edição';
    STATUS_SOLICITACAO_ABR : Text := 'Aberta';
    STATUS_SOLICITACAO_FIN : Text := 'Finalizada';
    STATUS_SOLICITACAO_APR : Text := 'Aprovada';
    STATUS_SOLICITACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnFinalizarCotacaoClick(
  Sender: TObject);
(*
  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    Return := False;

    cdsTabelaItens.First;
    while not cdsTabelaItens.Eof do
    begin
      Return := ( (cdsTabelaItensQUANTIDADE.AsInteger > cdsTabelaItensESTOQUE_SATELITE.AsInteger) or (cdsTabelaItensESTOQUE_SATELITE.AsInteger <= 0) );
      if ( Return ) then
        Break;
      cdsTabelaItens.Next;
    end;

    Result := Return;
  end;
*)
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);
  AbrirTabelaFornecedores( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  if ( ShowConfirm('Confirma a finalização da edição do solicitação?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value := STATUS_SOLICITACAO_ABR;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('solicitação finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusCotacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQUANTIDADE) or (Field = cdsTabelaItensVALOR_UNITARIO_REF) ) then
    begin
      cdsTabelaItensVALOR_TOTAL_REF.AsCurrency := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency;
      
    end;
end;

procedure TfrmGeSolicitacaoCompra.FormKeyDown(Sender: TObject;
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
          if GetExisteNumeroCotacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('Número de cotaçaõ já existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emissão da Autorização }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emissão da solicitação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  inherited;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_SOLICITACAO_COMPRA :
        Text := 'Compra';

      TIPO_SOLICITACAO_SERVICO:
        Text := 'Serviço';

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

function TfrmGeSolicitacaoCompra.GetRotinaAutorizarID: String;
begin
  Result := GetRotinaInternaID(btnAutorizarCotacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaCancelarCotacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarCotacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarCotacao);
end;

procedure TfrmGeSolicitacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarCotacao.Caption, RotinaID);

    if btnAutorizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAutorizarID, btnAutorizarCotacao.Caption, RotinaID);

    if btnCancelarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarCotacaoID, btnCancelarCotacao.Caption, RotinaID);

    if PnlFornecedor.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaManterFornecedorID, PnlFornecedor.Hint, RotinaID);
  end;
end;

procedure TfrmGeSolicitacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsSolicitacaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_CAN);
  HabilitarDesabilitar_Btns;
end;

function TfrmGeSolicitacaoCompra.GetRotinaManterFornecedorID: String;
begin
  Result := GetRotinaInternaID(PnlFornecedor);
end;

procedure TfrmGeSolicitacaoCompra.dtsFornecedorStateChange(Sender: TObject);
begin
  btnFornecedorInserir.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) );
  btnFornecedorEditar.Enabled  := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );
  btnFornecedorExcluir.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );

  BtnFornecedorOpcoes.Enabled   := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );
  nmGerarArquivoXLS.Enabled     := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) ) and ( IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_COT] );
  nmProcessarArquivoXLS.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) ) and ( IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_COT] );
end;

procedure TfrmGeSolicitacaoCompra.qryFornecedorVENCEDORGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( not Sender.IsNull ) then
    Case Sender.AsInteger of
      0 : Text := EmptyStr;
      1 : Text := 'X';
    end;
end;

procedure TfrmGeSolicitacaoCompra.SetEventoLOG(sEvento: String);
var
  sMensagem : String;
begin
  sMensagem := FormatDateTime('dd/mm/yyyy hh:mm', Now) + ' - ' + sEvento + ' (por ' + gUsuarioLogado.Login + ').';
  try
    if ( not IbDtstTabela.IsEmpty ) then
    begin
      IbDtstTabela.Edit;

      dbEventoLOG.Lines.Add(sMensagem);

      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;

      CommitTransaction;
    end;
  finally
  end;
end;

procedure TfrmGeSolicitacaoCompra.dbgFornecedorDblClick(Sender: TObject);
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  if CotacaoFornecedor(Self, cfoVisualizar,
    qryFornecedorEMPRESA.Value, qryFornecedorANO.Value, qryFornecedorCODIGO.Value, qryFornecedorFORNECEDOR.Value,
    IbDtstTabelaDESCRICAO_RESUMO.Value, EmptyStr, IbDtstTabelaEMISSAO_DATA.Value, IbDtstTabelaVALIDADE.Value) then
end;

procedure TfrmGeSolicitacaoCompra.SetCotacaoFornecedorItem;
begin
  qryFornecedor.First;

  while not qryFornecedor.Eof do
  begin
    with stpSetCotacaoFornecedorItem do
    begin
      ParamByName('ano').AsInteger        := qryFornecedorANO.AsInteger;
      ParamByName('codigo').AsInteger     := qryFornecedorCODIGO.AsInteger;
      ParamByName('empresa').AsString     := qryFornecedorEMPRESA.AsString;
      ParamByName('fornecedor').AsInteger := qryFornecedorFORNECEDOR.AsInteger;

      ExecProc;
    end;

    qryFornecedor.Next;
  end;
  CommitTransaction;

  qryFornecedor.Close;
  qryFornecedor.Open;
end;

procedure TfrmGeSolicitacaoCompra.SetCotacaoFornecedorProcessa(Empresa: String;
  Ano: Smallint; Codigo: Integer);
begin
  with stpSetCotacaoFornecedorProcessa do
  begin
    ParamByName('ano').AsInteger    := Ano;
    ParamByName('codigo').AsInteger := Codigo;
    ParamByName('empresa').AsString := Empresa;

    ExecProc;
    CommitTransaction;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeSolicitacaoCompra', TfrmGeSolicitacaoCompra);

end.
