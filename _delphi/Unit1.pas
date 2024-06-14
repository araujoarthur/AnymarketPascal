unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.IOUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils,
  Vcl.ComCtrls, scControls, System.JSON, Anymarket.MasterDetail.Categoria, Core.UI, Anymarket.MasterDetail,
  Anymarket.Produtos.Builder, Anymarket.Produtos, Anymarket.Produtos.Subtypes, Anymarket.MasterDetail.Produto, Anymarket.Bridge.Types;

type
  TForm1 = class(TForm)
    memoTestResults: TMemo;
    Button1: TButton;
    categoryObtainCategoryToMemo: TButton;
    categoryLoadCategories: TButton;
    categoryAddCategory: TButton;
    categoryCategorias: TComboBox;
    ListBox1: TListBox;
    categoryEditaCategoria: TButton;
    categoryRemoverCategoria: TButton;
    Button3: TButton;
    productsSearchableProduct: TEdit;
    productsTestBuilderAndSerializer: TButton;
    Button5: TButton;
    Button6: TButton;
    utilsCapitalizableEdit: TEdit;
    modalsOpenProductModal: TButton;
    feedTestObtaining: TButton;
    ordersFiltrarPedidos: TButton;
    ordersObterPedidos: TButton;
    ordersNextPage: TButton;
    ordersUpdateOrderId: TEdit;
    ordersAtualizaPago: TButton;
    ordersAtualizaFaturado: TButton;
    ordersAtualizaEnviado: TButton;
    ordersAtualizaCancelado: TButton;
    Button4: TButton;
    Button7: TButton;
    Button8: TButton;
    ordersDetalhesPedido: TButton;
    Button2: TButton;
    ordersAtualizaConcluido: TButton;
    Button9: TButton;
    Button10: TButton;
    odersEnviaXML: TButton;
    FileOpenDialog1: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure sctCategoriasEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure categoryObtainCategoryToMemoClick(Sender: TObject);
    procedure CarregarCategoriasButtonEvent(Sender: TObject);
    procedure AdicionarCategoriaButtonEvent(Sender: TObject);
    procedure RemoverCategoriaButtonEvent(Sender: TObject);
    procedure EditarCategoriaButtonEvent(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure CarregarMarcasButtonEvent(Sender: TObject);
    procedure productsTestBuilderAndSerializerClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure modalsOpenProductModalClick(Sender: TObject);
    procedure feedTestObtainingClick(Sender: TObject);
    procedure ordersFiltrarPedidosClick(Sender: TObject);
    procedure ordersObterPedidosClick(Sender: TObject);
    procedure ordersNextPageClick(Sender: TObject);
    procedure ordersAtualizaPagoClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ordersDetalhesPedidoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ordersAtualizaCanceladoClick(Sender: TObject);
    procedure ordersAtualizaEnviadoClick(Sender: TObject);
    procedure ordersAtualizaConcluidoClick(Sender: TObject);
    procedure ordersAtualizaFaturadoClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure odersEnviaXMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Anym: TAnymarket;
  CAT01Runs: Integer;
  countercbx: Integer;
  Pedidos: TAnymarket.TAnymarketPaginateResponse;

implementation

{$R *.dfm}

procedure TForm1.CarregarCategoriasButtonEvent(Sender: TObject);
var
  CategoriasObject: TJSONObject;
  CategoriasArray: TJSONArray;
begin
  CategoriasObject := Anym.ObterTodasCategorias;
  ListBox1.Items.Clear;
  if CheckResponseStatus(CategoriasObject) then               // isso tudo pode ser encapsulado em um metodo TRYGETRESPONSEDATA
  begin
    CategoriasArray := CategoriasObject.GetValue<TJSONArray>('data');
    PopulateListBoxWithCategories(ListBox1, CategoriasArray);
    memoTestResults.Lines.Add(CategoriasArray.ToString);
  end;
end;

procedure TForm1.CarregarMarcasButtonEvent(Sender: TObject);
var
  MarcasElement: TJSONObject;
begin
  MarcasElement := Anym.ObterTodasMarcas;
  if CheckResponseStatusNonStrict(MarcasElement) then
  begin
    memoTestResults.Lines.Add(MarcasElement.ToString);
  end;
end;

procedure TForm1.ordersObterPedidosClick(Sender: TObject);
begin
  Pedidos := Anym.FiltrarPedidosPaginado();
  memoTestResults.Lines.Add(Pedidos.RawResult.ToString);
  ordersNextPage.Enabled := True;
end;

procedure TForm1.ordersNextPageClick(Sender: TObject);
begin
  Pedidos.NextPage;
  memoTestResults.Lines.Add(Pedidos.RawResult.ToString);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('---------- IMPORTAÇÃO DE PEDIDOS ENVIADOS');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add(Anym.ObterPedidosEnviados().ToString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  var obj: TJSONObject := Anym.ObterTodasCategorias;
  var CategoriesArray: TJSONArray := obj.GetValue<TJSONArray>('data');
  memoTestResults.Lines.Add(obj.ToString);
  PopulateComboBoxWithCategories(categoryCategorias, CategoriesArray);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MemoTestResults.Lines.Clear;
end;

procedure TForm1.categoryObtainCategoryToMemoClick(Sender: TObject);
var
  CategoriasObject: TJSONObject;
  CategoriasArray: TJSONArray;
  CatVal: TJSONValue;
begin
  CategoriasObject := Anym.ObterTodasCategorias;
  if CheckResponseStatus(CategoriasObject) then               // isso tudo pode ser encapsulado em um metodo TRYGETRESPONSEDATA
  begin
    CategoriasArray := CategoriasObject.GetValue<TJSONArray>('data');
    for CatVal in FlattenCategories(CategoriasArray) do
    begin
      memoTestResults.Lines.Add(CatVal.ToString);
    end;
    
  end;
end;



procedure TForm1.Button3Click(Sender: TObject);
var
  CategoriasObject: TJSONObject;
  CategoriasArray: TJSONArray;
  // CatVal: TJSONValue;
begin
  CategoriasObject := Anym.ObterTodasCategorias;
  if CheckResponseStatus(CategoriasObject) then               // isso tudo pode ser encapsulado em um metodo TRYGETRESPONSEDATA
  begin
    CategoriasArray := CategoriasObject.GetValue<TJSONArray>('data');
    memoTestResults.Lines.Add(BoolToStr(Anym.ExisteCategoria(productsSearchableProduct.Text, FlattenCategories(CategoriasArray)), True));
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('---------- IMPORTAÇÃO DE PEDIDOS CANCELADOS');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add(Anym.ObterPedidosCancelados().ToString);
end;

procedure TForm1.productsTestBuilderAndSerializerClick(Sender: TObject);
var
  ProdutoBuilder: IProdutoAnymarketBuilder;
  Produto: TProdutoAnymarket;
begin
  ProdutoBuilder := TProdutoAnymarketBuilder.Create();
  Produto := ProdutoBuilder
                            .SetID(9)
                            .SetTitle('Foo')
                            .SetDescription('Foo Bar')
                            .SetCategoryID(98382)
                            .Build();

  memoTestResults.Lines.Add(Produto.SerializeObject.ToString);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Charact1, Charact2, Charact3: TCharacteristic;
  CharactArr: TWrapperArray<TCharacteristic>;
  Itm: TCharacteristic;
begin
  Charact1 := TCharacteristic.Create('CARACT', 'Primeira');
  Charact2 := TCharacteristic.Create('CARACTE', 'Segunda');
  Charact3 := TCharacteristic.Create('CARACTER', 'Terceira');

  CharactArr := TWrapperArray<TCharacteristic>.Create;
  CharactArr.AddItem(Charact1);
  CharactArr.AddItem(Charact2);
  CharactArr.AddItem(Charact3);

  for Itm in CharactArr do
  begin
    memoTestResults.Lines.Add(Itm.SerializeToJSON.ToString)
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  utilsCapitalizableEdit.Text := CapitalizeFirstLetter(utilsCapitalizableEdit.Text);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('---------- IMPORTAÇÃO DE PEDIDOS PENDENTES');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add(Anym.ObterPedidosPendentes().ToString);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('---------- IMPORTAÇÃO DE PEDIDOS PAGOS');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add(Anym.ObterPedidosPagos().ToString);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add('---------- IMPORTAÇÃO DE PEDIDOS CONCLUIDOS');
  MemoTestResults.Lines.Add('');
  MemoTestResults.Lines.Add(Anym.ObterPedidosConcluidos().ToString);
end;

procedure TForm1.modalsOpenProductModalClick(Sender: TObject);
var
  Ext: TfrmMasterDetailProduto;
begin
  Ext := TfrmMasterDetailProduto.Create(Self, Anym, mdmCreate);
  Ext.ShowModal;
end;

procedure TForm1.feedTestObtainingClick(Sender: TObject);
begin
  MemoTestResults.Lines.Add(Anym.ObterFeed().ToString);
end;

procedure TForm1.odersEnviaXMLClick(Sender: TObject);
var
  fd: TFileOpenDialog;
  XMLTxt: TStringList;
begin
  fd := TFileOpenDialog.Create(Self);
  try
    fd.DefaultFolder := TPath.GetDownloadsPath;
    if fd.Execute then
    begin
      XMLTxt := TStringList.Create;
      try
        XMLTxt.LoadFromFile(fd.FileName);
        MemoTestResults.Lines.Add(Anym.EnviarXMLNotaFiscal(StrToInt(ordersUpdateOrderId.Text), XMLTxt.Text).ToString);
      finally
        XMLTxt.Free;
      end;
    end else
    begin
      ShowMessage('Cancelou');
    end;
  finally
    fd.Free;
  end;

end;

procedure TForm1.ordersAtualizaCanceladoClick(Sender: TObject);
begin
  Anym.AtualizarPedidoCancelado(StrToInt(ordersUpdateOrderId.Text), 'nn');
end;

procedure TForm1.ordersAtualizaConcluidoClick(Sender: TObject);
begin
  MemoTestResults.Lines.Add(Anym.AtualizarPedidoConcluido(StrToInt(ordersUpdateOrderId.Text), Now).ToString);
end;

procedure TForm1.ordersAtualizaEnviadoClick(Sender: TObject);
var
  Track: TNewTracking;
begin
  Track := TNewTracking.Create;
  Track.SetNumber('AB00000009BR'); //462151
  Track.SetCarrier('PlaceHolder');
  Track.SetShippedDate(Now);
  memoTestResults.Lines.Add(Anym.AtualizarPedidoEnviado(StrToInt(ordersUpdateOrderId.Text), Track).ToString);
end;

procedure TForm1.ordersAtualizaFaturadoClick(Sender: TObject);
var
  SimpleInvoice: TNewInvoice;
begin
  SimpleInvoice := TNewInvoice.Create;
  SimpleInvoice.SetAccessKey('35240512345678000195551234567890123456789123');     //462355
  SimpleInvoice.SetDate(Now);
  MemoTestResults.Lines.Add(Anym.AtualizarPedidoFaturado(StrToInt(ordersUpdateOrderId.Text), SimpleInvoice).ToString)
end;

procedure TForm1.ordersAtualizaPagoClick(Sender: TObject);
begin
  Anym.AtualizarPedidoPago(StrToInt(ordersUpdateOrderId.Text));
end;

procedure TForm1.ordersDetalhesPedidoClick(Sender: TObject);
begin
 MemoTestResults.Lines.Add('');
 MemoTestResults.Lines.Add('');
 MemoTestResults.Lines.Add('-------------- DETALHES DO PEDIDO: '+ordersUpdateOrderId.Text);
 MemoTestResults.Lines.Add(Anym.DetalhesPedido(StrToInt(ordersUpdateOrderId.Text)).ToString);

end;

procedure TForm1.ordersFiltrarPedidosClick(Sender: TObject);
begin
  memoTestResults.Lines.Add(Anym.FiltrarPedidos().ToString);
end;

procedure TForm1.EditarCategoriaButtonEvent(Sender: TObject);
var
  ExtractedCategoryData: TJSONObject;
  MasterDetailEditMode: TfrmCatMasterDetail;
begin
  ExtractedCategoryData := ExtractListBox(ListBox1) as TJSONObject;
  memoTestResults.Lines.Add(ExtractedCategoryData.ToString);
  MasterDetailEditMode := TfrmCatMasterDetail.Create(Self, Anym, mdmEdit, ExtractedCategoryData);
  try
    MasterDetailEditMode.ShowModal;
  finally
    MasterDetailEditMode.Free;
  end;
end;

procedure TForm1.AdicionarCategoriaButtonEvent(Sender: TObject);
var newform: TfrmCatMasterDetail;
begin
  newform := TfrmCatMasterDetail.Create(Self, Anym, mdmCreate);
  try
    newform.ShowModal;
  finally
    newForm.Free;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  countercbx := 0;
  Anym := TAnymarket.Create('SB39983035L39961304E1805917634087C171260563408700O891.I');
  CAT01Runs := 0;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    categoryEditaCategoria.Enabled := True;
    categoryEditaCategoria.Enabled := True;
  end
  else begin
    categoryEditaCategoria.Enabled := False;
    categoryRemoverCategoria.Enabled := True;
  end;
end;

procedure TForm1.RemoverCategoriaButtonEvent(Sender: TObject);
var
  CategoryObject: TJSONObject;
  ExclusionResult: TJSONObject;
  DataObject: TJSONObject;
  ErrorMessage: String;
begin
  CategoryObject := ExtractListBox(ListBox1) as TJSONObject;

  if MessageDlg('Tem certeza que deseja remover a categoria "'+CategoryObject.GetValue<string>('name')+'"?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    Exit;


  ExclusionResult := Anym.ExcluirCategoria(CategoryObject.GetValue<Integer>('id'));

  if CheckResponseStatusNonStrict(ExclusionResult) then
  begin
    ShowMessage('Categoria Excluida!');
    CarregarCategoriasButtonEvent(categoryRemoverCategoria as TObject);
  end else
  begin
    if ExclusionResult.TryGetValue('data', DataObject) and DataObject.TryGetValue('message', ErrorMessage) then
    begin
      MessageDlg('Não foi possível remover categoria: ' + ErrorMessage, mtError, [mbOK], 0);
    end else
    begin
      MessageDlg('Não foi possível remover categoria.', mtError, [mbOK], 0);
    end;
  end;

end;

procedure TForm1.sctCategoriasEnter(Sender: TObject);
begin
  memoTestResults.Lines.Add('---- Entrou nos Testes de CATEGORIA ----')
end;

end.
