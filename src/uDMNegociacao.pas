unit uDMNegociacao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TDMNegociacao = class(TDataModule)
    qryNegociacao: TFDQuery;
    qryListagem: TFDQuery;
    qryItem: TFDQuery;
    qryItemID: TLargeintField;
    qryItemFKIDNEGOCIACAO: TLargeintField;
    qryItemFKIDPRODUTO: TLargeintField;
    qryItemSEQUENCIA: TIntegerField;
    qryItemQUANTIDADE: TFMTBCDField;
    qryItemVALORUNITARIO: TFMTBCDField;
    qryItemVALORTOTAL: TFMTBCDField;
    qryItemSTATUS: TStringField;
    qryListagemID: TLargeintField;
    qryListagemDATACADASTRO: TDateField;
    qryListagemDATAAPROVACAO: TDateField;
    qryListagemDATACONCLUIR: TDateField;
    qryListagemDATACANCELAR: TDateField;
    qryListagemCODIGO: TStringField;
    qryListagemVALOR: TFMTBCDField;
    qryListagemPRODUTOR: TStringField;
    qryListagemDISTRIBUIDORA: TStringField;
    dsListagem: TDataSource;
    qryListagemSTATUS: TStringField;
    dsItem: TDataSource;
    qryItemDESCRICAO: TStringField;
    dsNegociacao: TDataSource;
    dsDistribuidora: TDataSource;
    qryDistribuidora: TFDQuery;
    qryProdutor: TFDQuery;
    dsProdutor: TDataSource;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryNegociacaoID: TLargeintField;
    qryNegociacaoFKIDPRODUTOR: TLargeintField;
    qryNegociacaoFKIDDISTRIBUIDORA: TLargeintField;
    qryNegociacaoFKIDUSUARIO: TLargeintField;
    qryNegociacaoDATACADASTRO: TDateField;
    qryNegociacaoDATAAPROVACAO: TDateField;
    qryNegociacaoDATACONCLUIR: TDateField;
    qryNegociacaoDATACANCELAR: TDateField;
    qryNegociacaoCODIGO: TStringField;
    qryNegociacaoVALOR: TFMTBCDField;
    qryNegociacaoSTATUS: TStringField;
    qryProdutorID: TLargeintField;
    qryProdutorCODIGO: TStringField;
    qryProdutorNOME: TStringField;
    qryDistribuidoraID: TLargeintField;
    qryDistribuidoraCODIGO: TStringField;
    qryDistribuidoraNOME: TStringField;
    qryProdutoID: TLargeintField;
    qryProdutoCODIGO: TStringField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoVALOR: TFMTBCDField;
    TotalAprovada: TFDQuery;
    qryListagemSTATUSCOMPLETO: TStringField;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    FTotalNegociacao: currency;
    FLimiteCredito: Currency;
    { Private declarations }
    function RetornarIdProdutor(pProdutor: string): int64;
    function RetornarIdDistribuicao(pDistribuidora: string): int64;
    procedure SetTotalNegociacao(const Value: currency);
    function VerificarLimiteCredito(pIdProdutor, pIdDistribuidora: int64): boolean;
  public
    { Public declarations }
    property TotalNegociacao: currency read FTotalNegociacao write SetTotalNegociacao;
    procedure Novo;
    procedure Editar(pId: int64);
    function Gravar(pProdutor, pDistribuidora: string): boolean;
    procedure Pesquisar(pStatus: integer; pProdutor: string);
    Procedure AtualizarListagem;
    procedure InsereItem(pProduto: string; pQuantidade: Currency);
    function RetornarLimiteCredito(pProdutor, pDistribuidora: string): currency;
    procedure ImprimirRelatorio;
  end;

var
  DMNegociacao: TDMNegociacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uConexao, uFrameListagemNegociacao;

{$R *.dfm}

procedure TDMNegociacao.AtualizarListagem;
begin
  qryListagem.Refresh;
  FrameListagemNegociacao.DBCtrlGrid.DataSource.DataSet := qryListagem;
  FrameListagemNegociacao.DBCtrlGrid.Refresh;
  FrameListagemNegociacao.DBCtrlGrid.Repaint;
end;

procedure TDMNegociacao.DataModuleCreate(Sender: TObject);
begin
  qryNegociacao.Open;
  qryListagem.Open;
  qryItem.Open;
  qryProdutor.Open;
  qryDistribuidora.Open;
  qryProduto.Open;
end;

procedure TDMNegociacao.Editar(pId: int64);
begin
  qryNegociacao.Close;
  qryNegociacao.ParamByName('ID').AsLargeInt := pId;
  qryNegociacao.Open;
  qryNegociacao.Edit;

  qryItem.Close;
  qryItem.ParamByName('ID').AsLargeInt := PID;
  qryItem.Open;

  SetTotalNegociacao(qryNegociacaoVALOR.AsCurrency);
end;

function TDMNegociacao.Gravar(pProdutor, pDistribuidora: string): boolean;
begin
  Result := false;

  if not(VerificarLimiteCredito(RetornarIdProdutor(pProdutor), RetornarIdDistribuicao(pDistribuidora))) then
    Exit;

  if qryNegociacao.State = dsInsert then
    DMConexao.GravarCodigo('NEGOCIACAO', qryNegociacaoCODIGO.AsString);

  qryNegociacaoFKIDPRODUTOR.AsLargeInt      := RetornarIdProdutor(pProdutor);
  qryNegociacaoFKIDDISTRIBUIDORA.AsLargeInt := RetornarIdDistribuicao(pDistribuidora);
  qryNegociacaoVALOR.AsCurrency             := FTotalNegociacao;
  qryNegociacao.ApplyUpdates;
  qryItem.ApplyUpdates;

  self.AtualizarListagem;
  Result := True;
