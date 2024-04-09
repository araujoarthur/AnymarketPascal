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
  private
    FGumga: string;
    function MakeRequest(ARequestMethod: TRequestMethods; AURL: String; ABody: TJSONObject = nil): TJSONObject;
  public
    function MakePost(AURL: String; ABody: TJSONObject): TJSONObject;   // In the future it'll be made protected
    function MakeGet(AURL: String; AParams: TRequestParams): TJSONObject; // In the future it'll be made protected
    function MakePut(AURL: String; ABody: TJSONObject): TJSONObject;  // In the future it'll be made protected

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
