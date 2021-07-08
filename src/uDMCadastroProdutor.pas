unit uDMCadastroProdutor;

interface

uses
  System.SysUtils, System.Classes, uConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Forms;

type
  TDMCadastroProdutor = class(TDataModule)
    qryProdutor: TFDQuery;
    dsProdutor: TDataSource;
    qryProdutorLimite: TFDQuery;
    dsProdutorLimite: TDataSource;
    qryDistribuidora: TFDQuery;
    qryDistribuidoraID: TLargeintField;
    qryDistribuidoraNOME: TStringField;
    dsDistribuidora: TDataSource;
    qryListagem: TFDQuery;
    dsListagem: TDataSource;
    qryDistribuidoraCODIGO: TStringField;
    qryProdutorID: TLargeintField;
    qryProdutorDATACADASTRO: TDateField;
    qryProdutorCODIGO: TStringField;
    qryProdutorNOME: TStringField;
    qryProdutorCPFCNPJ: TStringField;
    qryProdutorSTATUS: TStringField;
    qryListagemID: TLargeintField;
    qryListagemCODIGO: TStringField;
    qryListagemNOME: TStringField;
    qryProdutorLimiteID: TLargeintField;
    qryProdutorLimiteFKIDPRODUTOR: TLargeintField;
    qryProdutorLimiteFKIDDISTRIBUIDORA: TLargeintField;
    qryProdutorLimiteVALOR: TFMTBCDField;
    qryProdutorLimiteNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsProdutorDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    function RetornaIdDistribuidora(pNome: string): int64;
  public
    { Public declarations }
    procedure Novo;
    procedure Editar(pId: int64);
    procedure IncluirProdutorLimite(pValor: Currency; pDistribuidora: string);
    function Gravar(pNome, pCPFCNPJ: string): boolean;
    procedure Pesquisar(pValue: string);
    Procedure AtualizarListagem;
  end;

var
  DMCadastroProdutor: TDMCadastroProdutor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFrameListagemProdutor;

{$R *.dfm}

{ TDMCadastroProdutor }

procedure TDMCadastroProdutor.AtualizarListagem;
begin
  qryListagem.Refresh;
  FrameListagemProdutor.DBCtrlGrid.DataSource.DataSet := qryListagem;
  FrameListagemProdutor.DBCtrlGrid.Refresh;
  FrameListagemProdutor.DBCtrlGrid.Repaint;
end;

procedure TDMCadastroProdutor.DataModuleCreate(Sender: TObject);
begin
  qryProdutor.Open;
  qryDistribuidora.Open;
  qryProdutorLimite.Open;
  qryListagem.Open;
end;

procedure TDMCadastroProdutor.dsProdutorDataChange(Sender: TObject; Field: TField);
begin
  qryProdutorLimite.Close;
  qryProdutorLimite.ParamByName('ID').AsLargeInt := qryProdutorID.AsLargeInt;
  qryProdutorLimite.Open;
end;

procedure TDMCadastroProdutor.Editar(pId: int64);
begin
  qryProdutor.Close;
  qryProdutor.ParamByName('ID').AsLargeInt := pId;
  qryProdutor.Open;
  qryProdutor.Edit;
end;

function TDMCadastroProdutor.Gravar(pNome, pCPFCNPJ: string): boolean;
begin
  if qryProdutor.State = dsInsert then
    DMConexao.GravarCodigo('PRODUTOR', qryProdutorCODIGO.AsString);

  qryProdutorNOME.AsString    := pNome;
  qryProdutorCPFCNPJ.AsString := pCPFCNPJ;
  qryProdutor.ApplyUpdates;

  self.AtualizarListagem;
end;

procedure TDMCadastroProdutor.IncluirProdutorLimite(pValor: Currency; pDistribuidora: string);
var
  lLimite: TFDQuery;
begin
  lLimite := TFDQuery.Create(nil);
  try
    lLimite.Connection := DMConexao.FDConnection;
    lLimite.SQL.Add('INSERT INTO PRODUTORLIMITE ');
    lLimite.SQL.Add('(ID, FKIDPRODUTOR, FKIDDISTRIBUIDORA, VALOR, STATUS) ');
    lLimite.SQL.Add('VALUEs(:ID, :FKIDPRODUTOR, :FKIDDISTRIBUIDORA, :VALOR, :STATUS)');
    lLimite.ParamByName('ID').AsLargeInt := DMConexao.RetornaId;
    lLimite.ParamByName('FKIDPRODUTOR').AsLargeInt := qryProdutorID.AsLargeInt;
    lLimite.ParamByName('FKIDDISTRIBUIDORA').AsLargeInt := RETORNAIDDISTRIBUIDORA(pDistribuidora);
    lLimite.ParamByName('VALOR').AsCurrency := pValor;
    lLimite.ParamByName('STATUS').AsString := 'A';
    lLimite.ExecSQL;
    DMConexao.FDConnection.Commit;

  finally
    lLimite.Free;
    qryProdutorLimite.Close;
    qryProdutorLimite.Open;
  end;
end;

procedure TDMCadastroProdutor.Novo;
begin
  qryProdutor.Close;
  qryProdutor.ParamByName('ID').AsLargeInt := 0;
  qryProdutor.Open;
  qryProdutor.Append;
  qryProdutorID.AsLargeInt           := TDMConexao.RetornaId;
  qryProdutorDATACADASTRO.AsDateTime := Date;
  qryProdutorCODIGO.AsString         := DMConexao.RetornaCodigo('PRODUTOR', 6);
  qryProdutorNOME.AsString           := '';
  qryProdutorCPFCNPJ.AsString        := '';
  qryProdutorSTATUS.AsString         := 'A';
end;

procedure TDMCadastroProdutor.Pesquisar(pValue: string);
begin
  qryListagem.Filter := Concat('NOME LIKE ', QuotedStr('%'+pValue+'%'));
  qryListagem.Filtered := True;
  AtualizarListagem;
end;

function TDMCadastroProdutor.RetornaIdDistribuidora(pNome: string): int64;
begin
  qryDistribuidora.Filter := 'NOME = '+QuotedStr(pNome);
  qryDistribuidora.Filtered := TRUE;
  Result := qryDistribuidoraID.AsLargeInt;
  qryDistribuidora.Filtered := FALSE;
end;

end.
