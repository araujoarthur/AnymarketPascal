{
  ATTENTION! THIS UNIT IS UNDOCUMMENTED AND IS SUBJECT TO IMMEDIATE CHANGE, FOR THIS REASON:
  - DON'T RELY ON METHODS DECLARED HERE UNLESS TO THEIR SPECIFIC FUNCTIONALITY __TO KEEP COMPATIBILITY WITH UI__.
  - DON'T ADD, CHANGE OR REMOVE ANY BEHAVIOR AS IT CAN BREAK THE ENTIRE MASTERDETAIL AND REQUEST STRUCTURE

  #########

  ATEN��O! ESSA UNIT N�O � DOCUMENTADA E EST� SUJEITA A MUDAN�AS, POR ESSE MOTIVO:
  - N�O UTILIZE OS METODOS PRESENTES AQUI EXCETO PELA SUA FUNCIONALIDADE EXCLUSIVA PARA MANTER COMPATIBILIDADE COM A INTERFACE.
  - N�O ADICIONE, MODIFIQUE OU REMOVA QUALQUER COMPORTAMENTO POIS ISSO PODE QUEBRAR A ESTRUTURA DE REQUISI��ES E INTERFACE INTEIRA.
}

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
function ExtractListBox(AListBox: TListBox): TObject;
function ExtractComboBox(AComboBox: TComboBox): TObject;
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
        raise Exception.Create('N�o foi possivel montar lista de categorias.');
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
        raise Exception.Create('N�o foi possivel montar lista de categorias.');
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

function ExtractListBox(AListBox: TListBox): TObject;
begin
  Result := AListBox.Items.Objects[AListBox.ItemIndex];
end;

function ExtractComboBox(AComboBox: TComboBox): TObject;
begin
  Result := AComboBox.Items.Objects[AComboBox.ItemIndex];
end;

end.
