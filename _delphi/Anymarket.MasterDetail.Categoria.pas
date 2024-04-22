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
  Core.Utils,
  Core.UI,
  Anymarket;

type
  TMasterDetailMode = (mdmCreate, mdmEdit);

  TfrmCatMasterDetail = class(TForm)
    edtCatId: TEdit;
    lblCatId: TLabel;
    edtCatName: TEdit;
    lblCatName: TLabel;
    gpbStaticItems: TGroupBox;
    gpbCategoryInfo: TGroupBox;
    lblMarkupCat: TLabel;
    lblQstMarkMarkup: TLabel;
    edtCatMarkup: TEdit;
    lblIdNoSistemaCat: TLabel;
    edtCatSystemID: TEdit;
    Label1: TLabel;
    cbScopeDP: TComboBox;
    gpbCreateAsSucat: TGroupBox;
    chkIsSubCategory: TCheckBox;
    cbCatParent: TComboBox;
    btnSaveCategory: TButton;
    btnCancelCategoryAction: TButton;
    lblRequired: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure chkIsSubCategoryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelCategoryActionClick(Sender: TObject);
    procedure AddCategory(Sender: TObject);
    procedure EditCategory(Sender: TObject);
    function CheckRequirements: Boolean;
  private
    { Private declarations }
    FAnymObject: TAnymarket;
    FCategoriesHasBeenLoaded: Boolean;
    FPassedData: TJSONObject;
    FMode: TMasterDetailMode;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AAnymObject: TAnymarket; AMode: TMasterDetailMode; AData: TJSONObject = nil); reintroduce;
  end;

var
  frmCatMasterDetail: TfrmCatMasterDetail;

function GetCurrentItemFromComboBox(AComboBox: TComboBox): TObject;

implementation

{$R *.dfm}
{ Loose Functions }

function GetCurrentItemFromComboBox(AComboBox: TComboBox): TObject;
var
  CurrIdx: Integer;
begin
  CurrIdx := AComboBox.ItemIndex;
  Result := AComboBox.Items.Objects[CurrIdx];
end;

{ TfrmCatMasterDetail }

procedure TfrmCatMasterDetail.AddCategory(Sender: TObject);
var
  CreationResult: TJSONObject;
  Category_Name: string;
  Category_PriceFactor: Integer;
  Category_DefinitionScope: TDefinitionPriceScope;
  Category_PartnerID: Integer;
  Category_ParentID: Integer;
begin
  if CheckRequirements then
  begin
    Category_ParentID := -1;
    Category_Name := edtCatName.Text;
    Category_PriceFactor := StrToInt(edtCatMarkup.Text);
    Category_DefinitionScope := (GetCurrentItemFromComboBox(cbScopeDP) as TComboBoxElementDPS).Value;

    if edtCatSystemID.Text <> '' then
    begin
      Category_PartnerID := StrToInt(edtCatSystemID.Text);
    end else
    begin
      Category_PartnerID := -1;
    end;

    if chkIsSubCategory.Checked then // Fluxo de criação da subcategoria
    begin
      Category_ParentID := (GetCurrentItemFromComboBox(cbCatParent) as TJSONObject)
                              .GetValue<Integer>('id');

      CreationResult := FAnymObject.CriarSubcategoria(Category_Name,
                                      Category_PriceFactor,
                                      Category_DefinitionScope,
                                      Category_ParentID,
                                      Category_PartnerID);
    end else
    begin    // Fluxo de criação de uma categoria mãe
      CreationResult := FAnymObject.CriarCategoria(Category_Name,
                                      Category_PriceFactor,
                                      Category_DefinitionScope,
                                      Category_PartnerID);
    end;

    if CheckResponseStatus(CreationResult) then
    begin
      MessageDlg('Categoria Criada com Sucesso!', mtConfirmation, [mbOK], 0);
      ModalResult := 1;
    end else
    begin
      MessageDlg('Não foi possível criar a categoria, erro: ' + CreationResult.GetValue<String>('response_code'), mtError, [mbOK], 0);
      ModalResult := -1;
    end;

  end
  else begin
    MessageDlg('Preencha todos os campos marcados como obrigatórios', mtError, [mbOK], 0);
  end;
end;

procedure TfrmCatMasterDetail.btnCancelCategoryActionClick(Sender: TObject);
begin
  Self.Close;
end;

function TfrmCatMasterDetail.CheckRequirements: Boolean;
begin

  Result := True;

  if edtCatName.Text = '' then
  begin
    Result := False;
  end else if edtCatMarkup.Text = '' then
  begin
    Result := False;
  end
  else if cbScopeDP.ItemIndex = -1 then
  begin
    Result := False;
  end else if (chkIsSubCategory.Checked and (cbCatParent.ItemIndex = -1)) then
  begin
    Result := False;
  end;

end;

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
        if PopulateComboBoxWithCategories(cbCatParent, CategoriesArray) then
        begin
          FCategoriesHasBeenLoaded := True;
        end else
        begin
          MessageDlg('Não foi possível obter lista de categorias', mtError, [mbOK], 0);
          cbCatParent.Enabled := False;
          chkIsSubCategory.Checked := False;
        end;

      end else
      begin
        MessageDlg('Não foi possível obter lista de categorias', mtError, [mbOK], 0);
        cbCatParent.Enabled := False;
        chkIsSubCategory.Checked := False;
      end;

    end;
  end else
  begin
    cbCatParent.Enabled := False;
  end;
end;

constructor TfrmCatMasterDetail.Create(AOwner: TComponent;
  AAnymObject: TAnymarket; AMode: TMasterDetailMode; AData: TJSONObject = nil);
begin
  inherited Create(AOwner);
  FAnymObject := AAnymObject;
  FMode := AMode;

  if AMode = mdmEdit then
  begin
    FPassedData := AData;
  end;
end;

procedure TfrmCatMasterDetail.EditCategory(Sender: TObject);
begin
//to-do
end;

procedure TfrmCatMasterDetail.FormShow(Sender: TObject);
var
  SKUScope, ADScope, CostScope: TComboBoxElementDPS;
begin
  SKUScope := TComboBoxElementDPS.Create(dpsSKU);
  ADScope := TComboBoxElementDPS.Create(dpsSKU_MARKETPLACE);
  CostScope := TComboBoxElementDPS.Create(dpsCOST);

  cbScopeDP.AddItem('Manual via SKU', SKUScope);
  cbScopeDP.AddItem('Manual via Anúncio', ADScope);
  cbScopeDP.AddItem('Automático via mudança de custo', CostScope);

  if FMode = mdmCreate then
  begin
    Self.Caption := 'Adicionando Nova Categoria';
    btnSaveCategory.OnClick := AddCategory;
  end;

  if FMode = mdmEdit then
  begin
    if not Assigned(FPassedData) then
    begin
      ModalResult := -1;
    end else begin
      Self.Caption := 'Modificando Categoria: ' + FPassedData.GetValue<String>('name');
      btnSaveCategory.OnClick := EditCategory;
    end;
  end;

  FCategoriesHasBeenLoaded := False;
end;

end.
