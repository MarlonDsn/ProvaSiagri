object DMNegociacao: TDMNegociacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 413
  Width = 582
  object qryNegociacao: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' NEGOCIACAO'
      'WHERE'
      ' ID = :ID')
    Left = 40
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object qryNegociacaoID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNegociacaoFKIDPRODUTOR: TLargeintField
      FieldName = 'FKIDPRODUTOR'
      Origin = 'FKIDPRODUTOR'
    end
    object qryNegociacaoFKIDDISTRIBUIDORA: TLargeintField
      FieldName = 'FKIDDISTRIBUIDORA'
      Origin = 'FKIDDISTRIBUIDORA'
    end
    object qryNegociacaoFKIDUSUARIO: TLargeintField
      FieldName = 'FKIDUSUARIO'
      Origin = 'FKIDUSUARIO'
    end
    object qryNegociacaoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qryNegociacaoDATAAPROVACAO: TDateField
      FieldName = 'DATAAPROVACAO'
      Origin = 'DATAAPROVACAO'
    end
    object qryNegociacaoDATACONCLUIR: TDateField
      FieldName = 'DATACONCLUIR'
      Origin = 'DATACONCLUIR'
    end
    object qryNegociacaoDATACANCELAR: TDateField
      FieldName = 'DATACANCELAR'
      Origin = 'DATACANCELAR'
    end
    object qryNegociacaoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryNegociacaoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryNegociacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryListagem: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' N.ID,'
      ' N.DATACADASTRO,'
      ' N.DATAAPROVACAO,'
      ' N.DATACONCLUIR,'
      ' N.DATACANCELAR,'
      ' N.CODIGO,'
      ' N.VALOR,'
      ' P.NOME AS "PRODUTOR",'
      ' D.NOME AS "DISTRIBUIDORA",'
      ' N.STATUS,'
      ' case N.STATUS'
      '    WHEN '#39'P'#39' THEN '#39'PENDENTE'#39
      '    WHEN '#39'A'#39' THEN '#39'APROVADA'#39
      '    WHEN '#39'O'#39' THEN '#39'CONCLUIR'#39
      '    WHEN '#39'C'#39' THEN '#39'CANCELADA'#39
      ' END AS "STATUSCOMPLETO"'
      'FROM'
      ' NEGOCIACAO N'
      '  LEFT OUTER JOIN PRODUTOR P ON (P.ID = N.FKIDPRODUTOR)'
      
        '  LEFT OUTER JOIN DISTRIBUIDORA D ON (D.ID = N.FKIDDISTRIBUIDORA' +
        ')'
      'WHERE'
      '  (P.NOME LIKE :PRODUTORDISTRIBUIDORA OR'
      '   D.NOME LIKE :PRODUTORDISTRIBUIDORA)'
      'ORDER BY'
      ' CODIGO ')
    Left = 216
    Top = 24
    ParamData = <
      item
        Name = 'PRODUTORDISTRIBUIDORA'
        DataType = ftString
        ParamType = ptInput
        Value = '%T%'
      end>
    object qryListagemID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListagemDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
    object qryListagemDATAAPROVACAO: TDateField
      FieldName = 'DATAAPROVACAO'
      Origin = 'DATAAPROVACAO'
    end
    object qryListagemDATACONCLUIR: TDateField
      FieldName = 'DATACONCLUIR'
      Origin = 'DATACONCLUIR'
    end
    object qryListagemDATACANCELAR: TDateField
      FieldName = 'DATACANCELAR'
      Origin = 'DATACANCELAR'
    end
    object qryListagemCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 50
    end
    object qryListagemVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryListagemPRODUTOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryListagemDISTRIBUIDORA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DISTRIBUIDORA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryListagemSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object qryListagemSTATUSCOMPLETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUSCOMPLETO'
      Origin = 'STATUSCOMPLETO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
  end
  object qryItem: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' ITEMNEGOCIACAO'
      'WHERE'
      ' FKIDNEGOCIACAO = :ID')
    Left = 40
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryItemID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemFKIDNEGOCIACAO: TLargeintField
      FieldName = 'FKIDNEGOCIACAO'
      Origin = 'FKIDNEGOCIACAO'
    end
    object qryItemFKIDPRODUTO: TLargeintField
      FieldName = 'FKIDPRODUTO'
      Origin = 'FKIDPRODUTO'
    end
    object qryItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object qryItemQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object qryItemVALORUNITARIO: TFMTBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryItemVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryItemSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object dsListagem: TDataSource
    DataSet = qryListagem
    Left = 288
    Top = 24
  end
  object dsItem: TDataSource
    DataSet = qryItem
    Left = 112
    Top = 80
  end
  object dsNegociacao: TDataSource
    DataSet = qryNegociacao
    Left = 112
    Top = 16
  end
  object dsDistribuidora: TDataSource
    DataSet = qryDistribuidora
    Left = 112
    Top = 152
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
      ' STATUS = '#39'A'#39
      'ORDER BY '
      ' NOME')
    Left = 40
    Top = 152
    object qryDistribuidoraID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
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
  end
  object qryProdutor: TFDQuery
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
      ' NOME')
    Left = 40
    Top = 208
    object qryProdutorID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutorCODIGO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      Size = 50
    end
    object qryProdutorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object dsProdutor: TDataSource
    DataSet = qryProdutor
    Left = 112
    Top = 208
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 112
    Top = 264
  end
  object qryProduto: TFDQuery
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
    Left = 40
    Top = 264
    object qryProdutoID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
  end
  object TotalAprovada: TFDQuery
    CachedUpdates = True
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      ' SUM(VALOR) AS TOTAL'
      'FROM'
      ' NEGOCIACAO'
      'WHERE'
      '  STATUS = '#39'A'#39' AND'
      '  FKIDPRODUTOR = :IDPRODUTOR AND'
      '  FKIDDISTRIBUIDORA = :IDDISTRIBUIDORA')
    Left = 216
    Top = 80
    ParamData = <
      item
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        Name = 'IDDISTRIBUIDORA'
        ParamType = ptInput
      end>
  end
  object frxReport: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44384.889602175900000000
    ReportOptions.LastChange = 44384.907549895800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  NegociacaoDATACADASTRO.Visible  := <Negociacao."DATACADASTRO">' +
        ' > 0;       '
      
        '  NegociacaoDATAAPROVACAO.Visible := (<Negociacao."DATAAPROVACAO' +
        '"> > 0);'
      
        '  NegociacaoDATACONCLUIR.Visible  := (<Negociacao."DATACONCLUIR"' +
        '> > 0);'
      
        '  NegociacaoDATACANCELAR.Visible  := (<Negociacao."DATACANCELAR"' +
        '> > 0);      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 360
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'Negociacao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = [ftBottom]
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 786.142240000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 190.846782890000000000
          Top = 19.949684120000000000
          Width = 342.885195880000000000
          Height = 54.549917530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de negocia'#231#227'o')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftBottom]
        Height = 68.031540000000000000
        Top = 162.519790000000000000
        Width = 786.142240000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'Negociacao'
        RowCount = 0
        object NegociacaoPRODUTOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 7.559060000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Produtor:  [Negociacao."PRODUTOR"]')
          ParentFont = False
        end
        object NegociacaoDISTRIBUIDORA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Distribuidora:  [Negociacao."DISTRIBUIDORA"]')
          ParentFont = False
        end
        object NegociacaoDATACADASTRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 7.559060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cad.:[Negociacao."DATACADASTRO"]')
          ParentFont = False
        end
        object NegociacaoDATAAPROVACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 34.015770000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Apr.:  [Negociacao."DATAAPROVACAO"]')
          ParentFont = False
        end
        object NegociacaoDATACONCLUIR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Con.:  [Negociacao."DATACONCLUIR"]')
          ParentFont = False
        end
        object NegociacaoDATACANCELAR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 428.086890000000000000
          Top = 34.015770000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Can.:[Negociacao."DATACANCELAR"]')
          ParentFont = False
        end
        object NegociacaoCODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 34.015770000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Contrato: [Negociacao."CODIGO"] - [Negociacao."VALOR"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end>
        end
        object NegociacaoVALOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 541.031850000000000000
          Top = 7.338590000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'STATUSCOMPLETO'
          DataSet = frxDBDataset
          DataSetName = 'Negociacao'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Negociacao."STATUSCOMPLETO"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'Negociacao'
    CloseDataSource = False
    DataSet = qryListagem
    BCDToCurrency = False
    Left = 424
    Top = 24
  end
end
