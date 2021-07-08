unit uFrameListagemProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uDMCadastroProdutor, uFrameCadastroProdutor, Vcl.DBCtrls, Vcl.DBCGrids;

type
  TFrameListagemProdutor = class(TFrame)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    PanelRodape: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtNome: TEdit;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    DBCtrlGrid: TDBCtrlGrid;
    DBTextCodigo: TDBText;
    Label2: TLabel;
    DBTextNome: TDBText;
    DBTextID: TDBText;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBGridProdutorDblClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
  private
    { Private declarations }
    procedure CadastroProdutor;
    procedure EditarProdutor;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy;override;
  end;

var
  FrameListagemProdutor: TFrameListagemProdutor;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TFrameListagemProdutor.btnEditarClick(Sender: TObject);
begin
  EditarProdutor;
end;

procedure TFrameListagemProdutor.btnNovoClick(Sender: TObject);
begin
  self.CadastroProdutor;
end;

procedure TFrameListagemProdutor.CadastroProdutor;
begin
  if not Assigned(FrameCadastroProdutor)  then
    FrameCadastroProdutor := TFrameCadastroProdutor.Create(0)
  else
    begin
      FreeAndNil(FrameCadastroProdutor);
      FrameCadastroProdutor := TFrameCadastroProdutor.Create(0);
    end;

  Self.Visible := False;
  FrameCadastroProdutor.Parent := frmprincipal.PanelFrame;
  FrameCadastroProdutor.Visible := True;
  FrameCadastroProdutor.Show;
end;

constructor TFrameListagemProdutor.Create;
begin
  inherited Create(nil);
  FrameListagemProdutor := Self;
  Application.CreateForm(TDMCadastroProdutor, DMCadastroProdutor);
end;

procedure TFrameListagemProdutor.DBGridProdutorDblClick(Sender: TObject);
begin
  EditarProdutor;
end;

destructor TFrameListagemProdutor.Destroy;
begin
  inherited;
end;

procedure TFrameListagemProdutor.EditarProdutor;
begin
  if not Assigned(FrameCadastroProdutor)  then
    FrameCadastroProdutor := TFrameCadastroProdutor.Create(DBTextID.Field.Value)
  else
    begin
      FreeAndNil(FrameCadastroProdutor);
      FrameCadastroProdutor := TFrameCadastroProdutor.Create(DBTextID.Field.Value);
    end;

  Self.Visible := False;
  FrameCadastroProdutor.Parent := frmprincipal.PanelFrame;
  FrameCadastroProdutor.Visible := True;
  FrameCadastroProdutor.Show;
end;

procedure TFrameListagemProdutor.edtNomeChange(Sender: TObject);
begin
  DMCadastroProdutor.Pesquisar(edtNome.Text);
end;

end.
