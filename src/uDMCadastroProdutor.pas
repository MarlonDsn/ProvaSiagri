unit uDMCadastroProdutor;

interface

uses
  System.SysUtils, System.Classes, uConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMCadastroProdutor = class(TDataModule)
    qryProdutor: TFDQuery;
    dsProdutor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastroProdutor: TDMCadastroProdutor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
