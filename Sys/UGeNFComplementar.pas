unit UGeNFComplementar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoCadastro, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ImgList, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, JvExMask, JvToolEdit,
  IBX.IBTable, JvDBControls, Vcl.Buttons;

type
  TfrmGeNFComplementar = class(TfrmGrPadraoCadastro)
    btbtnGerarNFe: TcxButton;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dtsEmpresa: TDataSource;
    tblEmpresa: TIBTable;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    tblModalidadeFrete: TIBTable;
    dtsModalidadeFrete: TDataSource;
    btbtnCancelarNFC: TcxButton;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblNFeOrigem: TLabel;
    dbNFeOrigem: TJvDBComboEdit;
    IbDtstTabelaNFC_NUMERO: TIntegerField;
    IbDtstTabelaNFC_EMPRESA: TIBStringField;
    IbDtstTabelaNFC_TIPO: TSmallintField;
    IbDtstTabelaNFC_DATA: TDateField;
    IbDtstTabelaNFC_HORA: TTimeField;
    IbDtstTabelaNFC_EMISSAO: TDateField;
    IbDtstTabelaNFC_ENVIADA: TSmallintField;
    IbDtstTabelaNFC_TEXTO: TWideMemoField;
    IbDtstTabelaNFE_SERIE: TIBStringField;
    IbDtstTabelaNFE_NUMERO: TIntegerField;
    IbDtstTabelaNFE_MODELO: TSmallintField;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaRECIBO: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaNFC_MODALIDADE_FRETE: TSmallintField;
    IbDtstTabelaNFC_TRANSPORTADORA: TIntegerField;
    IbDtstTabelaNFC_PLACA_VEICULO: TIBStringField;
    IbDtstTabelaNFC_PLACA_UF: TIBStringField;
    IbDtstTabelaNFC_PLACA_RNTC: TIBStringField;
    IbDtstTabelaNFC_VALOR_BASE_ICMS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_ICMS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    IbDtstTabelaNFC_VALOR_ICMS_SUBST: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_FRETE: TIBBCDField;
    IbDtstTabelaNFC_VALOR_SEGURO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_DESCONTO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_II: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_IPI: TIBBCDField;
    IbDtstTabelaNFC_VALOR_PIS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_COFINS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_OUTROS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_NOTA: TIBBCDField;
    IbDtstTabelaCANCELADA: TSmallintField;
    IbDtstTabelaCANCELADA_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADA_DATAHORA: TDateTimeField;
    IbDtstTabelaCANCELADA_MOTIVO: TWideMemoField;
    IbDtstTabelaDESTINATARIO_NFE: TIBStringField;
    IbDtstTabelaDESTINATARIO_CODIGO: TIntegerField;
    IbDtstTabelaDESTINATARIO_RAZAO: TIBStringField;
    IbDtstTabelaDESTINATARIO_CNPJ: TIBStringField;
    lblDestintario: TLabel;
    dbDestintario: TJvDBComboEdit;
    lblDestinatarioCnpj: TLabel;
    dbDestinatarioCnpj: TDBEdit;
    dbTipo: TDBRadioGroup;
    IbDtstTabelaNFC_EMISSOR: TIBStringField;
    lblEmissor: TLabel;
    dbEmissor: TDBEdit;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorDiferenca: TLabel;
    lblValorUn: TLabel;
    lblUnidade: TLabel;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    lblCST: TLabel;
    Bevel7: TBevel;
    lblAliquotaST: TLabel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorDiferenca: TDBEdit;
    dbValorUn: TDBEdit;
    dbUnidade: TDBEdit;
    dbAliquota: TDBEdit;
    dbCST: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoEditar: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    dbAliquotaST: TDBEdit;
    dbProduto: TJvDBComboEdit;
    dbCFOP: TJvDBComboEdit;
    lblValorBcIcms: TLabel;
    dbValorBcIcms: TDBEdit;
    lblValorIcms: TLabel;
    dbValorIcms: TDBEdit;
    lblValorBcIcmsST: TLabel;
    dbValorBcIcmsST: TDBEdit;
    dbValorIcmsST: TDBEdit;
    lblValorIcmsST: TLabel;
    lblValorTotalGeral: TLabel;
    dbValorTotalGeral: TDBEdit;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbsTransporte: TTabSheet;
    TbsInformeNFe: TTabSheet;
    lblLogNFeLote: TLabel;
    lblLogNFeLoteDataEmissao: TLabel;
    lblLogNFeLoteChave: TLabel;
    lblLogNFeLoteRecibo: TLabel;
    lblLogNFeLoteProtocolo: TLabel;
    lblLogNFeLoteArquivo: TLabel;
    lblLogNFeCancelMotivo: TLabel;
    lblLogNFeCancelUsuario: TLabel;
    lblLogNFeCancelData: TLabel;
    lblLogNFeUsuario: TLabel;
    BtnLimparDadosNFe: TSpeedButton;
    dbLogNFeLote: TDBEdit;
    d1LogNFeLoteDataEmissao: TDBEdit;
    d2LogNFeLoteDataEmissao: TDBEdit;
    dbLogNFeLoteChave: TDBEdit;
    dbLogNFeLoteRecibo: TDBEdit;
    dbLogNFeLoteProtocolo: TDBEdit;
    dbLogNFeLoteArquivo: TDBEdit;
    dbLogNFeCancelMotivo: TDBMemo;
    dbLogNFeCancelUsuario: TDBEdit;
    dbLogNFeCancelData: TDBEdit;
    dbLogNFeUsuario: TDBEdit;
    Bevel6: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    lblBaseICMS: TLabel;
    lblBaseICMSSubs: TLabel;
    lblTotalProduto: TLabel;
    lblValorOutros: TLabel;
    lblTotalNotaFiscal: TLabel;
    lblValorDesconto: TLabel;
    lblValorIPI: TLabel;
    lblValorICMSSubs: TLabel;
    lblValorIcmsNF: TLabel;
    dbValorFrete: TDBEdit;
    dbBaseICMS: TDBEdit;
    dbBaseICMSSubs: TDBEdit;
    dbTotalProduto: TDBEdit;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    dbValorDesconto: TDBEdit;
    dbValorIPI: TDBEdit;
    dbValorICMSSubs: TDBEdit;
    dbValorIcmsNF: TDBEdit;
    dbgProdutos: TDBGrid;
    pnlObservacao: TPanel;
    lblObservacao: TLabel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    dbObservacao: TDBMemo;
    cdsTabelaItensNFC_NUMERO: TIntegerField;
    cdsTabelaItensNFC_ITEM: TSmallintField;
    cdsTabelaItensMOV_ANO: TSmallintField;
    cdsTabelaItensMOV_CONTROLE: TIntegerField;
    cdsTabelaItensMOV_EMPRESA: TIBStringField;
    cdsTabelaItensMOV_SEQ: TSmallintField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensVALOR_DIFERENCA: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL: TIBBCDField;
    cdsTabelaItensALIQUOTA_ICMS: TIBBCDField;
    cdsTabelaItensBC_ICMS: TIBBCDField;
    cdsTabelaItensVALOR_ICMS: TIBBCDField;
    cdsTabelaItensALIQUOTA_ICMS_ST: TIBBCDField;
    cdsTabelaItensBC_ICMS_ST: TIBBCDField;
    cdsTabelaItensVALOR_ICMS_ST: TIBBCDField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensMOV_QUANTIDADE: TIBBCDField;
    cdsTabelaItensMOV_UNIDADE: TIBStringField;
    cdsTabelaItensMOV_UNIDADE_SIGLA: TIBStringField;
    cdsTabelaItensMOV_VALOR_UN: TIBBCDField;
    cdsTabelaItensMOV_VALOR_TOTAL: TFMTBCDField;
    cdsTabelaItensMOV_CFOP: TIntegerField;
    cdsTabelaItensMOV_CFOP_DESCRICAO: TIBStringField;
    cdsTabelaItensMOV_CST: TIBStringField;
    cdsTabelaItensMOV_CSOSN: TIBStringField;
    cdsTabelaItensMOV_ALIQUOTA: TIBBCDField;
    cdsTabelaItensMOV_ALIQUOTA_CSOSN: TIBBCDField;
    qryNFE: TIBDataSet;
    qryNFEEMPRESA: TIBStringField;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFEMODELO: TSmallintField;
    qryNFEVERSAO: TSmallintField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    updNFE: TIBUpdateSQL;
    dtsNFE: TDataSource;
    cdsTabelaItensMOV_VALOR_UN_NOVO: TIBBCDField;
    cdsTabelaItensMOV_TOTAL_GERAL: TIBBCDField;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    cdsTabelaItensMOV_ALIQUOTA_ST: TIBBCDField;
    cdsTabelaItensMOV_ALIQUOTA_MVA: TIBBCDField;
    qryProdutos: TIBDataSet;
    btnProdutoCancelar: TBitBtn;
    procedure pgcGuiasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNFC_DATAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbNFeOrigemButtonClick(Sender: TObject);
    procedure IbDtstTabelaDESTINATARIO_CNPJGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoCancelarClick(Sender: TObject);
  private
    { Private declarations }
    SQL_Itens : TStringList;
    procedure RecarregarRegistro;
    procedure AbrirTabelaItens(const Controle : Integer);
    procedure AbrirNotaFiscal(const Empresa : String; const Controle : Integer);

    procedure HabilitarDesabilitar_Btns;
    procedure CarregarProdutos(const aEmpresa, aSerie : String;const aNumero, aModelo : Integer);

    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarNFCID : String;

    procedure RegistrarNovaRotinaSistema;
    procedure pgcGuiasOnChange; override;
  public
    { Public declarations }
    property RotinaGerarNFeID    : String read GetRotinaGerarNFeID;
    property RotinaCancelarNFCID : String read GetRotinaCancelarNFCID;
  end;

