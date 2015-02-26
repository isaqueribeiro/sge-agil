unit UGeApropriacaoEstoqueImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ToolWin, ComCtrls;

type
  TfrmGeApropriacaoEstoqueImpressao = class(TfrmGrPadraoImpressao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeApropriacaoEstoqueImpressao: TfrmGeApropriacaoEstoqueImpressao;

implementation

{$R *.dfm}

end.
