object frmConfiguracao: TfrmConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Configura'#231#227'o'
  ClientHeight = 230
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblProtocolo: TLabel
    Left = 14
    Top = 24
    Width = 49
    Height = 13
    Caption = 'Protocolo:'
  end
  object lblServidor: TLabel
    Left = 14
    Top = 51
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object lblPorta: TLabel
    Left = 14
    Top = 78
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object lblBanco: TLabel
    Left = 14
    Top = 105
    Width = 33
    Height = 13
    Caption = 'Banco:'
  end
  object lblUsuario: TLabel
    Left = 14
    Top = 159
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object lblSenha: TLabel
    Left = 14
    Top = 186
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object lblIdioma: TLabel
    Left = 233
    Top = 83
    Width = 36
    Height = 13
    Caption = 'Idioma:'
  end
  object lblTema: TLabel
    Left = 233
    Top = 29
    Width = 30
    Height = 13
    Caption = 'Tema:'
  end
  object lblSchema: TLabel
    Left = 14
    Top = 132
    Width = 41
    Height = 13
    Caption = 'Schema:'
  end
  object edtServidor: TEdit
    Left = 64
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object cbProtocolo: TComboBox
    Left = 64
    Top = 21
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbProtocoloChange
    Items.Strings = (
      'SQL SERVER'
      'POSTGRE'
      'SQLITE')
  end
  object edtPorta: TEdit
    Left = 64
    Top = 75
    Width = 145
    Height = 21
    TabOrder = 2
    OnKeyPress = edtPortaKeyPress
  end
  object edtBanco: TEdit
    Left = 64
    Top = 102
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object edtUsuario: TEdit
    Left = 64
    Top = 156
    Width = 145
    Height = 21
    TabOrder = 5
  end
  object mskSenha: TMaskEdit
    Left = 64
    Top = 183
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 6
    Text = ''
  end
  object cbIdioma: TComboBox
    Left = 233
    Top = 102
    Width = 257
    Height = 21
    TabOrder = 8
    Items.Strings = (
      'Portugu'#234's'
      'English')
  end
  object mmSobre: TMemo
    Left = 233
    Top = 142
    Width = 257
    Height = 35
    TabStop = False
    Lines.Strings = (
      'Criado por: Wallace Ferreira.'
      'Mentor: Leonardo da Silva Duarte.')
    ReadOnly = True
    TabOrder = 11
  end
  object btnOK: TButton
    Left = 321
    Top = 191
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 9
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 415
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object cbTema: TComboBox
    Left = 233
    Top = 48
    Width = 257
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    OnChange = cbTemaChange
    Items.Strings = (
      'BRANCO'
      'CINZA'
      'ESCURO')
  end
  object edtSchema: TEdit
    Left = 64
    Top = 129
    Width = 145
    Height = 21
    TabOrder = 4
  end
end
