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
    function BuildUpObject: TJSONObject;
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
  Category_DefinitionScope: String;
  Category_PartnerID: Integer;
  Category_ParentID: Integer;
  ErrorData: TJSONObject;
  ErrorMessage: String;
begin
  if not CheckExists then
  begin
    if CheckRequirements then
    begin
      Category_Name := edtCatName.Text;
      Category_PriceFactor := StrToInt(edtCatMarkup.Text);
      {Category_DefinitionScope := (GetCurrentItemFromComboBox(cbScopeDP) as TComboBoxElementDPS).Value;}
      Category_DefinitionScope := ExtractPriceScope(cbScopeDP);

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

        ErrorMessage := '...';
        if CreationResult.TryGetValue('data', ErrorData) then
        begin
          try
            ErrorData.TryGetValue('message', ErrorMessage);
          finally
            ErrorData.Free;
          end;
        end;

        MessageDlg('Não foi possível criar a categoria, erro: ' + CreationResult.GetValue<String>('response_code') + ' - ' + ErrorMessage, mtError, [mbOK], 0);
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

function TfrmCatMasterDetail.BuildUpObject: TJSONObject;
var
  CategoryParent: TJSONObject;
  CategoryParentNew: TJSONObject;
begin
  Result := TJSONObject.Create;

  if edtCatID.Text <> '' then
    Result.AddPair('id', TJSONNumber.Create(StrToInt(edtCatId.Text)));

  Result.AddPair('name', TJSONString.Create(edtCatName.Text));
  Result.AddPair('priceFactor', TJSONNumber.Create(StrToInt(edtCatMarkup.Text)));

  if edtCatSystemID.Text <> '' then
    Result.AddPair('partnerId', TJSONString.Create(edtCatSystemID.Text));

  Result.AddPair('definitionPriceScope', TJSONString.Create(ExtractPriceScope(cbScopeDP)));

  if chkIsSubCategory.Checked and (cbCatParent.ItemIndex <> -1) then
  begin
    CategoryParent := ExtractComboBox(cbCatParent) as TJSONObject;
    try
      CategoryParentNew := TJSONObject.Create;
      CategoryParentNew.AddPair('id', TJSONNumber.Create(CategoryParent.GetValue<Integer>('id')));
      Result.AddPair('parent', CategoryParentNew as TJSONValue);
    finally
      CategoryParent.Free;
    end;
  end;  
end;

function TfrmCatMasterDetail.CheckExists: Boolean;
var
  SelectedCategory: TJSONObject;
  AllCategory: TJSONObject;
  CurrentCategoryName: String;
  CategoryFullPath: String;
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
var
  ACreationBody: TJSONObject;
  EditingResult: TJSONObject;
begin
  if not CheckExists then
  begin
    if CheckRequirements then
    begin
      ACreationBody := BuildUpObject;
      EditingResult := FAnymObject.AlterarCategoria(StrToInt(edtCatID.Text), ACreationBody);
      if CheckResponseStatusNonStrict(EditingResult) then
      begin
        MessageDlg('As edições foram salvas com sucesso.', mtInformation, [mbOK], 0);
        ModalResult := 1;
      end else
      begin
        MessageDlg('Não foi possível salvar as edições na categoria', mtError, [mbOK], 0);
      end;
      
    end else begin
      MessageDlg('Preencha todos os campos obrigatórios.', mtError, [mbOK], 0);
    end;

  end else
  begin
    MessageDlg('Já existe uma categoria com este nome.', mtError, [mbOK], 0);
  end;
//to-do
end;


procedure TfrmCatMasterDetail.FormShow(Sender: TObject);
var
  SKUScope, ADScope, CostScope: TComboBoxElementDPS;
begin
 { SKUScope := TComboBoxElementDPS.Create(dpsSKU);
  ADScope := TComboBoxElementDPS.Create(dpsSKU_MARKETPLACE);
  CostScope := TComboBoxElementDPS.Create(dpsCOST);

  cbScopeDP.AddItem('Manual via SKU', SKUScope);
  cbScopeDP.AddItem('Manual via Anúncio', ADScope);
  cbScopeDP.AddItem('Automático via mudança de custo', CostScope);   }

  PopulateComboBoxWithPriceScopes(cbScopeDP);

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
  CategoryParentObject, CategoryDetails, CategoryDetailsData: TJSONObject;
  CategoryParentID: Integer;
  CategorypriceFactor: Integer;
  CategoryPartnerSystemID: String;
  CategoryDefinitionPriceScopeString: String;
  CategoryDefinitionPriceScope: TDefinitionPriceScope; 
begin
  if Assigned(FPassedData) then
  begin  
    if FPassedData.TryGetValue('id', CategoryID) then
    begin
      edtCatId.Text := IntToStr(CategoryID);
    end else
    begin
      raise Exception.Create('Não foi possível obter o ID da Categoria.');
    end;

    if FPassedData.TryGetValue('name', CategoryName) then
    begin
      edtCatName.Text := CategoryName;
    end else
    begin
      raise Exception.Create('Não foi possível obter o nome da Categoria.');
    end;

    if FPassedData.TryGetValue('priceFactor', CategorypriceFactor) then
    begin
      edtCatMarkup.Text := IntToStr(CategorypriceFactor);
    end else
    begin
      raise Exception.Create('Não foi possível obter o priceFactor da Categoria.');
    end;

    if FPassedData.TryGetValue('partnerId', CategoryPartnerSystemID) then
    begin
      edtCatSystemID.Text := CategoryPartnerSystemID;
    end;

    if FPassedData.TryGetValue('parent', CategoryParentObject) then
    begin
      if CategoryParentObject.TryGetValue('id', CategoryParentID) then
      begin
        chkIsSubCategory.Checked := True; // Risky to assume cbCatParent is populated because it starts on OnClick, which is called by a mistake on checked.
        // Encontrar categoria com o ID CategoryParentID no combobox e extrair.
        cbCatParent.ItemIndex := SearchIntegerInComboboxObject(cbCatParent, 'id', CategoryParentID);
      end;
    end;

    
    CategoryDetails := FAnymObject.ObterDetalhesCategoria(CategoryID);
    
    if CheckResponseStatus(CategoryDetails) then
    begin
      if CategoryDetails.TryGetValue('data', CategoryDetailsData) then
      begin
        CategoryDefinitionPriceScopeString := CategoryDetailsData.GetValue<String>('definitionPriceScope');
        {CategoryDefinitionPriceScope := UnmapDPS(CategoryDefinitionPriceScopeString);
         cbScopeDP.ItemIndex := SearchDPSInComboBoxObject(cbScopeDP, CategoryDefinitionPriceScope);       }
        cbScopeDP.ItemIndex := MapPriceScopeStringIntoComboBoxElement(CategoryDefinitionPriceScopeString);
      end else
      begin
        raise Exception.Create('Não foi possível obter detalhes da categoria');
      end;
    end;


  end else begin
    raise Exception.Create('Não é possível editar categoria em branco.');
  end;
end;

end.
