unit uDMCadastroDistribuidora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConexao;

type
  TDMCadastroDistribuidora = class(TDataModule)
    qryDistribuidora: TFDQuery;
    dsDistribuidora: TDataSource;
    qryListagem: TFDQuery;
    dsListagem: TDataSource;
    qryDistribuidoraID: TLargeintField;
    qryDistribuidoraDATACADASTRO: TDateField;
    qryDistribuidoraCODIGO: TStringField;
    qryDistribuidoraNOME: TStringField;
    qryDistribuidoraCPFCNPJ: TStringField;
    qryDistribuidoraSTATUS: TStringField;
    qryListagemID: TLargeintField;
    qryListagemCODIGO: TStringField;
    qryListagemNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo;
    procedure Editar(pId: int64);
    function Gravar(pNome, pCPFCNPJ: string): boolean;
    procedure Pesquisar(pValue: string);
    procedure AtualizarListagem;
  end;

var
  DMCadastroDistribuidora: TDMCadastroDistribuidora;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFrameListagemDistribuidora;

{$R *.dfm}

{ TDMCadastroDistribuidora }

procedure TDMCadastroDistribuidora.AtualizarListagem;
begin
  qryListagem.Refresh;
  FrameListagemDistribuidora.DBCtrlGrid.DataSource.DataSet := qryListagem;
  FrameListagemDistribuidora.DBCtrlGrid.Refresh;
  FrameListagemDistribuidora.DBCtrlGrid.Repaint;
end;

procedure TDMCadastroDistribuidora.DataModuleCreate(Sender: TObject);
begin
  qryDistribuidora.Open;
  qryListagem.Open;
end;

procedure TDMCadastroDistribuidora.Editar(pId: int64);
begin
  qryDistribuidora.Close;
  qryDistribuidora.ParamByName('ID').AsLargeInt := pId;
  qryDistribuidora.Open;
  qryDistribuidora.Edit;
end;

function TDMCadastroDistribuidora.Gravar(pNome, pCPFCNPJ: string): boolean;
begin
  if qryDistribuidora.State = dsInsert then
    DMConexao.GravarCodigo('DISTRIBUIDORA', qryDistribuidoraCODIGO.AsString);

  qryDistribuidoraNOME.AsString    := pNome;
  qryDistribuidoraCPFCNPJ.AsString := pCPFCNPJ;
  qryDistribuidora.ApplyUpdates;

  self.AtualizarListagem;
end;

procedure TDMCadastroDistribuidora.Novo;
begin
  qryDistribuidora.Close;
  qryDistribuidora.ParamByName('ID').AsLargeInt := 0;
  qryDistribuidora.Open;
  qryDistribuidora.Append;
  qryDistribuidoraID.AsLargeInt           := TDMConexao.RetornaId;
  qryDistribuidoraDATACADASTRO.AsDateTime := Date;
  qryDistribuidoraCODIGO.AsString         := DMConexao.RetornaCodigo('DISTRIBUIDORA', 6);
  qryDistribuidoraNOME.AsString           := '';
  qryDistribuidoraCPFCNPJ.AsString        := '';
  qryDistribuidoraSTATUS.AsString         := 'A';
end;

procedure TDMCadastroDistribuidora.Pesquisar(pValue: string);
begin
  qryListagem.Filter := Concat('NOME LIKE ', QuotedStr('%'+pValue+'%'));
  qryListagem.Filtered := True;
  AtualizarListagem;
end;

end.
