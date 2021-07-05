program ControleNegociacao;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uConexao in 'uConexao.pas' {DMConexao: TDataModule},
  uFrameCadastroProdutor in 'uFrameCadastroProdutor.pas' {FrameCadastroProdutor: TFrame},
  uDMCadastroProdutor in 'uDMCadastroProdutor.pas' {DMCadastroProdutor: TDataModule},
  uFrameCadastroDistribuidora in 'uFrameCadastroDistribuidora.pas' {FrameCadastroDistribuidora: TFrame},
  uFrameCadastroProduto in 'uFrameCadastroProduto.pas' {FrameCadastroProduto: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TDMCadastroProdutor, DMCadastroProdutor);
  Application.Run;
end.
