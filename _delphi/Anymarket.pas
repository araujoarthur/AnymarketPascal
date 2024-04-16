unit Anymarket;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.JSON,
  Core.Utils;

type
  TRequestMethods = (rmGET, rmPOST, rmPUT, rmDELETE);

  TAnymarket = class
  private const
    URL_BASE = 'http://sandbox-api.anymarket.com.br/v2';
  private
    FGumga: string;
    function MakeRequest(ARequestMethod: TRequestMethods; AURL: String; ABody: TJSONObject = nil): TJSONObject;
  public
    function MakePost(AURL: String; ABody: TJSONObject): TJSONObject;   // In the future it'll be made protected
    function MakeGet(AURL: String; AParams: TRequestParams): TJSONObject; // In the future it'll be made protected
    function MakePut(AURL: String; ABody: TJSONObject): TJSONObject;  // In the future it'll be made protected

     { All the handlers currently return the raw body of the JSON response. In a future they will be filtered for errors and return proper types (boolean, string, integer, whatever is needed)}

    // ### Category Handlers ###

    // Creates a category with or without a related partnerId
    function CriarCategoria(AName: String; APriceFactor: Integer; ADefinitionPriceScope: TDefinitionPriceScope; APartnerID: Integer = -1): TJSONObject;
    // Creates a subcategory with or without a related partnerId, mostly boilerplate code from CriarCategoria, used only to allow separation between category and subcategory creation
    function CriarSubcategoria(AName: String; APriceFactor: Integer; ADefinitionPriceScope: TDefinitionPriceScope; AParentID: Integer; APartnerID: Integer = -1): TJSONObject;

    // ### Brand Handlers ###

    // Creates a brand and return the json from the request.
    function CriarMarca(AName: String; AReducedName: String; APartnerID: Integer = -1): TJSONObject;
    constructor Create(AGumga: String);
  end;

implementation

uses
  Vcl.Dialogs; // remove in a future.

{ TAnymarket }

constructor TAnymarket.Create(AGumga: String);
begin
  FGumga := AGumga;
end;

function TAnymarket.CriarCategoria(AName: String; APriceFactor: Integer;
  ADefinitionPriceScope: TDefinitionPriceScope;
  APartnerID: Integer): TJSONObject;
var
  Body: TJSONObject;
begin
  Body := TJSONObject.Create();
  try
    Body.AddPair('name', TJSONString.Create(AName));
    Body.AddPair('priceFactor', TJSONNumber.Create(APriceFactor));
    Body.AddPair('definitionPriceScope', TJSONString.Create(MapDPS(ADefinitionPriceScope)));
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
      Body.AddPair('partnerId', IntToStr(APartnerID));
    end;

    Result := MakePost(URL_BASE + '/brands', Body);
  finally
    Body.Free;
  end;

end;

// boilerplate function to allow separation of category/subcategory creation.
function TAnymarket.CriarSubcategoria(AName: String; APriceFactor: Integer;
  ADefinitionPriceScope: TDefinitionPriceScope; AParentID,
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
    Body.AddPair('definitionPriceScope', TJSONString.Create(MapDPS(ADefinitionPriceScope)));

    Parent.AddPair('id', AParentID);
    Body.AddPair('parent', Parent);

    if APartnerID >= 0 then
    begin
      Body.AddPair('partnerId', TJSONString.Create(IntToStr(APartnerID)));
    end;

    Result := MakePost(URL_BASE + '/categories', Body);
  finally
    Parent.Free;
    Body.Free;
  end;
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
  Result := MakeRequest(rmPOST, AURL, ABody);
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
          Result.AddPair('response_code', HTTPResponse.StatusCode);
          Result.AddPair('status', 'success');
        end else begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('response_code', HTTPResponse.StatusCode);
          Result.AddPair('status', 'success - no content');
        end;
      end else begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('response_code', HTTPResponse.StatusCode);
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
            Result.AddPair('response_code', HTTPResponse.StatusCode)
          end else begin
            Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
            Result.AddPair('response_code', HTTPResponse.StatusCode);
            Result.AddPair('status', 'success - no content');
          end;
        end else begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('response_code', HTTPResponse.StatusCode);
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
          Result.AddPair('response_code', HTTPResponse.StatusCode);
        end
        else
        begin
          Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
          Result.AddPair('status', 'success - no content');
          Result.AddPair('response_code', HTTPResponse.StatusCode);
        end;
      end 
      else
      begin
        Result.AddPair('data', TJSONObject.ParseJSONValue(HTTPResponse.ContentAsString()));
        Result.AddPair('response_code', HTTPResponse.StatusCode);
        Result.AddPair('status', 'failed');
      end;
               
    end; // END PUT BLOCK ---------------------------------------------------------------

  finally
    HTTPClient.Free();
  end;

end;

end.
