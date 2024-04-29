unit Anymarket.Produtos;

interface

  uses
    System.JSON,
    Core.Bitfield;
    // TODO: Test Serialization.
  type
    TProdutoAnymarket = class   // Frees its elements
    private const
      bfHasSetID                                    = 1 shl 0;
      bfHasSetTitle                                 = 1 shl 1;
      bfHasSetDescription                           = 1 shl 2;
      bfHasSetExternalProductID                     = 1 shl 3;
      bfHasSetCategoryID                            = 1 shl 4;
      bfHasSetBrandID                               = 1 shl 5;
      bfHasSetNBM                                   = 1 shl 6;
      bfHasSetOriginID                              = 1 shl 7;
      bfHasSetModel                                 = 1 shl 8;
      bfHasSetVideoURL                              = 1 shl 9;
      bfHasSetGender                                = 1 shl 10;
      bfHasSetWarrantyTime                          = 1 shl 11;
      bfHasSetWarrantyText                          = 1 shl 12;
      bfHasSetHeight                                = 1 shl 13;
      bfHasSetWidth                                 = 1 shl 14;
      bfHasSetWeight                                = 1 shl 15;
      bfHasSetLength                                = 1 shl 16;
      bfHasSetPriceFactor                           = 1 shl 17;
      bfHasSetCalculatedPrice                       = 1 shl 18;
      bfHasSetDefinitionPriceScope                  = 1 shl 19;
      bfHasSetHasVariations                         = 1 shl 20;
      bfHasSetIsProductActive                       = 1 shl 21;
      bfHasSetCharacteristics                       = 1 shl 22;
      bfHasSetImagens                               = 1 shl 23;
      bfHasSetSKUS                                  = 1 shl 24;
      bfHasSetAllowAutomaticSkuMarketplaceCreation  = 1 shl 25;
      bfHasSetKitComponents                         = 1 shl 26;
      bfHasSetProductType                           = 1 shl 27;


    private
      FBitField: TBitField32; // 32 Bits available;

      FID: integer;

      FTitle: String;

      FDescription: String;

      FExternalProductID: Integer;

      FCategoryID: Integer;

      FBrandID: Integer;

      FNBM: String;

      FOriginID: Integer;

      FModel: String;

      FVideoURL: String;

      FGender: String;

      FWarrantyTime: Double; //In Months.

      FWarrantyText: String;

      FHeight: Double;

      FWidth: Double;

      FWeight: Double;

      FLength: Double;

      FPriceFactor: Integer;

      FCalculatedPrice: Boolean;

      FDefinitionPriceScope: String;

      FHasVariations: Boolean;

      FIsProductActive: Boolean; // Defaults to true if not sent. (safe)

      FCharacteristics: TJSONArray;

      FImages: TJSONArray;

      FSKUS: TJSONArray;  // Criar classe TSKUArray com TSKUObject dentro, checar integridade de cada objeto na classe TSKUArray e um metodo pra transformar em TJSONArray (e, obviamente, na classe TSKUObject pra transformar em TJSONObject). Fazer o mesmo para imagens e caracteristicas.

      FAllowAutomaticSkuMarketplaceCreation: Boolean;      // Defaults to true if not sent (safe).

      FKitComponents: TJSONArray; // Mesmo tratamento de TSKUArray, com TKitComponents composto por varios TKitComponent

      FProductType: String;

    public
      procedure SetID(const AValue: Integer);
      procedure SetTitle(const AValue: String);
      procedure SetDescription(const AValue: String);
      procedure SetExternalProductID(const AValue: Integer);
      procedure SetCategoryID(const AValue: Integer);
      procedure SetBrandID(const AValue: Integer);
      procedure SetNBM(const AValue: String);
      procedure SetOriginID(const AValue: Integer);
      procedure SetModel(const AValue: String);
      procedure SetVideoURL(const AValue: String);
      procedure SetGender(const AValue: String);
      procedure SetWarrantyTime(const AValue: Double);
      procedure SetWarrantyText(const AValue: String);
      procedure SetHeight(const AValue: Double);
      procedure SetWidth(const AValue: Double);
      procedure SetWeight(const AValue: Double);
      procedure SetLength(const AValue: Double);
      procedure SetPriceFactor(const AValue: Integer);
      procedure SetCalculatedPrice(const AValue: Boolean);
      procedure SetDefinitionPriceScope(const AValue: String);
      procedure SetHasVariations(const AValue: Boolean);
      procedure SetIsProductActive(const AValue: Boolean);
      procedure SetCharacteristics(const AValue: TJSONArray);
      procedure SetImagens  (const AValue: TJSONArray);
      procedure SetSKUS(const AValue: TJSONArray);
      procedure SetAllowAutomaticSkuMarketplaceCreation(const AValue: Boolean);
      procedure SetKitComponents (const AValue: TJSONArray);
      procedure SetProductType(const AValue:  String);

      function SerializeObject: TJSONObject;
      function CheckRequeriments:Boolean;
      constructor Create;
    end;

