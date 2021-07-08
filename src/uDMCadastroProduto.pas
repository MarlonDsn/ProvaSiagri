unit uDMCadastroProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMCadastroProduto = class(TDataModule)
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    qryListagem: TFDQuery;
    dsListagem: TDataSource;
    qryProdutoID: TLargeintField;
    qryProdutoDATACADASTRO: TDateField;
    qryProdutoCODIGO: TStringField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoVALOR: TFMTBCDField;
    qryProdutoSTATUS: TStringField;
    qryListagemID: TLargeintField;
    qryListagemCODIGO: TStringField;
    qryListagemDESCRICAO: TStringField;
    qryListagemVALOR: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo;
    procedure Editar(pId: int64);
    function Gravar(pNome: string; pValor: currency): boolean;
    procedure Pesquisar(pValue: string);
    procedure AtualizarListagem;
  end;

var
  DMCadastroProduto: TDMCadastroProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uConexao, uFrameListagemProduto;

{$R *.dfm}

{ TDMCadastroProduto }

procedure TDMCadastroProduto.AtualizarListagem;
begin
  qryListagem.Refresh;
  FrameListagemProduto.DBCtrlGrid.DataSource.DataSet := qryListagem;
  FrameListagemProduto.DBCtrlGrid.Refresh;
  FrameListagemProduto.DBCtrlGrid.Repaint;
end;

procedure TDMCadastroProduto.DataModuleCreate(Sender: TObject);
begin
  qryProduto.Open;
  qryListagem.Open;
end;

procedure TDMCadastroProduto.Editar(pId: int64);
begin
  qryProduto.Close;
  qryProduto.ParamByName('ID').AsLargeInt := pId;
  qryProduto.Open;
  qryProduto.Edit;
end;

function TDMCadastroProduto.Gravar(pNome: string; pValor: currency): boolean;
begin
  if qryProduto.State = dsInsert then
    DMConexao.GravarCodigo('PRODUTO', qryProdutoCODIGO.AsString);

  qryProdutoDESCRICAO.AsString    := pNome;
  qryProdutoVALOR.AsCurrency      := pValor;
  qryProduto.ApplyUpdates;

  self.AtualizarListagem;
end;

procedure TDMCadastroProduto.Novo;
begin
  qryProduto.Close;
  qryProduto.ParamByName('ID').AsLargeInt := 0;
  qryProduto.Open;
  qryProduto.Append;
  qryProdutoID.AsLargeInt           := TDMConexao.RetornaId;
  qryProdutoDATACADASTRO.AsDateTime := Date;
  qryProdutoCODIGO.AsString         := DMConexao.RetornaCodigo('PRODUTO', 6);
  qryProdutoDESCRICAO.AsString      := '';
  qryProdutoVALOR.AsCurrency        := 0;
  qryProdutoSTATUS.AsString         := 'A';
end;

procedure TDMCadastroProduto.Pesquisar(pValue: string);
begin
  qryListagem.Filter := Concat('NOME LIKE ', QuotedStr('%'+pValue+'%'));
  qryListagem.Filtered := True;
  AtualizarListagem;
end;

end.
