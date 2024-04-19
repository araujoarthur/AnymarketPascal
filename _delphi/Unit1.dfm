object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  Caption = 'Anymarket Integration Test Suit'
  ClientHeight = 1460
  ClientWidth = 2294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -30
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 240
  TextHeight = 41
  object memoTestResults: TMemo
    Left = 0
    Top = 618
    Width = 2294
    Height = 842
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alBottom
    TabOrder = 0
  end
  object pgTests: TscPageControl
    Left = 0
    Top = 0
    Width = 2294
    Height = 725
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = sctCategorias
    Align = alTop
    TabOrder = 1
    TabGlowEffect.Enabled = False
    TabGlowEffect.Color = clHighlight
    TabGlowEffect.AlphaValue = 255
    TabGlowEffect.GlowSize = 18
    TabGlowEffect.Offset = 0
    TabGlowEffect.Intensive = True
    TabGlowEffect.StyleColors = True
    TabGlowEffect.HotColor = clNone
    TabGlowEffect.PressedColor = clNone
    TabGlowEffect.FocusedColor = clNone
    TabGlowEffect.PressedGlowSize = 7
    TabGlowEffect.PressedAlphaValue = 255
    TabGlowEffect.States = [scsHot, scsPressed, scsFocused]
    TabImageGlow = True
    HideBorder = False
    HideTabs = False
    TabsOffset = 0
    TabsInCenter = False
    ShowButtonsDivider = True
    TabsWallpaperIndex = -1
    ShowInActiveTab = True
    ShowFocusRect = True
    MouseWheelSupport = False
    TabExtededDraw = False
    TabSpacing = 1
    FreeOnClose = False
    ShowCloseButtons = False
    object sctCategorias: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Categorias'
      OnEnter = sctCategoriasEnter
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
      object gpbCAT01: TGroupBox
        Left = 8
        Top = 8
        Width = 462
        Height = 635
        Hint = 
          'Cadastrar pelo menos 3 categorias com nomes e markups diferentes' +
          '.'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        CustomHint = BalloonHint1
        ParentCustomHint = False
        Caption = 'CAT-01'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 259
          Height = 41
          Hint = 'Nome dado a categoria no AnyMarket'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          Caption = 'Nome da Categoria'
          ParentShowHint = False
          ShowHint = True
        end
        object Label2: TLabel
          Left = 8
          Top = 173
          Width = 320
          Height = 41
          Hint = 'Multiplicador do pre'#231'o da categoria'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          ParentCustomHint = False
          Caption = 'Fator de Pre'#231'o (Markup)'
          ParentShowHint = False
          ShowHint = True
        end
        object Label3: TLabel
          Left = 8
          Top = 298
          Width = 397
          Height = 41
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          Caption = 'Escopo de Defini'#231#227'o do Pre'#231'o'
        end
        object Label4: TLabel
          Left = 8
          Top = 423
          Width = 130
          Height = 41
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          Caption = 'ID no ERP'
        end
        object edtCategoryNameCAT01: TEdit
          Left = 60
          Top = 100
          Width = 343
          Height = 49
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          TabOrder = 0
          TextHint = 'Nome da Categoria'
        end
        object edtMarkupCAT01: TEdit
          Left = 60
          Top = 225
          Width = 343
          Height = 49
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          NumbersOnly = True
          TabOrder = 1
          TextHint = 'Fator de Pre'#231'o'
        end
        object cbdefinitionPriceScopeCAT01: TComboBox
          Left = 60
          Top = 350
          Width = 343
          Height = 49
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          TabOrder = 2
          Text = 'Selecionar'
          Items.Strings = (
            'dpsSKU'
            'dpsSKU_MARKETPLACE'
            'dpsCOST')
        end
        object edtpartnerIdCAT01: TEdit
          Left = 60
          Top = 475
          Width = 340
          Height = 49
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          NumbersOnly = True
          CanUndoSelText = True
          TabOrder = 3
          Text = '-1'
          TextHint = 'ID da Categoria no Sistema'
          OnExit = edtpartnerIdCAT01Exit
        end
        object btnRunCAT01: TButton
          Left = 120
          Top = 548
          Width = 188
          Height = 62
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          CustomHint = BalloonHint1
          Caption = 'CAT-01'
          DisabledImageName = 'CAT-01'
          TabOrder = 4
          OnClick = btnRunCAT01Click
        end
      end
      object Button1: TButton
        Left = 500
        Top = 45
        Width = 263
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Caption = 'Obter Categorias'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 500
        Top = 123
        Width = 188
        Height = 62
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Caption = 'Button2'
        TabOrder = 2
        OnClick = Button2Click
      end
      object TreeView1: TTreeView
        Left = 1608
        Top = 108
        Width = 682
        Height = 535
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Indent = 48
        TabOrder = 3
      end
      object btnLoadCategories: TButton
        Left = 1960
        Top = 30
        Width = 330
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Carregar Categorias'
        TabOrder = 4
        OnClick = btnLoadCategoriesClick
      end
      object edtAddCategory: TButton
        Left = 1608
        Top = 29
        Width = 188
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Add'
        TabOrder = 5
        OnClick = edtAddCategoryClick
      end
      object ComboBox1: TComboBox
        Left = 860
        Top = 52
        Width = 363
        Height = 49
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        TabOrder = 6
        Text = 'ComboBox1'
      end
    end
    object sctMarcas: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Marcas'
      StyleKind = sctsFormBackground
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 462
        Height = 635
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Caption = 'GroupBox1'
        TabOrder = 0
      end
    end
    object sctProdutos: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Produtos'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctPreco: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Pre'#231'o'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctEstoque: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Estoque'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctPedidos: TscTabSheet
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Pedidos'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 36
    Top = 178
  end
end
