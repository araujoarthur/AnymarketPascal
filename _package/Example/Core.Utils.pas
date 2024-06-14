{
  ATTENTION! THIS UNIT IS UNDOCUMMENTED AND IS SUBJECT TO IMMEDIATE CHANGE, FOR THIS REASON:
  - DON'T RELY ON METHODS DECLARED HERE UNLESS TO THEIR SPECIFIC FUNCTIONALITY __TO KEEP COMPATIBILITY WITH UI__.
  - DON'T ADD, CHANGE OR REMOVE ANY BEHAVIOR AS IT CAN BREAK THE ENTIRE MASTERDETAIL AND REQUEST STRUCTURE

  #########

  ATENÇÃO! ESSA UNIT NÃO É DOCUMENTADA E ESTÁ SUJEITA A MUDANÇAS, POR ESSE MOTIVO:
  - NÃO UTILIZE OS METODOS PRESENTES AQUI EXCETO PELA SUA FUNCIONALIDADE EXCLUSIVA PARA MANTER COMPATIBILIDADE COM A INTERFACE.
  - NÃO ADICIONE, MODIFIQUE OU REMOVA QUALQUER COMPORTAMENTO POIS ISSO PODE QUEBRAR A ESTRUTURA DE REQUISIÇÕES E INTERFACE INTEIRA.
}
unit Core.Utils;

interface
uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  System.DateUtils,
  Vcl.StdCtrls,
  Anymarket.Binding.Pedido,
  Anymarket.Constants;

type
  TDefinitionPriceScope = (dpsSKU, dpsSKU_MARKETPLACE, dpsCOST);

  TComboBoxElementDPS = class
  private
    FValue: TDefinitionPriceScope;
  public
    constructor Create(AValue: TDefinitionPriceScope);
    property Value:TDefinitionPriceScope read FValue;
  end;

  TComboBoxElementCategoryParentID = class
  private
    FParentID: Integer;
  public
    constructor Create(AParent: Integer);
    property Parent: Integer read FParentID;
  end;

  TRequestParamsEnumerator = class;

  {
    TRequestParam is the unitary element of TRequestParams. It holds the
    Name and Value of the parameter.
  }
  TRequestParam = record
    private
      FName: string;
      FValue: string;
    public
      constructor Create(AName, AValue: string); overload;

      property Name: string read FName;
      property Value: string read FValue;
  end;

  {
    TRequestParams groups the parameter elements of a request.
    For sake of simplicity, it must be used only for simple
    requests, for instance: Query strings.
  }
  TRequestParams = record
    private type RequestPrivateArray = array of TRequestParam;

    private
      FValues: RequestPrivateArray;
      FCount: Integer;
      function GetParam(Index: Integer): TRequestParam;
      function GetCount: Integer;
    procedure InitializeRecordParams;
    public
      procedure AddItem(AParamName, AParamValue: string);
      procedure RemoveItem(AParamIndex: Integer);

      function GetEnumerator: TRequestParamsEnumerator;
      function AsStringList: TStringList;
      function AsPayload: string;

      property Parameters[Index: Integer]:TRequestParam read GetParam; default;
      property Count: Integer read GetCount;
  end;

  // Enumerator for the TRequestParams
  TRequestParamsEnumerator = class
    private
      FIndex: Integer;
      FList: TRequestParams;
    public
      constructor Create(AList: TRequestParams);

      function MoveNext: Boolean;
      function GetCurrent: TRequestParam;

      property Current: TRequestParam read GetCurrent;
  end;
  {$IF CompilerVersion < 36}
  TGenericArrayLiberator = class
  public
    class procedure FreeVals<T>(Arr:TArray<T>);
  end;
  {$ENDIF}

function GetQueryString(AParameters: TRequestParams): string;
function CapitalizeFirstLetter(AString: String): String;
function IsSuccessfulResponseCode(ACode: Integer): Boolean;
function RemoveEscaping(AString: String): String;
function MapDPS(ADPS: TDefinitionPriceScope): String;
function UnmapDPS(ADPSString: String): TDefinitionPriceScope;
function DPSPointStringToEnum(Astr: string): TDefinitionPriceScope;
function CheckResponseStatus(AResponseObject: TJSONObject): Boolean;
function UtilsFlattenCategories(AArray: TJSONArray): TJSONArray;
function CheckResponseStatusNonStrict(AResponseObject: TJSONObject): Boolean;
function SearchIntegerInComboboxObject(AComboBox: TComboBox; Field: String; Value:Integer): Integer;
function SearchDPSInComboBoxObject(AComboBox: TComboBox; Value: TDefinitionPriceScope): Integer;
function BuildOrderFromJSON(const AObj: TJSONObject; var AOrd: TAnyPedido): Boolean;
function BuildPaymentFromJSON(const AObj: TJSONObject; var APayment: TPayment): Boolean;
function BuildItemFromJSON(const AObj: TJSONObject; var AItem: TItem): Boolean;
function BuildStockFromJSON(const AObj: TJSONObject; var AStock: TStock): Boolean;

