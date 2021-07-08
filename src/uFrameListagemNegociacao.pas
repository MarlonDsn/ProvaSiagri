unit uFrameListagemNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.DBCGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFrameListagemNegociacao = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtNome: TEdit;
    DBCtrlGrid: TDBCtrlGrid;
    DBTextCodigo: TDBText;
    DBTextNome: TDBText;
    DBText1: TDBText;
    Label4: TLabel;
    cbxStatus: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DBText2: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText3: TDBText;
    btnImprimirRelatorio: TSpeedButton;
    DBTextID: TDBText;
    btnMudarStatus: TSpeedButton;
    DBText4: TDBText;
    Label2: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure cbxStatusChange(Sender: TObject);
    procedure btnMudarStatusClick(Sender: TObject);
    procedure btnImprimirRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure CadastroNegociacao;
    procedure EditarNegociacao;
    procedure MudarStatus;
  public
    { Public declarations }
    constructor create;
  end;

var
  FrameListagemNegociacao: TFrameListagemNegociacao;

implementation

{$R *.dfm}

uses uDMNegociacao, uFrameNegociacao, uPrincipal, uMudarStatus;

{ TFrameListagemNegociacao }

procedure TFrameListagemNegociacao.btnEditarClick(Sender: TObject);
begin
  self.EditarNegociacao;
end;

procedure TFrameListagemNegociacao.btnImprimirRelatorioClick(Sender: TObject);
begin
  DMNegociacao.ImprimirRelatorio;
end;

procedure TFrameListagemNegociacao.btnMudarStatusClick(Sender: TObject);
begin
  self.MudarStatus;
end;

procedure TFrameListagemNegociacao.btnNovoClick(Sender: TObject);
begin
  self.CadastroNegociacao;
end;

procedure TFrameListagemNegociacao.CadastroNegociacao;
begin
  if not Assigned(FrameNegociacao) then
    FrameNegociacao := TFrameNegociacao.create(0)
  else
    begin
      FreeAndNil(FrameNegociacao);
      FrameNegociacao := TFrameNegociacao.Create(0);
    end;

  Self.Visible := False;
  FrameNegociacao.Parent := frmprincipal.PanelFrame;
  FrameNegociacao.Visible := True;
  FrameNegociacao.Show;
end;

procedure TFrameListagemNegociacao.cbxStatusChange(Sender: TObject);
begin
  DMNegociacao.Pesquisar(cbxStatus.ItemIndex, edtNome.Text);
end;

constructor TFrameListagemNegociacao.create;
begin
  inherited create(nil);
end;

procedure TFrameListagemNegociacao.EditarNegociacao;
begin
  if not Assigned(FrameNegociacao)  then
    FrameNegociacao := TFrameNegociacao.Create(DBTextID.Field.Value)
  else
    begin
      FreeAndNil(FrameNegociacao);
      FrameNegociacao := TFrameNegociacao.Create(DBTextID.Field.Value);
    end;

  Self.Visible := False;
  FrameNegociacao.Parent := frmprincipal.PanelFrame;
  FrameNegociacao.Visible := True;
  FrameNegociacao.Show;
end;

procedure TFrameListagemNegociacao.edtNomeChange(Sender: TObject);
begin
  DMNegociacao.Pesquisar(cbxStatus.ItemIndex, edtNome.Text);
end;

procedure TFrameListagemNegociacao.MudarStatus;
begin
  Application.CreateForm(TfrmMudarStatus, frmMudarStatus);
  try
    frmMudarStatus.ShowModal;
    DMNegociacao.Pesquisar(cbxStatus.ItemIndex, edtNome.Text);
  finally
    frmMudarStatus.Free;
  end;
end;

end.
