unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, System.DateUtils,
  System.AnsiStrings, System.MaskUtils;

type
  TDMConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function RetornaId: int64;
    class function PadLeft(const AString : String; const nLen : Integer; const Caracter : Char = ' '): String;

    procedure GravarCodigo(pCampo, pCodigo: string);
    function RetornaCodigo(pCampo: string; pZerosEsquerda: integer): string;
    function ValidaCpfCnpjEColocaMascara(pCPFCNPJ: string): String;
    function LimpaCPFCNPJ(pCPFCNPJ: string): string;
    procedure EsconderFrames;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal, Vcl.Forms;

{$R *.dfm}

{ TDMConexao }

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  with FDConnection.Params as TFDPhysFBConnectionDefParams do
  begin
    Database := GetCurrentDir+'\dados.fdb';
  end;
end;

procedure TDMConexao.EsconderFrames();
var
  i: integer;
begin
  for i := frmPrincipal.ComponentCount -1 downto 0 do
  begin
    if (frmPrincipal.Components[i] is Tframe) then
       (frmPrincipal.Components[i] as Tframe).Visible := False;
   end;
end;

procedure TDMConexao.GravarCodigo(pCampo, pCodigo: string);
var
  lCodigo: TFDQuery;
begin
  lCodigo := TFDQuery.Create(nil);
  try
    lCodigo.Connection := FDConnection;
    lCodigo.Close;
    lCodigo.CachedUpdates := True;
    lCodigo.Open('Select ' + pCampo + ' From Codigo');
    lCodigo.Edit;

    lCodigo.FieldByName(pCampo).AsString :=
     PadLeft((STRTOINT64(pCodigo)+1).ToString, 6, '0');

    lCodigo.ApplyUpdates;
  finally
    FreeAndNil(lCodigo);
  end;
end;

function TDMConexao.LimpaCPFCNPJ(pCPFCNPJ: string): string;
begin
  Result := StringReplace(pCPFCNPJ, '.', '', [rfreplaceall]);
  Result := StringReplace(Result, '/', '', [rfreplaceall]);
  Result := StringReplace(Result, '-', '', [rfreplaceall]);
  Result := StringReplace(Result, '.', '', [rfreplaceall]);
  Result := Trim(Result);
end;

class function TDMConexao.PadLeft(const AString: String; const nLen: Integer; const Caracter: Char): String;
var
  Tam: Integer;
begin
  Tam := Length(AString);
  if Tam < nLen then
    Result := StringOfChar(Caracter, (nLen - Tam)) + AString
  else
    Result := LeftStr(AString, nLen);
end;

function TDMConexao.RetornaCodigo(pCampo: string; pZerosEsquerda: integer): string;
var
  lCodigo: TFDQuery;
  lCod: String;
begin
  lCodigo := TFDQuery.Create(nil);
  try
    lCodigo.Connection := FDConnection;
    lCodigo.CachedUpdates := True;
    lCodigo.Open('select ' + pCampo + ' From Codigo');
    lCod := lCodigo.FieldByName(pCampo).AsString;

    if (lCod.Equals('')) then
      lCod := PadLeft('1', pZerosEsquerda, '0');

    Result := PadLeft(lCod, pZerosEsquerda, '0');
  finally
    FreeAndNil(lCodigo);
  end;
end;

class function TDMConexao.RetornaId: int64;
begin
  sleep(2);
  Result := MilliSecondsBetween(NOW, UnixDateDelta);
end;

function TDMConexao.ValidaCpfCnpjEColocaMascara(pCPFCNPJ: string): String;
var
  lCpfCnpj: String;
begin
  Result := '';
  lCpfCnpj := pCPFCNPJ;
  lCpfCnpj := LimpaCPFCNPJ(lCpfCnpj);

  if (lCpfCnpj.Length > 0) then
  begin
    if ((lCpfCnpj.Length = 11)) then
      lCpfCnpj := FormatMaskText('###\.###\.###\-##;0', lCpfCnpj)
    else if (lCpfCnpj.Length = 14) then
      lCpfCnpj := FormatMaskText('##\.###\.###\/####\-##;0', lCpfCnpj)
    else if (lCpfCnpj.Length < 11) then
      Result := pCPFCNPJ
    else
      Result := pCPFCNPJ;
  end;

  Result := lCpfCnpj;
end;

end.
