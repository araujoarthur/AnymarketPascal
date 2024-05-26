object frmMasterDetailProduto: TfrmMasterDetailProduto
  Left = 0
  Top = 0
  Caption = 'frmMasterDetailProduto'
  ClientHeight = 726
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object gbGeneral: TGroupBox
    Left = 0
    Top = 0
    Width = 1080
    Height = 726
    Align = alClient
    Caption = 'Dados Gerais'
    TabOrder = 0
    ExplicitHeight = 644
    object panelLeftColumn: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 599
      Height = 660
      Align = alLeft
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 619
      object panelLeftTopRow: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 593
        Height = 198
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        object lblDescricaoProduto: TLabel
          Left = 18
          Top = 53
          Width = 117
          Height = 15
          Caption = 'Descri'#231#227'o do Produto:'
        end
        object edtIDAnymarketProduto: TLabeledEdit
          Left = 18
          Top = 21
          Width = 95
          Height = 23
          EditLabel.Width = 92
          EditLabel.Height = 15
          EditLabel.Hint = 'ID do produto na plataforma Anymarket'
          EditLabel.Caption = 'ID no Anymarket:'
          ReadOnly = True
          TabOrder = 0
          Text = ''
        end
        object edtIDExternoProduto: TLabeledEdit
          Left = 501
          Top = 21
          Width = 84
          Height = 23
          EditLabel.Width = 57
          EditLabel.Height = 15
          EditLabel.Hint = 'Titulo de Exibi'#231#227'o do Produto'
          EditLabel.Caption = 'ID Externo:'
          TabOrder = 1
          Text = ''
        end
        object edtTituloProduto: TLabeledEdit
          Left = 135
          Top = 21
          Width = 354
          Height = 23
          EditLabel.Width = 96
          EditLabel.Height = 15
          EditLabel.Hint = 'Titulo de Exibi'#231#227'o do Produto'
          EditLabel.Caption = 'Titulo do Produto:'
          ImeName = 'Portuguese (Brazilian ABNT)'
          TabOrder = 2
          Text = ''
        end
        object memoDescricaoProduto: TMemo
          Left = 18
          Top = 74
          Width = 567
          Height = 57
          MaxLength = 10000
          TabOrder = 3
        end
        object chkAllowAutomaticSKUMarketplaceCreation: TCheckBox
          Left = 18
          Top = 171
          Width = 461
          Height = 17
          Caption = 
            'Permitir a cria'#231#227'o de anuncios automaticos baseado na configura'#231 +
            'ao da categoria'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object chkIsActiveProduct: TCheckBox
          Left = 18
          Top = 148
          Width = 99
          Height = 17
          Caption = 'Produto Ativo'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 207
        Width = 593
        Height = 450
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object gbDetails: TGroupBox
          Left = 0
          Top = 0
          Width = 593
          Height = 169
          Align = alTop
          Caption = 'Detalhes'
          TabOrder = 0
          object lblCategoriaObj: TLabel
            Left = 10
            Top = 21
            Width = 54
            Height = 15
            Caption = 'Categoria:'
          end
          object lblMarcaObj: TLabel
            Left = 242
            Top = 21
            Width = 36
            Height = 15
            Caption = 'Marca:'
          end
          object lblNCMProduto: TLabel
            Left = 384
            Top = 21
            Width = 73
            Height = 15
            Hint = 'Nomenclatura Comum do Mercosul'
            Caption = 'C'#243'digo NCM:'
          end
          object lblOrigemProduto: TLabel
            Left = 12
            Top = 71
            Width = 43
            Height = 15
            Hint = 'Origem de Acordo com COMEX.'
            Caption = 'Origem:'
          end
          object lblModeloProduto: TLabel
            Left = 10
            Top = 119
            Width = 107
            Height = 15
            Hint = 'Pode ser obrigat'#243'rio para algumas plataformas.'
            Caption = 'Modelo do Produto:'
          end
          object lblTipoProduto: TLabel
            Left = 242
            Top = 119
            Width = 89
            Height = 15
            Hint = 'Pode ser obrigat'#243'rio para algumas plataformas.'
            Caption = 'Tipo do Produto:'
          end
          object lblGeneroProduto: TLabel
            Left = 402
            Top = 119
            Width = 41
            Height = 15
            Caption = 'G'#234'nero:'
          end
          object cbCategoriaProduto: TComboBox
            Left = 10
            Top = 40
            Width = 207
            Height = 23
            TabOrder = 0
          end
          object cbMarcaProduto: TComboBox
            Left = 242
            Top = 40
            Width = 119
            Height = 23
            TabOrder = 1
          end
          object edtNCMProduto: TEdit
            Left = 384
            Top = 40
            Width = 201
            Height = 23
            TabOrder = 2
          end
          object cbOrigemProduto: TComboBox
            Left = 10
            Top = 89
            Width = 575
            Height = 22
            AutoDropDownWidth = True
            Style = csOwnerDrawVariable
            TabOrder = 3
            Items.Strings = (
              'Nacional'
              'Estrangeira - Importa'#231#227'o Direta'
              'Estrangeira - Adquirida no mercado Interno'
              
                'Nacional - Mercadoria ou bem com Conte'#250'do de Importa'#231#227'o superior' +
                ' a 40%'
              
                'Nacional - Mercadoria cuja produ'#231#227'o tenha sido feita em conformi' +
                'dade com os processos produtivos b'#225'sicos de que tratam as legisl' +
                'a'#231#245'es citadas nos Ajustes'
              
                'Nacional - Mercadoria ou bem com Conte'#250'do de Importa'#231#227'o inferior' +
                ' ou igual a 40%'
              
                'Estrangeira - Importa'#231#227'o direta, sem similar nacional, constante' +
                ' em lista da CAMEX'
              
                'Estrangeira - Adquirida no mercado interno, sem similar nacional' +
                ', constante em lista da CAMEX')
          end
          object edtModeloProduto: TEdit
            Left = 10
            Top = 138
            Width = 207
            Height = 23
            ImeName = 'Portuguese (Brazilian ABNT)'
            TabOrder = 4
          end
          object edtTipoProduto: TEdit
            Left = 242
            Top = 138
            Width = 135
            Height = 23
            ImeName = 'Portuguese (Brazilian ABNT)'
            TabOrder = 5
          end
          object cbGeneroProduto: TComboBox
            Left = 402
            Top = 138
            Width = 183
            Height = 23
            TabOrder = 6
            Items.Strings = (
              'Masculino'
              'Feminino'
              'Masculino Infantil'
              'Feminino Infantil'
              'Unissex'
              'Rec'#233'm Nascido'
              'Unissex Infantil')
          end
        end
        object gpWarranty: TGroupBox
          Left = 0
          Top = 187
          Width = 593
          Height = 158
          Align = alBottom
          Caption = 'Garantia'
          TabOrder = 1
          ExplicitTop = 208
          object lblWarrantyText: TLabel
            Left = 193
            Top = 22
            Width = 114
            Height = 15
            Caption = 'Descri'#231#227'o da Garantia'
          end
          object lblWarrantyTimeDesc: TLabel
            Left = 119
            Top = 48
            Width = 24
            Height = 15
            Caption = 'dias.'
          end
          object LabeledEdit1: TLabeledEdit
            Left = 12
            Top = 40
            Width = 101
            Height = 23
            EditLabel.Width = 102
            EditLabel.Height = 15
            EditLabel.Caption = 'Tempo da Garantia:'
            NumbersOnly = True
            TabOrder = 0
            Text = ''
          end
          object memoWarrantyText: TMemo
            Left = 192
            Top = 39
            Width = 393
            Height = 90
            TabOrder = 1
          end
        end
        object gbDimensions: TGroupBox
          Left = 0
          Top = 345
          Width = 593
          Height = 105
          Align = alBottom
          Caption = 'Dimens'#245'es'
          TabOrder = 2
          ExplicitTop = 328
          object Label1: TLabel
            Left = 136
            Top = 64
            Width = 17
            Height = 15
            Caption = 'cm'
          end
          object Label2: TLabel
            Left = 354
            Top = 64
            Width = 17
            Height = 15
            Caption = 'cm'
          end
          object Label3: TLabel
            Left = 563
            Top = 64
            Width = 17
            Height = 15
            Caption = 'cm'
          end
          object edtHeight: TLabeledEdit
            Left = 12
            Top = 56
            Width = 121
            Height = 23
            EditLabel.Width = 32
            EditLabel.Height = 15
            EditLabel.Caption = 'Altura'
            NumbersOnly = True
            TabOrder = 0
            Text = ''
          end
          object edtLength: TLabeledEdit
            Left = 440
            Top = 56
            Width = 121
            Height = 23
            EditLabel.Width = 75
            EditLabel.Height = 15
            EditLabel.Caption = 'Comprimento'
            NumbersOnly = True
            TabOrder = 1
            Text = ''
          end
          object edtWidth: TLabeledEdit
            Left = 230
            Top = 56
            Width = 121
            Height = 23
            EditLabel.Width = 40
            EditLabel.Height = 15
            EditLabel.Caption = 'Largura'
            NumbersOnly = True
            TabOrder = 2
            Text = ''
          end
        end
      end
    end
    object panelBottomMenu: TPanel
      Left = 2
      Top = 683
      Width = 1076
      Height = 41
      Align = alBottom
      BevelEdges = []
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitLeft = 904
      ExplicitTop = 680
      ExplicitWidth = 185
    end
    object panelRightColumn: TPanel
      Left = 607
      Top = 17
      Width = 471
      Height = 666
      Align = alRight
      BevelEdges = []
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 2
      object pgTabularData: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 465
        Height = 656
        Margins.Top = 5
        Margins.Bottom = 5
        ActivePage = tsSKUS
        Align = alClient
        TabOrder = 0
        object tsAnymarket: TTabSheet
          Caption = 'Anymarket'
          object Label4: TLabel
            Left = 161
            Top = 7
            Width = 157
            Height = 15
            Caption = 'Escopo de Defini'#231#227'o do Pre'#231'o'
          end
          object LabeledEdit2: TLabeledEdit
            Left = 11
            Top = 25
            Width = 121
            Height = 23
            EditLabel.Width = 44
            EditLabel.Height = 15
            EditLabel.Caption = 'Markup:'
            TabOrder = 0
            Text = ''
          end
          object cbDefinitionPriceScope: TComboBox
            Left = 161
            Top = 25
            Width = 161
            Height = 23
            TabOrder = 1
            Text = 'Selecionar'
          end
          object CheckBox1: TCheckBox
            Left = 344
            Top = 28
            Width = 110
            Height = 17
            Caption = 'Utilizar Markup'
            TabOrder = 2
          end
        end
        object pgMedia: TTabSheet
          Caption = 'Midia'
          ImageIndex = 1
          object gbImagens: TGroupBox
            Left = 0
            Top = 0
            Width = 457
            Height = 193
            Align = alTop
            Caption = 'Imagens'
            TabOrder = 0
            object btnUrlRemove: TButton
              Left = 379
              Top = 35
              Width = 75
              Height = 25
              Caption = 'Remover'
              DisabledImageName = 'btnRemoveImageURL'
              TabOrder = 0
            end
            object ListBox1: TListBox
              Left = 3
              Top = 80
              Width = 451
              Height = 97
              ItemHeight = 15
              TabOrder = 1
            end
            object edtImageUrl: TLabeledEdit
              Left = 3
              Top = 37
              Width = 278
              Height = 23
              EditLabel.Width = 84
              EditLabel.Height = 15
              EditLabel.Caption = 'URL da Imagem'
              TabOrder = 2
              Text = ''
            end
            object btnAddImageURL: TButton
              Left = 298
              Top = 35
              Width = 75
              Height = 25
              Caption = 'Adicionar'
              TabOrder = 3
            end
          end
          object gbVideo: TGroupBox
            Left = 0
            Top = 193
            Width = 457
            Height = 72
            Align = alTop
            Caption = 'Video'
            TabOrder = 1
            object edtVideoURL: TLabeledEdit
              Left = 16
              Top = 36
              Width = 425
              Height = 23
              EditLabel.Width = 74
              EditLabel.Height = 15
              EditLabel.Caption = 'URL do Video:'
              TabOrder = 0
              Text = ''
            end
          end
        end
        object tsCharacteristics: TTabSheet
          Caption = 'Caracter'#237'sticas'
          ImageIndex = 2
        end
        object tsSKUS: TTabSheet
          Caption = 'SKUS'
          ImageIndex = 3
        end
      end
    end
  end
end
