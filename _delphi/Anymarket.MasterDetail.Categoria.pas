unit Anymarket.MasterDetail.Categoria;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.CustomizeDlg,
  Vcl.StdCtrls,
  Core.Utils,
  Core.UI,
  Anymarket,
  Anymarket.MasterDetail;

type

  TfrmCatMasterDetail = class(TTFormMasterDetail)
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
    procedure LoadPassedData;
    function CheckRequirements: Boolean;
    function CheckExists: Boolean;
  private
    { Private declarations }
    FCategoriesHasBeenLoaded: Boolean;
    FCategoriesArray: TJSONArray;
  public
    { Public declarations }
    destructor Destroy; reintroduce;
  end;

var
  frmCatMasterDetail: TfrmCatMasterDetail;

implementation

{$R *.dfm}
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
  if not CheckExists then
  begin
    if CheckRequirements then
    begin
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
  end else begin
      MessageDlg('Já existe uma categoria ou subcategoria com o mesmo nome.', mtError, [mbOK], 0);
  end;
  
  
end;

procedure TfrmCatMasterDetail.btnCancelCategoryActionClick(Sender: TObject);
begin
  Self.Close;
end;

function TfrmCatMasterDetail.CheckExists: Boolean;
var
  SelectedCategory: TJSONObject;
  AllCategory: TJSONObject;
  CurrentCategoryName: String;
  CategoryFullPath: String;
  FlattenedCategs, CategoryArray: TJSONArray;
begin
  CurrentCategoryName := edtCatName.Text;
  
  if (FMode = mdmEdit) and (FPassedData.GetValue<String>('name') = CurrentCategoryName) then
  begin
    Exit(False);
  end;

  
  if chkIsSubCategory.Checked then
  begin
    SelectedCategory := GetCurrentItemFromComboBox(cbCatParent) as TJSONObject;
    CategoryFullPath := SelectedCategory.GetValue<String>('path') + '/' + CurrentCategoryName;
  end else
  begin
    CategoryFullPath := CurrentCategoryName;
  end;

  Result := FAnymObject.ExisteCategoria(CategoryFullPath); 
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
begin
  if chkIsSubCategory.Checked then
  begin
    cbCatParent.Enabled := True;

    if not FCategoriesHasBeenLoaded then
    begin
      CategoriesObject := FAnymObject.ObterTodasCategorias;

      if (CheckResponseStatus(CategoriesObject)) then
      begin
        FCategoriesArray := CategoriesObject.GetValue<TJSONArray>('data');  // <Generics> may break in Delphi 10
        if PopulateComboBoxWithCategories(cbCatParent, FCategoriesArray) then
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



destructor TfrmCatMasterDetail.Destroy;
begin
  inherited Destroy;
  if Assigned(FCategoriesArray) then
    FCategoriesArray.Free;
end;

procedure TfrmCatMasterDetail.EditCategory(Sender: TObject);
begin
  ShowMessage('Agora está editando');
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
      LoadPassedData();
    end;
  end;

  FCategoriesHasBeenLoaded := False;
end;

procedure TfrmCatMasterDetail.LoadPassedData;
var
  CategoryID: Integer;
  CategoryName: String;
  CategoryParentObject: TJSONObject;
  CategoryParentID: Integer;
  CategorypriceFactor: Integer;
  CategoryPartnerSystemID: Integer;
  CategoryDefinitionPriceScopeString: String;
  CategoryDefinitionPriceScope: TDefinitionPriceScope;
begin
  if Assigned(FPassedData) then
  begin  
    if FPassedData.TryGetValue('id', CategoryID) then
    begin
      edtCatId.Text := IntToStr(CategoryID);
    end;

    if FPassedData.TryGetValue('name', CategoryName) then
    begin
      edtCatName.Text := CategoryName;
    end;
    
    
    
  end else begin
    raise Exception.Create('Não é possível editar categoria em branco.');
  end;
end;

end.
