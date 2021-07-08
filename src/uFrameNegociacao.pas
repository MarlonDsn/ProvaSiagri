unit uFrameNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.DBCGrids, Vcl.Buttons;

type
  TFrameNegociacao = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    cbxProdutor: TDBLookupComboBox;
    Label1: TLabel;
    cbxDistribuidora: TDBLookupComboBox;
    Label2: TLabel;
    cbxProduto: TDBLookupComboBox;
    Label3: TLabel;
    edtQuantidade: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    LabelLimiteCredito: TLabel;
    Button1: TButton;
    Panel3: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBTextNome: TDBText;
    DBTextQuantidade: TDBText;
    DBTextPreco: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBTextTotal: TDBText;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    LabelTotal: TLabel;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure cbxProdutorClick(Sender: TObject);
    procedure cbxDistribuidoraClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FId: int64;

    procedure setId(const Value: int64);
    procedure RetornarValorLimiteCredito;
    procedure FecharCadastro;
  public
    { Public declarations }
    constructor create(pId: int64);
  end;

var
 FrameNegociacao: tframenegociacao;

implementation

{$R *.dfm}

uses uDMNegociacao, uFrameListagemNegociacao;

procedure TFrameNegociacao.btnCancelarClick(Sender: TObject);
begin
  FecharCadastro;
end;

procedure TFrameNegociacao.btnConfirmarClick(Sender: TObject);
begin
  if DMNegociacao.Gravar(cbxProdutor.Text, cbxDistribuidora.Text) then
    FecharCadastro
  else
    ShowMessage('Verifique o limite de crédito !');
end;

procedure TFrameNegociacao.Button1Click(Sender: TObject);
begin
  if cbxProduto.Text.IsEmpty then
   exit;

  DMNegociacao.InsereItem(cbxProduto.Text, StrToCurr(edtQuantidade.Text));
  LabelTotal.Caption := FormatCurr('R$ 0.00', DMNegociacao.TotalNegociacao);
end;

procedure TFrameNegociacao.cbxDistribuidoraClick(Sender: TObject);
begin
  Self.RetornarValorLimiteCredito;
end;

procedure TFrameNegociacao.cbxProdutorClick(Sender: TObject);
begin
  Self.RetornarValorLimiteCredito;
end;

constructor TFrameNegociacao.create(pId: int64);
begin
  inherited create(nil);
  FrameNegociacao := self;
  setId(pId);
end;

procedure TFrameNegociacao.FecharCadastro;
begin
   FrameListagemNegociacao.Visible := True;
   Self.Visible := False;
end;

procedure TFrameNegociacao.RetornarValorLimiteCredito;
begin
  if (cbxProdutor.Text.IsEmpty) or (cbxDistribuidora.Text.IsEmpty) then
    exit;

  LabelLimiteCredito.Caption :=
   FormatCurr('R$ 0.00', DMNegociacao.RetornarLimiteCredito(cbxProdutor.Text, cbxDistribuidora.Text));
end;

procedure TFrameNegociacao.setId(const Value: int64);
begin
  FId := Value;

  if Value = 0 then
    begin
      DMNegociacao.Novo;
    end
  else
    begin
      DMNegociacao.Editar(Value);
    end;
end;

end.
