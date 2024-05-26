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
      object Button1: TButton
        Left = 200
        Top = 18
        Width = 105
        Height = 25
        Caption = 'Obter Categorias'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 200
        Top = 49
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 1
        OnClick = Button2Click
      end
      object btnLoadCategories: TButton
        Left = 499
        Top = 216
        Width = 132
        Height = 25
        Cancel = True
        Caption = 'Carregar Categorias'
        TabOrder = 2
        OnClick = CarregarCategoriasButtonEvent
      end
      object btnAddCategory: TButton
        Left = 637
        Top = 38
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Add'
        TabOrder = 3
        OnClick = AdicionarCategoriaButtonEvent
      end
      object ComboBox1: TComboBox
        Left = 344
        Top = 21
        Width = 145
        Height = 23
        TabOrder = 4
        Text = 'ComboBox1'
      end
      object ListBox1: TListBox
        Left = 637
        Top = 69
        Width = 269
        Height = 171
        ItemHeight = 15
        TabOrder = 5
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
        TabOrder = 6
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
        TabOrder = 7
        OnClick = RemoverCategoriaButtonEvent
      end
      object Button3: TButton
        Left = 224
        Top = 96
        Width = 96
        Height = 43
        Caption = 'Button3'
        TabOrder = 8
        OnClick = Button3Click
      end
      object Edit1: TEdit
        Left = 360
        Top = 108
        Width = 152
        Height = 23
        TabOrder = 9
        Text = 'Edit1'
      end
      object Button7: TButton
        Left = 272
        Top = 216
        Width = 137
        Height = 25
        Cancel = True
        Caption = 'Open Product Modal'
        TabOrder = 10
        OnClick = Button7Click
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
  object Button4: TButton
    Left = 519
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 835
    Top = 551
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 135
    Top = 242
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 4
    OnClick = Button6Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 243
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'Edit2'
  end
end
