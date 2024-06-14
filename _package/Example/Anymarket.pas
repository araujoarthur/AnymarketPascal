unit Anymarket;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.Classes,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.JSON,
  Core.Utils,
  Anymarket.Feed,
  Anymarket.Constants,
  Anymarket.Utils,
  Anymarket.Bridge.Types
  ;

type
  TRequestMethods = (rmGET, rmPOST, rmPUT, rmDELETE);

  TAnymarket = class
  private const
    URL_BASE = 'http://sandbox-api.anymarket.com.br/v2';

  private
    FGumga: string;
    function MakeRequest(ARequestMethod: TRequestMethods; AURL: String; ABody: TJSONObject = nil): TJSONObject;
    function MakeRequestXML(AURL: String; AXML: String): TJSONObject;
  public
    type TAnymarketPaginateResponse = class
    private type TAnymarketOrderResponseHistoryEnumerator = class
    private
      FList: TAnymarketPaginateResponse;
      FIdx: Integer;
    public
      constructor Create(AList: TAnymarketPaginateResponse);
      function MoveNext: Boolean;
      function GetCurrent: TJSONObject;
    end;
    private
      FOwner: TAnymarket;
      FRawResult: TJSONObject;
      FHistory: TArray<TJSONObject>;
      FNext: String;
      FTotalResults: Integer;
      FTotalObtainedResults: Integer;
      FPageSize: Integer;
      FTotalPages: Integer;
      FCurrentPage: Integer;
      constructor Create(AOwner: TAnymarket; ARawResult: TJSONObject);
      function GetRawResult: TJSONObject;
      function GetResult: TJSONObject;
      function GetHistoryItem(Idx: Integer): TJSONObject;
      function GetHistoryLength: Integer;
      function IsEOFAlready: Boolean;
    public
      function NextPage: TAnymarketPaginateResponse;
      function GetEnumerator: TAnymarketOrderResponseHistoryEnumerator;
      property PageContent: TJSONObject read GetResult;
      property RawResult: TJSONObject read GetRawResult;
      property History[Idx: Integer]: TJSONObject read GetHistoryItem;
      property HistoryLength: Integer read GetHistoryLength;
      property TotalAvailableResults: Integer read FTotalResults;
      property TotalObtainedResults: Integer read FTotalObtainedResults;
      property PageSize: Integer read FPageSize;
      property TotalPageCount: Integer read FTotalPages;
      property CurrentPageNumber: Integer read FCurrentPage;
    end;

  public
    function MakePost(AURL: String; ABody: TJSONObject): TJSONObject;   // In the future it'll be made protected
    function MakeGet(AURL: String): TJSONObject; overload;
    function MakeGet(AURL: String; AParams: TRequestParams): TJSONObject; overload; // In the future it'll be made protected
    function MakeGet(AURL: String; AQueryString: String): TJSONObject; overload;// In the future it'll be made protected
    function MakePut(AURL: String; ABody: TJSONObject): TJSONObject;  // In the future it'll be made protected
    function MakeDelete(AURL: String): TJSONObject;
     { All the handlers currently return the raw body of the JSON response. In a future they will be filtered for errors and return proper types (boolean, string, integer, whatever is needed)}

    // ### Category Handlers ###

    // Creates a category with or without a related partnerId
    function CriarCategoria(AName: String; APriceFactor: Integer; ADefinitionPriceScope: String; APartnerID: Integer = -1): TJSONObject;
    // Creates a subcategory with or without a related partnerId, mostly boilerplate code from CriarCategoria, used only to allow separation between category and subcategory creation
    function CriarSubcategoria(AName: String; APriceFactor: Integer; ADefinitionPriceScope: String; AParentID: Integer; APartnerID: Integer = -1): TJSONObject;
    // Returns all categories already registered.
    function ObterTodasCategorias: TJSONObject;
    // Gets details of a category given its generated ID.
    function ObterDetalhesCategoria(ID: Integer): TJSONObject;
    // Verifies if a category with the given name already exists in a given flatten JSON Array.
    function ExisteCategoria(APath: String; AFlatten: TJSONArray): Boolean; overload;
    // The same as the above, but gets the category list and flattens it. User must only pass the path but is COSTLY.
    function ExisteCategoria(APath: String): Boolean; overload;
    // Deletes an existing category.
    function ExcluirCategoria(ACategoryID: Integer): TJSONObject;
    // Modify the category with the ID given ID. Note it's important to send a complete body because this operation is completed with a PUT, not a PATCH. Any missing information will be overwritten to NULL.
    function AlterarCategoria(ACategoryID: Integer; ANewBody: TJSONObject): TJSONObject;


    // ### Brand Handlers ###

    // Creates a brand and return the json from the request.
    function CriarMarca(AName: String; AReducedName: String; APartnerID: Integer = -1): TJSONObject;
    // Gets a list of all brands.
    function ObterTodasMarcas: TJSONObject;

    // ### Feed Handlers ###

    // Obtains the feed from the API.
    function ObterFeed(ALim: Integer = 15): TJSONObject;
    // Obtains the feed from the API and returns if there pending items there.
    function ExistemItensNoFeed: Boolean;

    // ### Order Handlers ###

    // Filters orders based on a user defined filter provided, otherwise based on standard api filter.
    function FiltrarPedidos(AFiltro: TOrderFilter = nil): TJSONObject;
    // Filters orders based on a user defined filter provided, otherwise based on standard api filter. Returns a pagination handler.
    function FiltrarPedidosPaginado(AFiltro: TOrderFilter = nil): TAnymarketPaginateResponse;

    // Filter for all time canceled orders or between provided dates.
    function ObterPedidosCancelados(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filter for all time canceled orders or between provided dates. Returns a pagination handler.
    function ObterPedidosCanceladosPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;

    // Filters for all time concluded orders or between provided dates.
    function ObterPedidosConcluidos(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filters for all time concluded orders or between provided dates. Returns a pagination handler.
    function ObterPedidosConcluidosPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;

    // Filters for all time pending orders or between provided dates.
    function ObterPedidosPendentes(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filters for all time pending orders or between provided dates. Returns a pagination handler.
    function ObterPedidosPendentesPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;

    // Filters for all time invoiced orders or between provided dates.
    function ObterPedidosFaturados(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filters for all time invoiced orders or between provided dates. Returns a pagination handler.
    function ObterPedidosFaturadosPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;

    // Filters for all time invoiced orders or between provided dates.
    function ObterPedidosPagos(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filters for all time invoiced orders or between provided dates. Returns a pagination handler.
    function ObterPedidosPagosPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;

    // Filters for all time invoiced orders or between provided dates.
    function ObterPedidosEnviados(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TJSONObject;
    // Filters for all time invoiced orders or between provided dates. Returns a pagination handler.
    function ObterPedidosEnviadosPaginado(ADataInicio: TDateTime = 0; ADataFim: TDateTime = 0): TAnymarketPaginateResponse;


    // Gets details on an order
    function DetalhesPedido(APedidoID: Integer): TJSONObject;


    // Updates an order to INVOICED. (Faturado)
    function AtualizarPedidoFaturado(APedidoID: Integer; AInvoice: TNewInvoice; AMetadata: TNewInvoiceMetadata = nil): TJSONObject;

    // Updates an order to PAID_WAITING_SHIP (Pago)
    function AtualizarPedidoPago(APedidoID: Integer): TJSONObject;

    // Updates an order to PAID_WAITING_DELIVERY (Enviado)
    function AtualizarPedidoEnviado(APedidoID: Integer; ATTracking: TNewTracking {Criar TNewTracking}): TJSONObject;

    // Updates an order to CONCLUDED
    function AtualizarPedidoConcluido(APedidoID: Integer; ADeliveryDate: TDateTime): TJSONObject;

    // Updates an order to CANCELED.
    function AtualizarPedidoCancelado(APedidoID: Integer; ADetalhes: String): TJSONObject;

    // Sends the invoice file content
    function EnviarXMLNotaFiscal(APedidoID: Integer; AXML: String): TJSONObject;

    // ### Pagination Handlers ###
    function Paginate(ARawResult: TJSONObject): TAnymarketPaginateResponse; overload;
    function Paginate(AURL: String): TAnymarketPaginateResponse; overload;

    constructor Create(AGumga: String);
  end;

implementation

uses
  Clipbrd,
  Vcl.Dialogs; // remove in a future.

{ TAnymarket }

function TAnymarket.AlterarCategoria(ACategoryID: Integer;
  ANewBody: TJSONObject): TJSONObject;
begin
  Result := MakePut(URL_BASE + '/categories/' + IntToStr(ACategoryID), ANewBody);
end;

function TAnymarket.AtualizarPedidoCancelado(APedidoID: Integer;
  ADetalhes: String): TJSONObject;
var
  ObjectData: TJSONObject;
begin
  ObjectData := TJSONObject.Create();
  try
    ObjectData.AddPair('status', TJSONString.Create(OS_CANCELED));
    ObjectData.AddPair('cancelDetails', TJSONString.Create(ADetalhes));

    Result := MakePut(URL_BASE + '/orders/'+IntToStr(APedidoID), ObjectData);
  finally
    if Assigned(ObjectData) then
      ObjectData.Free;
  end;

end;

function TAnymarket.AtualizarPedidoConcluido(APedidoID: Integer;
  ADeliveryDate: TDateTime): TJSONObject;
var
  ObjectData: TJSONObject;
  TrackingData: TJSONObject;
begin
  ObjectData := TJSONObject.Create;
  TrackingData := TJSONObject.Create;
  try
    TrackingData.AddPair('deliveredDate', TJSONString.Create(FormatDateTime('yyyy-mm-dd"T"hh:nn:ss-03:00', ADeliveryDate)));
    ObjectData.AddPair('status', TJSONString.Create(OS_CONCLUDED));
    ObjectData.AddPair('tracking', TrackingData);
    Result := MakePut(URL_BASE + '/orders/'+IntToStr(APedidoID), ObjectData);
  finally
    if Assigned(TrackingData) then
      TrackingData.Free;
  end;
end;

function TAnymarket.AtualizarPedidoEnviado(APedidoID: Integer;
  ATTracking: TNewTracking): TJSONObject;
var
  ObjectData: TJSONObject;
begin
  ObjectData := TJSONObject.Create;
  try
    ObjectData.AddPair('status', TJSONString.Create(OS_PAID_WAITING_DELIVERY));
    ObjectData.AddPair('tracking', ATTracking.GetJSON);
    Result := MakePut(URL_BASE + '/orders/'+IntToStr(APedidoID), ObjectData);
  finally
    if Assigned(ObjectData) then
      ObjectData.Free;
  end;
end;

function TAnymarket.AtualizarPedidoFaturado(APedidoID: Integer;
  AInvoice: TNewInvoice; AMetadata: TNewInvoiceMetadata): TJSONObject;
var
  ObjectData: TJSONObject;
begin
  ObjectData := TJSONObject.Create;
  try
    ObjectData.AddPair('status', TJSONString.Create(OS_INVOICED));
    ObjectData.AddPair('invoice', AInvoice.GetJSON);
    ShowMessage(AInvoice.GetJSON.GetValue('date').ToString);
    ShowMessage(AInvoice.GetJSON.GetValue('accessKey').ToString);
    if Assigned(AMetadata) then
      ObjectData.AddPair('metadata', AMetadata.GetJSON);

    Result := MakePut(URL_BASE + '/orders/'+IntToStr(APedidoID), ObjectData);
  finally
    if Assigned(ObjectData) then
      ObjectData.Free;
  end;
end;

function TAnymarket.AtualizarPedidoPago(APedidoID: Integer): TJSONObject;
var
  ObjectData: TJSONObject;
begin
  ObjectData := TJSONObject.Create;
  try
    ObjectData.AddPair('status', TJSONString.Create(OS_PAID_WAITING_SHIP));
    Result := MakePut(URL_BASE + '/orders/'+IntToStr(APedidoID), ObjectData);
  finally
    if Assigned(ObjectData) then
      ObjectData.Free;
  end;

end;

constructor TAnymarket.Create(AGumga: String);
begin
  FGumga := AGumga;
end;

function TAnymarket.CriarCategoria(AName: String; APriceFactor: Integer;
  ADefinitionPriceScope: String;
  APartnerID: Integer): TJSONObject;
var
  Body: TJSONObject;
begin
  Body := TJSONObject.Create();
  try
    Body.AddPair('name', TJSONString.Create(AName));
    Body.AddPair('priceFactor', TJSONNumber.Create(APriceFactor));
    Body.AddPair('definitionPriceScope', TJSONString.Create(ADefinitionPriceScope));
    if APartnerID >= 0 then
    begin
      Body.AddPair('partnerId', TJSONString.Create(IntToStr(APartnerID)));
    end;

    Result := MakePost(URL_BASE + '/categories', Body);
  finally
    Body.Free;
  end;

end;

function TAnymarket.CriarMarca(AName, AReducedName: String;
  APartnerID: Integer): TJSONObject;
var
  Body: TJSONObject;
begin
  Body := TJSONObject.Create;
  try
    Body.AddPair('name', TJSONString.Create(AName));
    Body.AddPair('reducedName', TJSONString.Create(AReducedName));

    if APartnerID >= 0 then
    begin
      Body.AddPair('partnerId', TJSONString.Create(IntToStr(APartnerID)));
    end;

    Result := MakePost(URL_BASE + '/brands', Body);
  finally
    Body.Free;
  end;

end;

// boilerplate function to allow separation of category/subcategory creation.
function TAnymarket.CriarSubcategoria(AName: String; APriceFactor: Integer;
  ADefinitionPriceScope: String; AParentID,
  APartnerID: Integer): TJSONObject;
var
  Body: TJSONObject;
  Parent: TJSONObject;
begin
  Body := TJSONObject.Create();
  Parent := TJSONObject.Create();
  try
    Body.AddPair('name', TJSONString.Create(AName));
    Body.AddPair('priceFactor', TJSONNumber.Create(APriceFactor));
    Body.AddPair('definitionPriceScope', TJSONString.Create(ADefinitionPriceScope));

    Parent.AddPair('id', TJSONNumber.Create(AParentID));
    Body.AddPair('parent', Parent);

    if APartnerID >= 0 then
    begin
      Body.AddPair('partnerId', TJSONString.Create(IntToStr(APartnerID)));
    end;

    Result := MakePost(URL_BASE + '/categories', Body);
  finally
    Parent.Free;
  end;
end;

function TAnymarket.DetalhesPedido(APedidoID: Integer): TJSONObject;
begin
  Result := MakeGet(URL_BASE + '/orders/'+IntToStr(APedidoID));
end;

function TAnymarket.EnviarXMLNotaFiscal(APedidoID: Integer;
  AXML: String): TJSONObject;
begin
  Result := MakeRequestXML(URL_BASE + '/orders/'+ IntToStr(APedidoID)+'/nfe', AXML);
end;

function TAnymarket.ExcluirCategoria(ACategoryID: Integer): TJSONObject;
begin
  Result := MakeDELETE(URL_BASE + '/categories/' + IntToStr(ACategoryID));
end;

function TAnymarket.ExisteCategoria(APath: String): Boolean;
var
  CategoryResponse: TJSONObject;
  CategoryArray: TJSONArray;
  CategoryFlatten: TJSONArray;
  FlattenValue: TJSONValue;
  PathValue: String;
begin

  CategoryResponse := ObterTodasCategorias();

  Result := False;

  try
    if CheckResponseStatus(CategoryResponse) then
    begin
      CategoryArray := CategoryResponse.GetValue<TJSONArray>('data');
      CategoryFlatten := UtilsFlattenCategories(CategoryArray);
      for FlattenValue in CategoryFlatten do
      begin
        if (FlattenValue as TJSONObject).TryGetValue<string>('path', PathValue) then
        begin
          if LowerCase(PathValue) = LowerCase(APath) then
          begin
            Result := True;
            Break
          end;
        end;
      end;
    end;
  finally
    if Assigned(CategoryResponse) then
      CategoryResponse.Free;
  end;
end;

function TAnymarket.ExistemItensNoFeed: Boolean;
var
  JSON: TJSONObject;
  JARRAY: TJSONArray;
begin
  JSON := ObterFeed;
  if IsSuccessfulResponseCode(JSON.GetValue('response_code').Value.ToInteger) then
  begin
    JARRAY := JSON.GetValue('data') as TJSONArray;
    Result := JARRAY.Count > 0;
  end else
  begin
    raise Exception.Create('Response code points an error: ' + JSON.GetValue('response_code').Value);
  end;

end;

function TAnymarket.FiltrarPedidos(AFiltro: TOrderFilter): TJSONObject;
var
  ReqParams: TRequestParams;
  QryStr: String;
begin
  if Assigned(AFiltro) then
  begin
    QryStr := AFiltro.GetQueryString;
    //ShowMessage(URL_BASE + '/orders'+ QryStr);
    Result := MakeGET(URL_BASE + '/orders', QryStr);
  end else begin
    Result := MakeGET(URL_BASE + '/orders', ReqParams);
  end;
end;

function TAnymarket.FiltrarPedidosPaginado(
  AFiltro: TOrderFilter): TAnymarketPaginateResponse;
begin
  Result := Paginate(FiltrarPedidos(AFiltro));
end;

function TAnymarket.ExisteCategoria(APath: String; AFlatten: TJSONArray): Boolean;
var
  PathValue: String;
  FlattenedValue: TJSONValue;
begin
  Result := False;
  for FlattenedValue in AFlatten do
  begin
    if (FlattenedValue as TJSONObject).TryGetValue<string>('path', PathValue) then
    begin
      if LowerCase(PathValue) = LowerCase(APath) then
      begin
        Result := True;
        Break
      end;
    end;
  end;
end;

function TAnymarket.MakeDelete(AURL: String): TJSONObject;
var
  ReqURL: String;
begin
  ReqURL := AURL;
  Result := MakeRequest(rmDELETE, ReqURL);
end;

function TAnymarket.MakeGet(AURL: String): TJSONObject;
begin
  Result := MakeRequest(rmGET, AURL);
end;

function TAnymarket.MakeGet(AURL, AQueryString: String): TJSONObject;
var
  ReqURL: String;
begin
  ReqURL := AURL + AQueryString;
  Result := MakeRequest(rmGET, ReqURL);
end;

function TAnymarket.MakeGet(AURL: String;  AParams: TRequestParams): TJSONObject;
var
  QueryString: String;
  ReqURL: String;
begin
  if AParams.Count > 0 then
    QueryString := GetQueryString(AParams)
  else
    QueryString := '';

  ReqURL := AURL + QueryString;
  Result := MakeRequest(rmGET, ReqURL);
end;

function TAnymarket.MakePost(AURL: String; ABody: TJSONObject): TJSONObject;
begin
  Result := MakeRequest(rmPOST, AURL, ABody);
end;

function TAnymarket.MakePut(AURL: String; ABody: TJSONObject): TJSONObject;
begin
  Result := MakeRequest(rmPUT, AURL, ABody);
end;

function TAnymarket.MakeRequest(ARequestMethod: TRequestMethods; AURL: String;
  ABody: TJSONObject): TJSONObject;
var
  HTTPClient: THTTPClient;
  HTTPResponse: IHTTPResponse;
  strStream: TStringStream;
begin
  Result := TJSONObject.Create;
  HTTPClient := THTTPClient.Create();

  try
    HTTPClient.ContentType := 'application/json';
    HTTPClient.CustomHeaders['gumgaToken'] := FGumga;

    if ARequestMethod = rmGET then // GET BLOCK ----------------------------------------------
    begin

      HTTPResponse := HTTPClient.Get(AURL);

      if IsSuccessfulResponseCode(HTTPResponse.StatusCode) then
      begin
        if Length(HTTPResponse.ContentAsString) > 0 then
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
          Result.AddPair('status', 'success');
        end else begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
          Result.AddPair('status', 'success - no content');
        end;
      end else begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
        Result.AddPair('status', 'failed');
      end;

    end  // END GET BLOCK --------------------------------------------------------------------
    else if ARequestMethod = rmPOST then // POST BLOCK ---------------------------------------
    begin
      if not Assigned(ABody) then
        raise Exception.Create('Cannot POST without a body.');

        strStream := TStringStream.Create(ABody.ToString, TEncoding.UTF8);
        try
          HTTPResponse := HTTPClient.Post(AURL, strStream);
        finally
          strStream.Free;
        end;

        if IsSuccessfulResponseCode(HTTPResponse.StatusCode) then
        begin
          if Length(HTTPResponse.ContentAsString) > 0 then
          begin
            Result.AddPair('data',TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
            Result.AddPair('status', 'success');
            Result.AddPair('response_code',TJSONNumber.Create(HTTPResponse.StatusCode))
          end else begin
            Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
            Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
            Result.AddPair('status', 'success - no content');
          end;
        end else begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
          Result.AddPair('status', 'failed');
        end;

    end  // END POST BLOCK --------------------------------------------------------------
    else if ARequestMethod = rmPUT then  // PUT BLOCK -----------------------------------
    begin

      if not Assigned(ABody) then
        raise Exception.Create('Cannot PUT without a body.');
        
      strStream := TStringStream.Create(ABody.ToString, TEncoding.UTF8);
      try
        HTTPResponse := HTTPClient.Put(AURL, strStream);  
      finally
        strStream.Free;
      end;

      if IsSuccessfulResponseCode(HTTPResponse.StatusCode) then
      begin
        if HTTPResponse.ContentLength > 0 then
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('status', 'success');
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
          Result.AddPair('payload', ABody.ToString);
        end
        else
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('status', 'success - no content');
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
          Result.AddPair('payload', ABody.ToString);
        end;
      end
      else
      begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
        Result.AddPair('status', 'failed');
      end;
               
    end // END PUT BLOCK ---------------------------------------------------------------
    else if ARequestMethod = rmDELETE then   // DELETE BLOCK ---------------------------
    begin
      HTTPResponse := HTTPClient.Delete(AURL);

      if IsSuccessfulResponseCode(HTTPResponse.StatusCode) then
      begin
        if HTTPResponse.ContentLength > 0 then
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('status', 'success');
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
        end
        else
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('status', 'success - no content');
          Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
        end;
      end
      else
      begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
        Result.AddPair('status', 'failed');
      end;
    end; // END DELETE BLOCK -----------------------------------------------------------
  finally
    HTTPClient.Free();
  end;

end;

function TAnymarket.MakeRequestXML(AURL: String; AXML: String): TJSONObject;
var
  HTTPClient: THTTPClient;
  HTTPResponse: IHTTPResponse;
  strStream: TStringStream;
begin
  Result := TJSONObject.Create;
  HTTPClient := THTTPClient.Create();

  try
    HTTPClient.CustomHeaders['Content-Type'] := 'application/xml; charset=UTF-8';
    HTTPClient.CustomHeaders['gumgaToken'] := FGumga;
    strStream := TStringStream.Create(AXML);
    try
      HTTPResponse := HTTPClient.Put(AURL, strStream);
    finally
      strStream.Free;
    end;

    if IsSuccessfulResponseCode(HTTPResponse.StatusCode) then
    begin
      if HTTPResponse.ContentLength > 0 then
      begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('status', 'success');
        Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
      end
      else
      begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('status', 'success - no content');
        Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
      end;
    end
    else
    begin
      Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
      Result.AddPair('response_code', TJSONNumber.Create(HTTPResponse.StatusCode));
      Result.AddPair('status', 'failed');
    end;
  finally
    HTTPClient.Free;
  end;
end;

function TAnymarket.ObterDetalhesCategoria(ID: Integer): TJSONObject;
var
  ReqParam: TRequestParams;
begin
  Result := MakeGet(URL_BASE + '/categories/' + IntToStr(ID), ReqParam);
end;

function TAnymarket.ObterFeed(ALim: Integer): TJSONObject;
var
  ReqParam: TRequestParams;
begin
  {$IFDEF ASSERTIVEACTIVATED}
  Assert((ALim >= 5) and (ALim <= 100));
  {$ENDIF}
  ReqParam.AddItem('limit', '5');
  Result := MakeGET(URL_BASE + '/orders/feeds', ReqParam);
end;

function TAnymarket.ObterPedidosCancelados(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create.SetStatus(OS_CANCELED);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosCanceladosPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
// TODO
end;

function TAnymarket.ObterPedidosConcluidos(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create.SetStatus(OS_CONCLUDED);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosConcluidosPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
// TODO
end;

function TAnymarket.ObterPedidosEnviados(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create.SetStatus(OS_PAID_WAITING_DELIVERY);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosEnviadosPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
 // TO-DO
end;

function TAnymarket.ObterPedidosFaturados(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create.SetStatus(OS_INVOICED);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosFaturadosPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
// TODO
end;

function TAnymarket.ObterPedidosPagos(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create;
  OrderFltr.SetStatus(OS_PAID_WAITING_SHIP);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosPagosPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
// TO-DO
end;

function TAnymarket.ObterPedidosPendentes(ADataInicio,
  ADataFim: TDateTime): TJSONObject;
var
  OrderFltr: TOrderFilter;
begin
  OrderFltr := TOrderFilter.Create.SetStatus(OS_PENDING);

  if ADataInicio <> 0 then
  begin
    OrderFltr.SetCreatedAfter(ADataInicio);
  end;

  if ADataFim <> 0 then
  begin
    OrderFltr.SetCreatedBefore(ADataFim);
  end;

  if ((ADataFim <> 0) and (ADataInicio <> 0)) and (ADataFim < ADataInicio) then
    raise Exception.Create('Starting date must not be bigger than ending date.');

  Result := FiltrarPedidos(OrderFltr);
end;

function TAnymarket.ObterPedidosPendentesPaginado(ADataInicio,
  ADataFim: TDateTime): TAnymarketPaginateResponse;
begin
// TODO
end;

function TAnymarket.ObterTodasCategorias: TJSONObject;
var
  ReqParam: TRequestParams;
begin
  Result := MakeGET(URL_BASE + '/categories/fullPath', ReqParam);
end;

function TAnymarket.ObterTodasMarcas: TJSONObject;
var
  EmptyReq: TRequestParams;
begin
  // Multiple Req to complete the list with all brands.
  Result := MakeGet(URL_BASE + '/brands', EmptyReq);
end;

function TAnymarket.Paginate(AURL: String): TAnymarketPaginateResponse;
begin
  Result := Paginate(MakeGET(AURL));
end;

function TAnymarket.Paginate(
  ARawResult: TJSONObject): TAnymarketPaginateResponse;
begin
  Result := TAnymarketPaginateResponse.Create(Self, ARawResult);
end;

{ TAnymarket.TAnymarketOrderResponse }

constructor TAnymarket.TAnymarketPaginateResponse.Create(AOwner: TAnymarket;
  ARawResult: TJSONObject);
var
  DataObject: TJSONObject;
  LinksArray: TJSONArray;
  PageObject: TJSONObject;
  ContentArray: TJSONArray;
begin
  FOwner := AOwner;
  FRawResult := ARawResult;
  SetLength(FHistory, 1);
  FHistory[0] := TJSONObject(ARawResult.Clone);
  if IsSuccessfulResponseCode(ARawResult.GetValue('response_code').Value.ToInteger) then
  begin
    if ARawResult.TryGetValue('data', DataObject) then
    begin
      if DataObject.TryGetValue('content', ContentArray) then
      begin
        FTotalObtainedResults := ContentArray.Count;
      end;

      if DataObject.TryGetValue('links', LinksArray) then
      begin
        if not(LinksArray.Items[0].TryGetValue('href', FNext)) then
        begin
          FNext := '-';
        end;
      end;

      if DataObject.TryGetValue('page', PageObject) then
      begin
        PageObject.TryGetValue('size', FPageSize);
        PageObject.TryGetValue('totalElements', FTotalResults);
        PageObject.TryGetValue('totalPages', FTotalPages);
        PageObject.TryGetValue('number', FCurrentPage);
      end;

      DataObject    := nil;
      LinksArray   := nil;
      PageObject    := nil;
      ContentArray  := nil;
    end else
    begin
      raise Exception.Create('An error occured during the setup of the results.');
    end;
  end else begin
    raise Exception.Create('An error occured during the request: ' + ARawResult.GetValue('response_code').Value);
  end;


end;

function TAnymarket.TAnymarketPaginateResponse.GetEnumerator: TAnymarketOrderResponseHistoryEnumerator;
begin
  Result := TAnymarketOrderResponseHistoryEnumerator.Create(Self);
end;

function TAnymarket.TAnymarketPaginateResponse.GetHistoryItem(
  Idx: Integer): TJSONObject;
begin
  Result := FHistory[Idx];
end;

function TAnymarket.TAnymarketPaginateResponse.GetHistoryLength: Integer;
begin
  Result := Length(FHistory);
end;

function TAnymarket.TAnymarketPaginateResponse.GetRawResult: TJSONObject;
begin
  Result := FRawResult;
end;

function TAnymarket.TAnymarketPaginateResponse.GetResult: TJSONObject;
var
  DataObject: TJSONObject;
begin
  if FRawResult.TryGetValue('data', DataObject) then
  begin
    if not(DataObject.TryGetValue('content', Result)) then
    begin
      raise Exception.Create('An error occurred while trying to extract content.');
    end;

  end;

end;

function TAnymarket.TAnymarketPaginateResponse.IsEOFAlready: Boolean;
begin
  Result := (FCurrentPage = FTotalPages);
end;

function TAnymarket.TAnymarketPaginateResponse.NextPage: TAnymarketPaginateResponse;
var
  DataObject: TJSONObject;
  LinksArray: TJSONArray;
  ContentArray: TJSONArray;
  PageObject: TJSONObject;
begin
  if not IsEOFAlready and (FNext <> '-') then
  begin
    FRawResult := FOwner.MakeGet(FNext);
    SetLength(FHistory, Length(FHistory) + 1);
    FHistory[Length(FHistory) - 1] := TJSONObject(FRawResult.Clone);
    if IsSuccessfulResponseCode(FRawResult.GetValue('response_code').Value.ToInteger) then
    begin
      if FRawResult.TryGetValue('data', DataObject) then
      begin
        if DataObject.TryGetValue('links', LinksArray) then
        begin
          if not (LinksArray.Items[0].TryGetValue('href', FNext)) then
          begin
            FNext := '-';
          end;
        end;

        if DataObject.TryGetValue('page', PageObject) then
        begin
          if not PageObject.TryGetValue('number', FCurrentPage) then
          begin
            FCurrentPage := -1;
          end;

          if not PageObject.TryGetValue('size', FPageSize) then
          begin
            FPageSize := -1;
          end;
        end;
        Clipboard.AsText := FRawResult  .ToString;
        if DataObject.TryGetValue('content', ContentArray) then
        begin
          FTotalObtainedResults := FTotalObtainedResults + ContentArray.Count;
        end else begin
          raise Exception.Create('There was not content in pagination number ' + IntToStr(FCurrentPage));
        end;
      end else begin
        raise Exception.Create('There''s no data field in response JSON.');
      end;

    end else begin
      raise Exception.Create('An error occured within the request.');
    end;

  end else begin
    // Não há mais nada para aplicar paging
    raise Exception.Create('There''s nothing else to apply paging.');
  end;

  Result := Self;


end;

{ TAnymarket.TAnymarketOrderResponse.TAnymarketOrderResponseHistoryEnumerator }

constructor TAnymarket.TAnymarketPaginateResponse.TAnymarketOrderResponseHistoryEnumerator.Create(
  AList: TAnymarketPaginateResponse);
begin
  FList := AList;
  FIdx := -1;
end;

function TAnymarket.TAnymarketPaginateResponse.TAnymarketOrderResponseHistoryEnumerator.GetCurrent: TJSONObject;
begin
  Result := FList.History[FIdx];
end;

function TAnymarket.TAnymarketPaginateResponse.TAnymarketOrderResponseHistoryEnumerator.MoveNext: Boolean;
begin
  Result := FIdx < FList.HistoryLength - 1;
  if Result then
    Inc(FIdx);
end;

end.