implementation

uses
  Vcl.Dialogs{remover}, System.SysUtils;

{ TProdutoAnymarket }

function TProdutoAnymarket.CheckRequeriments: Boolean;
begin
 //To-Do
end;

constructor TProdutoAnymarket.Create;
begin
  inherited;
  ShowMessage(IntToStr(FBitField.BF));

  FID:=  -1;
  FTitle := '';
  FDescription := '';
  FExternalProductID := -1;
  FCategoryID := -1;
  FBrandID := -1;
  FNBM := '';
  FOriginID := -1;
  FModel := '';
  FVideoURL := '';
  FGender := '';
  FWarrantyTime := -1.0;
  FWarrantyText := '';
  FHeight := -1.0;
  FWidth := -1.0;
  FWeight := -1.0;
  FLength := -1.0;
  FPriceFactor := -1;
  FCalculatedPrice := False;
  FDefinitionPriceScope := '';
  FHasVariations := False;
  FIsProductActive := True;
  FCharacteristics := nil;
  FImages := nil;
  FSKUS := nil;
  FAllowAutomaticSkuMarketplaceCreation := True;
  FKitComponents:= nil;
  FProductType := '';


end;

function TProdutoAnymarket.SerializeObject: TJSONObject;
begin
  Result := TJSONObject.Create;

  if FBitField.IsBitSet(bfHasSetID) then
    Result.AddPair('id', TJSONNumber.Create(FID));

  if FBitField.IsBitSet(bfHasSetTitle) then
    Result.AddPair('title', TJSONString.Create(FTitle));

  if FBitField.IsBitSet(bfHasSetDescription) then
    Result.AddPair('description', TJSONString.Create(FDescription));

  if FBitField.IsBitSet(bfHasSetExternalProductID) then
    Result.AddPair('externalIdProduct', TJSONString.Create(IntToStr(FExternalProductID)));

  if FBitField.IsBitSet(bfHasSetCategoryID) then
  begin
    // Adiciona um par com um TJSONValue que contem um TJSONObject com 1 key:value (id:categoria).
    Result.AddPair(
      'category',
      TJSONValue(TJSONObject.Create(
        TJSONPair.Create('id', TJSONNumber.Create(FCategoryID))
      ))
    );
  end;

  if FBitField.IsBitSet(bfHasSetBrandID) then
  begin
    Result.AddPair(
      'brand',
      TJSONValue(TJSONObject.Create(
        TJSONPair.Create('id', TJSONNumber.Create(FBrandID))
      ))
    );
  end;

  if FBitField.IsBitSet(bfHasSetNBM) then
  begin
    Result.AddPair(
      'nbm',
      TJSONValue(TJSONObject.Create(
        TJSONPair.Create('id', TJSONString.Create(FNBM))
      ))
    );
  end;

  if FBitField.IsBitSet(bfHasSetOriginID) then
  begin
    Result.AddPair(
      'origin',
      TJSONValue(TJSONObject.Create(
        TJSONPair.Create('id', FOriginID)
      ))
    );
  end;

  if FBitField.IsBitSet(bfHasSetModel) then
    Result.AddPair('model', TJSONString.Create(FModel));

  if FBitField.IsBitSet(bfHasSetVideoURL) then
    Result.AddPair('videoUrl', TJSONString.Create(FModel));

  if FBitField.IsBitSet(bfHasSetGender) then
    Result.AddPair('gender', TJSONString.Create(FGender));

  if FBitField.IsBitSet(bfHasSetWarrantyTime) then
    Result.AddPair('warrantyTime', TJSONNumber.Create(FWarrantyTime));

  if FBitField.IsBitSet(bfHasSetWarrantyText) then
    Result.AddPair('warrantyText', TJSONString.Create(FWarrantyText));

  if FBitField.IsBitSet(bfHasSetHeight) then
    Result.AddPair('height', TJSONNumber.Create(FHeight));

  if FBitField.IsBitSet(bfHasSetWidth) then
    Result.AddPair('width', TJSONNumber.Create(FWidth));

  if FBitField.IsBitSet(bfHasSetWeight) then
    Result.AddPair('weight', TJSONNumber.Create(FWeight));

  if FBitField.IsBitSet(bfHasSetLength) then
    Result.AddPair('length', TJSONNumber.Create(FLength));

  if FBitField.IsBitSet(bfHasSetPriceFactor) then
    Result.AddPair('priceFactor', TJSONNumber.Create(FPriceFactor));

  if FBitField.IsBitSet(bfHasSetCalculatedPrice) then
    Result.AddPair('calculatedPrice', TJSONBool.Create(FCalculatedPrice));

  if FBitField.IsBitSet(bfHasSetDefinitionPriceScope) then
    Result.AddPair('definitionPriceScope',TJSONString.Create(FDefinitionPriceScope));

  if FBitField.IsBitSet(bfHasSetHasVariations) then
    Result.AddPair('hasVariations', TJSONBool.Create(FHasVariations));

  if FBitField.IsBitSet(bfHasSetIsProductActive) then
    Result.AddPair('isProductActive', TJSONBool.Create(FIsProductActive));

  if FBitField.IsBitSet(bfHasSetCharacteristics) then
    // TO-DO

  if FBitField.IsBitSet(bfHasSetImagens) then
    // TO-DO

  if FBitField.IsBitSet(bfHasSetSKUS) then
    // TO-DO

  if FBitField.IsBitSet(bfHasSetAllowAutomaticSkuMarketplaceCreation) then
    Result.AddPair('allowAutomaticSkuMarketplaceCreation', TJSONBool.Create(FAllowAutomaticSkuMarketplaceCreation));

  if FBitField.IsBitSet(bfHasSetKitComponents) then
    // TO-DO

  if FBitField.IsBitSet(bfHasSetProductType) then
    Result.AddPair('type', TJSONString.Create(FProductType));

