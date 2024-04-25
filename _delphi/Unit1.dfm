object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Anymarket Integration Test Suit'
  ClientHeight = 584
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowHint = True
  OnCreate = FormCreate
  TextHeight = 15
  object memoTestResults: TMemo
    Left = 0
    Top = 292
    Width = 918
    Height = 292
    Align = alBottom
    TabOrder = 0
  end
  object pgTests: TscPageControl
    Left = 0
    Top = 0
    Width = 918
    Height = 290
    ActivePage = sctCategorias
    Align = alTop
    TabOrder = 1
    TabGlowEffect.Enabled = False
    TabGlowEffect.Color = clHighlight
    TabGlowEffect.AlphaValue = 255
    TabGlowEffect.GlowSize = 7
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
      Caption = 'Categorias'
      OnEnter = sctCategoriasEnter
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
      object gpbCAT01: TGroupBox
        Left = 3
        Top = 3
        Width = 185
        Height = 254
        Hint = 
          'Cadastrar pelo menos 3 categorias com nomes e markups diferentes' +
          '.'
        CustomHint = BalloonHint1
        ParentCustomHint = False
        Caption = 'CAT-01'
        TabOrder = 0
        object Label1: TLabel
          Left = 3
          Top = 19
          Width = 103
          Height = 15
          Hint = 'Nome dado a categoria no AnyMarket'
          CustomHint = BalloonHint1
          Caption = 'Nome da Categoria'
          ParentShowHint = False
          ShowHint = True
        end
        object Label2: TLabel
          Left = 3
          Top = 69
          Width = 128
          Height = 15
          Hint = 'Multiplicador do pre'#231'o da categoria'
          CustomHint = BalloonHint1
          ParentCustomHint = False
          Caption = 'Fator de Pre'#231'o (Markup)'
          ParentShowHint = False
          ShowHint = True
        end
        object Label3: TLabel
          Left = 3
          Top = 119
          Width = 157
          Height = 15
          CustomHint = BalloonHint1
          Caption = 'Escopo de Defini'#231#227'o do Pre'#231'o'
        end
        object Label4: TLabel
          Left = 3
          Top = 169
          Width = 51
          Height = 15
          CustomHint = BalloonHint1
          Caption = 'ID no ERP'
        end
        object edtCategoryNameCAT01: TEdit
          Left = 24
          Top = 40
          Width = 137
          Height = 23
          CustomHint = BalloonHint1
          TabOrder = 0
          TextHint = 'Nome da Categoria'
        end
        object edtMarkupCAT01: TEdit
          Left = 24
          Top = 90
          Width = 137
          Height = 23
          CustomHint = BalloonHint1
          NumbersOnly = True
          TabOrder = 1
          TextHint = 'Fator de Pre'#231'o'
        end
        object cbdefinitionPriceScopeCAT01: TComboBox
          Left = 24
          Top = 140
          Width = 137
          Height = 23
          CustomHint = BalloonHint1
          TabOrder = 2
          Text = 'Selecionar'
          Items.Strings = (
            'dpsSKU'
            'dpsSKU_MARKETPLACE'
            'dpsCOST')
        end
        object edtpartnerIdCAT01: TEdit
          Left = 24
          Top = 190
          Width = 136
          Height = 23
          CustomHint = BalloonHint1
          NumbersOnly = True
          CanUndoSelText = True
          TabOrder = 3
          Text = '-1'
          TextHint = 'ID da Categoria no Sistema'
          OnExit = edtpartnerIdCAT01Exit
        end
        object btnRunCAT01: TButton
          Left = 48
          Top = 219
          Width = 75
          Height = 25
          CustomHint = BalloonHint1
          Caption = 'CAT-01'
          DisabledImageName = 'CAT-01'
          TabOrder = 4
          OnClick = btnRunCAT01Click
        end
      end
      object Button1: TButton
        Left = 200
        Top = 18
        Width = 105
        Height = 25
        Caption = 'Obter Categorias'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 200
        Top = 49
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 2
        OnClick = Button2Click
      end
      object btnLoadCategories: TButton
        Left = 499
        Top = 212
        Width = 132
        Height = 25
        Cancel = True
        Caption = 'Carregar Categorias'
        TabOrder = 3
        OnClick = CarregarCategoriasButtonEvent
      end
      object btnAddCategory: TButton
        Left = 637
        Top = 38
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Add'
        TabOrder = 4
        OnClick = AdicionarCategoriaButtonEvent
      end
      object ComboBox1: TComboBox
        Left = 344
        Top = 21
        Width = 145
        Height = 23
        TabOrder = 5
        Text = 'ComboBox1'
      end
      object ListBox1: TListBox
        Left = 637
        Top = 69
        Width = 269
        Height = 171
        ItemHeight = 15
        TabOrder = 6
        OnClick = ListBox1Click
      end
      object btnEditaCategoria: TButton
        Left = 719
        Top = 38
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Editar'
        Enabled = False
        TabOrder = 7
        OnClick = EditarCategoriaButtonEvent
      end
      object btnRemoverCategoria: TButton
        Left = 800
        Top = 38
        Width = 76
        Height = 25
        Cancel = True
        Caption = 'Remover'
        Enabled = False
        TabOrder = 8
        OnClick = RemoverCategoriaButtonEvent
      end
      object Button3: TButton
        Left = 224
        Top = 96
        Width = 96
        Height = 43
        Caption = 'Button3'
        TabOrder = 9
        OnClick = Button3Click
      end
      object Edit1: TEdit
        Left = 360
        Top = 108
        Width = 152
        Height = 23
        TabOrder = 10
        Text = 'Edit1'
      end
    end
    object sctMarcas: TscTabSheet
      Caption = 'Marcas'
      StyleKind = sctsFormBackground
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
      object ListBox2: TListBox
        Left = 72
        Top = 3
        Width = 208
        Height = 254
        ItemHeight = 15
        TabOrder = 0
      end
      object btnCarregarMarcas: TButton
        Left = 287
        Top = 3
        Width = 120
        Height = 25
        Caption = 'Carregar Marcas'
        TabOrder = 1
        OnClick = CarregarMarcasButtonEvent
      end
    end
    object sctProdutos: TscTabSheet
      Caption = 'Produtos'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctPreco: TscTabSheet
      Caption = 'Pre'#231'o'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctEstoque: TscTabSheet
      Caption = 'Estoque'
      StyleKind = sctsTabSheet
      WallpaperIndex = -1
      CustomBackgroundImageIndex = -1
      DrawTabsWallpaper = False
    end
    object sctPedidos: TscTabSheet
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
