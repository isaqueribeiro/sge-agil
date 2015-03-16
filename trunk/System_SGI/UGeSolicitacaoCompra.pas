unit UGeSolicitacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, IBStoredProc, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask;

type
  TfrmGeSolicitacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
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
    nmImprimirSolicitacao: TMenuItem;
    qryProduto: TIBDataSet;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    tblTipoSolicitacao: TIBTable;
    dtsTipoSolicitacao: TDataSource;
    lblDataValidade: TLabel;
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
    btnFinalizarSolicitacao: TcxButton;
    btnAprovarSolicitacao: TcxButton;
    btnCancelarSolicitacao: TcxButton;
    lblCentroCustoSolicitacao: TLabel;
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
    lblProdutoNaoCadastrado: TLabel;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    dbCentroCustoSolicitacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbCentroCustoItem: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    procedure dbCentroCustoSelecionar(Sender: TObject);
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
    procedure btnAprovarSolicitacaoClick(Sender: TObject);
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
    procedure nmImprimirSolicitacaoClick(Sender: TObject);
    procedure btnCancelarSolicitacaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarSolicitacaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure qryFornecedorVENCEDORGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCusto    : Integer;
    procedure AbrirTabelaItens(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);

    function GetRotinaFinalizarID : String;
    function GetRotinaAprovarID : String;
    function GetRotinaCancelarSolicitacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAprovarID   : String read GetRotinaAprovarID;
    property RotinaCancelarSolicitacaoID : String read GetRotinaCancelarSolicitacaoID;
  end;

var
  frmGeSolicitacaoCompra: TfrmGeSolicitacaoCompra;

  procedure MostrarControleSolicitacao(const AOwner : TComponent);

  function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeProduto,
  UGeCentroCusto, UGeSolicitacaoCompraCancelar;

{$R *.dfm}

procedure MostrarControleSolicitacao(const AOwner : TComponent);
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