var
  frmGeNFComplementar: TfrmGeNFComplementar;

implementation

uses
  UDMBusiness, UConstantesDGE, UGeNFEmitida, UDMNFe;

{$R *.dfm}

procedure TfrmGeNFComplementar.AbrirNotaFiscal(const Empresa : String; const Controle: Integer);
begin
  with qryNFE do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;
end;

procedure TfrmGeNFComplementar.AbrirTabelaItens(const Controle: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.nfc_numero = ' + IntToStr(Controle));
    Add('order by');
    Add('    i.nfc_numero');
    Add('  , i.nfc_item');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaNUMERO.AsInteger > 0 ) then
  begin
    if ( IbDtstTabelaCANCELADA.AsInteger = 1 ) then
      sMsg := 'Esta nota complementar não pode ser alterada porque está cancelada.'
    else
      sMsg := 'Esta nota complementar não pode ser alterada porque está finalizada.';

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
      AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
    end;
  end;
end;

procedure TfrmGeNFComplementar.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaNUMERO.AsInteger > 0 ) then
  begin
    if ( IbDtstTabelaCANCELADA.AsInteger = 1 ) then
      sMsg := 'Esta nota complementar não pode ser excluída porque está cancelada.'
    else
      sMsg := 'Esta nota complementar não pode ser excluída porque está finalizada.';

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
      AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
    end;
  end;
