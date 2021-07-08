object FrameListagemNegociacao: TFrameListagemNegociacao
  Left = 0
  Top = 0
  Width = 870
  Height = 650
  Align = alClient
  TabOrder = 0
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 650
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 864
      Height = 13
      Align = alTop
      Caption = 'Controle negocia'#231#227'o > Listagem de negocia'#231#227'o'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 226
    end
    object PanelRodape: TPanel
      Left = 0
      Top = 600
      Width = 870
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      Color = 13092807
      ParentBackground = False
      TabOrder = 0
      object btnEditar: TSpeedButton
        AlignWithMargins = True
        Left = 174
        Top = 10
        Width = 114
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = 'Editar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnEditarClick
        ExplicitLeft = 75
      end
      object btnNovo: TSpeedButton
        AlignWithMargins = True
        Left = 40
        Top = 10
        Width = 114
        Height = 30
        Margins.Left = 40
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = 'Novo'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnNovoClick
        ExplicitLeft = 32
        ExplicitTop = 8
      end
      object btnImprimirRelatorio: TSpeedButton
        AlignWithMargins = True
        Left = 517
        Top = 10
        Width = 189
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = 'Imprimir relat'#243'rio'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnImprimirRelatorioClick
        ExplicitLeft = 620
      end
      object btnMudarStatus: TSpeedButton
        AlignWithMargins = True
        Left = 308
        Top = 10
        Width = 189
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = 'Alterar status'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3158064
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        OnClick = btnMudarStatusClick
        ExplicitLeft = 277
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 29
      Width = 850
      Height = 571
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 846
        Height = 88
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 209
          Top = 8
          Width = 62
          Height = 21
          Caption = 'Produtor'
        end
        object Label4: TLabel
          Left = 20
          Top = 8
          Width = 42
          Height = 21
          Caption = 'Status'
        end
        object edtNome: TEdit
          Left = 209
          Top = 35
          Width = 599
          Height = 29
          CharCase = ecUpperCase
          TabOrder = 0
          TextHint = 'NOME DO PRODUTOR...'
          OnChange = edtNomeChange
        end
        object cbxStatus: TComboBox
          Left = 20
          Top = 35
          Width = 157
          Height = 29
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'TODOS'
          OnChange = cbxStatusChange
          Items.Strings = (
            'TODOS'
            'PENDENTE'
            'APROVADA'
            'CONCLUIR'
            'CANCELADA')
        end
      end
      object DBCtrlGrid: TDBCtrlGrid
        AlignWithMargins = True
        Left = 22
        Top = 93
        Width = 806
        Height = 476
        Margins.Left = 20
        Margins.Right = 20
        Margins.Bottom = 0
        Align = alClient
        DataSource = DMNegociacao.dsListagem
        PanelHeight = 59
        PanelWidth = 789
        TabOrder = 1
        RowCount = 8
        SelectedColor = 14857632
        object DBTextCodigo: TDBText
          Left = 82
          Top = 7
          Width = 101
          Height = 17
          Margins.Top = 10
          Margins.Bottom = 10
          DataField = 'CODIGO'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBTextNome: TDBText
          Left = 300
          Top = 7
          Width = 265
          Height = 18
          Margins.Top = 10
          Margins.Bottom = 10
          DataField = 'PRODUTOR'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBText1: TDBText
          AlignWithMargins = True
          Left = 685
          Top = 15
          Width = 101
          Height = 29
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alRight
          Alignment = taCenter
          DataField = 'VALOR'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 394
          ExplicitTop = 13
          ExplicitHeight = 23
        end
        object Label5: TLabel
          Left = 23
          Top = 7
          Width = 53
          Height = 21
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 226
          Top = 7
          Width = 65
          Height = 21
          Caption = 'Produtor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 300
          Top = 33
          Width = 265
          Height = 18
          Margins.Top = 10
          Margins.Bottom = 10
          DataField = 'DISTRIBUIDORA'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 205
          Top = 33
          Width = 86
          Height = 21
          Caption = 'Distribui'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 560
          Top = 7
          Width = 45
          Height = 21
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 568
          Top = 32
          Width = 105
          Height = 18
          Margins.Top = 10
          Margins.Bottom = 10
          DataField = 'STATUSCOMPLETO'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBTextID: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 10
          Width = 14
          Height = 39
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Alignment = taCenter
          DataField = 'ID'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
          ExplicitLeft = 82
        end
        object DBText4: TDBText
          Left = 82
          Top = 34
          Width = 101
          Height = 17
          Margins.Top = 10
          Margins.Bottom = 10
          DataField = 'DATACADASTRO'
          DataSource = DMNegociacao.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 40
          Top = 34
          Width = 35
          Height = 21
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