implementation

uses
  System.Rtti;

{ Loose Utils Functions }
function GetQueryString(AParameters: TRequestParams): string;
var
  QueryString: string;
  RequestParam: TRequestParam;
begin
  QueryString := '?';
  for RequestParam in AParameters do
  begin
    if QueryString.EndsWith('?') then
    begin
      QueryString := QueryString + RequestParam.Name + '=' + RequestParam.Value;
    end else begin
      QueryString := QueryString + '&' + RequestParam.Name + '=' + RequestParam.Value;
    end;
  end;

  Result := QueryString;
end;

function RemoveEscaping(AString: String): String;
begin
  Result := StringReplace(AString, '\/', '/', [rfReplaceAll]);
end;

function IsSuccessfulResponseCode(ACode: Integer): Boolean;
begin
  Result := (ACode >= 200) and (ACode < 300);
end;

function CapitalizeFirstLetter(AString: String): String;
begin
  AString := Lowercase(AString);
  Result := UpCase(AString[1]) + Copy(AString, 2, Length(AString) - 1);
end;


function MapDPS(ADPS: TDefinitionPriceScope): String;
begin
  case ADPS of
    dpsSKU: Result := 'SKU' ;
    dpsSKU_MARKETPLACE: Result := 'SKU_MARKETPLACE';
    dpsCOST: Result := 'COST';
  end;
end;

function DPSPointStringToEnum(Astr: string): TDefinitionPriceScope;
begin
  if Astr = 'dpsSKU' then
  begin
    Result:= dpsSKU;
  end else if Astr = 'dpsSKU_MARKETPLACE' then
  begin
    Result := dpsSKU_MARKETPLACE;
  end else if Astr = 'dpsCOST' then
  begin
    Result := dpsCOST;
  end;
end;

function UnmapDPS(ADPSString: String): TDefinitionPriceScope;
begin
  if ADPSString = 'SKU' then
    Result := dpsSKU
  else if ADPSString = 'SKU_MARKETPLACE' then
    Result := dpsSKU_MARKETPLACE
  else if ADPSString = 'COST' then
    Result := dpsCOST;
end;

function CheckResponseStatus(AResponseObject: TJSONObject): Boolean;
begin
  Result := (AResponseObject.GetValue<string>('status') = 'success');
end;

function CheckResponseStatusNonStrict(AResponseObject: TJSONObject): Boolean;
begin
  Result := (AResponseObject.GetValue<string>('status') = 'success') or (AResponseObject.GetValue<string>('status') = 'success - no content');
end;

function UtilsFlattenCategories(AArray: TJSONArray): TJSONArray;
var
  Value: TJSONValue;
  ValueObject: TJSONObject;
  ChildrenValue: TJSONValue;
  ChildrenArray: TJSONArray;
  FlatteningResult: TJSONArray;
  FlatteningValue: TJSONValue;
begin
  Result := TJSONArray.Create;
  for Value in AArray do
  begin
    Result.AddElement(Value);
    if (Value as TJSONObject).TryGetValue('children', ChildrenValue) then
    begin
      ChildrenArray := ChildrenValue as TJSONArray;
      FlatteningResult := UtilsFlattenCategories(ChildrenArray);
      for FlatteningValue in FlatteningResult do
      begin
        Result.AddElement(FlatteningValue);
      end;
    end;
  end;
end;

function SearchIntegerInComboboxObject(AComboBox: TComboBox; Field: String; Value:Integer): Integer;
var
  ItemCount: Integer;
begin
  ItemCount := AComboBox.Items.Count;
  for Result := 0 to ItemCount do
  begin
    if (AComboBox.Items.Objects[Result] as TJSONObject).GetValue<Integer>(field) = Value then
    begin
      break
    end;
  end;
end;

function SearchDPSInComboBoxObject(AComboBox: TComboBox; Value: TDefinitionPriceScope): Integer;
var
  ItemCount: Integer;
