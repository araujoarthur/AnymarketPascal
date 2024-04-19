unit Core.UI;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  Vcl.StdCtrls;

function AddChars(AString: String; ACount: Integer): String;
function PopulateComboBoxWithCategories(AComboBox:TComboBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;

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
    // Preciso bolar um jeito de chamar isso recursivamente.
    ValueObject := Value as TJSONObject;
    
    AComboBox.AddItem(AddChars('  ', AIdentLevel) + ValueObject.GetValue<String>('name'), ValueObject);
    
    if ValueObject.TryGetValue('children', ChildrenValue) then
    begin
      ChildrenArray := ChildrenValue as TJSONArray;
      if not (PopulateComboBoxWithCategories(AComboBox, ChildrenArray, AIdentLevel + 1)) then
      begin
        raise Exception.Create('Não foi possivel montar lista de categorias.');
      end;
    end;


  end;
end;

end.
