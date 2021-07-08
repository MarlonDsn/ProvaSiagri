object DMCadastroDistribuidora: TDMCadastroDistribuidora
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 391
  Width = 411
  object qryDistribuidora: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' DISTRIBUIDORA'
      'WHERE'
      ' ID = :ID')
    Left = 40
    Top = 17
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object qryDistribuidoraID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryDistribuidoraDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qryDistribuidoraCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryDistribuidoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryDistribuidoraCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
    end
    object qryDistribuidoraSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsDistribuidora: TDataSource
    DataSet = qryDistribuidora
    Left = 128
    Top = 16
  end
  object qryListagem: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' ID,'
      ' CODIGO,'
      ' NOME'
      'FROM'
      ' DISTRIBUIDORA'
      'WHERE'
      ' STATUS = '#39'A'#39
      'ORDER BY '
      ' CODIGO')
    Left = 256
    Top = 16
    object qryListagemID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryListagemCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryListagemNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object dsListagem: TDataSource
    DataSet = qryListagem
    Left = 328
    Top = 16
  end
end
