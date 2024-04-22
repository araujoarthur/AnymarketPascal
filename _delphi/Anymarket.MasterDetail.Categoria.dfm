object frmCatMasterDetail: TfrmCatMasterDetail
  Left = 0
  Top = 0
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  ClientHeight = 785
  ClientWidth = 1118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -30
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 240
  TextHeight = 41
  object gpbStaticItems: TGroupBox
    Left = 0
    Top = 0
    Width = 1118
    Height = 163
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alTop
    Caption = 'Valores Est'#225'ticos'
    TabOrder = 0
    object lblCatId: TLabel
      Left = 38
      Top = 73
      Width = 29
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'ID'
    end
    object edtCatId: TEdit
      Left = 80
      Top = 65
      Width = 160
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      TabStop = False
      AutoSelect = False
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gpbCategoryInfo: TGroupBox
    Left = 0
    Top = 163
    Width = 1118
    Height = 305
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alTop
    Caption = 'Informa'#231#245'es da Categoria'
    TabOrder = 1
    object lblCatName: TLabel
      Left = 38
      Top = 65
      Width = 266
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Nome da Categoria:'
    end
    object lblMarkupCat: TLabel
      Left = 35
      Top = 138
      Width = 149
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Markup     :'
    end
    object lblQstMarkMarkup: TLabel
      Left = 153
      Top = 138
      Width = 13
      Height = 41
      Hint = 'Multiplicador do Custo do Item para Calculo do Pre'#231'o Base'
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      StyleElements = [seBorder]
    end
    object lblIdNoSistemaCat: TLabel
      Left = 418
      Top = 138
      Width = 190
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'ID no Sistema:'
    end
    object Label1: TLabel
      Left = 38
      Top = 210
      Width = 404
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Escopo de Defini'#231#227'o do Pre'#231'o:'
    end
    object lblRequired: TLabel
      Left = 302
      Top = 53
      Width = 14
      Height = 41
      Hint = 'Obrigat'#243'rio'
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 142
      Top = 122
      Width = 14
      Height = 41
      Hint = 'Obrigat'#243'rio'
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label3: TLabel
      Left = 433
      Top = 195
      Width = 14
      Height = 41
      Hint = 'Obrigat'#243'rio'
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object edtCatName: TEdit
      Left = 318
      Top = 58
      Width = 685
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      TabOrder = 0
    end
    object edtCatMarkup: TEdit
      Left = 197
      Top = 130
      Width = 205
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ImeName = 'Portuguese (Brazilian ABNT)'
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCatSystemID: TEdit
      Left = 624
      Top = 138
      Width = 383
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      NumbersOnly = True
      TabOrder = 2
    end
    object cbScopeDP: TComboBox
      Left = 458
      Top = 207
      Width = 362
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 3
    end
  end
  object gpbCreateAsSucat: TGroupBox
    Left = 0
    Top = 468
    Width = 1118
    Height = 173
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alTop
    Caption = 'Criar como Subcategoria'
    TabOrder = 2
    object cbCatParent: TComboBox
      Left = 498
      Top = 100
      Width = 362
      Height = 49
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Enabled = False
      TabOrder = 0
    end
    object chkIsSubCategory: TCheckBox
      Left = 37
      Top = 101
      Width = 445
      Height = 42
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Criar como subcategoria de:'
      TabOrder = 1
      OnClick = chkIsSubCategoryClick
    end
  end
  object btnSaveCategory: TButton
    Left = 917
    Top = 700
    Width = 188
    Height = 63
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = AddCategory
  end
  object btnCancelCategoryAction: TButton
    Left = 660
    Top = 700
    Width = 200
    Height = 63
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelCategoryActionClick
  end
end
