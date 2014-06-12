program SGE_PDV;

uses
  Windows,
  Forms,
  Controls,
  IniFiles,
  SysUtils,
  MidasLIB,
  HPL_Strings in '..\Sys\lib\HPL_Strings.pas',
  UPrinc in 'UPrinc.pas' {frmPrinc},
  UDMBusiness in '..\Sys\UDMBusiness.pas' {DMBusiness: TDataModule},
  USobre in '..\Sys\USobre.pas' {frmSobre},
  UGrPadraoCadastro in '..\Sys\lib\UGrPadraoCadastro.pas' {frmGrPadraoCadastro},
  UGrPadrao in '..\Sys\lib\UGrPadrao.pas' {frmGrPadrao},
  UGeBancos in '..\Sys\UGeBancos.pas' {frmGeBancos},
  UGeTipoLogradouro in '..\Sys\UGeTipoLogradouro.pas' {frmGeTipoLogradouro},
  UGeEstado in '..\Sys\UGeEstado.pas' {frmGeEstado},
  UGeCidade in '..\Sys\UGeCidade.pas' {frmGeCidade},
  UGeDistrito in '..\Sys\UGeDistrito.pas' {frmGeDistrito},
  UGeBairro in '..\Sys\UGeBairro.pas' {frmGeBairro},
  UGeLogradouro in '..\Sys\UGeLogradouro.pas' {frmGeLogradouro},
  UGeEmpresa in '..\Sys\UGeEmpresa.pas' {frmGeEmpresa},
  UGeCliente in '..\Sys\UGeCliente.pas' {frmGeCliente},
  UGeFornecedor in '..\Sys\UGeFornecedor.pas' {frmGeFornecedor},
  UGeGrupoProduto in '..\Sys\UGeGrupoProduto.pas' {frmGeGrupoProduto},
  UGeSecaoProduto in '..\Sys\UGeSecaoProduto.pas' {frmGeSecaoProduto},
  UGeUnidade in '..\Sys\UGeUnidade.pas' {frmGeUnidade},
  UGeTabelaCFOP in '..\Sys\UGeTabelaCFOP.pas' {frmGeTabelaCFOP},
  UGeFormaPagto in '..\Sys\UGeFormaPagto.pas' {frmGeFormaPagto},
  UGeVendedor in '..\Sys\UGeVendedor.pas' {frmGeVendedor},
  UGeCondicaoPagto in '..\Sys\UGeCondicaoPagto.pas' {frmGeCondicaoPagto},
  UDMNFe in '..\Sys\UDMNFe.pas' {DMNFe: TDataModule},
  UGeConfigurarNFeACBr in '..\Sys\UGeConfigurarNFeACBr.pas' {frmGeConfigurarNFeACBr},
  UEnviarLoteNFe in '..\Sys\UEnviarLoteNFe.pas' {frmEnviarLoteNFe},
  ChkDgVer in '..\Sys\lib\ChkDgVer.pas',
  UGrCampoRequisitado in '..\Sys\lib\UGrCampoRequisitado.pas' {frmCampoRequisitado},
  UGeGerarBoletos in '..\Sys\UGeGerarBoletos.pas' {frmGeGerarBoleto},
  UGePromocao in '..\Sys\UGePromocao.pas' {frmGePromocao},
  UGeContaCorrente in '..\Sys\UGeContaCorrente.pas' {frmGeContaCorrente},
  UGeCaixa in '..\Sys\UGeCaixa.pas' {frmGeCaixa},
  UGeFluxoCaixa in '..\Sys\UGeFluxoCaixa.pas' {frmGeFluxoCaixa},
  UFuncoes in '..\Sys\lib\UFuncoes.pas',
  UInfoVersao in '..\Sys\lib\UInfoVersao.pas',
  UGeFabricante in '..\Sys\UGeFabricante.pas' {frmGeFabricante},
  FormFactoryU in '..\Sys\lib\FormFactoryU.pas',
  FuncoesFormulario in '..\Sys\lib\FuncoesFormulario.pas',
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  UGeExportarNFeGerada in '..\Sys\UGeExportarNFeGerada.pas' {frmGeExportarNFeGerada},
  UGeSobre in '..\System_SGE\UGeSobre.pas' {frmGeSobre},
  UGrUsuarioAlterarSenha_v2 in '..\System_SGE\UGrUsuarioAlterarSenha_v2.pas' {frmGrUsuarioAlterarSenha},
  UGrPesq in '..\System_SGE\UGrPesq.pas' {frmPesq},
  UGrPadraoPesquisa in '..\Sys\lib\UGrPadraoPesquisa.pas' {frmGrPadraoPesquisa},
  UGeConfiguracaoEmpresa in '..\Sys\UGeConfiguracaoEmpresa.pas' {frmGeConfiguracaoEmpresa},
  UGrPadraoLogin in '..\Sys\lib\UGrPadraoLogin.pas' {frmGrPadraoLogin},
  UObserverInterface in '..\Sys\lib\UObserverInterface.pas',
  UBaseObject in '..\Sys\lib\UBaseObject.pas',
  UCliente in '..\Sys\lib\UCliente.pas',
  UGrPadraoImpressao in '..\System_SGE\lib\UGrPadraoImpressao.pas' {frmGrPadraoImpressao},
  UGeProduto in '..\Sys\UGeProduto.pas' {frmGeProduto},
  UGeEstoqueAjusteManual in '..\System_SGE\UGeEstoqueAjusteManual.pas' {frmGeEstoqueAjusteManual},
  UGrUsuario in '..\System_SGE\UGrUsuario.pas' {frmGrUsuario},
  UGeEfetuarLogin in '..\System_SGE\UGeEfetuarLogin.pas' {FrmEfetuarLogin},
  UGeVenda in '..\Sys\UGeVenda.pas' {frmGeVenda},
  UGeVendaCancelar in '..\Sys\UGeVendaCancelar.pas' {frmGeVendaCancelar},
  UGeVendaConfirmaTitulos in '..\Sys\UGeVendaConfirmaTitulos.pas' {frmGeVendaConfirmaTitulos},
  UGeVendaFormaPagto in '..\Sys\UGeVendaFormaPagto.pas' {frmGeVendaFormaPagto},
  UGeVendaGerarNFe in '..\Sys\UGeVendaGerarNFe.pas' {frmGeVendaGerarNFe},
  UGeEfetuarPagtoREC in '..\Sys\UGeEfetuarPagtoREC.pas' {frmGeEfetuarPagtoREC},
  UGeVendaTransporte in '..\Sys\UGeVendaTransporte.pas' {frmGeVendaTransporte},
  UGrMessage in '..\Sys\lib\UGrMessage.pas' {frmGeMessage};

{$R *.res}

begin
  FileINI := TIniFile.Create( ExtractFilePath(ParamStr(0)) + 'Conexao.ini' );

  Application.Initialize;
  Application.Title := 'PDV | Ponto de Venda do SGE';
  Application.CreateForm(TDMBusiness, DMBusiness);
  Application.CreateForm(TDMNFe, DMNFe);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmPesq, frmPesq);
  Application.Run;
end.