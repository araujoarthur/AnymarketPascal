unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils,
  Vcl.ComCtrls, scControls, System.JSON, Anymarket.MasterDetail.Categoria, Core.UI, Anymarket.MasterDetail,
  Anymarket.Produtos.Builder, Anymarket.Produtos, Anymarket.Produtos.Subtypes;

type
  TForm1 = class(TForm)
    memoTestResults: TMemo;
    pgTests: TscPageControl;
    sctCategorias: TscTabSheet;
    sctMarcas: TscTabSheet;
    sctProdutos: TscTabSheet;
    sctPreco: TscTabSheet;
    sctEstoque: TscTabSheet;
    sctPedidos: TscTabSheet;
    Button1: TButton;
    Button2: TButton;
    btnLoadCategories: TButton;
    btnAddCategory: TButton;
    ComboBox1: TComboBox;
    ListBox1: TListBox;
    btnEditaCategoria: TButton;
    btnRemoverCategoria: TButton;
    Button3: TButton;
    Edit1: TEdit;
    ListBox2: TListBox;
    btnCarregarMarcas: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure sctCategoriasEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CarregarCategoriasButtonEvent(Sender: TObject);
    procedure AdicionarCategoriaButtonEvent(Sender: TObject);
    procedure RemoverCategoriaButtonEvent(Sender: TObject);
    procedure EditarCategoriaButtonEvent(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure CarregarMarcasButtonEvent(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  var obj: TJSONObject := Anym.ObterTodasCategorias;
  var CategoriesArray: TJSONArray := obj.GetValue<TJSONArray>('data');
  memoTestResults.Lines.Add(obj.ToString);
  PopulateComboBoxWithCategories(ComboBox1, CategoriesArray);
end;

procedure TForm1.Button2Click(Sender: TObject);
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
    memoTestResults.Lines.Add(BoolToStr(Anym.ExisteCategoria(Edit1.Text, FlattenCategories(CategoriasArray)), True));
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
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
    btnEditaCategoria.Enabled := True;
    btnRemoverCategoria.Enabled := True;
  end
  else begin
    btnEditaCategoria.Enabled := False;
    btnRemoverCategoria.Enabled := True;
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
    CarregarCategoriasButtonEvent(btnRemoverCategoria as TObject);
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
