unit uFrameListagemProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids;

type
  TFrameListagemProduto = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtNome: TEdit;
    DBCtrlGrid: TDBCtrlGrid;
    DBTextCodigo: TDBText;
    Label2: TLabel;
    DBTextNome: TDBText;
    DBTextID: TDBText;
    DBText1: TDBText;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    procedure edtNomeChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CadastroProduto;
    procedure EditarProduto;
  public
    { Public declarations }
    constructor create;
  end;

var
  FrameListagemProduto: TFrameListagemProduto;

implementation

{$R *.dfm}

uses uDMCadastroProduto, uPrincipal, uFrameCadastroProduto;

procedure TFrameListagemProduto.btnEditarClick(Sender: TObject);
begin
  self.EditarProduto;
end;

procedure TFrameListagemProduto.btnNovoClick(Sender: TObject);
begin
  self.CadastroProduto;
end;

procedure TFrameListagemProduto.CadastroProduto;
begin
  if not Assigned(FrameCadastroProduto)  then
    FrameCadastroProduto := TFrameCadastroProduto.Create(0)
  else
    begin
      FreeAndNil(FrameCadastroProduto);
      FrameCadastroProduto := TFrameCadastroProduto.Create(0);
    end;

  Self.Visible := False;
  FrameCadastroProduto.Parent := frmprincipal.PanelFrame;
  FrameCadastroProduto.Visible := True;
  FrameCadastroProduto.Show;
end;

constructor TFrameListagemProduto.create;
begin
  inherited Create(nil);
  FrameListagemProduto := Self;
  Application.CreateForm(TDMCadastroProduto, DMCadastroProduto);
end;

procedure TFrameListagemProduto.EditarProduto;
begin
  if not Assigned(FrameCadastroProduto)  then
    FrameCadastroProduto := TFrameCadastroProduto.Create(DBTextID.Field.Value)
  else
    begin
      FreeAndNil(FrameCadastroProduto);
      FrameCadastroProduto := TFrameCadastroProduto.Create(DBTextID.Field.Value);
    end;

  Self.Visible := False;
  FrameCadastroProduto.Parent := frmprincipal.PanelFrame;
  FrameCadastroProduto.Visible := True;
  FrameCadastroProduto.Show;
end;

procedure TFrameListagemProduto.edtNomeChange(Sender: TObject);
begin
  DMCadastroProduto.Pesquisar(edtNome.Text);
end;

end.
