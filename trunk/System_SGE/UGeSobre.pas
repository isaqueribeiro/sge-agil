unit UGeSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, USobre, StdCtrls, ExtCtrls, dxGDIPlusClasses, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeSobre = class(TfrmSobre)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowAbout(const AOwer : TComponent);

implementation

uses UDMBusiness, UFuncoes, UConstantesDGE, UInfoVersao;

{$R *.dfm}

procedure ShowAbout(const AOwer : TComponent);
var
  frm : TfrmGeSobre;
begin
  frm := TfrmGeSobre.Create(AOwer);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeSobre.FormCreate(Sender: TObject);
var
  sCNPJ : String;
  ver : TInfoVersao;
begin
  inherited;
  ver := TInfoVersao.GetInstance;

  (* -- Isaque : 22/04/2014 -> Bloco de c�digo descontinuado

  if ( StrIsCNPJ(gUsuarioLogado.Empresa) ) then
    sCNPJ := StrFormatarCnpj(gUsuarioLogado.Empresa)
  else
    sCNPJ := StrFormatarCpf(gUsuarioLogado.Empresa);

  Comments.Caption :=
    'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
    'com licen�a de uso para ' + GetEmpresaNomeDefault + ' CPF/CNPJ.: '  + sCNPJ + ' ' +
    'atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + '.';
  *)
  
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := StrFormatarCpf(gLicencaSistema.CNPJ);

  Comments.Caption :=
    'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
    'com licen�a de uso para ' + gLicencaSistema.Empresa    + ', com CPF/CNPJ.: '  + sCNPJ + '.' + #13 +
    'Atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + ', ' +
    'tendo como compet�ncia limite ' + IntToStr(gLicencaSistema.Competencia) +
    ' (' + DateToStr(gLicencaSistema.DataBloqueio) + ').';
end;

end.
