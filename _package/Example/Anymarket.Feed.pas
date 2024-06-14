unit Anymarket.Feed;

interface

uses
   System.SysUtils
  ,System.JSON;

type
  TAnymarketFeedItem = record
    orderId: Integer;
    feedToken: String;
    procedure Define(AOrderID: Integer; AToken:String);
  end;

  TAnymarketFeed = class
  private
    FItems: TArray<TAnymarketFeedItem>;
    function GetItem(I: integer): TAnymarketFeedItem;
    procedure SetItem(I: integer; const Value: TAnymarketFeedItem);
    function GetCount: Integer;
    type TAnymarketFeedIterator = class
    private
      FList: TAnymarketFeed;
      FIdx: Integer;
    public
      constructor Create(aList: TAnymarketFeed);
      function GetCurrent: TAnymarketFeedItem;
      function MoveNext: Boolean;
    end;
  public
    constructor Create(AArray: TJSONArray);
    function GetEnumerator: TAnymarketFeedIterator;
    property Items[I: integer]: TAnymarketFeedItem read GetItem write SetItem;
    property Count: Integer read GetCount;
  end;



implementation

{ TAnymarketFeed }

procedure TAnymarketFeedItem.Define(AOrderID: Integer; AToken: String);
begin
  Self.orderId := AOrderID;
  Self.feedToken := AToken;
end;

{ TAnymarketFeed }

constructor TAnymarketFeed.Create(AArray: TJSONArray);
var
  Idx: Integer;
begin
  SetLength(FItems, AArray.Count);
  for Idx := 0 to AArray.Count do
  begin
    FItems[Idx].orderId := (AArray.Items[Idx] as TJSONObject).GetValue('id').Value.ToInteger;
    FItems[Idx].feedToken := (AArray.Items[Idx] as TJSONObject).GetValue('token').Value;
  end;
end;

function TAnymarketFeed.GetCount: Integer;
begin
  Result := Length(FItems);
end;

function TAnymarketFeed.GetEnumerator: TAnymarketFeedIterator;
begin
  Result := TAnymarketFeedIterator.Create(Self);
end;

function TAnymarketFeed.GetItem(I: integer): TAnymarketFeedItem;
begin
  Result := FItems[I];
end;

procedure TAnymarketFeed.SetItem(I: integer;
  const Value: TAnymarketFeedItem);
begin
  if (I >= 0) and (I < Length(FItems)) then
    FItems[I] := Value
  else
    raise Exception.Create('Index out of bounds');
end;

{ TAnymarketFeed.TAnymarketFeedIterator }

constructor TAnymarketFeed.TAnymarketFeedIterator.Create(
  aList: TAnymarketFeed);
begin
  FList := aList;
  FIdx := -1;
end;

function TAnymarketFeed.TAnymarketFeedIterator.GetCurrent: TAnymarketFeedItem;
begin
  Result := FList.Items[FIdx];
end;

function TAnymarketFeed.TAnymarketFeedIterator.MoveNext: Boolean;
begin
  Result := FIdx < (FList.Count - 1);
  if Result then
    Inc(FIdx);
end;

end.