function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeSolicitacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeSolicitacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarSolicitacao.Visible := False;
    frm.btnAprovarSolicitacao.Visible   := False;
    frm.btnCancelarSolicitacao.Visible  := False;

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
    btnFinalizarSolicitacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_EDC, STATUS_SOLICITACAO_ABR]) and (not cdsTabelaItens.IsEmpty);
    btnAprovarSolicitacao.Enabled   := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) and (not cdsTabelaItens.IsEmpty);
    btnCancelarSolicitacao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);

    nmImprimirSolicitacao.Enabled   := (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
  end
  else
  begin
    btnFinalizarSolicitacao.Enabled := False;
    btnAprovarSolicitacao.Enabled   := False;
    btnCancelarSolicitacao.Enabled  := False;

    nmImprimirSolicitacao.Enabled   := (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
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

    if ( not IbDtstTabelaDATA_EMISSAO.IsNull ) then
    begin
      if ( IbDtstTabelaDATA_EMISSAO.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;

      if ( IbDtstTabelaDATA_EMISSAO.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;
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

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_SOLICITACAO_FIN ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_SOLICITACAO_APR : sMsg := 'Esta solicita��o n�o pode ser alterada por j� est� aprovada/encerrada.';
      STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicita��o n�o pode ser alterada porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) then
      if not ShowConfirm('A an�lise da solicita��o selecionada est� em andamento (Aberta).' + #13 + 'Deseja coloc�-la em edi��o novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.AsInteger := STATUS_SOLICITACAO_EDC;
      dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicita��o reaberta para edi��o por ' + gUsuarioLogado.Login);
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_SOLICITACAO_FIN ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_SOLICITACAO_APR : sMsg := 'Esta solicita��o n�o pode ser exclu�da por j� est� aprovada/encerrada.';
      STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicita��o n�o pode ser exclu�da porque est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
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
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( Trim(IbDtstTabelaOBJETO_SOLICITACAO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma breve descri��o sobre o objeto da solicita��o!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
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
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;
*)
    end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensITEM_CODIGO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o c�digo do produto/servi�o.');
      dbProduto.SetFocus;
    end
    else
    if ( Trim(cdsTabelaItensITEM_DESCRICAO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar a descri��o do produto/servi�o.');
      dbProdutoNome.SetFocus;
    end
    else
    if ( cdsTabelaItensUNIDADE.AsInteger = 0 ) then
    begin
      ShowWarning('Favor selecionar a unidade de medida do produto/servi�o.');
      dbUnidade.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

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
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensUSUARIO.Value    := gUsuarioLogado.Login;
  cdsTabelaItensITEM_CADASTRADO.Value := 0;

  cdsTabelaItensCENTRO_CUSTO.Assign( IbDtstTabelaCENTRO_CUSTO );
  cdsTabelaItensCENTRO_CUSTO_NOME.Assign( IbDtstTabelaCENTRO_CUSTO_NOME );

  cdsTabelaItensITEM_CODIGO.Clear;
  cdsTabelaItensITEM_DESCRICAO.Clear;
end;

procedure TfrmGeSolicitacaoCompra.btnAprovarSolicitacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if not (IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_FIN) then
    ShowInformation('Apenas solicita��es finalizadas/encerradas podem sem aprovadas!')
  else
  if ( ShowConfirm('Confirma a aprova��o do solicita��o selecionada?') ) then
  begin
    IbDtstTabela.Edit;

    dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicita��o aprovada por ' + gUsuarioLogado.Login);
    IbDtstTabelaSTATUS.Value            := STATUS_SOLICITACAO_APR;
    IbDtstTabelaAPROVACAO_DATA.Value    := GetDateDB;
    IbDtstTabelaAPROVACAO_USUARIO.Value := gUsuarioLogado.Login;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Solicita��o aprovada realizada com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusSolicitacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_SOLICITACAO_APR );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
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

  pgcMaisDados.ActivePage := tbsEventoLOG;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iCentroCusto = 0, '', '(s.centro_custo = ' + IntToStr(iCentroCusto) + ') and ') +
    'cast(s.data_emissao as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusSolicitacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (s.status = ' + IntToStr(RdgStatusSolicitacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeSolicitacaoCompra.CarregarDadosProduto(Codigo: Integer);
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
        cdsTabelaItensITEM_CODIGO.AsString      := FieldByName('cod').AsString;
        cdsTabelaItensITEM_DESCRICAO.AsString   := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensUNP_DESCRICAO.AsString    := FieldByName('Unp_descricao').AsString;
        cdsTabelaItensITEM_CADASTRADO.AsInteger := 1;


        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado!');
        cdsTabelaItensITEM_CODIGO.Clear;
      end;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGeSolicitacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autoriza��o.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar altera��o em andamento no �tem da solicita��o!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger);

    if GetExisteNumeroSolicitacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('N�mero de solicita��o j� existe!');
      Abort;
    end;

    IbDtstTabelaSTATUS.AsInteger            := STATUS_SOLICITACAO_ABR;
    IbDtstTabelaOBJETO_SOLICITACAO.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBJETO_SOLICITACAO.AsString));
    IbDtstTabelaMOVITO.AsString             := Trim(AnsiUpperCase(IbDtstTabelaMOVITO.AsString));
    IbDtstTabelaOBSERVACAO.AsString         := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACAO.AsString));

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
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeSolicitacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      IbDtstTabelaVALIDADE.Value := IbDtstTabelaDATA_EMISSAO.Value + GetPrazoValidadeCotacaoCompra(IbDtstTabelaEMPRESA.AsString);

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensITEM_CODIGO.AsString, 0) );

  if ( Sender = dbQuantidade ) then
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
    // Destacar solicita��o em edi��o
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblSolicitacaoEmEdicao.Color
    else
    // Destacar solicita��o aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblSolicitacaoAberta.Font.Color
    else
    // Destacar solicita��o cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_SOLICITACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblSolicitacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos j� n�o cadastrados
  if ( Sender = dbgProdutos ) then
  begin
    if ( cdsTabelaItensITEM_CADASTRADO.AsInteger = 0 ) then
      dbgProdutos.Canvas.Font.Color := lblProdutoNaoCadastrado.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
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
  if ( Trim(IbDtstTabelaOBJETO_SOLICITACAO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma breve descri��o sobre o objeto da solicita��o!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
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
      TIPO_SOLICITACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_SOLICITACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensITEM_CODIGO.AsString      := sCodigoAlfa;
      cdsTabelaItensITEM_DESCRICAO.AsString   := sDescricao;
      cdsTabelaItensITEM_CADASTRADO.AsInteger := 1;
      cdsTabelaItensUNP_DESCRICAO.AsString    := sUnidade;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;
    
  end;
end;

procedure TfrmGeSolicitacaoCompra.nmImprimirSolicitacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa, GetEmailEmpresa(IbDtstTabelaEMPRESA.AsString), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qrySolicitacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCODIGO.AsInteger;
      ParamByName('emp').AsString  := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    frrSolicitacaoCompra.ShowReport;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnCancelarSolicitacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( not (IbDtstTabelaSTATUS.AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]) ) then
    ShowInformation('Apenas registros finalizados e/ou aprovados podem ser cancelados!')
  else
  if ( CancelarCOT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODIGO.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Solicita��o cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeSolicitacaoCompra.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_SOLICITACAO_EDC : Text := 'Em Edi��o';
    STATUS_SOLICITACAO_ABR : Text := 'Aberta';
    STATUS_SOLICITACAO_FIN : Text := 'Finalizada';
    STATUS_SOLICITACAO_APR : Text := 'Aprovada';
    STATUS_SOLICITACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnFinalizarSolicitacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( ShowConfirm('Confirma a finaliza��o da solicita��o?') ) then
  begin
    IbDtstTabela.Edit;

    dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicita��o finaizada por ' + gUsuarioLogado.Login);

    IbDtstTabelaSTATUS.Value := STATUS_SOLICITACAO_FIN;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Solicita��o finalizada com sucesso !' + #13#13 + 'Ano/N�mero: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusSolicitacao.ItemIndex := 0;
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
          if GetExisteNumeroSolicitacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('N�mero de solicita��o j� existe!' + #13 + 'Controle: ' + sControle);

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emiss�o da solicita��o est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

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
        Text := 'Servi�o';

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        Text := 'Compra/Servi�o';
    end;
end;

function TfrmGeSolicitacaoCompra.GetRotinaAprovarID: String;
begin
  Result := GetRotinaInternaID(btnAprovarSolicitacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaCancelarSolicitacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarSolicitacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarSolicitacao);
end;

procedure TfrmGeSolicitacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarSolicitacao.Caption, RotinaID);

    if btnAprovarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAprovarID, btnAprovarSolicitacao.Caption, RotinaID);

    if btnCancelarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarSolicitacaoID, btnCancelarSolicitacao.Caption, RotinaID);
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

procedure TfrmGeSolicitacaoCompra.dbCentroCustoSelecionar(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if (Sender = dbCentroCustoSolicitacao) then
    if ( IbDtstTabela.State in [dsInsert] ) then
      if ( SelecionarDepartamento(Self, 0, IbDtstTabelaEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
      begin
          IbDtstTabelaCENTRO_CUSTO.AsInteger     := iCodigo;
          IbDtstTabelaCENTRO_CUSTO_NOME.AsString := sNome;
      end;

  if (Sender = dbCentroCustoItem) then
    if ( cdsTabelaItens.State in [dsInsert] ) then
      if ( SelecionarDepartamento(Self, 0, IbDtstTabelaEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
      begin
          cdsTabelaItensCENTRO_CUSTO.AsInteger     := iCodigo;
          cdsTabelaItensCENTRO_CUSTO_NOME.AsString := sNome;
      end;
end;

initialization
  FormFunction.RegisterForm('frmGeSolicitacaoCompra', TfrmGeSolicitacaoCompra);

end.
