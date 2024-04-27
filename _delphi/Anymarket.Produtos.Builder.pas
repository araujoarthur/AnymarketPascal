unit Anymarket.Produtos.Builder;

interface
uses
  System.JSON,
  Anymarket.Produtos;
type
  {
    Interface de Builder para Produto. Note que o produto criado utilizando um
    builder que implemente a interface não precisa ser liberado pelo usuário
  }
  IProdutoAnymarketBuilder = interface
      function SetID(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetTitle(const AValue: String): IProdutoAnymarketBuilder;
      function SetDescription(const AValue: String): IProdutoAnymarketBuilder;
      function SetExternalProductID(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetCategoryID(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetBrandID(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetNBM(const AValue: String): IProdutoAnymarketBuilder;
      function SetOriginID(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetModel(const AValue: String): IProdutoAnymarketBuilder;
      function SetVideoURL(const AValue: String): IProdutoAnymarketBuilder;
      function SetGender(const AValue: String): IProdutoAnymarketBuilder;
      function SetWarrantyTime(const AValue: Double): IProdutoAnymarketBuilder;
      function SetWarrantyText(const AValue: String): IProdutoAnymarketBuilder;
      function SetHeight(const AValue: Double): IProdutoAnymarketBuilder;
      function SetWidth(const AValue: Double): IProdutoAnymarketBuilder;
      function SetWeight(const AValue: Double): IProdutoAnymarketBuilder;
      function SetLength(const AValue: Double): IProdutoAnymarketBuilder;
      function SetPriceFactor(const AValue: Integer): IProdutoAnymarketBuilder;
      function SetCalculatedPrice(const AValue: Boolean): IProdutoAnymarketBuilder;
      function SetDefinitionPriceScope(const AValue: String): IProdutoAnymarketBuilder;
      function SetHasVariations(const AValue: Boolean): IProdutoAnymarketBuilder;
      function SetIsProductActive(const AValue: Boolean): IProdutoAnymarketBuilder;
      function SetCharacteristics(const AValue: TJSONArray): IProdutoAnymarketBuilder;
      function SetImagens  (const AValue: TJSONArray): IProdutoAnymarketBuilder;
      function SetSKUS(const AValue: TJSONArray): IProdutoAnymarketBuilder;
      function SetAllowAutomaticSkuMarketplaceCreation(const AValue: Boolean): IProdutoAnymarketBuilder;
      function SetKitComponents (const AValue: TJSONArray): IProdutoAnymarketBuilder;
      function SetProductType(const AValue:  String): IProdutoAnymarketBuilder;
      function Build: TProdutoAnymarket;
  end;

  {
    Concrete Builder p/ TProdutoAnymarket
  }
  TProdutoAnymarketBuilder = class(TInterfacedObject, IProdutoAnymarketBuilder)
  private
    FProduto: TProdutoAnymarket;
  public
    function SetID(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetTitle(const AValue: String): IProdutoAnymarketBuilder;
    function SetDescription(const AValue: String): IProdutoAnymarketBuilder;
    function SetExternalProductID(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetCategoryID(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetBrandID(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetNBM(const AValue: String): IProdutoAnymarketBuilder;
    function SetOriginID(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetModel(const AValue: String): IProdutoAnymarketBuilder;
    function SetVideoURL(const AValue: String): IProdutoAnymarketBuilder;
    function SetGender(const AValue: String): IProdutoAnymarketBuilder;
    function SetWarrantyTime(const AValue: Double): IProdutoAnymarketBuilder;
    function SetWarrantyText(const AValue: String): IProdutoAnymarketBuilder;
    function SetHeight(const AValue: Double): IProdutoAnymarketBuilder;
    function SetWidth(const AValue: Double): IProdutoAnymarketBuilder;
    function SetWeight(const AValue: Double): IProdutoAnymarketBuilder;
    function SetLength(const AValue: Double): IProdutoAnymarketBuilder;
    function SetPriceFactor(const AValue: Integer): IProdutoAnymarketBuilder;
    function SetCalculatedPrice(const AValue: Boolean): IProdutoAnymarketBuilder;
    function SetDefinitionPriceScope(const AValue: String): IProdutoAnymarketBuilder;
    function SetHasVariations(const AValue: Boolean): IProdutoAnymarketBuilder;
    function SetIsProductActive(const AValue: Boolean): IProdutoAnymarketBuilder;
    function SetCharacteristics(const AValue: TJSONArray): IProdutoAnymarketBuilder;
    function SetImagens  (const AValue: TJSONArray): IProdutoAnymarketBuilder;
    function SetSKUS(const AValue: TJSONArray): IProdutoAnymarketBuilder;
    function SetAllowAutomaticSkuMarketplaceCreation(const AValue: Boolean): IProdutoAnymarketBuilder;
    function SetKitComponents (const AValue: TJSONArray): IProdutoAnymarketBuilder;
    function SetProductType(const AValue:  String): IProdutoAnymarketBuilder;
    function Build: TProdutoAnymarket;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TProdutoAnymarketBuilder }

function TProdutoAnymarketBuilder.Build: TProdutoAnymarket;
begin
  Result := FProduto;
end;

constructor TProdutoAnymarketBuilder.Create;
begin
  inherited;
  FProduto := TProdutoAnymarket.Create;
end;

destructor TProdutoAnymarketBuilder.Destroy;
begin
  FProduto.Free;
  inherited Destroy;
end;

function TProdutoAnymarketBuilder.SetAllowAutomaticSkuMarketplaceCreation(
  const AValue: Boolean): IProdutoAnymarketBuilder;
begin
  FProduto.SetAllowAutomaticSkuMarketplaceCreation(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetBrandID(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetBrandID(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetCalculatedPrice(
  const AValue: Boolean): IProdutoAnymarketBuilder;
begin
  FProduto.SetCalculatedPrice(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetCategoryID(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetCategoryID(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetCharacteristics(
  const AValue: TJSONArray): IProdutoAnymarketBuilder;
begin
  FProduto.SetCharacteristics(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetDefinitionPriceScope(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetDefinitionPriceScope(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetDescription(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetDescription(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetExternalProductID(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetExternalProductID(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetGender(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetGender(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetHasVariations(
  const AValue: Boolean): IProdutoAnymarketBuilder;
begin
  FProduto.SetHasVariations(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetHeight(
  const AValue: Double): IProdutoAnymarketBuilder;
begin
  FProduto.SetHeight(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetID(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetID(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetImagens(
  const AValue: TJSONArray): IProdutoAnymarketBuilder;
begin
  FProduto.SetImagens(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetIsProductActive(
  const AValue: Boolean): IProdutoAnymarketBuilder;
begin
  FProduto.SetIsProductActive(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetKitComponents(
  const AValue: TJSONArray): IProdutoAnymarketBuilder;
begin
  FProduto.SetKitComponents(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetLength(
  const AValue: Double): IProdutoAnymarketBuilder;
begin
  FProduto.SetLength(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetModel(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetModel(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetNBM(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetNBM(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetOriginID(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetOriginID(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetPriceFactor(
  const AValue: Integer): IProdutoAnymarketBuilder;
begin
  FProduto.SetPriceFactor(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetProductType(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetProductType(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetSKUS(
  const AValue: TJSONArray): IProdutoAnymarketBuilder;
begin
  FProduto.SetSKUS(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetTitle(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetTitle(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetVideoURL(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetVideoURL(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetWarrantyText(
  const AValue: String): IProdutoAnymarketBuilder;
begin
  FProduto.SetWarrantyText(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetWarrantyTime(
  const AValue: Double): IProdutoAnymarketBuilder;
begin
  FProduto.SetWarrantyTime(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetWeight(
  const AValue: Double): IProdutoAnymarketBuilder;
begin
  FProduto.SetWeight(AValue);
  Result := Self;
end;

function TProdutoAnymarketBuilder.SetWidth(
  const AValue: Double): IProdutoAnymarketBuilder;
begin
  FProduto.SetWidth(AValue);
  Result := Self;
end;

end.
