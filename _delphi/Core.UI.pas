unit Core.UI;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  Vcl.StdCtrls,
  Vcl.ComCtrls;

function AddChars(AString: String; ACount: Integer): String;
function PopulateComboBoxWithCategories(AComboBox:TComboBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
function PopulateListBoxWithCategories(AListBox: TListBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
function FlattenCategories(AArray: TJSONArray): TJSONArray;
implementation

function AddChars(AString: String; ACount: Integer): String;
var
  I: integer;
begin       
  Result := '';
                   
  if ACount <> 0 then
  begin
  
    for I := 1 to ACount do
    begin
      Result := Result + AString;
    end;
    
  end;
  
    
end;

function PopulateComboBoxWithCategories(AComboBox:TComboBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
var
  Value: TJSONValue;
  ValueObject: TJSONObject;
  ChildrenValue: TJSONValue;
  ChildrenArray: TJSONArray;
begin
  Result := True;
  for Value in AArray do
  begin
    ValueObject := Value as TJSONObject;

    AComboBox.AddItem(AddChars('  ', AIdentLevel) + ValueObject.GetValue<String>('name'), ValueObject);

    if ValueObject.TryGetValue('children', ChildrenValue) then
    begin
      ChildrenArray := ChildrenValue as TJSONArray;
      if not (PopulateComboBoxWithCategories(AComboBox, ChildrenArray, AIdentLevel + 1)) then
      begin
        Result := False;
        raise Exception.Create('Não foi possivel montar lista de categorias.');
      end;
    end;
  end;
end;

function PopulateListBoxWithCategories(AListBox: TListBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
var
  Value: TJSONValue;
  ValueObject: TJSONObject;
  ChildrenValue: TJSONValue;
  ChildrenArray: TJSONArray;
begin
  Result := True;
  for Value in AArray do
  begin
    ValueObject := Value as TJSONObject;

    AListBox.AddItem(AddChars('  ', AIdentLevel) + ValueObject.GetValue<String>('name'), ValueObject);

    if ValueObject.TryGetValue('children', ChildrenValue) then
    begin
      ChildrenArray := ChildrenValue as TJSONArray;
      if not (PopulateListBoxWithCategories(AListBox, ChildrenArray, AIdentLevel + 1)) then
      begin
        Result := False;
        raise Exception.Create('Não foi possivel montar lista de categorias.');
      end;
    end;


  end;
end;

function FlattenCategories(AArray: TJSONArray): TJSONArray;
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
      FlatteningResult := FlattenCategories(ChildrenArray);
      for FlatteningValue in FlatteningResult do
      begin
        Result.AddElement(FlatteningValue);
      end;
    end;
  end;
end;

end.