end;

procedure TProdutoAnymarket.SetAllowAutomaticSkuMarketplaceCreation(
  const AValue: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetAllowAutomaticSkuMarketplaceCreation) then
  begin
    FAllowAutomaticSkuMarketplaceCreation := AValue;
    FBitField.SetBit(bfHasSetAllowAutomaticSkuMarketplaceCreation);
  end;

end;

procedure TProdutoAnymarket.SetBrandID(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetBrandID) then
  begin
    FBrandID := AValue;
    FBitField.SetBit(bfHasSetBrandID);
  end;

end;

procedure TProdutoAnymarket.SetCalculatedPrice(const AValue: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetCalculatedPrice) then
  begin
    FCalculatedPrice := AValue;
    FBitField.SetBit(bfHasSetCalculatedPrice);
  end;
end;

procedure TProdutoAnymarket.SetCategoryID(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetCategoryID) then
  begin
    FCategoryID := AValue;
    FBitField.SetBit(bfHasSetCategoryID);
  end;
end;

procedure TProdutoAnymarket.SetCharacteristics(const AValue: TJSONArray);
begin
  if not FBitField.IsBitSet(bfHasSetCharacteristics) then
  begin
    FCharacteristics := AValue;
    FBitField.SetBit(bfHasSetCharacteristics);
  end;
end;

procedure TProdutoAnymarket.SetDefinitionPriceScope(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetDefinitionPriceScope) then
  begin
    FDefinitionPriceScope := AValue;
    FBitField.SetBit(bfHasSetDefinitionPriceScope);
  end;
end;

procedure TProdutoAnymarket.SetDescription(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetDescription) then
  begin
    FDescription := AValue;
    FBitField.SetBit(bfHasSetDescription);
  end;
end;

procedure TProdutoAnymarket.SetExternalProductID(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetExternalProductID) then
  begin
    FExternalProductID := AValue;
    FBitField.SetBit(bfHasSetExternalProductID);
  end;
end;

procedure TProdutoAnymarket.SetGender(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetGender) then
  begin
    FGender := AValue;
    FBitField.SetBit(bfHasSetGender);
  end;
end;