end;

procedure TfrmGeNFComplementar.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
    AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
  end;
end;

procedure TfrmGeNFComplementar.btbtnSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da venda.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no produto da nota complementar!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if ( IbDtstTabelaNFC_VALOR_TOTAL_NOTA.AsCurrency <= 0 ) then
      IbDtstTabelaNFC_VALOR_TOTAL_NOTA.Clear;

    inherited;

  end;
end;

procedure TfrmGeNFComplementar.btnProdutoCancelarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    cdsTabelaItens.Cancel;
    btnProdutoEditar.SetFocus;
  end;
end;

procedure TfrmGeNFComplementar.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeNFComplementar.CarregarProdutos(const aEmpresa, aSerie : String;const aNumero, aModelo : Integer);
var
  cAliquotaNormal,
  cAliquotaST    : Currency;
begin
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );

  with qryProdutos do
  begin
    Close;
    ParamByName('empresa').AsString := aEmpresa;
    ParamByName('serie').AsString   := aSerie;
    ParamByName('numero').AsInteger := aNumero;
    ParamByName('modelo').AsInteger := aModelo;
    Open;

    AliquotaIcms(GetEmpresaUF(IbDtstTabelaNFC_EMPRESA.AsString)
      , IfThen(TTipoNF(IbDtstTabelaNFC_TIPO.AsInteger) = tnfEntrada,
          GetFornecedorUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger),
          GetClienteUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger))
      , cAliquotaNormal
      , cAliquotaST);

    First;
    while not Eof do
    begin
      cdsTabelaItens.Append;
      cdsTabelaItensNFC_NUMERO.Assign( IbDtstTabelaNFC_NUMERO );
      cdsTabelaItensNFC_ITEM.Value := RecNo;
      cdsTabelaItensMOV_ANO.Value         := FieldByName('mov_ano').AsInteger;
      cdsTabelaItensMOV_CONTROLE.Value    := FieldByName('mov_controle').AsInteger;
      cdsTabelaItensMOV_EMPRESA.Value     := FieldByName('mov_empresa').AsString;
      cdsTabelaItensMOV_SEQ.Value         := FieldByName('mov_seq').AsInteger;
      cdsTabelaItensPRODUTO.Value         := FieldByName('mov_produto').AsString;
      cdsTabelaItensQUANTIDADE.Value      := 0.0;
      cdsTabelaItensVALOR_DIFERENCA.Value := 0.0;
      cdsTabelaItensVALOR_TOTAL.Value     := 0.0;
      cdsTabelaItensALIQUOTA_ICMS.Value   := 0.0;
      cdsTabelaItensBC_ICMS.Value         := 0.0;
      cdsTabelaItensVALOR_ICMS.Value      := 0.0;
      cdsTabelaItensALIQUOTA_ICMS_ST.Value    := 0.0;
      cdsTabelaItensBC_ICMS_ST.Value          := 0.0;
      cdsTabelaItensVALOR_ICMS_ST.Value       := 0.0;
      cdsTabelaItensDESCRI_APRESENTACAO.Value := FieldByName('mov_produto_descricao').AsString;
      cdsTabelaItensMOV_QUANTIDADE.Value      := FieldByName('mov_quantidade').AsCurrency;
      cdsTabelaItensMOV_UNIDADE.Value         := FieldByName('mov_unidade').AsString;
      cdsTabelaItensMOV_UNIDADE_SIGLA.Value   := FieldByName('mov_unidade_sigla').AsString;
      cdsTabelaItensMOV_VALOR_UN.Value        := FieldByName('mov_valor_un').AsCurrency;
      cdsTabelaItensMOV_CFOP.Value            := FieldByName('mov_cfop').AsInteger;
      cdsTabelaItensMOV_CFOP_DESCRICAO.Value  := FieldByName('mov_cfop_descricao').AsString;
      cdsTabelaItensMOV_CST.Value             := FieldByName('mov_cst').AsString;
      cdsTabelaItensMOV_CSOSN.Value           := FieldByName('mov_csosn').AsString;
      cdsTabelaItensMOV_ALIQUOTA.Value        := FieldByName('mov_aliquota').AsCurrency;
      cdsTabelaItensMOV_ALIQUOTA_CSOSN.Value  := FieldByName('mov_aliquota_csosn').AsCurrency;
      cdsTabelaItensMOV_VALOR_UN_NOVO.Value   := FieldByName('mov_valor_un').AsCurrency;
      cdsTabelaItensMOV_VALOR_TOTAL.Value     := FieldByName('mov_valor_total').AsCurrency;
      cdsTabelaItensMOV_TOTAL_GERAL.Value     := FieldByName('mov_valor_total').AsCurrency + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      cdsTabelaItensMOV_ALIQUOTA_ST.Value     := cAliquotaST;
      cdsTabelaItensMOV_ALIQUOTA_MVA.Value    := 0.0;
      cdsTabelaItens.Post;

      Next;
    end;

    cdsTabelaItens.First;
  end;
