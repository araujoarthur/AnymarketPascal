unit Anymarket.MasterDetail.Categoria;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.CustomizeDlg,
  Vcl.StdCtrls,
  Core.Utils, Anymarket;

type
  TfrmCatMasterDetail = class(TForm)
    edtCatId: TEdit;
    lblCatId: TLabel;
    edtCatName: TEdit;
    lblCatName: TLabel;
    Edit3: TEdit;
    gpbStaticItems: TGroupBox;
    gpbCategoryInfo: TGroupBox;
    lblMarkupCat: TLabel;
    lblQstMarkMarkup: TLabel;
    edtMarkupCat: TEdit;
    lblIdNoSistemaCat: TLabel;
    edtCatSystemID: TEdit;
    Label1: TLabel;
    cbScopeDP: TComboBox;
    gpbCreateAsSucat: TGroupBox;
    chkIsSubCategory: TCheckBox;
    cbCatParent: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure chkIsSubCategoryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FAnymObject: TAnymarket;
    FCategoriesHasBeenLoaded: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AAnymObject: TAnymarket); reintroduce;
  end;

var
  frmCatMasterDetail: TfrmCatMasterDetail;

implementation

{$R *.dfm}

procedure TfrmCatMasterDetail.chkIsSubCategoryClick(Sender: TObject);
var
  CategoriesObject: TJSONObject;
  CategoriesArray: TJSONArray;
  Value: TJSONValue;
  ValueObject: TJSONObject;
begin
  if chkIsSubCategory.Checked then
  begin
    cbCatParent.Enabled := True;

    if not FCategoriesHasBeenLoaded then
    begin
      CategoriesObject := FAnymObject.ObterTodasCategorias;

      if (CheckResponseStatus(CategoriesObject)) then
      begin
        CategoriesArray := CategoriesObject.GetValue<TJSONArray>('data');  // <Generics> may break in Delphi 10
        for Value in CategoriesArray do
        begin
          ValueObject := Value as TJSONObject;
          cbCatParent.AddItem(ValueObject.GetValue<String>('name'), ValueObject);
        end;
        FCategoriesHasBeenLoaded := True;
      end else
      begin
        MessageDlg('Não foi possível obter lista de categorias', mtError, [mbOK], 0);
        cbCatParent.Enabled := False;
      end;

    end;
  end else
  begin
    cbCatParent.Enabled := False;
  end;
end;

constructor TfrmCatMasterDetail.Create(AOwner: TComponent;
  AAnymObject: TAnymarket);
begin
  inherited Create(AOwner);
  FAnymObject := AAnymObject;
end;

procedure TfrmCatMasterDetail.FormCreate(Sender: TObject);
var
  SKUScope, ADScope, CostScope: TComboBoxElementDPS;
begin
  SKUScope := TComboBoxElementDPS.Create(dpsSKU);
  ADScope := TComboBoxElementDPS.Create(dpsSKU_MARKETPLACE);
  CostScope := TComboBoxElementDPS.Create(dpsCOST);

  cbScopeDP.AddItem('Manual via SKU', SKUScope);
  cbScopeDP.AddItem('Manual via Anúncio', ADScope);
  cbScopeDP.AddItem('Automático via mudança de custo', CostScope);
end;

procedure TfrmCatMasterDetail.FormShow(Sender: TObject);
begin
  FCategoriesHasBeenLoaded := False;
end;

end.
