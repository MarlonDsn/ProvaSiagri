object FrameNegociacao: TFrameNegociacao
  Left = 0
  Top = 0
  Width = 870
  Height = 650
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 650
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 344
    ExplicitTop = 304
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 870
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      Color = 13092807
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = -3
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 54
        Height = 16
        Caption = 'Produtor:'
      end
      object Label2: TLabel
        Left = 340
        Top = 8
        Width = 77
        Height = 16
        Caption = 'Distribuidora:'
      end
      object Label3: TLabel
        Left = 16
        Top = 67
        Width = 49
        Height = 16
        Caption = 'Produto:'
      end
      object Label4: TLabel
        Left = 340
        Top = 67
        Width = 70
        Height = 16
        Caption = 'Quantidade:'
      end
      object Label5: TLabel
        Left = 668
        Top = 8
        Width = 100
        Height = 16
        Caption = 'Limite de cr'#233'dito:'
      end
      object LabelLimiteCredito: TLabel
        Left = 736
        Top = 30
        Width = 56
        Height = 19
        Alignment = taRightJustify
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cbxProdutor: TDBLookupComboBox
        Left = 16
        Top = 30
        Width = 300
        Height = 24
        DataField = 'FKIDPRODUTOR'
        DataSource = DMNegociacao.dsNegociacao
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = DMNegociacao.dsProdutor
        TabOrder = 0
        OnClick = cbxProdutorClick
      end
      object cbxDistribuidora: TDBLookupComboBox
        Left = 340
        Top = 30
        Width = 300
        Height = 24
        DataField = 'FKIDDISTRIBUIDORA'
        DataSource = DMNegociacao.dsNegociacao
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = DMNegociacao.dsDistribuidora
        TabOrder = 1
        OnClick = cbxDistribuidoraClick
      end
      object cbxProduto: TDBLookupComboBox
        Left = 16
        Top = 90
        Width = 300
        Height = 24
        DataField = 'FKIDPRODUTO'
        DataSource = DMNegociacao.dsItem
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListSource = DMNegociacao.dsProduto
        TabOrder = 2
      end
      object edtQuantidade: TEdit
        Left = 340
        Top = 89
        Width = 77
        Height = 24
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 3
        Text = '1'
      end
      object Button1: TButton
        Left = 440
        Top = 89
        Width = 75
        Height = 25
        Caption = 'Lan'#231'ar'
        TabOrder = 4
        OnClick = Button1Click
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 600
      Width = 870
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      Color = 13092807
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 606
      object btnConfirmar: TSpeedButton
        AlignWithMargins = True
        Left = 697
        Top = 10
        Width = 153
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 20
        Margins.Bottom = 10
        Align = alRight
        Caption = 'Confirmar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnConfirmarClick
        ExplicitLeft = 696
        ExplicitTop = 8
        ExplicitHeight = 38
      end
      object btnCancelar: TSpeedButton
        AlignWithMargins = True
        Left = 524
        Top = 10
        Width = 153
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alRight
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 696
        ExplicitTop = 8
        ExplicitHeight = 38
      end
      object LabelTotal: TLabel
        Left = 92
        Top = 10
        Width = 82
        Height = 29
        Alignment = taRightJustify
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 33
        Top = 14
        Width = 53
        Height = 25
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 0
      Top = 120
      Width = 870
      Height = 480
      Align = alClient
      DataSource = DMNegociacao.dsItem
      PanelHeight = 48
      PanelWidth = 853
      TabOrder = 2
      RowCount = 10
      SelectedColor = 14857632
      ExplicitHeight = 600
      object DBTextNome: TDBText
        AlignWithMargins = True
        Left = 43
        Top = 10
        Width = 353
        Height = 28
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alRight
        Alignment = taRightJustify
        DataField = 'DESCRICAO'
        DataSource = DMNegociacao.dsItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = 13
      end
      object DBTextQuantidade: TDBText
        AlignWithMargins = True
        Left = 409
        Top = 10
        Width = 108
        Height = 28
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alRight
        Alignment = taRightJustify
        DataField = 'QUANTIDADE'
        DataSource = DMNegociacao.dsItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 445
      end
      object DBTextPreco: TDBText
        AlignWithMargins = True
        Left = 565
        Top = 10
        Width = 107
        Height = 28
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alRight
        Alignment = taRightJustify
        DataField = 'VALORUNITARIO'
        DataSource = DMNegociacao.dsItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 582
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 523
        Top = 15
        Width = 36
        Height = 23
        Margins.Top = 15
        Margins.Bottom = 10
        Align = alRight
        Alignment = taCenter
        Caption = 'X'
        ExplicitLeft = 541
      end
      object Label8: TLabel
        AlignWithMargins = True
        Left = 678
        Top = 15
        Width = 26
        Height = 23
        Margins.Top = 15
        Margins.Bottom = 10
        Align = alRight
        Alignment = taCenter
        Caption = '='
        ExplicitLeft = 824
      end
      object DBTextTotal: TDBText
        AlignWithMargins = True
        Left = 710
        Top = 7
        Width = 123
        Height = 31
        Margins.Top = 7
        Margins.Right = 20
        Margins.Bottom = 10
        Align = alRight
        Alignment = taRightJustify
        DataField = 'VALORTOTAL'
        DataSource = DMNegociacao.dsItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 727
      end
    end
  end
end
