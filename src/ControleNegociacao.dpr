program ControleNegociacao;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uConexao in 'uConexao.pas' {DMConexao: TDataModule},
  uFrameCadastroProdutor in 'uFrameCadastroProdutor.pas' {FrameCadastroProdutor: TFrame},
  uDMCadastroProdutor in 'uDMCadastroProdutor.pas' {DMCadastroProdutor: TDataModule},
  uFrameCadastroDistribuidora in 'uFrameCadastroDistribuidora.pas' {FrameCadastroDistribuidora: TFrame},
  uFrameCadastroProduto in 'uFrameCadastroProduto.pas' {FrameCadastroProduto: TFrame},
  uFrameListagemProdutor in 'uFrameListagemProdutor.pas' {FrameListagemProdutor: TFrame},
  uFrameListagemDistribuidora in 'uFrameListagemDistribuidora.pas' {FrameListagemDistribuidora: TFrame},
  uFrameListagemProduto in 'uFrameListagemProduto.pas' {FrameListagemProduto: TFrame},
  uDMCadastroDistribuidora in 'uDMCadastroDistribuidora.pas' {DMCadastroDistribuidora: TDataModule},
  uDMCadastroProduto in 'uDMCadastroProduto.pas' {DMCadastroProduto: TDataModule},
  uFrameListagemNegociacao in 'uFrameListagemNegociacao.pas' {FrameListagemNegociacao: TFrame},
  uDMNegociacao in 'uDMNegociacao.pas' {DMNegociacao: TDataModule},
  uFrameNegociacao in 'uFrameNegociacao.pas' {FrameNegociacao: TFrame},
  uMudarStatus in 'uMudarStatus.pas' {frmMudarStatus};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TDMCadastroProdutor, DMCadastroProdutor);
  Application.CreateForm(TDMCadastroDistribuidora, DMCadastroDistribuidora);
  Application.CreateForm(TDMCadastroProduto, DMCadastroProduto);
  Application.CreateForm(TDMNegociacao, DMNegociacao);
  Application.CreateForm(TfrmMudarStatus, frmMudarStatus);
  Application.Run;
end.