procedure TProdutoAnymarket.SetHasVariations(const AValue: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetHasVariations) then
  begin
    FHasVariations := AValue;
    FBitField.SetBit(bfHasSetHasVariations);
  end;
end;

procedure TProdutoAnymarket.SetHeight(const AValue: Double);
begin
  if not FBitField.IsBitSet(bfHasSetHeight) then
  begin
    FHeight := AValue;
    FBitField.SetBit(bfHasSetHeight);
  end;
end;

procedure TProdutoAnymarket.SetID(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetID) then
  begin
    FID := AValue;
    FBitField.SetBit(bfHasSetID);
  end;
end;

procedure TProdutoAnymarket.SetImagens(const AValue: TJSONArray);
begin
  if not FBitField.IsBitSet(bfHasSetImagens) then
  begin
    FImages := AValue;
    FBitField.SetBit(bfHasSetImagens);
  end;
end;

procedure TProdutoAnymarket.SetIsProductActive(const AValue: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetIsProductActive) then
  begin
    FIsProductActive := AValue;
    FBitField.SetBit(bfHasSetIsProductActive);
  end;
end;

procedure TProdutoAnymarket.SetKitComponents(const AValue: TJSONArray);
begin
  if not FBitField.IsBitSet(bfHasSetKitComponents) then
  begin
    FKitComponents := AValue;
    FBitField.SetBit(bfHasSetKitComponents);
  end;
end;

procedure TProdutoAnymarket.SetLength(const AValue: Double);
begin
  if not FBitField.IsBitSet(bfHasSetLength) then
  begin
    FLength := AValue;
    FBitField.SetBit(bfHasSetLength);
  end;
end;

procedure TProdutoAnymarket.SetModel(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetModel) then
  begin
    FModel := AValue;
    FBitField.SetBit(bfHasSetModel);
  end;
end;

procedure TProdutoAnymarket.SetNBM(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetNBM) then
  begin
    FNBM := AValue;
    FBitField.SetBit(bfHasSetNBM);
  end;
end;

procedure TProdutoAnymarket.SetOriginID(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetOriginID) then
  begin
    FOriginID := AValue;
    FBitField.SetBit(bfHasSetOriginID);
  end;
end;

procedure TProdutoAnymarket.SetPriceFactor(const AValue: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetPriceFactor) then
  begin
    FPriceFactor := AValue;
    FBitField.SetBit(bfHasSetPriceFactor);
  end;
end;

procedure TProdutoAnymarket.SetProductType(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetProductType) then
  begin
    FProductType := AValue;
    FBitField.SetBit(bfHasSetProductType);
  end;
end;

procedure TProdutoAnymarket.SetSKUS(const AValue: TJSONArray);
begin
  if not FBitField.IsBitSet(bfHasSetSKUS) then
  begin
    FSKUS := AValue;
    FBitField.SetBit(bfHasSetSKUS);
  end;
end;

procedure TProdutoAnymarket.SetTitle(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetTitle) then
  begin
    FTitle := AValue;
    FBitField.SetBit(bfHasSetTitle);
  end;
end;

procedure TProdutoAnymarket.SetVideoURL(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetVideoURL) then
  begin
    FVideoURL := AValue;
    FBitField.SetBit(bfHasSetVideoURL);
  end;
end;

procedure TProdutoAnymarket.SetWarrantyText(const AValue: String);
begin
  if not FBitField.IsBitSet(bfHasSetWarrantyText) then
  begin
    FWarrantyText := AValue;
    FBitField.SetBit(bfHasSetWarrantyText);
  end;
end;

procedure TProdutoAnymarket.SetWarrantyTime(const AValue: Double);
begin
  if not FBitField.IsBitSet(bfHasSetWarrantyTime) then
  begin
    FWarrantyTime := AValue;
    FBitField.SetBit(bfHasSetWarrantyTime);
  end;
end;

procedure TProdutoAnymarket.SetWeight(const AValue: Double);
begin
  if not FBitField.IsBitSet(bfHasSetWeight) then
  begin
    FWeight := AValue;
    FBitField.SetBit(bfHasSetWeight);
  end;
end;

procedure TProdutoAnymarket.SetWidth(const AValue: Double);
begin
  if not FBitField.IsBitSet(bfHasSetWeight) then
  begin
    FWidth := AValue;
    FBitField.SetBit(bfHasSetWeight);
  end;
end;

end.