end;

procedure TfrmGeNFComplementar.ControlEditExit(Sender: TObject);
var
  cAliquotaNormal,
  cAliquotaST    : Currency;
begin
  inherited;
  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_DIFERENCA.AsCurrency := (cdsTabelaItensMOV_VALOR_UN_NOVO.AsCurrency - cdsTabelaItensMOV_VALOR_UN.AsCurrency);
      cdsTabelaItensVALOR_TOTAL.AsCurrency     :=
        ( (cdsTabelaItensMOV_QUANTIDADE.AsCurrency + cdsTabelaItensQUANTIDADE.AsCurrency) *
          (cdsTabelaItensMOV_VALOR_UN.AsCurrency + cdsTabelaItensVALOR_DIFERENCA.AsCurrency) ) -
        cdsTabelaItensMOV_VALOR_TOTAL.AsCurrency;
      cdsTabelaItensMOV_TOTAL_GERAL.AsCurrency := (cdsTabelaItensMOV_VALOR_TOTAL.AsCurrency + cdsTabelaItensVALOR_TOTAL.AsCurrency);
    end;

  // Buscar os percentuais de Aliquota ICMS
  if ( (Sender = dbValorBcIcms) or (Sender = dbValorBcIcmsST) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      AliquotaIcms(GetEmpresaUF(IbDtstTabelaNFC_EMPRESA.AsString)
        , IfThen(TTipoNF(IbDtstTabelaNFC_TIPO.AsInteger) = tnfEntrada,
            GetFornecedorUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger),
            GetClienteUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger))
        , cAliquotaNormal
        , cAliquotaST);
    end;

  // Calcular o valor da Aliquota ICMS de acordo o percentual do ICMS Normal
  if ( Sender = dbValorBcIcms ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( cdsTabelaItensBC_ICMS.AsCurrency > 0 ) then
      begin
        cdsTabelaItensALIQUOTA_ICMS.AsCurrency := 100.0;
        cdsTabelaItensVALOR_ICMS.AsCurrency    := cdsTabelaItensBC_ICMS.AsCurrency * cAliquotaNormal / 100;
      end
      else
      begin
        cdsTabelaItensALIQUOTA_ICMS.AsCurrency := 0.0;
        cdsTabelaItensVALOR_ICMS.AsCurrency    := 0.0;
      end;

  // Calcular o valor da Aliquota ICMS de acordo o percentual do ICMS ST
  if ( Sender = dbValorBcIcmsST ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( cdsTabelaItensBC_ICMS_ST.AsCurrency > 0 ) then
      begin
        cdsTabelaItensALIQUOTA_ICMS_ST.AsCurrency := 100.0;
        cdsTabelaItensVALOR_ICMS_ST.AsCurrency    := cdsTabelaItensBC_ICMS_ST.AsCurrency * cAliquotaST / 100;
      end
      else
      begin
        cdsTabelaItensALIQUOTA_ICMS_ST.AsCurrency := 0.0;
        cdsTabelaItensVALOR_ICMS_ST.AsCurrency    := 0.0;
      end;

  if ( Sender = dbValorIcmsST ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeNFComplementar.dbNFeOrigemButtonClick(Sender: TObject);
var
  sEmpresa,
  sSerie  : String;
  iNumero ,
  iModelo : Integer;
  aDestinatario : TDestinatarioNF;
begin
  sEmpresa := IbDtstTabelaNFC_EMPRESA.AsString;
  if ( IbDtstTabela.State in [dsInsert] ) then
    if ( SelecionarNFe(Self, sEmpresa, sSerie, iNumero, iModelo, aDestinatario) ) then
    begin
      IbDtstTabelaNFE_SERIE.Value  := sSerie;
      IbDtstTabelaNFE_NUMERO.Value := iNumero;
      IbDtstTabelaNFE_MODELO.Value := iModelo;
      IbDtstTabelaDESTINATARIO_NFE.Value    := FormatFloat('0000000', iNumero) + '-' + sSerie;
      IbDtstTabelaDESTINATARIO_CODIGO.Value := aDestinatario.Codigo;
      IbDtstTabelaDESTINATARIO_RAZAO.Value  := aDestinatario.RazaoSocial;
      IbDtstTabelaDESTINATARIO_CNPJ.Value   := aDestinatario.CpfCnpj;

      IbDtstTabelaFORNECEDOR.Clear;
      IbDtstTabelaCLIENTE.Clear;

      IbDtstTabelaNFC_TIPO.AsInteger := Ord(aDestinatario.Tipo);

      Case aDestinatario.Tipo of
        dtFornecedor : IbDtstTabelaFORNECEDOR.AsInteger := aDestinatario.Codigo;
        dtCliente    : IbDtstTabelaCLIENTE.AsInteger    := aDestinatario.Codigo;
      end;

      CarregarProdutos(sEmpresa, sSerie, iNumero, iModelo);
      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeNFComplementar.DtSrcTabelaItensStateChange(Sender: TObject);
begin
  btnProdutoEditar.Enabled   := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoCancelar.Enabled := ( cdsTabelaItens.State in [dsEdit, dsInsert] );
  btnProdutoSalvar.Enabled   := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit] ) then
    if ( dbQuantidade.Visible and dbQuantidade.Enabled ) then
      dbQuantidade.SetFocus;
end;

procedure TfrmGeNFComplementar.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  dbNFeOrigem.Button.Enabled   := (IbDtstTabela.State = dsInsert);

  DtSrcTabelaItens.AutoEdit   := DtSrcTabela.AutoEdit and (IbDtstTabelaRECIBO.AsString = EmptyStr);
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeNFComplementar.FormCreate(Sender: TObject);
begin
  inherited;
  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  tblModalidadeFrete.Open;

  RotinaID := ROTINA_NFE_COMPLEMENTAR_ID;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBNFE_COMPLEMENTAR';
  CampoCodigo    := 'nf.nfc_numero';
  CampoDescricao := 'coalesce(f.nomeforn, c.nome)';
  CampoOrdenacao := 'coalesce(nf.nfc_emissao, nf.nfc_data), coalesce(f.nomeforn, c.nome)';

  WhereAdditional := 'coalesce(nf.nfc_emissao, nf.nfc_data) between ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  btbtnGerarNFe.Visible := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
end;

procedure TfrmGeNFComplementar.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TfrmGeNFComplementar.GetRotinaCancelarNFCID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarNFC);
end;

