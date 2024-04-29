object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  Caption = 'Anymarket Integration Test Suit'
  ClientHeight = 1460
  ClientWidth = 2295
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
    Top = 730
    Width = 2295
    Height = 730
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
    Width = 2295
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
      object btnLoadCategories: TButton
        Left = 1248
        Top = 530
        Width = 330
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Carregar Categorias'
        TabOrder = 3
        OnClick = CarregarCategoriasButtonEvent
      end
      object btnAddCategory: TButton
        Left = 1593
        Top = 95
        Width = 187
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Add'
        TabOrder = 4
        OnClick = AdicionarCategoriaButtonEvent
      end
      object ComboBox1: TComboBox
        Left = 860
        Top = 53
        Width = 363
        Height = 49
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        TabOrder = 5
        Text = 'ComboBox1'
      end
      object ListBox1: TListBox
        Left = 1593
        Top = 173
        Width = 672
        Height = 427
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        ItemHeight = 41
        TabOrder = 6
        OnClick = ListBox1Click
      end
      object btnEditaCategoria: TButton
        Left = 1798
        Top = 95
        Width = 187
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Editar'
        Enabled = False
        TabOrder = 7
        OnClick = EditarCategoriaButtonEvent
      end
      object btnRemoverCategoria: TButton
        Left = 2000
        Top = 95
        Width = 190
        Height = 63
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Cancel = True
        Caption = 'Remover'
        Enabled = False
        TabOrder = 8
        OnClick = RemoverCategoriaButtonEvent
      end
      object Button3: TButton
        Left = 560
        Top = 240
        Width = 240
        Height = 108
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Caption = 'Button3'
        TabOrder = 9
        OnClick = Button3Click
      end
      object Edit1: TEdit
        Left = 900
        Top = 270
        Width = 380
        Height = 49
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        TabOrder = 10
        Text = 'Edit1'
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
      object ListBox2: TListBox
        Left = 180
        Top = 8
        Width = 520
        Height = 635
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        ItemHeight = 41
        TabOrder = 0
      end
      object btnCarregarMarcas: TButton
        Left = 718
        Top = 8
        Width = 300
        Height = 62
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Caption = 'Carregar Marcas'
        TabOrder = 1
        OnClick = CarregarMarcasButtonEvent
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
  object Button4: TButton
    Left = 622
    Top = 540
    Width = 188
    Height = 63
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Caption = 'Button4'
    TabOrder = 2
    OnClick = Button4Click
  end
  object BalloonHint1: TBalloonHint
    Left = 36
    Top = 178
  end
end
