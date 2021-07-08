unit uFrameListagemDistribuidora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uDMCadastroDistribuidora, Vcl.DBCtrls, Vcl.DBCGrids, uFrameCadastroDistribuidora;

type
  TFrameListagemDistribuidora = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtNome: TEdit;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    DBCtrlGrid: TDBCtrlGrid;
    DBTextCodigo: TDBText;
    Label2: TLabel;
    DBTextNome: TDBText;
    DBTextID: TDBText;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBCtrlGridDblClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
  private
    { Private declarations }
    FFrameCadastroDistribuidora: TFrameCadastroDistribuidora;
    procedure CadastroDistribuidora;
    procedure EditarDistribuidora;

  public
    { Public declarations }

    constructor Create;
    destructor destroy;override;
  end;

var
  FrameListagemDistribuidora: TFrameListagemDistribuidora;

implementation

{$R *.dfm}

uses uPrincipal;

{ TFrameListagemDistribuidora }

procedure TFrameListagemDistribuidora.btnEditarClick(Sender: TObject);
begin
  EditarDistribuidora;
end;

procedure TFrameListagemDistribuidora.btnNovoClick(Sender: TObject);
begin
  CadastroDistribuidora;
end;

procedure TFrameListagemDistribuidora.CadastroDistribuidora;
begin
  if not Assigned(FFrameCadastroDistribuidora)  then
    FFrameCadastroDistribuidora := TFrameCadastroDistribuidora.Create(0)
  else
    begin
      FreeAndNil(FFrameCadastroDistribuidora);
      FFrameCadastroDistribuidora := TFrameCadastroDistribuidora.Create(0);
    end;

  Self.Visible := False;
  FFrameCadastroDistribuidora.Parent := frmprincipal.PanelFrame;
  FFrameCadastroDistribuidora.Visible := True;
  FFrameCadastroDistribuidora.Show;
end;

constructor TFrameListagemDistribuidora.Create;
begin
  inherited Create(nil);
  FrameListagemDistribuidora := Self;
  Application.CreateForm(TDMCadastroDistribuidora, DMCadastroDistribuidora);
end;

procedure TFrameListagemDistribuidora.DBCtrlGridDblClick(Sender: TObject);
begin
  EditarDistribuidora;
end;

destructor TFrameListagemDistribuidora.destroy;
begin

  inherited;
end;

procedure TFrameListagemDistribuidora.EditarDistribuidora;
begin
  if not Assigned(FFrameCadastroDistribuidora)  then
    FFrameCadastroDistribuidora := TFrameCadastroDistribuidora.Create(DBTextID.Field.Value)
  else
    begin
      FreeAndNil(FFrameCadastroDistribuidora);
      FFrameCadastroDistribuidora := TFrameCadastroDistribuidora.Create(DBTextID.Field.Value);
    end;

  Self.Visible := False;
  FFrameCadastroDistribuidora.Parent := frmprincipal.PanelFrame;
  FFrameCadastroDistribuidora.Visible := True;
  FFrameCadastroDistribuidora.Show;
end;

procedure TFrameListagemDistribuidora.edtNomeChange(Sender: TObject);
begin
  DMCadastroDistribuidora.Pesquisar(edtNome.Text);
end;

end.
