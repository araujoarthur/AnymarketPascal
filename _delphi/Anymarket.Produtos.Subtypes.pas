unit Anymarket.Produtos.Subtypes;

interface

uses System.JSON, System.Classes, System.SysUtils;

type
  TCharacteristic = class // Unitary Element
  private
    FName: String;
    FValue: String;
  public
    function SerializeToJsonValue: TJSONValue;
    constructor Create(AName, AValue: String);
  end;

  TCharacteristicArray = class // Encapsulating element.
  private
    FItems: array of TCharacteristic;
    function GetCharacteristic(I: Integer): TCharacteristic;
    procedure SetCharacteristic(I: Integer; const Value: TCharacteristic);
  public
    property Items[I: Integer]: TCharacteristic read GetCharacteristic write SetCharacteristic;
  end;

  TImageItem = class // Unitary Element
  private
  public
  end;

  TImageArray = class  // Encapsulationg element (must create enumerator/iterator?)
  private
  public
  end;

  TSKUObject = class // Unitary Element
  private
  public
  end;

  TSKUArray = class // Encapsulationg element (must create enumerator/iterator?)
  private
  public
  end;

  TKitComponent = class   // Unitary Element
  private
  public
  end;

  TKitComponents = class  // Encapsulationg element (must create enumerator/iterator?)
  private
  public
  end;

implementation

{ TCharacteristic }

constructor TCharacteristic.Create(AName, AValue: String);
begin
  FName := AName;
  FValue := AValue;
end;

function TCharacteristic.SerializeToJsonValue: TJSONValue;
var
  JSONCharacteristicObject: TJSONObject;
begin
  JSONCharacteristicObject := TJSONObject.Create;
  JSONCharacteristicObject.AddPair('name', TJSONString.Create(FName));
  JSONCharacteristicObject.AddPair('value', TJSONString.Create(FValue));
  Result := TJSONValue(JSONCharacteristicObject);
end;

{ TCharacteristicArray }

function TCharacteristicArray.GetCharacteristic(I: Integer): TCharacteristic;
begin
  if (I > 0) and (I < Length(FItems)) then
  begin
    Result := FItems[I];
  end else
  begin
    raise Exception.Create('Characteristic out of bounds');
  end;

end;

procedure TCharacteristicArray.SetCharacteristic(I: Integer;
  const Value: TCharacteristic);
begin
    if (I > 0) and (I < Length(FItems)) then
  begin
    FItems[I] := Value
  end else
  begin
    raise Exception.Create('Characteristic out of bounds');
  end;
end;

end.
