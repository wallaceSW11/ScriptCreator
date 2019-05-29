object frmModeloPesquisa: TfrmModeloPesquisa
  Left = 0
  Top = 0
  Caption = 'Modelo Pesquisa'
  ClientHeight = 376
  ClientWidth = 570
  Color = clBtnFace
  Constraints.MinHeight = 415
  Constraints.MinWidth = 586
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    570
    376)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTipo: TLabel
    Left = 8
    Top = 5
    Width = 24
    Height = 13
    Caption = 'Tipo:'
  end
  object lblTrecho: TLabel
    Left = 159
    Top = 5
    Width = 37
    Height = 13
    Caption = 'Trecho:'
  end
  object cbTipo: TComboBox
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object edtTrecho: TEdit
    Left = 159
    Top = 24
    Width = 313
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnKeyDown = edtTrechoKeyDown
  end
  object btnLocalizar: TButton
    Left = 478
    Top = 22
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Localizar'
    TabOrder = 4
    OnClick = btnLocalizarClick
  end
  object sgResultado: TStringGrid
    Left = 8
    Top = 51
    Width = 545
    Height = 278
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 3
    OnDblClick = sgResultadoDblClick
  end
  object btnOk: TButton
    Left = 397
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancelar: TButton
    Left = 478
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
