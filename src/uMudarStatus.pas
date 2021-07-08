unit uMudarStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls,
  System.AnsiStrings;

type
  TfrmMudarStatus = class(TForm)
    PanelRodape: TPanel;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    cbxStatus: TComboBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDadosNegociacao;
    procedure AbrirComboBox;
    procedure GravarStatus;
  public
    { Public declarations }
  end;

var
  frmMudarStatus: TfrmMudarStatus;

implementation

{$R *.dfm}

uses uDMNegociacao, uFrameListagemNegociacao;

procedure TfrmMudarStatus.AbrirComboBox;
begin
 cbxStatus.ItemIndex := AnsiIndexStr(DMNegociacao.qryNegociacaoSTATUS.AsString, ['P','A','O','C']);
end;

procedure TfrmMudarStatus.AbrirDadosNegociacao;
begin
  DMNegociacao.qryNegociacao.Close;
  DMNegociacao.qryNegociacao.ParamByName('ID').AsLargeInt := FrameListagemNegociacao.DBTextID.Field.Value;
  DMNegociacao.qryNegociacao.Open;
  AbrirComboBox;
end;

procedure TfrmMudarStatus.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMudarStatus.btnConfirmarClick(Sender: TObject);
begin
  GravarStatus;
  CLOSE;
end;

procedure TfrmMudarStatus.FormShow(Sender: TObject);
begin
  AbrirDadosNegociacao;
end;

procedure TfrmMudarStatus.GravarStatus;
begin
  DMNegociacao.qryNegociacao.Edit;
  case cbxStatus.ItemIndex of
   0:DMNegociacao.qryNegociacaoSTATUS.AsString := 'P';

   1:begin
       DMNegociacao.qryNegociacaoSTATUS.AsString := 'A';
       DMNegociacao.qryNegociacaoDATAAPROVACAO.AsDateTime := date;
     end;

   2:begin
       DMNegociacao.qryNegociacaoSTATUS.AsString := 'O';
       DMNegociacao.qryNegociacaoDATACONCLUIR.AsDateTime := date;
     end;

   3:begin
       DMNegociacao.qryNegociacaoSTATUS.AsString := 'C';
       DMNegociacao.qryNegociacaoDATACANCELAR.AsDateTime := date;
     end;
  end;
  DMNegociacao.qryNegociacao.ApplyUpdates;
end;

end.
