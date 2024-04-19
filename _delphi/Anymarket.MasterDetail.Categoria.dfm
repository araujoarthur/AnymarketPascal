object frmCatMasterDetail: TfrmCatMasterDetail
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Edit3: TEdit
    Left = 135
    Top = 131
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Edit3'
  end
  object gpbStaticItems: TGroupBox
    Left = 8
    Top = 8
    Width = 415
    Height = 65
    Caption = 'Valores Est'#225'ticos'
    TabOrder = 1
    object lblCatId: TLabel
      Left = 15
      Top = 29
      Width = 11
      Height = 15
      Caption = 'ID'
    end
    object edtCatId: TEdit
      Left = 32
      Top = 26
      Width = 64
      Height = 23
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gpbCategoryInfo: TGroupBox
    Left = 8
    Top = 79
    Width = 415
    Height = 122
    Caption = 'Informa'#231#245'es da Categoria'
    TabOrder = 2
    object lblCatName: TLabel
      Left = 15
      Top = 26
      Width = 106
      Height = 15
      Caption = 'Nome da Categoria:'
    end
    object lblMarkupCat: TLabel
      Left = 14
      Top = 55
      Width = 59
      Height = 15
      Caption = 'Markup     :'
    end
    object lblQstMarkMarkup: TLabel
      Left = 61
      Top = 55
      Width = 5
      Height = 15
      Hint = 'Multiplicador do Custo do Item para Calculo do Pre'#231'o Base'
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      StyleElements = [seBorder]
    end
    object lblIdNoSistemaCat: TLabel
      Left = 167
      Top = 55
      Width = 75
      Height = 15
      Caption = 'ID no Sistema:'
    end
    object Label1: TLabel
      Left = 15
      Top = 84
      Width = 160
      Height = 15
      Caption = 'Escopo de Defini'#231#227'o do Pre'#231'o:'
    end
    object edtCatName: TEdit
      Left = 127
      Top = 23
      Width = 274
      Height = 23
      TabOrder = 0
    end
    object edtMarkupCat: TEdit
      Left = 79
      Top = 52
      Width = 82
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCatSystemID: TEdit
      Left = 248
      Top = 52
      Width = 153
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object cbScopeDP: TComboBox
      Left = 181
      Top = 81
      Width = 145
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 3
    end
  end
  object gpbCreateAsSucat: TGroupBox
    Left = 8
    Top = 224
    Width = 415
    Height = 89
    Caption = 'Criar como Subcategoria'
    TabOrder = 3
    object cbCatParent: TComboBox
      Left = 199
      Top = 40
      Width = 145
      Height = 23
      Enabled = False
      TabOrder = 0
    end
  end
  object chkIsSubCategory: TCheckBox
    Left = 23
    Top = 267
    Width = 178
    Height = 17
    Caption = 'Criar como subcategoria de:'
    TabOrder = 4
    OnClick = chkIsSubCategoryClick
  end
end
