unit Anymarket.Utils;

interface

uses
   System.SysUtils
  ,System.DateUtils
  ,Anymarket.Constants;

type
  // Tipo que encapsula filtro para pedidos
  TOrderFilter = class
  private type
    ADDED_FIELDS = (adCreatedAfter, adCreatedBefore, adLimit, adMarketplaceId,
      adMarketplace, adOffset, adSort, adSortDirection, adIncludeQuoteID,
      adStatus);
  private
    FUsedFields: TArray<ADDED_FIELDS>;
    FCreatedAfter: string;
    FCreatedBefore: string;
    FLimit: Integer;
    FMarketplaceID: string;
    FOffset: Int64;
    FSort: string;
    FSortDirection: string;
    FIncludeQuoteID: string;
    FMarketplace: string;
    FStatus: string;
    function GetCreatedAfterProp: TDateTime;
    function GetCreatedAfterPropSTR: string;
    function GetCreatedBeforeProp: TDateTime;
    function GetCreatedBeforePropSTR: string;
    function GetIncludeQuoteIdProp: string;
    function GetLimitProp: Integer;
    function GetMarketplaceIdProp: string;
    function GetMarketplaceProp: string;
    function GetOffsetProp: Int64;
    function GetSortDirectionProp: string;
    function GetSortProp: string;
    function GetStatusProp: string;
    function AlreadyIn(AValue: TOrderFilter.ADDED_FIELDS): Boolean;
    function IdxOf(AValue: TOrderFilter.ADDED_FIELDS): Integer;
  public
    constructor Create;
    function SetCreatedAfter(AValue: TDateTime): TOrderFilter;
    function SetCreatedBefore(AValue: TDateTime): TOrderFilter;
    function SetLimit(AValue: Integer): TOrderFilter;
    function SetMarketplaceId(AValue: String): TOrderFilter;
    function SetOffset(AValue: Integer): TOrderFilter;
    function SetSort(AValue: String): TOrderFilter;
    function SetSortDirection(AValue: String): TOrderFilter;
    function SetIncludeQuoteId(AValue: String): TOrderFilter;
    function SetStatus(AValue:String): TOrderFilter;
    function Reset: TOrderFilter;
    function GetQueryString: String;
    property createdAfter: TDateTime read GetCreatedAfterProp;
    property createdBefore: TDateTime read GetCreatedBeforeProp;
    property createdAfterStr: string read GetCreatedAfterPropSTR;
    property createdBeforeStr: string read GetCreatedBeforePropSTR;
    property limit: Integer read GetLimitProp;
    property marketplaceId: string read GetMarketplaceIdProp;
    property offset: Int64 read GetOffsetProp;
    property sort: String read GetSortProp;
    property sortDirection: string read GetSortDirectionProp;
    property includeQuoteId: string read GetIncludeQuoteIdProp;
    property marketplace: string read GetMarketplaceProp;
    property status: string read GetStatusProp;
  end;

  function IsValidOrderStatus(AStatus: String): Boolean;

implementation

function IsValidOrderStatus(AStatus: String): Boolean;
var
  Elm: String;
begin
  for Elm in ANY_ORDER_STATUS do
  begin
    Result := AStatus = Elm;
    if Result then
      break;
  end;
end;

{ TOrderFilter }

function TOrderFilter.AlreadyIn(AValue: TOrderFilter.ADDED_FIELDS): boolean;
var
  addedFld: ADDED_FIELDS;
begin
  Result := False;
  for addedFld in FUsedFields do
  begin
    Result := (addedFld = AValue);
    if Result then
      break;
  end;
end;

constructor TOrderFilter.Create;
begin
  FCreatedAfter := '-';
  FCreatedBefore := '-';
  FLimit := -1;
  FMarketplaceID := '-';
  FOffset := -1;
  FSort := '-';
  FSortDirection := '-';
  FIncludeQuoteID := '-';
  SetLength(FUsedFields, 0)
end;

function TOrderFilter.GetCreatedAfterProp: TDateTime;
begin
  if AlreadyIn(adCreatedAfter) then
    Result := ISO8601ToDate(FCreatedAfter)
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetCreatedAfterPropSTR: string;
begin
  if AlreadyIn(adCreatedAfter) then
    Result := FCreatedAfter
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetCreatedBeforeProp: TDateTime;
begin
  if AlreadyIn(adCreatedBefore) then
    Result := ISO8601ToDate(FCreatedBefore)
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetCreatedBeforePropSTR: string;
begin
  if AlreadyIn(adCreatedBefore) then
    Result := FCreatedBefore
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetIncludeQuoteIdProp: string;
begin
  if AlreadyIn(adIncludeQuoteID) then
    Result := FIncludeQuoteID
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetLimitProp: Integer;
begin
  if AlreadyIn(adLimit) then
    Result := FLimit
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetMarketplaceIdProp: string;
begin
  if AlreadyIn(adMarketplaceId) then
    Result := FMarketplaceID
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetMarketplaceProp: string;
begin
  if AlreadyIn(adMarketplace) then
    Result := FMarketplace
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetOffsetProp: Int64;
begin
  if AlreadyIn(adOffset) then
    Result := FOffset
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetQueryString: String;
var
  addFld: ADDED_FIELDS;