end;

procedure TDMNegociacao.ImprimirRelatorio;
begin
  frxReport.ShowReport;
end;

procedure TDMNegociacao.InsereItem(pProduto: string; pQuantidade: Currency);
begin
  qryProduto.Filter := 'DESCRICAO = '+QuotedStr(pProduto);
  qryProduto.Filtered := True;

  if (not(qryItem.State = dsInsert)) or (qryItem.State = dsBrowse) then
    qryItem.Append;

  qryItemID.AsLargeInt             := DMConexao.RetornaId;
  qryItemFKIDNEGOCIACAO.AsLargeInt := qryNegociacaoID.AsLargeInt;
  qryItemFKIDPRODUTO.AsLargeInt    := qryProdutorID.AsLargeInt;
  qryItemDESCRICAO.AsString        := pProduto;
  qryItemSEQUENCIA.AsInteger       := qryItem.RecordCount;
  qryItemQUANTIDADE.AsCurrency     := pQuantidade;
  qryItemVALORUNITARIO.AsCurrency  := qryProdutoVALOR.AsCurrency;
  qryItemVALORTOTAL.AsCurrency     := (pQuantidade*qryProdutoVALOR.AsCurrency);
  qryItemSTATUS.AsString           := 'A';
  qryItem.Post;
  SetTotalNegociacao(qryItemVALORTOTAL.AsCurrency);
  qryProduto.Filtered := False;
end;

procedure TDMNegociacao.Novo;
begin
  qryNegociacao.Close;
  qryNegociacao.ParamByName('ID').AsLargeInt := 0;
  qryNegociacao.Open;

  qryItem.Close;
  qryItem.ParamByName('ID').AsLargeInt := 0;
  qryItem.Open;

  qryNegociacao.Append;
  qryNegociacaoID.AsLargeInt           := DMConexao.RetornaId;
  qryNegociacaoCODIGO.AsString         := DMConexao.RetornaCodigo('NEGOCIACAO', 6);
  qryNegociacaoDATACADASTRO.AsDateTime := DATE;
  qryNegociacaoSTATUS.AsString         := 'P';
  SetTotalNegociacao(0);
end;

procedure TDMNegociacao.Pesquisar(pStatus: integer; pProdutor: string);
begin
  qryListagem.ParamByName('PRODUTORDISTRIBUIDORA').AsString := '%'+pProdutor+'%';

  case pStatus of
   0: qryListagem.Filter := '';
   1: qryListagem.Filter := ' STATUS = '+QuotedStr('P');
   2: qryListagem.Filter := ' STATUS = '+QuotedStr('A');
   3: qryListagem.Filter := ' STATUS = '+QuotedStr('O');
   4: qryListagem.Filter := ' STATUS = '+QuotedStr('C');
  end;
  qryListagem.Filtered := True;
  qryListagem.OPEN;
  AtualizarListagem;
end;

function TDMNegociacao.RetornarIdDistribuicao(pDistribuidora: string): int64;
begin
  qryDistribuidora.Filter := 'NOME = '+QuotedStr(pDistribuidora);
  qryDistribuidora.Filtered := True;
  Result := qryDistribuidoraID.AsLargeInt;
  qryDistribuidora.Filtered := False;
end;

function TDMNegociacao.RetornarIdProdutor(pProdutor: string): int64;
begin
  qryProdutor.Filter := 'NOME = '+QuotedStr(pProdutor);
  qryProdutor.Filtered := True;
  Result := qryProdutorID.AsLargeInt;
  qryProdutor.Filtered := False;
end;

function TDMNegociacao.RetornarLimiteCredito(pProdutor, pDistribuidora: string): currency;
var
  lLimite: TFDQuery;
begin
  lLimite := TFDQuery.Create(nil);
  try
    llimite.Connection := DMConexao.FDConnection;
    lLimite.SQL.Add
     ('SELECT VALOR FROM PRODUTORLIMITE WHERE FKIDPRODUTOR = :IDPRODUTOR AND FKIDDISTRIBUIDORA = :IDDISTRIBUIDORA');
    lLimite.ParamByName('IDPRODUTOR').AsLargeInt := RetornarIdProdutor(pProdutor);
    lLimite.ParamByName('IDDISTRIBUIDORA').AsLargeInt := RetornarIdDistribuicao(pDistribuidora);
    lLimite.Open;

    TotalAprovada.Close;
    TotalAprovada.ParamByName('IDPRODUTOR').AsLargeInt      := lLimite.ParamByName('IDPRODUTOR').AsLargeInt;
    TotalAprovada.ParamByName('IDDISTRIBUIDORA').AsLargeInt := lLimite.ParamByName('IDDISTRIBUIDORA').AsLargeInt;
    TotalAprovada.Open;

    Result := (lLimite.FieldByName('VALOR').AsCurrency - TotalAprovada.FieldByName('TOTAL').AsCurrency);
    FLimiteCredito := Result;
  finally
    lLimite.Free;
  end;
end;

procedure TDMNegociacao.SetTotalNegociacao(const Value: currency);
begin
  FTotalNegociacao := FTotalNegociacao+Value;
end;

function TDMNegociacao.VerificarLimiteCredito(pIdProdutor, pIdDistribuidora: int64): boolean;
begin
  TotalAprovada.Close;
  TotalAprovada.ParamByName('IDPRODUTOR').AsLargeInt := pIdProdutor;
  TotalAprovada.ParamByName('IDDISTRIBUIDORA').AsLargeInt := pIdDistribuidora;
  TotalAprovada.Open;

  RESULT := (FLimiteCredito > TotalAprovada.FieldByName('TOTAL').AsCurrency);
end;

end.
