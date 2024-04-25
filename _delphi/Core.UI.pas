{
  ATTENTION! THIS UNIT IS UNDOCUMMENTED AND IS SUBJECT TO IMMEDIATE CHANGE, FOR THIS REASON:
  - DON'T RELY ON METHODS DECLARED HERE UNLESS TO THEIR SPECIFIC FUNCTIONALITY __TO KEEP COMPATIBILITY WITH UI__.
  - DON'T ADD, CHANGE OR REMOVE ANY BEHAVIOR AS IT CAN BREAK THE ENTIRE MASTERDETAIL AND REQUEST STRUCTURE

  #########

  ATENÇÃO! ESSA UNIT NÃO É DOCUMENTADA E ESTÁ SUJEITA A MUDANÇAS, POR ESSE MOTIVO:
  - NÃO UTILIZE OS METODOS PRESENTES AQUI EXCETO PELA SUA FUNCIONALIDADE EXCLUSIVA PARA MANTER COMPATIBILIDADE COM A INTERFACE.
  - NÃO ADICIONE, MODIFIQUE OU REMOVA QUALQUER COMPORTAMENTO POIS ISSO PODE QUEBRAR A ESTRUTURA DE REQUISIÇÕES E INTERFACE INTEIRA.
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
function PopulateComboBoxWithPriceScopes(AComboBox: TComboBox): Boolean;
function ExtractPriceScope(AComboBox: TComboBox): String;
function MapPriceScopeStringIntoComboBoxElement(AStringElement: String): Integer;
function PopulateComboBoxWithCategories(AComboBox:TComboBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
function PopulateListBoxWithCategories(AListBox: TListBox; AArray: TJSONArray; AIdentLevel: Integer = 0): Boolean;
function ExtractListBox(AListBox: TListBox): TObject;
function ExtractComboBox(AComboBox: TComboBox): TObject;
function FlattenCategories(AArray: TJSONArray): TJSONArray;
implementation

uses
  Vcl.Dialogs;

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

function PopulateComboBoxWithPriceScopes(AComboBox: TComboBox): Boolean;
begin
  AComboBox.Items.Add('Manual via SKU');
  AComboBox.Items.Add('Manual via Anúncio');
  AComboBox.Items.Add('Automático via mudança de custo');
  Result := True;
end;

function ExtractPriceScope(AComboBox: TComboBox): String;
begin
  if AComboBox.ItemIndex = 0 then
    Result := 'SKU'
  else if AComboBox.ItemIndex = 1 then
    Result := 'SKU_MARKETPLACE'
  else if AComboBox.ItemIndex = 2 then
    Result := 'COST'
  else
     raise Exception.Create('Not a valid combobox.');
end;

function MapPriceScopeStringIntoComboBoxElement(AStringElement: String): Integer;
begin
  ShowMessage(AStringElement);
  if UpperCase(AStringElement) = 'SKU' then
    Result := 0
  else if UpperCase(AStringElement) = 'SKU_MARKETPLACE' then
    Result := 1
  else if UpperCase(AStringElement) = 'COST' then
    Result := 2
  else
     raise Exception.Create('Not a valid string.');
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

function ExtractListBox(AListBox: TListBox): TObject;
begin
  Result := AListBox.Items.Objects[AListBox.ItemIndex];
end;

function ExtractComboBox(AComboBox: TComboBox): TObject;
begin
  Result := AComboBox.Items.Objects[AComboBox.ItemIndex];
end;

end.
