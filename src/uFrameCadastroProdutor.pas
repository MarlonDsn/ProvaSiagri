unit uFrameCadastroProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, uDMCadastroProdutor;

type
  TFrameCadastroProdutor = class(TFrame)
    PanelPrincipal: TPanel;
    PanelRodape: TPanel;
    Label1: TLabel;
    PanelCadastro: TPanel;
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    edtNomeProdutor: TEdit;
    Label4: TLabel;
    edtCPFCNPJ: TEdit;
    PanelPrincipalLimite: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cbxDistribuidora: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edtLimiteCredito: TEdit;
    btnAdicionarLimite: TSpeedButton;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure edtNomeProdutorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCPFCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxDistribuidoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLimiteCreditoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAdicionarLimiteClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    FId: int64;

    procedure setId(const Value: int64);
    procedure FecharCadastro;
  public
    { Public declarations }
    constructor Create(pId: int64);
  end;

VAR
 FrameCadastroProdutor: TFrameCadastroProdutor;

implementation

{$R *.dfm}

uses uConexao, uFrameListagemProduto, uFrameListagemProdutor;

{ TFrameCadastroProdutor }

procedure TFrameCadastroProdutor.btnAdicionarLimiteClick(Sender: TObject);
begin
  DMCadastroProdutor.IncluirProdutorLimite(StrToFloat(edtLimiteCredito.Text), cbxDistribuidora.Text);
  btnCancelar.Visible := FALSE;
end;

procedure TFrameCadastroProdutor.cbxDistribuidoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    edtLimiteCredito.SetFocus;
end;

constructor TFrameCadastroProdutor.Create(pId: int64);
begin
  inherited create(nil);
  FrameCadastroProdutor := self;
  setId(pId);
  DBGrid1.DataSource.DataSet := DMCadastroProdutor.qryProdutorLimite;
end;

procedure TFrameCadastroProdutor.edtCPFCNPJExit(Sender: TObject);
begin
  edtCPFCNPJ.Text := DMConexao.ValidaCpfCnpjEColocaMascara(edtCPFCNPJ.Text);
end;

procedure TFrameCadastroProdutor.edtCPFCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    cbxDistribuidora.SetFocus;
end;

procedure TFrameCadastroProdutor.edtLimiteCreditoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnAdicionarLimite.Click;
end;

procedure TFrameCadastroProdutor.edtNomeProdutorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    edtCPFCNPJ.SetFocus;
end;

procedure TFrameCadastroProdutor.FecharCadastro;
begin
   FrameListagemProdutor.Visible := True;
   Self.Visible := False;
end;

procedure TFrameCadastroProdutor.setId(const Value: int64);
begin
  FId := Value;

  if Value = 0 then
    begin
      DMCadastroProdutor.Novo;
      edtCodigo.Text := DMCadastroProdutor.qryProdutorCODIGO.AsString;
    end
  else
    begin
      DMCadastroProdutor.Editar(Value);
      edtCodigo.Text       := DMCadastroProdutor.qryProdutorCODIGO.AsString;
      edtNomeProdutor.Text := DMCadastroProdutor.qryProdutorNOME.AsString;
      edtCPFCNPJ.Text      := DMConexao.ValidaCpfCnpjEColocaMascara(DMCadastroProdutor.qryProdutorCPFCNPJ.AsString);
    end;
end;

procedure TFrameCadastroProdutor.btnGravarClick(Sender: TObject);
begin
  DMCadastroProdutor.Gravar(edtNomeProdutor.Text, edtCPFCNPJ.Text);
  btnCancelar.Visible := True;
  FecharCadastro;
end;

procedure TFrameCadastroProdutor.btnCancelarClick(Sender: TObject);
begin
  FecharCadastro;
end;

end.
