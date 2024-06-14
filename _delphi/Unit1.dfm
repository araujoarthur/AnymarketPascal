object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Anymarket Integration Test Suit'
  ClientHeight = 584
  ClientWidth = 1020
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
    Top = 312
    Width = 1020
    Height = 272
    Align = alBottom
    TabOrder = 0
  end
  object productsTestBuilderAndSerializer: TButton
    Left = 733
    Top = 177
    Width = 281
    Height = 25
    Caption = '[PRODUTOS] Test Product Builder and Serializer'
    TabOrder = 1
    OnClick = productsTestBuilderAndSerializerClick
  end
  object Button5: TButton
    Left = 446
    Top = 171
    Width = 281
    Height = 25
    Caption = '[UTILS] Testa Wrapper'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 446
    Top = 18
    Width = 281
    Height = 25
    Caption = '[UTILS] Capitalize First Letter Function'
    TabOrder = 3
    OnClick = Button6Click
  end
  object utilsCapitalizableEdit: TEdit
    Left = 288
    Top = 19
    Width = 152
    Height = 23
    TabOrder = 4
    Text = 'utilsCapitalizableEdit'
  end
  object ordersObterPedidos: TButton
    Left = 8
    Top = 47
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Obter Pedidos (VAR GLOBAL)'
    TabOrder = 5
    OnClick = ordersObterPedidosClick
  end
  object ordersNextPage: TButton
    Left = 8
    Top = 78
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Next Page (VAR GLOBAL)'
    Enabled = False
    TabOrder = 6
    OnClick = ordersNextPageClick
  end
  object ordersFiltrarPedidos: TButton
    Left = 8
    Top = 16
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Teste Filtra Pedidos'
    TabOrder = 7
    OnClick = ordersFiltrarPedidosClick
  end
  object categoryEditaCategoria: TButton
    Left = 815
    Top = 18
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Editar'
    Enabled = False
    TabOrder = 8
    OnClick = EditarCategoriaButtonEvent
  end
  object categoryRemoverCategoria: TButton
    Left = 896
    Top = 18
    Width = 76
    Height = 25
    Cancel = True
    Caption = 'Remover'
    Enabled = False
    TabOrder = 9
    OnClick = RemoverCategoriaButtonEvent
  end
  object ListBox1: TListBox
    Left = 733
    Top = 49
    Width = 281
    Height = 116
    ItemHeight = 15
    TabOrder = 10
    OnClick = ListBox1Click
  end
  object categoryAddCategory: TButton
    Left = 733
    Top = 18
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Add'
    TabOrder = 11
    OnClick = AdicionarCategoriaButtonEvent
  end
  object Button1: TButton
    Left = 446
    Top = 49
    Width = 281
    Height = 23
    Caption = '[CATEGORIAS] Obter Categorias para ComboBox'
    TabOrder = 12
    OnClick = Button1Click
  end
  object categoryCategorias: TComboBox
    Left = 288
    Top = 48
    Width = 152
    Height = 23
    TabOrder = 13
    Text = 'categoryCategorias'
  end
  object categoryLoadCategories: TButton
    Left = 446
    Top = 140
    Width = 281
    Height = 25
    Cancel = True
    Caption = '[CATEGORIAS] Carregar Categorias em ListBox'
    TabOrder = 14
    OnClick = CarregarCategoriasButtonEvent
  end
  object Button3: TButton
    Left = 446
    Top = 78
    Width = 281
    Height = 25
    Caption = '[CATEGORIAS] Checa Data Object'
    TabOrder = 15
    OnClick = Button3Click
  end
  object modalsOpenProductModal: TButton
    Left = 733
    Top = 208
    Width = 281
    Height = 25
    Cancel = True
    Caption = '[MODAIS] Open Product Modal'
    TabOrder = 16
    OnClick = modalsOpenProductModalClick
  end
  object feedTestObtaining: TButton
    Left = 733
    Top = 239
    Width = 281
    Height = 25
    Caption = '[FEED] Test Feed Obtaining'
    TabOrder = 17
    OnClick = feedTestObtainingClick
  end
  object categoryObtainCategoryToMemo: TButton
    Left = 446
    Top = 109
    Width = 281
    Height = 25
    Caption = '[CATEGORIAS] Obter Categorias para Memo'
    TabOrder = 18
    OnClick = categoryObtainCategoryToMemoClick
  end
  object productsSearchableProduct: TEdit
    Left = 288
    Top = 77
    Width = 152
    Height = 23
    TabOrder = 19
    Text = 'productsSearchableProduct'
  end
  object ordersUpdateOrderId: TEdit
    Left = 8
    Top = 125
    Width = 225
    Height = 23
    TabOrder = 20
    Text = 'ordersUpdateOrderId'
  end
  object ordersAtualizaPago: TButton
    Left = 8
    Top = 154
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Atualizar para Pago'
    TabOrder = 21
    OnClick = ordersAtualizaPagoClick
  end
  object ordersAtualizaFaturado: TButton
    Left = 8
    Top = 185
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Atualizar para Faturado'
    TabOrder = 22
    OnClick = ordersAtualizaFaturadoClick
  end
  object ordersAtualizaEnviado: TButton
    Left = 8
    Top = 216
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Atualizar para Enviado'
    TabOrder = 23
    OnClick = ordersAtualizaEnviadoClick
  end
  object ordersAtualizaCancelado: TButton
    Left = 8
    Top = 247
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Atualizar para Cancelado'
    TabOrder = 24
    OnClick = ordersAtualizaCanceladoClick
  end
  object Button4: TButton
    Left = 256
    Top = 247
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Busca Cancelados'
    TabOrder = 25
    OnClick = Button4Click
  end
  object Button7: TButton
    Left = 256
    Top = 216
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Busca Pendentes'
    TabOrder = 26
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 256
    Top = 185
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Busca Pagos'
    TabOrder = 27
    OnClick = Button8Click
  end
  object ordersDetalhesPedido: TButton
    Left = 239
    Top = 124
    Width = 186
    Height = 25
    Caption = '[PEDIDOS] Detalhes do Pedido'
    TabOrder = 28
    OnClick = ordersDetalhesPedidoClick
  end
  object Button2: TButton
    Left = 976
    Top = 318
    Width = 36
    Height = 14
    Caption = 'Clear'
    Font.Charset = OEM_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    OnClick = Button2Click
  end
  object ordersAtualizaConcluido: TButton
    Left = 8
    Top = 278
    Width = 225
    Height = 25
    Caption = '[PEDIDOS] Atualizar para Concluido'
    TabOrder = 30
    OnClick = ordersAtualizaConcluidoClick
  end
  object Button9: TButton
    Left = 256
    Top = 278
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Buscar Concluidos'
    TabOrder = 31
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 431
    Top = 278
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Buscar Enviados'
    TabOrder = 32
    OnClick = Button10Click
  end
  object odersEnviaXML: TButton
    Left = 431
    Top = 247
    Width = 169
    Height = 25
    Caption = '[PEDIDOS] Enviar XML'
    TabOrder = 33
    OnClick = odersEnviaXMLClick
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 632
    Top = 312
  end
end