begin
  ItemCount := AComboBox.Items.Count;
  for Result := 0 to ItemCount do
  begin
    if (AComboBox.Items.Objects[Result] as TComboBoxElementDPS).Value = Value then
      break;
  end;
end;

function BuildOrderFromJSON(const AObj: TJSONObject; var AOrd: TAnyPedido): Boolean;
var
  Idx: Integer;
  tempInt: Integer;
  tempString: String;
  tempDateTime: TDateTime;
  tempBoolean: Boolean;
  tempDouble: Double;
  tempJSONArray: TJSONArray;
  tempPayment: TPayment;
  tempItem: TItem;
  tempArrayPayment: TArray<TPayment>;
  tempArrayItem: TArray<TItem>;
  tempJSONObject: TJSONObject;
begin
  // Reminder para o eu do futuro:
  {
    Quando escrevi isso eu tinha um ótimo motivo para não utilizar um loop. Favor não questionar sabedoria ancestral.
  }
  AOrd := TAnyPedido.Create;
  if AObj.TryGetValue('id', tempInt) then AOrd.id := tempInt;
  if AObj.TryGetValue('accountName', tempString) then AOrd.accountName := tempString;
  if AObj.TryGetValue('marketPlaceId', tempString) then AOrd.marketPlaceId := tempString;
  if AObj.TryGetValue('marketPlaceNumber', tempString) then AOrd.marketPlaceNumber := tempString;
  if AObj.TryGetValue('partnerId', tempString) then AOrd.partnerId := tempString;
  if AObj.TryGetValue('marketPlace', tempString) then AOrd.marketPlace := tempString;
  if AObj.TryGetValue('subChannel', tempString) then AOrd.subChannel := tempString;
  if AObj.TryGetValue('subChannelNormalized', tempString) then AOrd.subChannelNormalized := tempString;
  if AObj.TryGetValue('createdAt', tempString) then AOrd.createdAt := ISO8601ToDate(tempString);
  if AObj.TryGetValue('paymentDate', tempString) then AOrd.paymentDate := ISO8601ToDate(tempString);
  if AObj.TryGetValue('cancelDate', tempString) then AOrd.cancelDate := ISO8601ToDate(tempString);
  if AObj.TryGetValue('shippingOptionId', tempString) then AOrd.shippingOptionId := tempString;
  if AObj.TryGetValue('transmissionStatus', tempString) then AOrd.transmissionStatus := tempString;
  if AObj.TryGetValue('status', tempString) then AOrd.status := tempString;
  if AObj.TryGetValue('marketPlaceStatus', tempString) then AOrd.marketPlaceStatus := tempString;
  if AObj.TryGetValue('marketPlaceStatusComplement', tempString) then AOrd.marketPlaceStatusComplement := tempString;
  if AObj.TryGetValue('documentIntermediator', tempString) then AOrd.documentIntermediator := tempString;
  if AObj.TryGetValue('intermediateRegistrationId', tempString) then AOrd.intermediateRegistrationId := tempString;
  if AObj.TryGetValue('documentPaymentInstitution', tempString) then AOrd.documentPaymentInstitution := tempString;
  if AObj.TryGetValue('fulfillment', tempBoolean) then AOrd.fulfillment := tempBoolean;
  if AObj.TryGetValue('discount', tempDouble) then AOrd.discount := tempDouble;
  if AObj.TryGetValue('freight', tempDouble) then AOrd.freight := tempDouble;
  if AObj.TryGetValue('sellerFreight', tempDouble) then AOrd.sellerFreight := tempDouble;
  if AObj.TryGetValue('interestValue', tempDouble) then AOrd.interestValue := tempDouble;
  if AObj.TryGetValue('gross', tempDouble) then AOrd.gross := tempDouble;
  if AObj.TryGetValue('total', tempDouble) then AOrd.total := tempDouble;
  if AObj.TryGetValue('marketPlaceUrl', tempString) then AOrd.marketPlaceUrl := tempString;
  if AObj.TryGetValue('marketPlaceShipmentStatus', tempString) then AOrd.marketPlaceShipmentStatus := tempString;
  if AObj.TryGetValue('deliverStatus', tempString) then AOrd.deliverStatus := tempString;
  if AObj.TryGetValue('idAccount', tempInt) then AOrd.idAccount := tempInt;
  if AObj.TryGetValue('orderTypeName', tempString) then AOrd.orderTypeName := tempString;

  // Start of special elements.

  // ## OBJECTS ##

  if AObj.TryGetValue('quoteReconciliation', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('quoteId', tempString) then AOrd.quoteReconciliation.quoteId := tempString;
    if tempJSONObject.TryGetValue('price', tempDouble) then AOrd.quoteReconciliation.price := tempDouble;
  end;

  if AObj.TryGetValue('invoice', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('accessKey', tempString) then AOrd.invoice.accessKey := tempString;
    if tempJSONObject.TryGetValue('series', tempString) then AOrd.invoice.series := tempString;
    if tempJSONObject.TryGetValue('number', tempString) then AOrd.invoice.number := tempString;
    if tempJSONObject.TryGetValue('date', tempString) then AOrd.invoice.date := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('cfop', tempString) then AOrd.invoice.cfop := tempString;
    if tempJSONObject.TryGetValue('companyStateTaxId', tempString) then AOrd.invoice.companyStateTaxId := tempString;
    if tempJSONObject.TryGetValue('linkNfe', tempString) then AOrd.invoice.linkNfe := tempString;
    if tempJSONObject.TryGetValue('invoiceLink', tempString) then AOrd.invoice.invoiceLink := tempString;
    if tempJSONObject.TryGetValue('extraDescription', tempString) then AOrd.invoice.extraDescription := tempString;
  end;

  if AObj.TryGetValue('shipping', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('address', tempString) then AOrd.shipping.address := tempString;
    if tempJSONObject.TryGetValue('city', tempString) then AOrd.shipping.city := tempString;
    if tempJSONObject.TryGetValue('comment', tempString) then AOrd.shipping.comment := tempString;
    if tempJSONObject.TryGetValue('country', tempString) then AOrd.shipping.country := tempString;
    if tempJSONObject.TryGetValue('countryAcronymNormalized', tempString) then AOrd.shipping.countryAcronymNormalized := tempString;
    if tempJSONObject.TryGetValue('countryNameNormalized', tempString) then AOrd.shipping.countryNameNormalized := tempString;
    if tempJSONObject.TryGetValue('neighborhood', tempString) then AOrd.shipping.neighborhood := tempString;
    if tempJSONObject.TryGetValue('number', tempString) then AOrd.shipping.number := tempString;
    if tempJSONObject.TryGetValue('promisedShippingTime', tempString) then AOrd.shipping.promisedShippingTime := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('receiverName', tempString) then AOrd.shipping.receiverName := tempString;
    if tempJSONObject.TryGetValue('reference', tempString) then AOrd.shipping.reference := tempString;
    if tempJSONObject.TryGetValue('state', tempString) then AOrd.shipping.state := tempString;
    if tempJSONObject.TryGetValue('stateNameNormalized', tempString) then AOrd.shipping.stateNameNormalized := tempString;
    if tempJSONObject.TryGetValue('street', tempString) then AOrd.shipping.street := tempString;
    if tempJSONObject.TryGetValue('zipCode', tempString) then AOrd.shipping.zipCode := tempString;
  end;

  if AObj.TryGetValue('billingAddress', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('address', tempString) then AOrd.billingAddress.address := tempString;
    if tempJSONObject.TryGetValue('city', tempString) then AOrd.billingAddress.city := tempString;
    if tempJSONObject.TryGetValue('comment', tempString) then AOrd.billingAddress.city := tempString;
    if tempJSONObject.TryGetValue('country', tempString) then AOrd.billingAddress.country := tempString;
    if tempJSONObject.TryGetValue('countryAcronymNormalized', tempString) then AOrd.billingAddress.countryAcronymNormalized := tempString;
    if tempJSONObject.TryGetValue('countryNameNormalized', tempString) then AOrd.billingAddress.countryNameNormalized := tempString;
    if tempJSONObject.TryGetValue('neighborhood', tempString) then AOrd.billingAddress.neighborhood := tempString;
    if tempJSONObject.TryGetValue('number', tempString) then AOrd.billingAddress.number := tempString;
    if tempJSONObject.TryGetValue('reference', tempString) then AOrd.billingAddress.reference := tempString;
    if tempJSONObject.TryGetValue('shipmentUserDocument', tempString) then AOrd.billingAddress.shipmentUserDocument := tempString;
    if tempJSONObject.TryGetValue('shipmentUserDocumentType', tempString) then AOrd.billingAddress.shipmentUserDocumentType := tempString;
    if tempJSONObject.TryGetValue('shipmentUserName', tempString) then AOrd.billingAddress.shipmentUserName := tempString;
    if tempJSONObject.TryGetValue('state', tempString) then AOrd.billingAddress.state := tempString;
    if tempJSONObject.TryGetValue('stateNameNormalized', tempString) then AOrd.billingAddress.stateNameNormalized := tempString;
    if tempJSONObject.TryGetValue('street', tempString) then AOrd.billingAddress.street := tempString;
    if tempJSONObject.TryGetValue('zipCode', tempString) then AOrd.billingAddress.street := tempString;
  end;

  if AObj.TryGetValue('anymarketAddress', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('address', tempString) then AOrd.anymarketAddress.address := tempString;
    if tempJSONObject.TryGetValue('city', tempString) then AOrd.anymarketAddress.city := tempString;
    if tempJSONObject.TryGetValue('comment', tempString) then AOrd.anymarketAddress.comment := tempString;
    if tempJSONObject.TryGetValue('country', tempString) then AOrd.anymarketAddress.country := tempString;
    if tempJSONObject.TryGetValue('neighborhood', tempString) then AOrd.anymarketAddress.neighborhood := tempString;
    if tempJSONObject.TryGetValue('number', tempString) then AOrd.anymarketAddress.number := tempString;
    if tempJSONObject.TryGetValue('promisedShippingTime', tempString) then AOrd.anymarketAddress.promisedShippingTime := tempString;
    if tempJSONObject.TryGetValue('receiverName', tempString) then AOrd.anymarketAddress.receiverName := tempString;
    if tempJSONObject.TryGetValue('reference', tempString) then AOrd.anymarketAddress.reference := tempString;
    if tempJSONObject.TryGetValue('state', tempString) then AOrd.anymarketAddress.state := tempString;
    if tempJSONObject.TryGetValue('stateAcronymNormalized', tempString) then AOrd.anymarketAddress.stateAcronymNormalized := tempString;
    if tempJSONObject.TryGetValue('street', tempString) then AOrd.anymarketAddress.street := tempString;
    if tempJSONObject.TryGetValue('zipCode', tempString) then AOrd.anymarketAddress.zipCode := tempString;
  end;

  if AObj.TryGetValue('buyer', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('cellPhone', tempString) then AOrd.buyer.cellPhone := tempString;
    if tempJSONObject.TryGetValue('document', tempString) then AOrd.buyer.document := tempString;
    if tempJSONObject.TryGetValue('documentNumberNormalized', tempString) then AOrd.buyer.documentNumberNormalized := tempString;
    if tempJSONObject.TryGetValue('documentType', tempString) then AOrd.buyer.documentType := tempString;
    if tempJSONObject.TryGetValue('email', tempString) then AOrd.buyer.email := tempString;
    if tempJSONObject.TryGetValue('marketPlaceId', tempString) then AOrd.buyer.marketPlaceId := tempString;
    if tempJSONObject.TryGetValue('name', tempString) then AOrd.buyer.name := tempString;
    if tempJSONObject.TryGetValue('phone', tempString) then AOrd.buyer.phone := tempString;
    if tempJSONObject.TryGetValue('dateOfBirth', tempString) then AOrd.buyer.dateOfBirth := tempString;
    if tempJSONObject.TryGetValue('companyStateTaxId', tempString) then AOrd.buyer.companyStateTaxId := tempString;
  end;

  if AObj.TryGetValue('tracking', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('carrier', tempString) then AOrd.tracking.carrier := tempString;
    if tempJSONObject.TryGetValue('date', tempString) then AOrd.tracking.date := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('deliveredDate', tempString) then AOrd.tracking.deliveredDate := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('estimateDate', tempString) then AOrd.tracking.estimateDate := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('number', tempString) then AOrd.tracking.number := tempString;
    if tempJSONObject.TryGetValue('shippedDate', tempString) then AOrd.tracking.shippedDate := ISO8601ToDate(tempString);
    if tempJSONObject.TryGetValue('url', tempString) then AOrd.tracking.url := tempString;
    if tempJSONObject.TryGetValue('carrierDocument', tempString) then AOrd.tracking.carrierDocument := tempString;
  end;

  if AObj.TryGetValue('pickup', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('id', tempInt) then AOrd.pickup.id := tempInt;
    if tempJSONObject.TryGetValue('description', tempString) then AOrd.pickup.description := tempString;
    if tempJSONObject.TryGetValue('partnerId', tempInt) then AOrd.pickup.partnerId := tempInt;
    if tempJSONObject.TryGetValue('marketplaceId', tempString) then AOrd.pickup.marketplaceId := tempString;
    if tempJSONObject.TryGetValue('receiverName', tempString) then AOrd.pickup.receiverName := tempString;
  end;

  if AObj.TryGetValue('metadata', tempJSONObject)  then
  begin
    if tempJSONObject.TryGetValue('number-of-packages', tempInt) then AOrd.metadata.number_of_packages := tempInt;
    if tempJSONObject.TryGetValue('cdZipCode', tempString) then AOrd.metadata.cdZipCode := tempString;
    if tempJSONObject.TryGetValue('needInvoiceXML', tempBoolean) then AOrd.metadata.needInvoiceXML := tempBoolean;
    if tempJSONObject.TryGetValue('mshops', tempBoolean) then AOrd.metadata.mshops := tempBoolean;
    if tempJSONObject.TryGetValue('Envvias', tempString) then AOrd.metadata.Envvias := tempString;
    if tempJSONObject.TryGetValue('VIAtotalDiscountAmount', tempString) then AOrd.metadata.VIAtotalDiscountAmount := tempString;
    if tempJSONObject.TryGetValue('B2WshippingType', tempString) then AOrd.metadata.B2WshippingType := tempString;
    if tempJSONObject.TryGetValue('logistic_type', tempString) then AOrd.metadata.logistic_type := tempString;
    if tempJSONObject.TryGetValue('printTag', tempBoolean) then AOrd.metadata.printTag := tempBoolean;
    if tempJSONObject.TryGetValue('canceldetail_motivation', tempString) then AOrd.metadata.canceldetail_motivation := tempString;
    if tempJSONObject.TryGetValue('canceldetail_code', tempString) then AOrd.metadata.canceldetail_code := tempString;
    if tempJSONObject.TryGetValue('canceldetail_description', tempString) then AOrd.metadata.canceldetail_description := tempString;
    if tempJSONObject.TryGetValue('canceldetail_requested_by', tempString) then AOrd.metadata.canceldetail_requested_by := tempString;
  end;

  // ## ARRAYS ##

  if AObj.TryGetValue('payments', tempJSONArray) then
  begin
    // This is boilerplate code (from SetLength to the End;). It all could be inside a function that returns the value
    // assigned to AOrd.Payments: AOrd.Payments := MyFunctionToPopulate(...);
    SetLength(tempArrayPayment, tempJSONArray.Count);

    for Idx := 0 to tempJSONArray.Count - 1 do
    begin
      if BuildPaymentFromJSON(tempJSONArray.Items[Idx] as TJSONObject, tempPayment) then
        tempArrayPayment[Idx] := tempPayment;
    end;

    AOrd.payments := tempArrayPayment;
  end;

  if AObj.TryGetValue('items', tempJSONArray) then
  begin
    SetLength(tempArrayItem, tempJSONArray.Count);
    for Idx := 0 to tempJSONArray.Count - 1 do
    begin
      if BuildItemFromJSON(tempJSONArray.Items[Idx] as TJSONObject, tempItem) then
        tempArrayItem[Idx] := tempItem;
    end;

    AOrd.items := tempArrayItem;
  end;

end;

function BuildPaymentFromJSON(const AObj: TJSONObject; var APayment: TPayment): Boolean;
var
  tempInt: Integer;
  tempString: String;
  tempDouble: Double;
begin
  if Assigned(APayment) then
    raise Exception.Create('The output variable must be uninitialized');
  APayment := TPayment.Create;

  if AObj.TryGetValue('installments', tempInt) then APayment.installments := tempInt;
  if AObj.TryGetValue('marketplaceId', tempString) then APayment.marketplaceId := tempString;
  if AObj.TryGetValue('method', tempString) then APayment.method := tempString;
  if AObj.TryGetValue('paymentDetailNormalized', tempString) then APayment.paymentDetailNormalized := tempString;
  if AObj.TryGetValue('paymentMethodNormalized', tempString) then APayment.paymentMethodNormalized := tempString;
  if AObj.TryGetValue('status', tempString) then APayment.status := tempString;
  if AObj.TryGetValue('value', tempDouble) then APayment.value := tempDouble;
  if AObj.TryGetValue('gatewayFee', tempDouble) then APayment.gatewayFee := tempDouble;
  if AObj.TryGetValue('marketplaceFee', tempDouble) then APayment.marketplaceFee := tempDouble;

  Result := True;
end;

function BuildItemFromJSON(const AObj: TJSONObject; var AItem: TItem): Boolean;
var
  Idx: Integer;
  tempString: String;
  tempInt: Integer;
  tempDouble: Double;
  tempBoolean: Boolean;
  tempJSONArray: TJSONArray;
  tempJSONObject: TJSONObject;
  tempStocksArray: TArray<TStock>;
  tempStock: TStock;
begin
  if Assigned(AItem) then
    raise Exception.Create('The output variable must be unintialized');



  if AObj.TryGetValue('amount', tempDouble) then AItem.amount := tempDouble;
  if AObj.TryGetValue('unit', tempDouble) then AItem.unit_ := tempDouble;
  if AObj.TryGetValue('gross', tempDouble) then AItem.gross := tempDouble;
  if AObj.TryGetValue('total', tempDouble) then AItem.total := tempDouble;
  if AObj.TryGetValue('discount', tempDouble) then AItem.discount := tempDouble;
  if AObj.TryGetValue('marketPlaceId', tempString) then AItem.marketPlaceId := tempString;
  if AObj.TryGetValue('orderItemId', tempString) then AItem.orderItemId := tempString;
  if AObj.TryGetValue('idInMarketPlace', tempString) then AItem.idInMarketPlace := tempString;
  if AObj.TryGetValue('officialStoreId', tempString) then AItem.officialStoreId := tempString;
  if AObj.TryGetValue('officialStoreName', tempString) then AItem.officialStoreName := tempString;
  if AObj.TryGetValue('listingType', tempString) then AItem.listingType := tempString;
  if AObj.TryGetValue('freeShipping', tempBoolean) then AItem.freeShipping := tempBoolean;

  if AObj.TryGetValue('customization', tempJSONObject) then
  begin
    if tempJSONObject.TryGetValue('customizationType', tempString) then AItem.customization.customizationType := tempString;
    if tempJSONObject.TryGetValue('customizationQuantity', tempDouble) then AItem.customization.customizationQuantity := tempDouble;
    if tempJSONObject.TryGetValue('customizationPrice', tempString) then AItem.customization.customizationPrice := tempString;
    if tempJSONObject.TryGetValue('customizationValue', tempString) then AItem.customization.customizationValue := tempString;
  end;

  if AObj.TryGetValue('product', tempJSONObject) then
  begin
   if tempJSONObject.TryGetValue('id', tempInt) then AItem.product.id := tempInt;
   if tempJSONObject.TryGetValue('title', tempString) then AItem.product.title := tempString;
  end;

  if AObj.TryGetValue('sku', tempJSONObject) then
  begin
    if tempJSONObject.TryGetValue('ean', tempString) then AItem.sku.ean := tempString;
    if tempJSONObject.TryGetValue('id', tempInt) then AItem.sku.id := tempInt;
    if tempJSONObject.TryGetValue('title', tempString) then AItem.sku.title := tempString;
    if tempJSONObject.TryGetValue('partnerId', tempString) then AItem.sku.partnerId := tempString;
    if tempJSONObject.TryGetValue('externalId', tempString) then AItem.sku.externalId := tempString;
  end;

  if AObj.TryGetValue('shippings', tempJSONObject) then
  begin
    if tempJSONObject.TryGetValue('id', tempInt) then AItem.shippings.id := tempInt;
    if tempJSONObject.TryGetValue('shippingCarrierNormalized', tempString) then AItem.shippings.shippingCarrierNormalized := tempString;
    if tempJSONObject.TryGetValue('shippingCarrierTypeNormalized', tempString) then AItem.shippings.shippingCarrierTypeNormalized := tempString;
    if tempJSONObject.TryGetValue('shippingtype', tempString) then AItem.shippings.shippingtype := tempString;
  end;

  if AObj.TryGetValue('stocks', tempJSONArray) then
  begin
    SetLength(tempStocksArray, tempJSONArray.Count);
    for Idx := 0 to tempJSONArray.Count - 1 do
    begin
      if BuildStockFromJSON(tempJSONArray.Items[Idx] as TJSONObject, tempStock) then
      begin
        tempStocksArray[Idx] := tempStock;
      end;
    end;
  end;

  Result := True;
end;

function BuildStockFromJSON(const AObj: TJSONObject; var AStock: TStock): Boolean;
var
  tempDouble: Double;
  tempString: String;
  tempInt: Integer;
begin
  if Assigned(AStock) then
    raise Exception.Create('The output variable must be uninitialized');
  AStock := TStock.Create;

  if AObj.TryGetValue('amount', tempDouble) then AStock.amount := tempDouble;
  if AObj.TryGetValue('stockLocalId', tempInt) then AStock.stockLocalId := tempInt;
  if AObj.TryGetValue('stockName', tempString) then AStock.stockName := tempString;

  Result := True;
end;

{ TRequestParam }

constructor TRequestParam.Create(AName, AValue: string);
begin
  FName := AName;
  FValue := AValue;
end;

{ TRequestParams }

function TRequestParams.GetParam(Index: Integer): TRequestParam;
begin
  if (Length(FValues) = 0) or (Length(FValues) - 1 < Index) then
  begin
    raise ERangeError.Create('The provided index does not exist in the current list') at @TRequestParams.GetParam;
  end else
  begin
    Result := FValues[Index];
  end;
end;

procedure TRequestParams.InitializeRecordParams;
begin
  FCount := 0;
end;

procedure TRequestParams.AddItem(AParamName, AParamValue: string);
begin
  SetLength(FValues, Length(FValues) + 1);
  FCount := Length(FValues);

  FValues[Length(FValues) - 1] := TRequestParam.Create(AParamName, AParamValue);
end;

function TRequestParams.AsPayload: string;
var
  Parameter: TRequestParam;
  JSONObject: TJSONObject;
begin
  JSONObject := TJSONObject.Create;
  try
    for Parameter in FValues do
    begin

      JSONObject.AddPair(Parameter.Name, Parameter.Value);
      // Type check, then assign correctly within a json object string.
    end;
    Result := JSONObject.ToString;
  finally
    JSONObject.Free;
  end;
end;

function TRequestParams.AsStringList: TStringList;
var
  Parameter: TRequestParam;
begin
  Result := TStringList.Create;
  for Parameter in FValues do
  begin
    Result.Add(Parameter.Name + '=' + Parameter.Value);
  end;
end;

function TRequestParams.GetCount: Integer;
begin
  Result := Length(FValues);
end;

function TRequestParams.GetEnumerator: TRequestParamsEnumerator;
begin
  Result := TRequestParamsEnumerator.Create(Self);
end;

procedure TRequestParams.RemoveItem(AParamIndex: Integer);
var
  ArrLength: Integer;
  SurplusElements: Integer;
begin
  ArrLength := Length(FValues);
  if (ArrLength > 0) and (AParamIndex < ArrLength) then
  begin
    // Frees dynamically allocated memory
    Finalize(FValues[AParamIndex]);

    // Elements that are to the right of the "hole". If it's 0,
    // it means we had deleted the last one element and there are 0 to the right.
    SurplusElements := ArrLength - AParamIndex;


    if SurplusElements > 0 then
    begin
      // Move signature: procedure Move(const Source; var Dest; Count: NativeInt);
      // It will move SizeOf(TRequestParam) * SurplusElements bytes to the starting position FValues[AParamIndex]
      // and it will fill the hole created when we finalize() that value before.
      Move(FValues[AParamIndex + 1], FValues[AParamIndex], SizeOf(TRequestParam)* SurplusElements);
    end;

    // By the docs: "Initialize simply zeros out the memory occupied by long strings"
    // https://docwiki.embarcadero.com/Libraries/Athens/en/System.Initialize
    // So we are, actually, cleaning that spot we won't use anymore.
    Initialize(FValues[ArrLength - 1]);
    SetLength(FValues, ArrLength - 1);

    FCount := ArrLength - 1;
  end else
  begin
    raise ERangeError.Create('The provided index does not exist in the current list') at @TRequestParams.GetParam;
  end;

end;


{ TRequestParamsEnumerator }

constructor TRequestParamsEnumerator.Create(AList: TRequestParams);
begin
  FList := AList;
  FIndex := -1;
end;

function TRequestParamsEnumerator.GetCurrent: TRequestParam;
begin
  Result := FList[FIndex];
end;

function TRequestParamsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < (FList.Count - 1);
  if Result then
    Inc(FIndex);
end;

{ TComboBoxElementDPS }

constructor TComboBoxElementDPS.Create(AValue: TDefinitionPriceScope);
begin
  FValue := AValue;
end;

{ TComboBoxElementCategoryParentID }

constructor TComboBoxElementCategoryParentID.Create(AParent: Integer);
begin
  FParentID := AParent;
end;

{$IF CompilerVersion < 36}
{ TGenericArrayLiberator }

class procedure TGenericArrayLiberator.FreeVals<T>(Arr: TArray<T>);
var
  Element: T;
  Value: TValue;
begin
  for Element in Arr do
  begin
    Value := TValue.From<T>(Element);
    if Value.IsObject then
    begin
      Value.AsObject.Free;
    end;
  end;
end;
{$ENDIF}
{ TOrderFilter }

end.
