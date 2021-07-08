object DMCadastroProdutor: TDMCadastroProdutor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 306
  Width = 382
  object qryProdutor: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' PRODUTOR'
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
    object qryProdutorID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutorDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qryProdutorCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryProdutorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryProdutorCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
    end
    object qryProdutorSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutor: TDataSource
    DataSet = qryProdutor
    OnDataChange = dsProdutorDataChange
    Left = 128
    Top = 16
  end
  object qryProdutorLimite: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' L.ID,'
      ' L.FKIDPRODUTOR,'
      ' L.FKIDDISTRIBUIDORA,'
      ' L.VALOR,'
      ' D.NOME'
      'FROM'
      ' PRODUTORLIMITE L'
      
        '  LEFT OUTER JOIN DISTRIBUIDORA D ON (D.ID = L.FKIDDISTRIBUIDORA' +
        ')'
      'WHERE'
      ' FKIDPRODUTOR = :ID')
    Left = 40
    Top = 72
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object qryProdutorLimiteID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutorLimiteFKIDPRODUTOR: TLargeintField
      FieldName = 'FKIDPRODUTOR'
      Origin = 'FKIDPRODUTOR'
    end
    object qryProdutorLimiteFKIDDISTRIBUIDORA: TLargeintField
      FieldName = 'FKIDDISTRIBUIDORA'
      Origin = 'FKIDDISTRIBUIDORA'
    end
    object qryProdutorLimiteVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryProdutorLimiteNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsProdutorLimite: TDataSource
    DataSet = qryProdutorLimite
    Left = 128
    Top = 72
  end
  object qryDistribuidora: TFDQuery
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
      ' STATUS = '#39'A'#39)
    Left = 40
    Top = 128
    object qryDistribuidoraID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryDistribuidoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryDistribuidoraCODIGO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODIGO'
      Size = 50
    end
  end
  object dsDistribuidora: TDataSource
    DataSet = qryDistribuidora
    Left = 128
    Top = 128
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
      ' PRODUTOR'
      'WHERE'
      ' STATUS = '#39'A'#39
      'ORDER BY '
      ' CODIGO')
    Left = 256
    Top = 16
    object qryListagemID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
