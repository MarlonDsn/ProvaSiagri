unit uFrameCadastroProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls;

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
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