begin
  if Length(FUsedFields) > 0 then
  begin
    Result := '?';
    for addFld in FUsedFields do
    begin
      if (IdxOf(addFld) > 0) and (IdxOf(addFld) <= (Length(FUsedFields) - 2)) then
        Result := Result + '&';

      case addFld of
        adCreatedAfter:         Result := Result + 'createdAfter='    +          FCreatedAfter;
        adCreatedBefore:        Result := Result + 'createdBefore='   +          FCreatedBefore;
        adLimit:                Result := Result + 'limit='           + IntToStr(FLimit);
        adMarketplaceId:        Result := Result + 'marketplaceId='   +          FMarketplaceId ;
        adMarketplace:          Result := Result + 'marketplace='     +          FMarketplace ;
        adOffset:               Result := Result + 'offset='          + IntToStr(FOffset) ;
        adSort:                 Result := Result + 'sort='            +          FSort ;
        adSortDirection:        Result := Result + 'sortDirection='   +          FSortDirection ;
        adIncludeQuoteID:       Result := Result + 'includeQuoteId='  +          FIncludeQuoteID;
        adStatus:               Result := Result + 'status='          +          FStatus ;
      end;

    end;
  end else
  begin
    Result := '';
  end;
end;

function TOrderFilter.GetSortDirectionProp: string;
begin
  if AlreadyIn(adSortDirection) then
    Result := FSortDirection
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetSortProp: string;
begin
  if AlreadyIn(adSort) then
    Result := FSort
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.GetStatusProp: string;
begin
  if AlreadyIn(adStatus) then
    Result := FStatus
  else
    raise Exception.Create('Filter not set.');
end;

function TOrderFilter.IdxOf(AValue: TOrderFilter.ADDED_FIELDS): Integer;
var
  Idx: Integer;
begin
  Result := -1;
  for Idx := 0 to Length(FUsedFields) do
  begin
    if FUsedFields[Idx] = AValue then
    begin
      Result := Idx;
      break;
    end;
  end;

end;

function TOrderFilter.Reset: TOrderFilter;
begin
  FCreatedAfter := '-';
  FCreatedBefore := '-';
  FLimit := -1;
  FMarketplaceID := '-';
  FOffset := -1;
  FSort := '-';
  FSortDirection := '-';
  FIncludeQuoteID := '-';
  SetLength(FUsedFields, 0);
end;

function TOrderFilter.SetCreatedAfter(AValue: TDateTime): TOrderFilter;
begin
  if not AlreadyIn(adCreatedAfter) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adCreatedAfter;
    FCreatedAfter := DateToISO8601(AValue);
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetCreatedBefore(AValue: TDateTime): TOrderFilter;
begin
  if not AlreadyIn(adCreatedBefore) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adCreatedBefore;
    FCreatedBefore := DateToISO8601(AValue);
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetIncludeQuoteId(AValue: String): TOrderFilter;
begin
  if not AlreadyIn(adIncludeQuoteID) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adIncludeQuoteID;
    FIncludeQuoteID := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetLimit(AValue: Integer): TOrderFilter;
begin
  if not AlreadyIn(adLimit) and ((AValue >= 5) or (AValue <= 100)) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adLimit;
    FLimit := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetMarketplaceId(AValue: String): TOrderFilter;
begin
  if not AlreadyIn(adMarketplaceId) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adMarketplaceId;
    FMarketplaceID := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetOffset(AValue: Integer): TOrderFilter;
begin
  if not AlreadyIn(adOffset) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adOffset;
    FOffset := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetSort(AValue: String): TOrderFilter;
begin
  if not AlreadyIn(adSort) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adSort;
    FSort := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetSortDirection(AValue: String): TOrderFilter;
begin
  if not AlreadyIn(adSort) and ((AValue = SD_ASC) or (AValue = SD_DESC)) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := adSort;
    FSort := AValue;
  end;
  Result := Self; // Allows Chaining
end;

function TOrderFilter.SetStatus(AValue: String): TOrderFilter;
begin
  if not AlreadyIn(adStatus) then
  begin
    if IsValidOrderStatus(AValue) then
    begin
      SetLength(FUsedFields, Length(FUsedFields) + 1);
      FUsedFields[Length(FUsedFields) - 1] := adStatus;
      FStatus := AValue;
    end else begin
      raise Exception.Create('Invalid Order Status.');
    end;
  end;


end;

end.
