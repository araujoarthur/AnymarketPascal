unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils,
  Vcl.ComCtrls, scControls, System.JSON, Anymarket.MasterDetail.Categoria, Core.UI;

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
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    TreeView1: TTreeView;
    btnLoadCategories: TButton;
    edtAddCategory: TButton;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtpartnerIdCAT01Exit(Sender: TObject);
    procedure btnRunCAT01Click(Sender: TObject);
    procedure sctCategoriasEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnLoadCategoriesClick(Sender: TObject);
    procedure edtAddCategoryClick(Sender: TObject);
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

procedure TForm1.btnLoadCategoriesClick(Sender: TObject);
var
  CategoriasObject: TJSONObject;
  CategoriasArray: TJSONArray;
begin
  CategoriasObject := Anym.ObterTodasCategorias;

  if CheckResponseStatus(CategoriasObject) then               // isso tudo pode ser encapsulado em um metodo TRYGETRESPONSEDATA
  begin
    CategoriasArray := CategoriasObject.GetValue<TJSONArray>('data');
    memoTestResults.Lines.Add(CategoriasArray.ToString);
  end;
end;

procedure TForm1.btnRunCAT01Click(Sender: TObject);
var
  catName: string;
  catMarkup: Integer;
  catPriceScope: string;
  catPartnerID: Integer;
  ReqRes: TJSONObject;
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

  ReqRes := Anym.CriarCategoria(catName, catMarkup, DPSPointStringToEnum(catPriceScope), catPartnerID);

  memoTestResults.Lines.Add('CAT-01 RUN ' + IntToStr(CAT01Runs) + ' RESULT: ');
  memoTestResults.Lines.Add('');
  memoTestResults.Lines.Add(ReqRes.ToString);
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
var newform: TfrmCatMasterDetail;
begin
  newform := TfrmCatMasterDetail.Create(Self, Anym, mdmCreate);
  newform.Show;
end;



procedure TForm1.edtAddCategoryClick(Sender: TObject);
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

procedure TForm1.sctCategoriasEnter(Sender: TObject);
begin
  memoTestResults.Lines.Add('---- Entrou nos Testes de CATEGORIA ----')
end;

end.
