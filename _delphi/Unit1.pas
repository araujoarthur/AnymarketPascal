unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils,
  Vcl.ComCtrls, scControls, System.JSON;

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
    procedure FormCreate(Sender: TObject);
    procedure edtpartnerIdCAT01Exit(Sender: TObject);
    procedure btnRunCAT01Click(Sender: TObject);
    procedure sctCategoriasEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Anym: TAnymarket;
  CAT01Runs: Integer;

implementation

{$R *.dfm}

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

procedure TForm1.edtpartnerIdCAT01Exit(Sender: TObject);
begin
  if edtpartnerIdCAT01.Text = '' then
    edtpartnerIdCAT01.Text := '-1';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Anym := TAnymarket.Create('SB39983035L39961202E1804795779127C171148377912700O891.I');
  CAT01Runs := 0;
end;

procedure TForm1.sctCategoriasEnter(Sender: TObject);
begin
  memoTestResults.Lines.Add('---- Entrou nos Testes de CATEGORIA ----')
end;

end.
