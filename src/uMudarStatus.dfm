object frmMudarStatus: TfrmMudarStatus
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONTROLE NEGOCIA'#199#195'O - MUDAR STATUS'
  ClientHeight = 172
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 205
    Height = 29
    Caption = 'C'#243'digo negocia'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 74
    Height = 29
    Caption = 'Status:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 219
    Top = 16
    Width = 208
    Height = 29
    DataField = 'CODIGO'
    DataSource = DMNegociacao.dsNegociacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object PanelRodape: TPanel
    Left = 0
    Top = 133
    Width = 435
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    Color = 13092807
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 314
    ExplicitWidth = 799
    object btnConfirmar: TSpeedButton
      AlignWithMargins = True
      Left = 262
      Top = 5
      Width = 153
      Height = 29
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 20
      Margins.Bottom = 5
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
      ExplicitLeft = 626
      ExplicitTop = 10
      ExplicitHeight = 18
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 89
      Top = 5
      Width = 153
      Height = 29
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
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
  end
  object cbxStatus: TComboBox
    Left = 88
    Top = 77
    Width = 339
    Height = 37
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'PENDENTE'
    Items.Strings = (
      'PENDENTE'
      'APROVADA'
      'CONCLUIR'
      'CANCELADA')
  end
end
