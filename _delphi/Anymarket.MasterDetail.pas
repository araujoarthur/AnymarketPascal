unit Anymarket.MasterDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
 Vcl.StdCtrls, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.JSON, Anymarket;

type
  TMasterDetailMode = (mdmCreate, mdmEdit);

  TTFormMasterDetail = class(TForm)
  private
    { Private declarations }
  protected
    { Protected Declarations }
    FMode: TMasterDetailMode;
    FPassedData: TJSONObject;
    FAnymObject: TAnymarket;
    function GetCurrentItemFromComboBox(AComboBox: TComboBox): TObject;
  public
    { Public declarations }

    property Mode: TMasterDetailMode read FMode;
    property Data: TJSONObject read FPassedData;
    constructor Create(AOwner: TComponent; AAnymObject: TAnymarket; AMode: TMasterDetailMode; AData: TJSONObject = nil); reintroduce;
  end;

var
  TFormMasterDetail: TTFormMasterDetail;

implementation

{$R *.dfm}

{ TForm2 }

constructor TTFormMasterDetail.Create(AOwner: TComponent;
  AAnymObject: TAnymarket; AMode: TMasterDetailMode; AData: TJSONObject = nil);
begin
  inherited Create(AOwner);
  FAnymObject := AAnymObject;
  FMode := AMode;

  if AMode = mdmEdit then
  begin
    FPassedData := AData;
  end;
end;

function TTFormMasterDetail.GetCurrentItemFromComboBox(AComboBox: TComboBox): TObject;
var
  CurrIdx: Integer;
begin
  CurrIdx := AComboBox.ItemIndex;
  Result := AComboBox.Items.Objects[CurrIdx];
end;

end.
