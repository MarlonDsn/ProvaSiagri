unit uFrameCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameCadastroProduto = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    edtPreco: TEdit;
    Label4: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNomeProdutor: TEdit;
    procedure edtNomeProdutorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FId: int64;

    procedure setId(const Value: int64);
    procedure FecharCadastro;
  public
    { Public declarations }
    constructor Create(pId: int64);
  end;

var
  FrameCadastroProduto: TFrameCadastroProduto;

implementation

{$R *.dfm}

uses uFrameListagemProduto, uDMCadastroProduto;

{ TFrameCadastroProduto }

procedure TFrameCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  FecharCadastro;
end;

procedure TFrameCadastroProduto.btnConfirmarClick(Sender: TObject);
begin
  DMCadastroProduto.Gravar(edtNomeProdutor.Text, StrToCurr(edtPreco.Text));
  FecharCadastro;
end;

constructor TFrameCadastroProduto.Create(pId: int64);
begin
  inherited create(nil);
  FrameCadastroProduto := self;
  setId(pId);
end;

procedure TFrameCadastroProduto.edtNomeProdutorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    edtPreco.SetFocus;
end;

procedure TFrameCadastroProduto.FecharCadastro;
begin
   FrameListagemProduto.Visible := True;
   Self.Visible := False;
end;

procedure TFrameCadastroProduto.setId(const Value: int64);
begin
  FId := Value;

  if Value = 0 then
    begin
      DMCadastroProduto.Novo;
      edtCodigo.Text := DMCadastroProduto.qryProdutoCODIGO.AsString;
    end
  else
    begin
      DMCadastroProduto.Editar(Value);
      edtCodigo.Text       := DMCadastroProduto.qryProdutoCODIGO.AsString;
      edtNomeProdutor.Text := DMCadastroProduto.qryProdutoDESCRICAO.AsString;
      edtPreco.Text        := DMCadastroProduto.qryProdutoVALOR.AsString;
    end;
end;

end.