function TfrmGeNFComplementar.GetRotinaGerarNFeID: String;
begin
  Result := GetRotinaInternaID(btbtnGerarNFe);
end;

procedure TfrmGeNFComplementar.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnLista.Enabled       := (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1) and
      GetPermissaoRotinaInterna(btbtnLista, False);
    btbtnGerarNFe.Enabled    := (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaRECIBO.AsString <> EmptyStr);
    btbtnCancelarNFC.Enabled := (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1);
  end
  else
  begin
    btbtnLista.Enabled       := (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1) and
      GetPermissaoRotinaInterna(btbtnLista, False);
    btbtnGerarNFe.Enabled    := False;
    btbtnCancelarNFC.Enabled := False;
  end;
end;

procedure TfrmGeNFComplementar.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
  AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
end;

procedure TfrmGeNFComplementar.IbDtstTabelaDESTINATARIO_CNPJGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if StrIsCNPJ(Sender.AsString) then
      Text := StrFormatarCnpj(Sender.AsString)
    else
    if StrIsCPF(Sender.AsString) then
      Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeNFComplementar.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  IbDtstTabelaNFC_EMPRESA.Value := gUsuarioLogado.Empresa;
  IbDtstTabelaNFC_DATA.Value    := GetDateDB;
  IbDtstTabelaNFC_HORA.Value    := GetTimeDB;
  IbDtstTabelaNFC_EMISSAO.Value := GetDateDB;
  IbDtstTabelaNFC_EMISSOR.Value := gUsuarioLogado.Login;
  IbDtstTabelaNFC_ENVIADA.Value := 0;
  IbDtstTabelaNFC_MODALIDADE_FRETE.Value := 0;

  IbDtstTabelaNFC_VALOR_BASE_ICMS.Value       := 0.0;
  IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST.Value := 0.0;
  IbDtstTabelaNFC_VALOR_ICMS.Value            := 0.0;
  IbDtstTabelaNFC_VALOR_ICMS_SUBST.Value      := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_FRETE.Value           := 0.0;
  IbDtstTabelaNFC_VALOR_DESCONTO.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_SEGURO.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_OUTROS.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_II.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_IPI.Value  := 0.0;
  IbDtstTabelaNFC_VALOR_PIS.Value        := 0.0;
  IbDtstTabelaNFC_VALOR_COFINS.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_NOTA.Value := 0.0;

  IbDtstTabelaCANCELADA.Value            := 0;
  IbDtstTabelaCANCELADA_USUARIO.Clear;
  IbDtstTabelaCANCELADA_DATAHORA.Clear;
  IbDtstTabelaCANCELADA_MOTIVO.Clear;
  IbDtstTabelaNFC_TEXTO.Clear;
  IbDtstTabelaNFE_SERIE.Clear;
  IbDtstTabelaNFE_NUMERO.Clear;
  IbDtstTabelaNFE_MODELO.Clear;
  IbDtstTabelaRECIBO.Clear;
end;

procedure TfrmGeNFComplementar.IbDtstTabelaNFC_DATAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime) + ' ' + FormatDateTime('hh:mm', IbDtstTabelaNFC_HORA.AsDateTime);
end;

procedure TfrmGeNFComplementar.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
  AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );

  pgcMaisDados.ActivePage := tbsValores;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.RecarregarRegistro;
var
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNFC_NUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    IbDtstTabela.Close;
    IbDtstTabela.Open;
    if not IbDtstTabela.Locate('NFC_NUMERO', sID, []) then
      raise Exception.Create('Registro não sincronizado com a base.' + #13 + 'Favor executar pesquisa para localizá-lo!');
  end;
end;

procedure TfrmGeNFComplementar.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnGerarNFe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarNFeID, btbtnGerarNFe.Caption, RotinaID);

    if btbtnCancelarNFC.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarNFCID, btbtnCancelarNFC.Caption, RotinaID);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeNFComplementar', TfrmGeNFComplementar);

end.
