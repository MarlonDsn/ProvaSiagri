object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 329
  Width = 446
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=D:\siagri\ProvaSiagri\data\DADOS.FDB')
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorHome = 'D:\siagri\ProvaSiagri'
    Left = 40
    Top = 64
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 128
    Top = 8
  end
end
