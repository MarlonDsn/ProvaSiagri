unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, dxGDIPlusClasses, Vcl.ExtCtrls, uFrameListagemProdutor,
  uFrameListagemDistribuidora;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    PanelFrame: TPanel;
    btnProdutor: TSpeedButton;
    btnDistribuidora: TSpeedButton;
    btnProduto: TSpeedButton;
    btnSair: TSpeedButton;
    btnNegociacao: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnProdutorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDistribuidoraClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnNegociacaoClick(Sender: TObject);
  private
    { Private declarations }
    FFrameListagemProdutor: TFrameListagemProdutor;
    FFrameListagemDistribuidora: TFrameListagemDistribuidora;

    procedure CriarFrameListagemProdutor;
    procedure CriarFrameListagemDistribuidora;
    procedure CriarFrameListagemProduto;
    procedure CriarFrameListagemNegociacao;
    procedure EsconderFrames;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrameListagemProduto, uFrameListagemNegociacao;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmPrincipal.CriarFrameListagemDistribuidora;
begin
  self.EsconderFrames;
  if not(Assigned(FrameListagemDistribuidora)) then
    FrameListagemDistribuidora := TFrameListagemDistribuidora.Create;

  FrameListagemDistribuidora.Parent := PanelFrame.Parent;
  FrameListagemDistribuidora.Visible := true;
  FrameListagemDistribuidora.Show;
end;

procedure TfrmPrincipal.CriarFrameListagemNegociacao;
begin
  self.EsconderFrames;

  if not(Assigned(FrameListagemNegociacao)) then
    FrameListagemNegociacao := TFrameListagemNegociacao.Create;

  FrameListagemNegociacao.Parent := PanelFrame.Parent;
  FrameListagemNegociacao.Visible := true;
  FrameListagemNegociacao.Show;
end;

procedure TfrmPrincipal.CriarFrameListagemProduto;
begin
  self.EsconderFrames;

  if not(Assigned(FrameListagemProduto)) then
    FrameListagemProduto := TFrameListagemProduto.Create;

  FrameListagemProduto.Parent := PanelFrame.Parent;
  FrameListagemProduto.Visible := true;
  FrameListagemProduto.Show;
end;

procedure TfrmPrincipal.CriarFrameListagemProdutor;
begin
  self.EsconderFrames;

  if not(Assigned(FrameListagemProdutor)) then
    FrameListagemProdutor := TFrameListagemProdutor.Create;

  FrameListagemProdutor.Parent := PanelFrame.Parent;
  FrameListagemProdutor.Visible := true;
  FrameListagemProdutor.Show;
end;

procedure TfrmPrincipal.EsconderFrames;
begin
  if (Assigned(FrameListagemProdutor)) then
    FrameListagemProdutor.Visible := False;

  if (Assigned(FrameListagemDistribuidora)) then
    FrameListagemDistribuidora.Visible := False;

  if (Assigned(FrameListagemProduto)) then
    FrameListagemProduto.Visible := False;

  if (Assigned(FrameListagemNegociacao)) then
    FrameListagemNegociacao.Visible := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Self.CriarFrameListagemProdutor;
end;

procedure TfrmPrincipal.btnDistribuidoraClick(Sender: TObject);
begin
  CriarFrameListagemDistribuidora;
end;

procedure TfrmPrincipal.btnNegociacaoClick(Sender: TObject);
begin
  CriarFrameListagemNegociacao;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  CriarFrameListagemProduto;
end;

procedure TfrmPrincipal.btnProdutorClick(Sender: TObject);
begin
  CriarFrameListagemProdutor;
end;

end.
