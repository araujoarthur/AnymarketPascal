object frmCatMasterDetail: TfrmCatMasterDetail
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 314
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object gpbStaticItems: TGroupBox
    Left = 0
    Top = 0
    Width = 441
    Height = 65
    Align = alTop
    Caption = 'Valores Est'#225'ticos'
    TabOrder = 0
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
      TabStop = False
      AutoSelect = False
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gpbCategoryInfo: TGroupBox
    Left = 0
    Top = 65
    Width = 441
    Height = 122
    Align = alTop
    Caption = 'Informa'#231#245'es da Categoria'
    TabOrder = 1
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
    object lblRequired: TLabel
      Left = 121
      Top = 21
      Width = 5
      Height = 15
      Hint = 'Obrigat'#243'rio'
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 57
      Top = 49
      Width = 5
      Height = 15
      Hint = 'Obrigat'#243'rio'
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label3: TLabel
      Left = 173
      Top = 78
      Width = 5
      Height = 15
      Hint = 'Obrigat'#243'rio'
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object edtCatName: TEdit
      Left = 127
      Top = 23
      Width = 274
      Height = 23
      TabOrder = 0
    end
    object edtCatMarkup: TEdit
      Left = 79
      Top = 52
      Width = 82
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCatSystemID: TEdit
      Left = 250
      Top = 55
      Width = 153
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object cbScopeDP: TComboBox
      Left = 183
      Top = 83
      Width = 145
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 3
    end
  end
  object gpbCreateAsSucat: TGroupBox
    Left = 0
    Top = 187
    Width = 441
    Height = 69
    Align = alTop
    Caption = 'Criar como Subcategoria'
    TabOrder = 2
    object cbCatParent: TComboBox
      Left = 199
      Top = 40
      Width = 145
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object chkIsSubCategory: TCheckBox
      Left = 15
      Top = 40
      Width = 178
      Height = 17
      Caption = 'Criar como subcategoria de:'
      TabOrder = 1
      OnClick = chkIsSubCategoryClick
    end
  end
  object btnSaveCategory: TButton
    AlignWithMargins = True
    Left = 361
    Top = 274
    Width = 75
    Height = 22
    Margins.Top = 18
    Margins.Right = 5
    Margins.Bottom = 18
    Align = alRight
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = AddCategory
    ExplicitLeft = 356
    ExplicitTop = 269
  end
  object btnCancelCategoryAction: TButton
    AlignWithMargins = True
    Left = 275
    Top = 274
    Width = 80
    Height = 22
    Margins.Top = 18
    Margins.Bottom = 18
    Align = alRight
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelCategoryActionClick
    ExplicitLeft = 264
    ExplicitTop = 280
    ExplicitHeight = 25
  end
end
