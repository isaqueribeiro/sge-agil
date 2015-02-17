unit UGeProdutoEstoqueImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ToolWin, ComCtrls, DBClient, Provider, DB, IBCustomDataSet,
  IBQuery, frxClass, frxDBSet;

type
  TfrmGeProdutoEstoqueImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    QryFabricante: TIBQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    frRelacaoProduto: TfrxReport;
    QryRelacaoProduto: TIBQuery;
    DspRelacaoProduto: TDataSetProvider;
    CdsRelacaoProduto: TClientDataSet;
    FrdsRelacaoProduto: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueProduto ,
    FSQL_DemandaEstoqueProduto : TStringList;
    IGrupo ,
    IFabricante : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
  public
    { Public declarations }
  end;

var
  frmGeProdutoEstoqueImpressao: TfrmGeProdutoEstoqueImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe;

const
  REPORT_RELACAO_ESTOQUE_PRODUTO = 0;
  
{$R *.dfm}

procedure TfrmGeProdutoEstoqueImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]));
      DMBusiness.ConfigurarEmail(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]), EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarEmpresa;
var
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount + 1);

    edEmpresa.Items.Add('(Todas)');
    IEmpresa[0] := EmptyStr;

    I := 1;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := 0;
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarFabricante;
var
  I : Integer;
begin
  with CdsFabricante do
  begin
    Open;

    edFabricante.Clear;
    SetLength(IFabricante, RecordCount + 1);

    edFabricante.Items.Add('(Todos)');
    IFabricante[0] := 0;

    I := 1;

    while not Eof do
    begin
      edFabricante.Items.Add( FieldByName('nome').AsString );
      IFabricante[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edFabricante.ItemIndex := 0;
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarGrupo;
var
  I : Integer;
begin
  with CdsGrupo do
  begin
    Open;

    edGrupo.Clear;
    SetLength(IGrupo, RecordCount + 1);

    edGrupo.Items.Add('(Todos)');
    IGrupo[0] := 0;

    I := 1;

    while not Eof do
    begin
      edGrupo.Items.Add( FieldByName('descri').AsString );
      IGrupo[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edGrupo.ItemIndex := 0;
end;

procedure TfrmGeProdutoEstoqueImpressao.FormCreate(Sender: TObject);
begin
  inherited;

  FSQL_RelacaoEstoqueProduto := TStringList.Create;
  FSQL_RelacaoEstoqueProduto.AddStrings( QryRelacaoProduto.SQL );

  FSQL_DemandaEstoqueProduto := TStringList.Create;
  FSQL_DemandaEstoqueProduto.AddStrings( QryDemandaProduto.SQL );
end;

procedure TfrmGeProdutoEstoqueImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarGrupo;
  CarregarFabricante;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoEstoqueImpressao', TfrmGeProdutoEstoqueImpressao);

end.
