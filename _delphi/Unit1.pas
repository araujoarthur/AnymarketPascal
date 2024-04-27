unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils,
  Vcl.ComCtrls, scControls, System.JSON, Anymarket.MasterDetail.Categoria, Core.UI, Anymarket.MasterDetail;

type
  TForm1 = class(TForm)
    memoTestResults: TMemo;
    pgTests: TscPageControl;
    sctCategorias: TscTabSheet;
    gpbCAT01: TGroupBox;
    edtCategoryNameCAT01: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtMarkupCAT01: TEdit;
    BalloonHint1: TBalloonHint;
    Label3: TLabel;
    cbdefinitionPriceScopeCAT01: TComboBox;
    Label4: TLabel;
    edtpartnerIdCAT01: TEdit;
    btnRunCAT01: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure edtpartnerIdCAT01Exit(Sender: TObject);
    procedure btnRunCAT01Click(Sender: TObject);
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

uses Anymarket.Produtos;

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

procedure TForm1.btnRunCAT01Click(Sender: TObject);
var
  catName: string;
  catMarkup: Integer;
  catPriceScope: string;
  catPartnerID: Integer;
//  ReqRes: TJSONObject;
begin
  catName := edtCategoryNameCAT01.Text;
  catMarkup := StrToInt(edtMarkupCAT01.Text);
  catPriceScope := cbdefinitionPriceScopeCAT01.Items[cbdefinitionPriceScopeCAT01.ItemIndex];
  catPartnerID := StrToInt(edtpartnerIdCAT01.Text);

  CAT01Runs := CAT01Runs + 1;
  memoTestResults.Lines.Add('');
  memoTestResults.Lines.Add('CAT-01 Runs: ' + IntToStr(CAT01Runs));
  memoTestResults.Lines.Add('   PARAMETROS:');
  memoTestResults.Lines.Add('       name: ' + catName);
  memoTestResults.Lines.Add('       priceFactor: ' + IntToStr(catMarkup));
  memoTestResults.Lines.Add('       definitionPriceScope: ' + catPriceScope);
  memoTestResults.Lines.Add('       partnerId: ' + IntToStr(catPartnerID));
  memoTestResults.Lines.Add('');

  //ReqRes := Anym.CriarCategoria(catName, catMarkup, DPSPointStringToEnum(catPriceScope), catPartnerID);

  memoTestResults.Lines.Add('CAT-01 RUN ' + IntToStr(CAT01Runs) + ' RESULT: ');
  memoTestResults.Lines.Add('');
  //memoTestResults.Lines.Add(ReqRes.ToString);
  memoTestResults.Lines.Add('');
  memoTestResults.Lines.Add('CAT-01 RUN ' + IntToStr(CAT01Runs) + ' FINISHED.');
  memoTestResults.Lines.Add('');
  memoTestResults.Lines.Add('');

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
begin
  TProdutoAnymarket.Create();
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

procedure TForm1.edtpartnerIdCAT01Exit(Sender: TObject);
begin
  if edtpartnerIdCAT01.Text = '' then
    edtpartnerIdCAT01.Text := '-1';
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
