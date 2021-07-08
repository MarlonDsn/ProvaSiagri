object FrameListagemProdutor: TFrameListagemProdutor
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
      Caption = 'Controle negocia'#231#227'o > Listagem de produtor'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 214
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
        ExplicitLeft = 736
      end
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
        ExplicitLeft = 304
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
          Left = 20
          Top = 8
          Width = 46
          Height = 21
          Caption = 'Nome:'
        end
        object edtNome: TEdit
          Left = 20
          Top = 35
          Width = 806
          Height = 29
          CharCase = ecUpperCase
          TabOrder = 0
          TextHint = 'NOME DO PRODUTOR...'
          OnChange = edtNomeChange
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
        DataSource = DMCadastroProdutor.dsListagem
        PanelHeight = 43
        PanelWidth = 789
        TabOrder = 1
        RowCount = 11
        SelectedColor = 14857632
        object DBTextCodigo: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 10
          Width = 101
          Height = 23
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Alignment = taCenter
          DataField = 'CODIGO'
          DataSource = DMCadastroProdutor.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 20
          ExplicitTop = 12
          ExplicitHeight = 17
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 110
          Top = 10
          Width = 6
          Height = 23
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 21
        end
        object DBTextNome: TDBText
          AlignWithMargins = True
          Left = 122
          Top = 10
          Width = 101
          Height = 23
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Alignment = taCenter
          DataField = 'NOME'
          DataSource = DMCadastroProdutor.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 499
          ExplicitTop = 13
        end
        object DBTextID: TDBText
          AlignWithMargins = True
          Left = 229
          Top = 10
          Width = 101
          Height = 23
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Alignment = taCenter
          DataField = 'ID'
          DataSource = DMCadastroProdutor.dsListagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3158064
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
          ExplicitLeft = 394
          ExplicitTop = 13
        end
      end
    end
  end
end
