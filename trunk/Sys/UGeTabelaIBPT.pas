unit UGeTabelaIBPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, dblookup, IBQuery, IBTable,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TfrmGeTabelaIBPT = class(TfrmGrPadraoCadastro)
    IbDtstTabelaID_IBPT: TIntegerField;
    IbDtstTabelaNCM_IBPT: TIBStringField;
    IbDtstTabelaEX_IBPT: TIBStringField;
    IbDtstTabelaTABELA_IBPT: TIBStringField;
    IbDtstTabelaDESCRICAO_IBPT: TWideMemoField;
    IbDtstTabelaALIQNACIONAL_IBPT: TIBBCDField;
    IbDtstTabelaALIQINTERNACIONAL_IBPT: TIBBCDField;
    IbDtstTabelaALIQESTADUAL_IBPT: TIBBCDField;
    IbDtstTabelaALIQMUNICIPAL_IBPT: TIBBCDField;
    lblCodigoNCM: TLabel;
    dbCodigoNCM: TDBEdit;
    dbDescricao: TDBMemo;
    lblDescricao: TLabel;
    qryNivelIBPT: TIBQuery;
    dtsNivelIBPT: TDataSource;
    lblNivel: TLabel;
    dbNivel: TDBLookupComboBox;
    lblTabela: TLabel;
    dbTabela: TDBLookupComboBox;
    qryTabelaIBPT: TIBQuery;
    dtsTabelaIBPT: TDataSource;
    GrpBxAliquotas: TGroupBox;
    lblAliquotaNAC: TLabel;
    dbAliquotaNAC: TDBEdit;
    lblAliquotaINT: TLabel;
    dbAliquotaINT: TDBEdit;
    dbAliquotaEST: TDBEdit;
    lblAliquotaEST: TLabel;
    dbAliquotaMUN: TDBEdit;
    lblAliquotaMUN: TLabel;
    btnImportar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
  private
    { Private declarations }
    FApenasServicos : Boolean;
  public
    { Public declarations }
    procedure FiltarDados(const aTipo : Integer = 0); overload;
  end;

var
  frmGeTabelaIBPT: TfrmGeTabelaIBPT;

  function SelecionarCodigoIBPT(const AOwner : TComponent; const ApenasServicos : Boolean;
    var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGeTabelaIBPTImportar;

{$R *.dfm}

function SelecionarCodigoIBPT(const AOwner : TComponent; const ApenasServicos : Boolean;
  var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;
var
  frm : TfrmGeTabelaIBPT;
begin
  frm := TfrmGeTabelaIBPT.Create(AOwner);
  try
    frm.FApenasServicos := ApenasServicos;

    Result := frm.SelecionarRegistro(aIndice, aDescricao);

    if Result then
      aCodigo := frm.IbDtstTabelaNCM_IBPT.AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaIBPT.btnFiltrarClick(Sender: TObject);
begin
  if FApenasServicos then
    WhereAdditional := 't.tabela_ibpt in (''1'', ''2'')';

  //inherited;
  FiltarDados(0);
end;

procedure TfrmGeTabelaIBPT.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  btnImportar.Enabled := btbtnIncluir.Enabled;
end;

procedure TfrmGeTabelaIBPT.FiltarDados(const aTipo: Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with IbDtstTabela, SelectSQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        Case aTipo of
          // Por ID, Código NCM
          0:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
            begin
              Add( 'where ((' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) );
              Add( '  or (t.ncm_ibpt like ' + QuotedStr(Trim(edtFiltrar.Text) + '%') + '))' );
            end
            else
            begin
              Add( 'where ((upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '     or upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
            end;
        end;

      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SelectSQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try

        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + IbDtstTabela.SelectSQL.Text);
  end;
end;

procedure TfrmGeTabelaIBPT.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_TABELA_IBPT_ID;
  ControlFirstEdit := dbCodigoNCM;

  DisplayFormatCodigo := '0000000';

  NomeTabela      := 'SYS_IBPT';
  CampoCodigo     := 't.id_ibpt';
  CampoDescricao  := 't.descricao_ibpt';
  CampoOrdenacao  := 't.tabela_ibpt, t.ex_ibpt, t.ncm_ibpt, t.descricao_ibpt';
  AbrirTabelaAuto := True;

  UpdateGenerator;

  qryNivelIBPT.Open;
  qryTabelaIBPT.Open;
end;

procedure TfrmGeTabelaIBPT.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEX_IBPT.Value := '0';
  IbDtstTabelaALIQNACIONAL_IBPT.Value      := 0.0;
  IbDtstTabelaALIQINTERNACIONAL_IBPT.Value := 0.0;
  IbDtstTabelaALIQESTADUAL_IBPT.Value      := 0.0;
  IbDtstTabelaALIQMUNICIPAL_IBPT.Value     := 0.0;
  IbDtstTabelaTABELA_IBPT.Clear;
  IbDtstTabelaDESCRICAO_IBPT.Clear;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaIBPT', TfrmGeTabelaIBPT);

end.
