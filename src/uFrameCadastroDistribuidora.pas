unit uFrameCadastroDistribuidora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameCadastroDistribuidora = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    edtCPFCNPJ: TEdit;
    Label4: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNomeDistribuidor: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure edtNomeDistribuidorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FId: int64;

    procedure SetId(const Value: int64);
    procedure FecharCadastro;
  public
    { Public declarations }
   constructor create(pId: int64);
  end;

var
  FrameCadastroDistribuidora: TFrameCadastroDistribuidora;

implementation

{$R *.dfm}

uses uDMCadastroDistribuidora, uConexao, uFrameListagemDistribuidora;

{ TFrameCadastroDistribuidora }

constructor TFrameCadastroDistribuidora.create(pId: int64);
begin
  inherited create(nil);
  setId(pId);
end;

procedure TFrameCadastroDistribuidora.edtCPFCNPJExit(Sender: TObject);
begin
  edtCPFCNPJ.Text := DMConexao.ValidaCpfCnpjEColocaMascara(edtCPFCNPJ.Text);
end;

procedure TFrameCadastroDistribuidora.edtNomeDistribuidorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    edtCPFCNPJ.SetFocus;
end;

procedure TFrameCadastroDistribuidora.FecharCadastro;
begin
   FrameListagemDistribuidora.Visible := True;
   Self.Visible := False;
end;

procedure TFrameCadastroDistribuidora.SetId(const Value: int64);
begin
  FId := Value;

  if Value = 0 then
    begin
      DMCadastroDistribuidora.Novo;
      edtCodigo.Text := DMCadastroDistribuidora.qryDistribuidoraCODIGO.AsString;
    end
  else
    begin
      DMCadastroDistribuidora.Editar(Value);
      edtCodigo.Text           := DMCadastroDistribuidora.qryDistribuidoraCODIGO.AsString;
      edtNomeDistribuidor.Text := DMCadastroDistribuidora.qryDistribuidoraNOME.AsString;
      edtCPFCNPJ.Text          := DMConexao.ValidaCpfCnpjEColocaMascara(DMCadastroDistribuidora.qryDistribuidoraCPFCNPJ.AsString);
    end;
end;

procedure TFrameCadastroDistribuidora.btnGravarClick(Sender: TObject);
begin
  DMCadastroDistribuidora.Gravar(edtNomeDistribuidor.Text, edtCPFCNPJ.Text);
  FecharCadastro;
end;

procedure TFrameCadastroDistribuidora.btnCancelarClick(Sender: TObject);
begin
  FecharCadastro;
end;

end.
