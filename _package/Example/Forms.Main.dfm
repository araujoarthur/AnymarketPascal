object tfrmExemplos: TtfrmExemplos
  Left = 0
  Top = 0
  Caption = 'Exemplos'
  ClientHeight = 777
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 217
    Height = 25
    Caption = 'Exemplo de Filtro de Todos os Pedidos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object testResult: TMemo
    Left = 0
    Top = 400
    Width = 500
    Height = 377
    Align = alBottom
    TabOrder = 1
  end
  object Button2: TButton
    Left = 231
    Top = 8
    Width = 257
    Height = 25
    Caption = 'Exemplo de Filtro Customizado de Pedidos'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 39
    Width = 217
    Height = 23
    TabOrder = 3
    Text = 'ID Anymarket do Pedido Para Detalhes'
  end
  object Button3: TButton
    Left = 231
    Top = 39
    Width = 257
    Height = 25
    Caption = 'Detalhar Pedido do Qual se tem o ID Anymarket'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 68
    Width = 217
    Height = 25
    Caption = 'Buscar Pedidos Pagos'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 231
    Top = 70
    Width = 257
    Height = 25
    Caption = 'Buscar Pedidos Pendentes'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 99
    Width = 217
    Height = 25
    Caption = 'Buscar Pedidos Cancelados'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 231
    Top = 99
    Width = 257
    Height = 25
    Caption = 'Buscar Pedidos Concluidos'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 130
    Width = 217
    Height = 25
    Caption = 'Buscar Pedidos Enviados'
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 231
    Top = 130
    Width = 257
    Height = 25
    Caption = 'Buscar Pedidos Faturados'
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 8
    Top = 190
    Width = 480
    Height = 25
    Caption = 'Atualizar Pedido para Pago'
    TabOrder = 11
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 8
    Top = 221
    Width = 480
    Height = 25
    Caption = 'Atualizar Pedido para Faturado'
    TabOrder = 12
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 8
    Top = 252
    Width = 480
    Height = 25
    Caption = 'Atualizar Pedido para Enviado'
    TabOrder = 13
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 8
    Top = 283
    Width = 480
    Height = 25
    Caption = 'Atualizar Pedido para Concluido'
    TabOrder = 14
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 8
    Top = 314
    Width = 480
    Height = 25
    Caption = 'Atualizar Pedido Para Cancelado'
    TabOrder = 15
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 8
    Top = 345
    Width = 480
    Height = 25
    Caption = 'Enviar XML do Pedido'
    TabOrder = 16
    OnClick = Button15Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 161
    Width = 480
    Height = 23
    TabOrder = 17
    Text = 'ID do Pedido para Atualizar Status'
  end
end
