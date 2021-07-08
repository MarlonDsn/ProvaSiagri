object DMCadastroProduto: TDMCadastroProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 443
  object qryProduto: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' PRODUTO'
      'WHERE'
      ' ID = :ID')
    Left = 32
    Top = 17
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object qryProdutoID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qryProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryProdutoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 120
    Top = 16
  end
  object qryListagem: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' ID,'
      ' CODIGO,'
      ' DESCRICAO,'
      ' VALOR'
      'FROM'
      ' PRODUTO'
      'WHERE'
      ' STATUS = '#39'A'#39
      'ORDER BY'
      ' DESCRICAO')
    Left = 248
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
    object qryListagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryListagemVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dsListagem: TDataSource
    DataSet = qryListagem
    Left = 316
    Top = 16
  end
end
