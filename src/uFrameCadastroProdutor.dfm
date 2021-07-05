object FrameCadastroProdutor: TFrameCadastroProdutor
  Left = 0
  Top = 0
  Width = 870
  Height = 650
  TabOrder = 0
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 650
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -3
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 864
      Height = 13
      Align = alTop
      Caption = 'Controle negocia'#231#227'o > Cadastro de produtor'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 216
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
      ExplicitTop = 603
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 707
        Top = 10
        Width = 153
        Height = 30
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
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
        ExplicitLeft = 696
        ExplicitTop = 8
        ExplicitHeight = 38
      end
      object SpeedButton2: TSpeedButton
        AlignWithMargins = True
        Left = 534
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
        ExplicitLeft = 696
        ExplicitTop = 8
        ExplicitHeight = 38
      end
    end
    object PanelCadastro: TPanel
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
      ExplicitLeft = 17
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 53
        Height = 21
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 201
        Top = 16
        Width = 46
        Height = 21
        Caption = 'Nome:'
      end
      object Label4: TLabel
        Left = 16
        Top = 80
        Width = 72
        Height = 21
        Caption = 'CPF/CNPJ:'
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 43
        Width = 177
        Height = 29
        CharCase = ecUpperCase
        TabOrder = 0
        TextHint = '000001'
      end
      object edtNomeProdutor: TEdit
        Left = 201
        Top = 43
        Width = 626
        Height = 29
        CharCase = ecUpperCase
        TabOrder = 1
        TextHint = 'NOME DO PRODUTOR...'
      end
      object edtCPFCNPJ: TEdit
        Left = 16
        Top = 107
        Width = 177
        Height = 29
        CharCase = ecUpperCase
        TabOrder = 2
        TextHint = 'CPF OU CNPJ...'
      end
      object PanelPrincipalLimite: TPanel
        AlignWithMargins = True
        Left = 16
        Top = 152
        Width = 811
        Height = 393
        BevelOuter = bvNone
        Color = 6908265
        ParentBackground = False
        TabOrder = 3
        object Label5: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 805
          Height = 23
          Align = alTop
          Caption = 'Limite de cr'#233'dito'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13092807
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 139
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 29
          Width = 805
          Height = 361
          Margins.Top = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 13092807
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 30
          ExplicitHeight = 360
          object Panel2: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 0
            Width = 799
            Height = 57
            Margins.Top = 0
            Align = alTop
            BevelOuter = bvNone
            Color = 13092807
            ParentBackground = False
            TabOrder = 0
            object Label6: TLabel
              Left = 0
              Top = 2
              Width = 94
              Height = 21
              Caption = 'Distribuidora:'
            end
            object Label7: TLabel
              Left = 487
              Top = 2
              Width = 119
              Height = 21
              Caption = 'Limite de cr'#233'dito:'
            end
            object SpeedButton3: TSpeedButton
              AlignWithMargins = True
              Left = 636
              Top = 10
              Width = 153
              Height = 37
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Align = alRight
              Caption = 'Adicionar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
              ExplicitTop = 11
            end
            object cbxDistribuidora: TDBLookupComboBox
              Left = 0
              Top = 25
              Width = 473
              Height = 29
              NullValueKey = 48
              TabOrder = 0
            end
            object edtLimiteCredito: TEdit
              Left = 487
              Top = 25
              Width = 146
              Height = 29
              CharCase = ecUpperCase
              TabOrder = 1
              Text = '0,00'
            end
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 60
            Width = 805
            Height = 301
            Align = alClient
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -16
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
      end
    end
  end
end
