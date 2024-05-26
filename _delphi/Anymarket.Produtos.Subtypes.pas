unit Anymarket.Produtos.Subtypes;

interface

uses System.JSON, System.Classes, System.SysUtils, Core.Bitfield, Core.Utils;

type
  ISerializableToJSON = Interface
  ['{6A623FF2-A0BE-4B37-9D62-E5B2A5496620}']
    function SerializeToJSON: TJSONValue;
  end;

  // BuildableFromJson is yet to be implemented. Can receive a json and recreate the object.
  IBuildableFromJSON = Interface
    procedure BuildFromJson;
  end;

  TCharacteristic = class(TInterfacedObject, ISerializableToJSON) // Unitary Element
  private
    FName: String;
    FValue: String;
    function GetName: String;
    function GetValue: String;
  public
    function SerializeToJSON: TJSONValue;
    property Value: String read GetValue;
    property Name: String read GetName;
    constructor Create(AName, AValue: String);
  end;

  TImageItem = class(TInterfacedObject, ISerializableToJSON) // Unitary Element
  private
    FBitField: TBitField32;
    
    FID: Integer;
    FIndex: Integer;
    FMain: Boolean;  // REQ
    FURL: String;  // REQ
    FThumbnailURL: String;
    FLowResolutionURL: String;
    FStandardURL: String;
    FOriginalImage: String;
    FVariation: String; // Indica a qual variação a imagem pertence.
    FStatus: String; //UNPROCESSED, PROCESSED, ERROR;
    FStatusMessage: String;
    FStandardWidth: Double;
    FStandardHeight: Double;
    FOriginalWidth: Double;
    FOriginalHeight: Double;
    function GetID: Integer;
    function GetIndex: Integer;
    function GetLowResolutionURL: String;
    function GetMain: Boolean;
    function GetOriginalHeight: Double;
    function GetOriginalImage: String;
    function GetOriginalWidth: Double;
    function GetStandardHeight: Double;
    function GetStandardURL: String;
    function GetStandardWidth: Double;
    function GetStatus: String;
    function GetStatusMessage: String;
    function GetThumbnailURL: String;
    function GetURL: String;
    function GetVariation: String;
    procedure SetID(const Value: Integer);
    procedure SetIndex(const Value: Integer);
    procedure SetLowResolutionURL(const Value: String);
    procedure SetMain(const Value: Boolean);
    procedure SetOriginalHeight(const Value: Double);
    procedure SetOriginalImage(const Value: String);
    procedure SetOriginalWidth(const Value: Double);
    procedure SetStandardHeight(const Value: Double);
    procedure SetStandardURL(const Value: String);
    procedure SetStandardWidth(const Value: Double);
    procedure SetStatus(const Value: String);
    procedure SetStatusMessage(const Value: String);
    procedure SetThumbnailURL(const Value: String);
    procedure SetURL(const Value: String);
    procedure SetVariation(const Value: String);
    const
      bfHasSetID                  = 1 shl 0;
      bfHasSetIndex               = 1 shl 1;
      bfHasSetMain                = 1 shl 2;  // REQ
      bfHasSetURL                 = 1 shl 3;  // REQ
      bfHasSetThumbnailURL        = 1 shl 4;
      bfHasSetLowResolutionURL    = 1 shl 5;
      bfHasSetStandardURL         = 1 shl 6;
      bfHasSetOriginalImage       = 1 shl 7;
      bfHasSetVariation           = 1 shl 8; // Indica a qual variação a imagem pertence.
      bfHasSetStatus              = 1 shl 9; //UNPROCESSED, PROCESSED, ERROR;
      bfHasSetStatusMessage       = 1 shl 10;
      bfHasSetStandardWidth       = 1 shl 11;
      bfHasSetStandardHeight      = 1 shl 12;
      bfHasSetOriginalWidth       = 1 shl 13;
      bfHasSetOriginalHeight      = 1 shl 14;
  public
    constructor Create;
    function SerializeToJSON: TJSONValue;
    function CheckRequirements: Boolean;
    property ID: Integer read GetID write SetID;
    property Idx: Integer read GetIndex write SetIndex;
    property Main: Boolean read GetMain write SetMain;  // REQ
    property URL: String read GetURL write SetURL; // REQ
    property ThumbnailURL: String read GetThumbnailURL write SetThumbnailURL;
    property LowResolutionURL: String read GetLowResolutionURL write SetLowResolutionURL;
    property StandardURL: String read GetStandardURL write SetStandardURL;
    property OriginalImage: String read GetOriginalImage write SetOriginalImage;
    property Variation: String read GetVariation write SetVariation; // Indica a qual variação a imagem pertence.
    property Status: String read GetStatus write SetStatus; //UNPROCESSED, PROCESSED, ERROR;
    property StatusMessage: String read GetStatusMessage write SetStatusMessage;
    property StandardWith: Double read GetStandardWidth write SetStandardWidth;
    property StandardHeight: Double read GetStandardHeight write SetStandardHeight;
    property OriginalWidth: Double read GetOriginalWidth write SetOriginalWidth;
    property OriginalHeight: Double read GetOriginalHeight write SetOriginalHeight;
  end;

  TSKUObject = class(TInterfacedObject, ISerializableToJSON) // Unitary Element
  private
    FBitfield: TBitField32;

    FID: Integer;
    FTitle: String; //REQ
    FPartnerID: String; //REQ
    FEAN: String;
    FAmount: Double; //REQ
    FAdditionalTime: Double; // Tempo adicional para preparo em dias.  //REQ
    FPrice: Double; //REQ
    FSellPrice: Double;    //REQ
    FStockLocalId: Integer;
    FVariations: TJSONObject;
    FAdditionalStocks: TJSONArray;
    FExternalID: String;
    FActive: Boolean;
    FVolumes: Double;
  private const
    bfHasSetID               = 1 shl 0;
    bfHasSetTitle            = 1 shl 1;
    bfHasSetPartnerID        = 1 shl 2;
    bfHasSetEAN              = 1 shl 3;
    bfHasSetAmount           = 1 shl 4;
    bfHasSetAdditionalTime   = 1 shl 5;
    bfHasSetPrice            = 1 shl 6;
    bfHasSetSellPrice        = 1 shl 7;
    bfHasSetStockLocalId     = 1 shl 8;
    bfHasSetVariations       = 1 shl 9;
    bfHasSetAdditionalStocks = 1 shl 10;
    bfHasSetExternalID       = 1 shl 11;
    bfHasSetActive           = 1 shl 12;
    bfHasSetVolumes          = 1 shl 13;

    function GetAdditionalTime: Double;
    function GetAmount: Double;
    function GetEAN: String;
    function GetID: Integer;
    function GetPartnerID: String;
    function GetPrice: Double;
    function GetSellPrice: Double;
    function GetStockLocalId: Integer;
    function GetTitle: String;
    procedure SetAdditionalTime(const Value: Double);
    procedure SetAmount(const Value: Double);
    procedure SetEAN(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetPartnerID(const Value: String);
    procedure SetPrice(const Value: Double);
    procedure SetSellPrice(const Value: Double);
    procedure SetStockLocalId(const Value: Integer);
    procedure SetTitle(const Value: String);
    function GetActive: Boolean;
    function GetExternalId: String;
    function GetVolumes: Double;
    procedure SetActive(const Value: Boolean);
    procedure SetExternalId(const Value: String);
    procedure SetVolumes(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddVariation(AName, AValue: String); overload;
    procedure AddVariation(AName: String; AValue: TJSONNumber); overload;
    procedure AddVariation(AName: String; AValue: TJSONBool);  overload;
    procedure AddVariation(AName: String; AValue: Double); overload;
    procedure AddVariation(AName: String; AValue: Integer); overload;
    procedure AddVariation(AName: String; AValue: Boolean); overload;
    
    function GetVariation(AName: String): TJSONValue;
    procedure RemoveVariation(AName: String);
    procedure AddAdditionalStock(AStockLocalID: Integer; APrice, AAmount,AAdittionalTime: Double);
    procedure RemoveAdditionalStock(AIdx: Integer);
    function GetAdditionalStock(AIdx: Integer): TJSONObject;
    function CheckRequirements: Boolean;
    function SerializeToJSON: TJSONValue;

    property ID: Integer read GetID write SetID;
    property Title: String read GetTitle write SetTitle;
    property PartnerID: String read GetPartnerID write SetPartnerID;
    property EAN: String read GetEAN write SetEAN;
    property Amout: Double read GetAmount write SetAmount;
    property AdditionalTime: Double read GetAdditionalTime write SetAdditionalTime;
    property Price: Double read GetPrice write SetPrice;
    property SellPrice: Double read GetSellPrice write SetSellPrice;
    property StockLocalId: Integer read GetStockLocalId write SetStockLocalId;
    property ExternalId: String read GetExternalId write SetExternalId;
    property Active: Boolean read GetActive write SetActive;
    property Volumes: Double read GetVolumes write SetVolumes;
  end;

  TKitComponent = class(TInterfacedObject, ISerializableToJSON)   // Unitary Element
  private
    FBitfield: TBitfield32;
    
    FIdSku: string;
    FStockLocalId: string;
    FPercentage: Double;
    FQuantity: Double;
    FIsMainComponent: Boolean;
  private const
    bfHasSetIdSku                 = 1 shl 0;
    bfHasSetStockLocalId          = 1 shl 1;
    bfHasSetPercentage            = 1 shl 2;
    bfHasSetQuantity              = 1 shl 3;
    bfHasSetIsMainComponent       = 1 shl 4;
    function GetIsMainComponent: Boolean;
    function GetPercentage: Double;
    function GetQuantity: Double;
    function GetSkuID: string;
    function GetStockLocalId: string;
    procedure SetIsMainComponent(const Value: Boolean);
    procedure SetPercentage(const Value: Double);
    procedure SetQuantity(const Value: Double);
    procedure SetSkuID(const Value: string);
    procedure SetStockLocalId(const Value: string);
  public
    constructor Create;
    function SerializeTOJson: TJSONValue;

    property SkuID: string read GetSkuID write SetSkuID;
    property StockLocalId: string read GetStockLocalId write SetStockLocalId;
    property Percentage: Double read GetPercentage write SetPercentage;
    property Quantity: Double read GetQuantity write SetQuantity;
    property IsMainComponent: Boolean read GetIsMainComponent write SetIsMainComponent;
  end;

  TWrapperArray<T: ISerializableToJSON> = class // Encapsulating element.
  private
  
    FItems: array of T;
    function GetItem(I: Integer): T;
    procedure SetItem(I: Integer; const Value: T);
    function GetLengthCount: Integer;

  type
    TWrapperEnumerator = class
    private
      FIdx: Integer;
      FArray: TWrapperArray<T>;
    public
      constructor Create(AArray: TWrapperArray<T>);
      function MoveNext: Boolean;
      function GetCurrent:T;

      property Current: T read GetCurrent;
    end;

  public
    constructor Create;

    procedure AddItem(AItem: T);
    function GetEnumerator: TWrapperEnumerator;
    function SerializeToJSONArray: TJSONArray;
    property Count: Integer read GetLengthCount;
    property Items[I: Integer]: T read GetItem write SetItem;
  end;

  

implementation

uses
  Vcl.Dialogs;

{ TCharacteristic }

constructor TCharacteristic.Create(AName, AValue: String);
begin
  FName := AName;
  FValue := AValue;
end;

function TCharacteristic.GetName: String;
begin
  Result := FName;
end;

function TCharacteristic.GetValue: String;
begin
  Result := FValue;
end;

function TCharacteristic.SerializeToJSON: TJSONValue;
var
  JSONCharacteristicObject: TJSONObject;
begin
  JSONCharacteristicObject := TJSONObject.Create;
  JSONCharacteristicObject.AddPair('name', TJSONString.Create(FName));
  JSONCharacteristicObject.AddPair('value', TJSONString.Create(FValue));
  Result := TJSONValue(JSONCharacteristicObject);
end;

{ TCharacteristicArray }

procedure TWrapperArray<T>.AddItem(
  AItem: T);
var
  OldLen: Integer;
begin
  OldLen := Length(FItems);
  SetLength(FItems, OldLen + 1);

  FItems[OldLen] := AItem;  // ACharac nao precisa ser finalizada pelo usuario pois será gerenciada pela lista.
end;

constructor TWrapperArray<T>.Create;
begin
  inherited;
  SetLength(FItems, 0);
end;

function TWrapperArray<T>.GetEnumerator: TWrapperEnumerator;
begin
  Result := TWrapperEnumerator.Create(Self);
end;

function TWrapperArray<T>.GetItem(I: Integer): T;
begin
  if (I >= 0) and (I < Length(FItems)) then
  begin
    Result := FItems[I];
  end else
  begin
    raise Exception.Create('Item out of bounds');
  end;

end;

function TWrapperArray<T>.GetLengthCount: Integer;
begin
  Result := Length(FItems);
end;

function TWrapperArray<T>.SerializeToJSONArray: TJSONArray;
var
  Itm: T;
begin
  Result := TJSONArray.Create;
  for Itm in FItems do
  begin
    Result.AddElement(Itm.SerializeToJSON())
  end;
end;

procedure TWrapperArray<T>.SetItem(I: Integer;
  const Value: T);
begin
    if (I > 0) and (I < Length(FItems)) then
  begin
    FItems[I] := Value
  end else
  begin
    raise Exception.Create('Item out of bounds');
  end;
end;

{ TWrapperArray<T>.TWrapperEnumerator }

constructor TWrapperArray<T>.TWrapperEnumerator.Create(AArray: TWrapperArray<T>);
begin
  FIdx := -1;
  FArray := AArray;
end;

function TWrapperArray<T>.TWrapperEnumerator.GetCurrent: T;
begin
  Result := FArray.Items[FIdx];
end;

function TWrapperArray<T>.TWrapperEnumerator.MoveNext: Boolean;
begin
  Inc(FIdx);
  Result := FIdx < FArray.Count;
end;

{ TImageItem }

function TImageItem.CheckRequirements: Boolean;
begin
  Result := False;
  if FBitField.IsBitSet(bfHasSetMain) and FBitField.IsBitSet(bfHasSetURL) then
    Result := True;
end;

constructor TImageItem.Create;
begin
  FID := -1;
  FIndex := -1;
  FMain := False;  // REQ
  FURL := '';  // REQ
  FThumbnailURL := '';
  FLowResolutionURL := '';
  FStandardURL := '';
  FOriginalImage := '';
  FVariation := ''; // Indica a qual variação a imagem pertence.
  FStatus := ''; //UNPROCESSED, PROCESSED, ERROR;
  FStatusMessage := '';
  FStandardWidth := 0.0;
  FStandardHeight := 0.0;
  FOriginalWidth := 0.0;
  FOriginalHeight := 0.0;
end;

function TImageItem.GetID: Integer;
begin
  Result := FID;
end;

function TImageItem.GetIndex: Integer;
begin
  Result := FIndex;
end;

function TImageItem.GetLowResolutionURL: String;
begin
  Result := FLowResolutionURL;
end;

function TImageItem.GetMain: Boolean;
begin
  Result := FMain;
end;

function TImageItem.GetOriginalHeight: Double;
begin
  Result := FOriginalHeight;
end;

function TImageItem.GetOriginalImage: String;
begin
  Result := FOriginalImage;
end;

function TImageItem.GetOriginalWidth: Double;
begin
  Result := FOriginalWidth;
end;

function TImageItem.GetStandardHeight: Double;
begin
  Result := FStandardHeight;
end;

function TImageItem.GetStandardURL: String;
begin
  Result := FStandardURL;
end;

function TImageItem.GetStandardWidth: Double;
begin
  Result := FStandardWidth;
end;

function TImageItem.GetStatus: String;
begin
  Result := FStatus;
end;

function TImageItem.GetStatusMessage: String;
begin
  Result := FStatusMessage;
end;

function TImageItem.GetThumbnailURL: String;
begin
  Result := FThumbnailURL;
end;

function TImageItem.GetURL: String;
begin
  Result := FURL;
end;

function TImageItem.GetVariation: String;
begin
  Result := FVariation;
end;

function TImageItem.SerializeToJSON: TJSONValue;
var
  ResultObject: TJSONObject;
begin
  Result := nil;
  if CheckRequirements then
  begin
    ResultObject := TJSONObject.Create;
    ResultObject.AddPair('main', TJSONBool.Create(FMain));
    ResultObject.AddPair('url', TJSONString.Create(FURL));


    if FBitField.IsBitSet(bfHasSetID) then
      ResultObject.AddPair('id', TJSONNumber.Create(FID));

    if FBitField.IsBitSet(bfHasSetIndex) then
      ResultObject.AddPair('index', TJSONNumber.Create(FIndex));

    if FBitField.IsBitSet(bfHasSetThumbnailURL) then
      ResultObject.AddPair('thumbnailUrl', TJSONString.Create(FThumbnailURL));

    if FBitField.IsBitSet(bfHasSetLowResolutionURL) then
      ResultObject.AddPair('lowResolutionUrl', TJSONString.Create(FLowResolutionURL));

    if FBitField.IsBitSet(bfHasSetStandardURL) then
      ResultObject.AddPair('standardUrl', TJSONString.Create(FStandardURL));

    if FBitField.IsBitSet(bfHasSetOriginalImage) then
      ResultObject.AddPair('originalImage', TJSONString.Create(FOriginalImage));

    if FBitField.IsBitSet(bfHasSetVariation) then
      ResultObject.AddPair('variation', TJSONString.Create(FVariation));

    if FBitField.IsBitSet(bfHasSetStatus) then
    begin
      if (Uppercase(FStatus.Trim) = 'UNPROCESSED') or (Uppercase(FStatus.Trim) = 'PROCESSED') or (Uppercase(FStatus.Trim) = 'ERROR') then
        ResultObject.AddPair('status', TJSONString.Create(FStatus));
    end;

    if FBitField.IsBitSet(bfHasSetStatusMessage) then
      ResultObject.AddPair('statusMessage', TJSONString.Create(FStatusMessage));

    if FBitField.IsBitSet(bfHasSetStandardWidth) then
      ResultObject.AddPair('standardWidth', TJSONNumber.Create(FStandardWidth));

    if FBitField.IsBitSet(bfHasSetStandardHeight) then
      ResultObject.AddPair('standardHeight', TJSONNumber.Create(FStandardHeight));

    if FBitField.IsBitSet(bfHasSetOriginalWidth) then
      ResultObject.AddPair('originalWidth', TJSONNumber.Create(FOriginalWidth));

    if FBitField.IsBitSet(bfHasSetOriginalHeight) then
      ResultObject.AddPair('originalHeight',TJSONNumber.Create(FOriginalHeight));

    Result := TJSONValue(ResultObject);

  end;
end;

procedure TImageItem.SetID(const Value: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetID) then
  begin
    FID := Value;
    FBitField.SetBit(bfHasSetID);
  end;
end;

procedure TImageItem.SetIndex(const Value: Integer);
begin
  if not FBitField.IsBitSet(bfHasSetIndex) then
  begin
    FIndex := Value;
    FBitField.SetBit(bfHasSetIndex);
  end;
end;

procedure TImageItem.SetLowResolutionURL(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetLowResolutionURL) then
  begin
    FLowResolutionURL := Value;
    FBitField.SetBit(bfHasSetLowResolutionURL);
  end;
end;

procedure TImageItem.SetMain(const Value: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetMain) then
  begin
    FMain := Value;
    FBitField.SetBit(bfHasSetMain);
  end;
end;

procedure TImageItem.SetOriginalHeight(const Value: Double);
begin
  if not FBitField.IsBitSet(bfHasSetOriginalHeight) then
  begin
    FOriginalHeight := Value;
    FBitField.SetBit(bfHasSetOriginalHeight);
  end;
end;

procedure TImageItem.SetOriginalImage(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetOriginalImage) then
  begin
    FOriginalImage := Value;
    FBitField.SetBit(bfHasSetOriginalImage);
  end;
end;

procedure TImageItem.SetOriginalWidth(const Value: Double);
begin
  if not FBitField.IsBitSet(bfHasSetOriginalWidth) then
  begin
    FOriginalWidth := Value;
    FBitField.SetBit(bfHasSetOriginalWidth);
  end;
end;

procedure TImageItem.SetStandardHeight(const Value: Double);
begin
  if not FBitField.IsBitSet(bfHasSetStandardHeight) then
  begin
    FStandardHeight := Value;
    FBitField.SetBit(bfHasSetStandardHeight);
  end;
end;

procedure TImageItem.SetStandardURL(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetStandardURL) then
  begin
    FStandardURL := Value;
    FBitField.SetBit(bfHasSetStandardURL);
  end;
end;

procedure TImageItem.SetStandardWidth(const Value: Double);
begin
  if not FBitField.IsBitSet(bfHasSetStandardWidth) then
  begin
    FStandardWidth := Value;
    FBitField.SetBit(bfHasSetStandardWidth);
  end;
end;

procedure TImageItem.SetStatus(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetStatus) then
  begin
    FStatus := Value;
    FBitField.SetBit(bfHasSetStatus);
  end;
end;

procedure TImageItem.SetStatusMessage(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetStatusMessage) then
  begin
    FStatusMessage := Value;
    FBitField.SetBit(bfHasSetStatusMessage);
  end;
end;

procedure TImageItem.SetThumbnailURL(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetThumbnailURL) then
  begin
    FThumbnailURL := Value;
    FBitField.SetBit(bfHasSetThumbnailURL);
  end;
end;

procedure TImageItem.SetURL(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetURL) then
  begin
    FURL := Value;
    FBitField.SetBit(bfHasSetURL);
  end;
end;

procedure TImageItem.SetVariation(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetVariation) then
  begin
    FVariation := Value;
    FBitField.SetBit(bfHasSetVariation);
  end;
end;

{ TSKUObject }

procedure TSKUObject.AddAdditionalStock(AStockLocalID: Integer; APrice, AAmount,
  AAdittionalTime: Double);
var
  NewASObject: TJSONObject;
begin
  NewASObject := TJSONObject.Create;
  NewASObject
    .AddPair('price', TJSONNumber.Create(APrice))
    .AddPair('amout', TJSONNumber.Create(AAmount))
    .AddPair('additionalTime', TJSONNumber.Create(AAdittionalTime))
    .AddPair('stockLocalId', TJSONNumber.Create(AStockLocalID));

  FAdditionalStocks.AddElement(TJSONValue(NewASObject));

end;

procedure TSKUObject.AddVariation(AName, AValue: String);
begin

  if not FBitfield.IsBitSet(bfHasSetVariations) then
    FBitField.SetBit(bfHasSetVariations);

  FVariations.AddPair(CapitalizeFirstLetter(AName), TJSONString.Create(AValue));
end;

procedure TSKUObject.AddVariation(AName: String; AValue: TJSONNumber);
begin
  if not FBitfield.IsBitSet(bfHasSetVariations) then
      FBitField.SetBit(bfHasSetVariations);

  FVariations.AddPair(CapitalizeFirstLetter(AName), AValue);
end;

procedure TSKUObject.AddVariation(AName: String; AValue: TJSONBool);
begin
  if not FBitfield.IsBitSet(bfHasSetVariations) then
      FBitField.SetBit(bfHasSetVariations);   
      
  FVariations.AddPair(CapitalizeFirstLetter(AName), AValue);
end;

procedure TSKUObject.AddVariation(AName: String; AValue: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetVariations) then
      FBitField.SetBit(bfHasSetVariations);

  FVariations.AddPair(CapitalizeFirstLetter(AName), TJSONNumber.Create(AValue));
end;

procedure TSKUObject.AddVariation(AName: String; AValue: Integer);
begin
  if not FBitfield.IsBitSet(bfHasSetVariations) then
      FBitField.SetBit(bfHasSetVariations);

  FVariations.AddPair(CapitalizeFirstLetter(AName), TJSONNumber.Create(AValue));
end;

procedure TSKUObject.AddVariation(AName: String; AValue: Boolean);
begin
  if not FBitfield.IsBitSet(bfHasSetVariations) then
      FBitField.SetBit(bfHasSetVariations);

  FVariations.AddPair(CapitalizeFirstLetter(AName), TJSONBool.Create(AValue));
end;

function TSKUObject.CheckRequirements: Boolean;
begin
  Result := True;

  if not FBitField.IsBitSet(bfHasSetTitle) then
    Exit(False);

  if not FBitField.IsBitSet(bfHasSetPartnerID) then
    Exit(False);

  if not FBitField.IsBitSet(bfHasSetAmount) then
    Exit(False);

  if not FBitField.IsBitSet(bfHasSetAdditionalTime) then
    Exit(False);

  if not FBitField.IsBitSet(bfHasSetPrice) then
    Exit(False);

  if not FBitField.IsBitSet(bfHasSetSellPrice) then
    Exit(False);

end;

constructor TSKUObject.Create;
begin
  FID := -1;
  FTitle := ''; //REQ
  FPartnerID := ''; //REQ
  FEAN := '';
  FAmount := -1; //REQ
  FAdditionalTime := -1; // Tempo adicional para preparo em dias.  //REQ
  FPrice := -1; //REQ
  FSellPrice := -1;    //REQ
  FStockLocalId := -1;
  FVariations := TJSONObject.Create;
  FAdditionalStocks := TJSONArray.Create;
  FExternalID := '';
  FActive := False;
  FVolumes := -1.0;
end;

destructor TSKUObject.Destroy;
begin
  if Assigned(FVariations) then
  begin
    FreeAndNil(FVariations);
  end;

  if Assigned(FAdditionalStocks) then
  begin
    FreeAndNil(FAdditionalStocks);
  end;

  inherited;
end;

function TSKUObject.GetActive: Boolean;
begin
  Result := FActive;
end;

function TSKUObject.GetAdditionalStock(AIdx: Integer): TJSONObject;
begin
  Result := nil;
  if (AIdx < FAdditionalStocks.Count) and (AIdx >= 0) then
    Result := TJSONObject(FAdditionalStocks[AIdx]);
end;

function TSKUObject.GetAdditionalTime: Double;
begin
  Result := FAdditionalTime;
end;

function TSKUObject.GetAmount: Double;
begin
  Result := FAmount;
end;

function TSKUObject.GetEAN: String;
begin
  Result := FEAN;
end;

function TSKUObject.GetExternalId: String;
begin
  Result := FExternalID;
end;

function TSKUObject.GetID: Integer;
begin
  Result := FID;
end;

function TSKUObject.GetPartnerID: String;
begin
  Result := FPartnerID;
end;

function TSKUObject.GetPrice: Double;
begin
  Result := FPrice;
end;

function TSKUObject.GetSellPrice: Double;
begin
  Result := FSellPrice;
end;

function TSKUObject.GetStockLocalId: Integer;
begin
  Result := FStockLocalId;
end;

function TSKUObject.GetTitle: String;
begin
  Result := FTitle;
end;


function TSKUObject.GetVariation(AName: String): TJSONValue;
begin
  if not FVariations.TryGetValue(AName, Result) then
  begin
    raise Exception.Create('Could not find variation name.');
  end;
end;

function TSKUObject.GetVolumes: Double;
begin
  Result := FVolumes;
end;

procedure TSKUObject.RemoveAdditionalStock(AIdx: Integer);
var
  RemovedValue: TJSONValue;
begin
  if (AIdx < FAdditionalStocks.Count) and (AIdx >= 0) then
  begin
    RemovedValue := FAdditionalStocks.Remove(AIdx);
    if RemovedValue <> nil then
      RemovedValue.Free; // Libera o TJSONValue removido da Array.
  end;
end;

procedure TSKUObject.RemoveVariation(AName: String);
var
  RemovedPair: TJSONPair;
begin
  RemovedPair := FVariations.RemovePair(CapitalizeFirstLetter(AName));
  if RemovedPair <> nil then
  begin
    if FVariations.Count = 0 then
      FBitField.UnsetBit(bfHasSetVariations);
    RemovedPair.Free;  // Se o par for encontrado e removido, ele é retornado para RemovedPair e liberado da memoria aqui.
  end;

end;

function TSKUObject.SerializeToJSON: TJSONValue;
var
  ResultObject: TJSONObject;
begin
  Result := nil;
  if CheckRequirements then
  begin

    ResultObject := TJSONObject.Create;

    if FBitField.IsBitSet(bfhasSetId) then
      ResultObject.AddPair('id', TJSONNumber.Create(FID));

    if FBitField.IsBitSet(bfhasSetTitle) then
      ResultObject.AddPair('title', TJSONString.Create(FTitle));

    if FBitField.IsBitSet(bfhasSetPartnerId) then
      ResultObject.AddPair('partnerId', TJSONString.Create(FPartnerID));

    if FBitField.IsBitSet(bfhasSetEAN) then
      ResultObject.AddPair('ean', TJSONString.Create(FEAN));

    if FBitField.IsBitSet(bfhasSetAmount) then
      ResultObject.AddPair('amount', TJSONNumber.Create(FAmount));

    if FBitField.IsBitSet(bfhasSetAdditionalTime) then
      ResultObject.AddPair('additionalTime', TJSONNumber.Create(FAdditionalTime));

    if FBitField.IsBitSet(bfhasSetPrice) then
      ResultObject.AddPair('price', TJSONNumber.Create(FPrice));

    if FBitField.IsBitSet(bfhasSetSellPrice) then
      ResultObject.AddPair('sellPrice', TJSONNumber.Create(FSellPrice));

    if FBitField.IsBitSet(bfhasSetStockLocalId) then
      ResultObject.AddPair('stockLocalId',TJSONNumber.Create(FStockLocalId));

    if FBitField.IsBitSet(bfhasSetVariations) then
      ResultObject.AddPair('variations',TJSONValue(FVariations));

    if FBitField.IsBitSet(bfhasSetAdditionalStocks) then
      ResultObject.AddPair('additionalStocks',TJSONValue(FAdditionalStocks));

    if FBitField.IsBitSet(bfhasSetExternalID) then
      ResultObject.AddPair('externalId',TJSONString.Create(FExternalID));

    if FBitField.IsBitSet(bfhasSetActive) then
      ResultObject.AddPair('active',TJSONBool.Create(FActive));

    if FBitField.IsBitSet(bfhasSetVolumes) then
      ResultObject.AddPair('volumes',TJSONNumber.Create(FVolumes));
  end;
end;

procedure TSKUObject.SetActive(const Value: Boolean);
begin
  if not FBitField.IsBitSet(bfHasSetActive) then
  begin
    FActive := Value;
    FBitField.SetBit(bfHasSetActive);
  end;
end;

procedure TSKUObject.SetAdditionalTime(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetAdditionalTime) then
  begin
    FAdditionalTime := Value;
    FBitfield.SetBit(bfHasSetAdditionalTime);
  end;

end;

procedure TSKUObject.SetAmount(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetAmount) then
  begin
    FAmount := Value;
    FBitfield.SetBit(bfHasSetAmount);
  end;
end;

procedure TSKUObject.SetEAN(const Value: String);
begin
  if not FBitfield.IsBitSet(bfHasSetEAN) then
  begin
    FEAN := Value;
    FBitfield.SetBit(bfHasSetEAN);
  end;
end;

procedure TSKUObject.SetExternalId(const Value: String);
begin
  if not FBitField.IsBitSet(bfHasSetExternalID) then
  begin
    FExternalID := Value;
    FBitField.SetBit(bfHasSetExternalID);
  end;
end;

procedure TSKUObject.SetID(const Value: Integer);
begin
  if not FBitfield.IsBitSet(bfHasSetID) then
  begin
    FID := Value;
    FBitfield.SetBit(bfHasSetID);
  end;
end;

procedure TSKUObject.SetPartnerID(const Value: String);
begin
  if not FBitfield.IsBitSet(bfHasSetPartnerID) then
  begin
    FPartnerId := Value;
    FBitfield.SetBit(bfHasSetPartnerID);
  end;
end;

procedure TSKUObject.SetPrice(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetPrice) then
  begin
    FPrice := Value;
    FBitfield.SetBit(bfHasSetPrice);
  end;
end;

procedure TSKUObject.SetSellPrice(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetSellPrice) then
  begin
    FSellPrice := Value;
    FBitfield.SetBit(bfHasSetSellPrice);
  end;
end;

procedure TSKUObject.SetStockLocalId(const Value: Integer);
begin
  if not FBitfield.IsBitSet(bfHasSetStockLocalId) then
  begin
    FStockLocalId := Value;
    FBitfield.SetBit(bfHasSetStockLocalId);
  end;
end;

procedure TSKUObject.SetTitle(const Value: String);
begin
  if not FBitfield.IsBitSet(bfHasSetTitle) then
  begin
    FTitle := Value;
    FBitfield.SetBit(bfHasSetTitle);
  end;
end;

procedure TSKUObject.SetVolumes(const Value: Double);
begin
  if not FBitField.IsBitSet(bfHasSetVolumes) then
  begin
    FVolumes := Value;
    FBitField.SetBit(bfHasSetVolumes);
  end;
end;

{ TKitComponent }

constructor TKitComponent.Create;
begin
  FIdSku := '';
  FStockLocalId := '';
  FPercentage := -1.0;
  FQuantity := -1.0;
  FIsMainComponent := False;
end;

function TKitComponent.GetIsMainComponent: Boolean;
begin
  Result := FIsMainComponent;
end;

function TKitComponent.GetPercentage: Double;
begin
  Result := FPercentage;
end;

function TKitComponent.GetQuantity: Double;
begin
  Result := FQuantity;
end;

function TKitComponent.GetSkuID: string;
begin
  Result := FIDSku;
end;

function TKitComponent.GetStockLocalId: string;
begin
  Result := FStockLocalId;
end;

function TKitComponent.SerializeTOJson: TJSONValue;
var
  ObjectBuilding: TJSONObject;
begin
  ObjectBuilding := TJSONObject.Create;
  try
    if FBitfield.IsBitSet(bfHasSetIdSku) then
      ObjectBuilding.AddPair('idSku', TJSONString.Create(FIDSku));

    if FBitfield.IsBitSet(bfHasSetStockLocalId) then
      ObjectBuilding.AddPair('stockLocalId', TJSONString.Create(FStockLocalId));

    if FBitfield.IsBitSet(bfHasSetPercentage) then
      ObjectBuilding.AddPair('percentage', TJSONNumber.Create(FPercentage));

    if FBitfield.IsBitSet(bfHasSetQuantity) then
      ObjectBuilding.AddPair('quantity', TJSONNumber.Create(FQuantity));
      
    if FBitfield.IsBitSet(bfHasSetIsMainComponent) then
      ObjectBuilding.AddPair('quantity', TJSONBool.Create(IsMainComponent));
    
  finally
    if ObjectBuilding.Count = 0 then
    begin
      ObjectBuilding.Free;
      Result := nil;
    end else
    begin
      Result := TJSONValue(ObjectBuilding);
    end;
  end;
end;

procedure TKitComponent.SetIsMainComponent(const Value: Boolean);
begin
  if not FBitfield.IsBitSet(bfHasSetIsMainComponent) then
  begin
    FIsMainComponent := Value;
    FBitfield.SetBit(bfHasSetIsMainComponent);
  end;
end;

procedure TKitComponent.SetPercentage(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetPercentage) then
  begin
    FPercentage := Value;
    FBitfield.SetBit(bfHasSetPercentage);
  end;
end;

procedure TKitComponent.SetQuantity(const Value: Double);
begin
  if not FBitfield.IsBitSet(bfHasSetQuantity) then
  begin
    FQuantity := Value;
    FBitfield.SetBit(bfHasSetQuantity);
  end;
end;

procedure TKitComponent.SetSkuID(const Value: string);
begin
  if not FBitfield.IsBitSet(bfHasSetIDSku) then
  begin
    FIDSku := Value;
    FBitfield.SetBit(bfHasSetIDSku);
  end;
end;

procedure TKitComponent.SetStockLocalId(const Value: string);
begin
  if not FBitfield.IsBitSet(bfHasSetStockLocalId) then
  begin
    FStockLocalId := Value;
    FBitfield.SetBit(bfHasSetStockLocalId);
  end;
end;

end.
