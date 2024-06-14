unit Anymarket.Bridge.Types;

interface
  uses
     System.SysUtils
     ,System.JSON
    ,System.DateUtils;
  type
    TNewInvoice = class
    private
      type TNewInvoiceMetadataFields =
              (_fdAccessKey, _fdSeries, _fdNumber, _fdDate, _fdCFOP, _fdCompanyStateTaxID, _fdLinkNFE,
              _fdInvoiceLink, _fdExtraDescription);
    private
      FUsedFields: TArray<TNewInvoiceMetadataFields>;
      FAccessKey: String;
      FSeries: String;
      FNumber: String;
      FDate: String;
      FCFOP: String;
      FCompanyStateTaxID: String;
      FLinkNFE: String;
      FInvoiceLink: String;
      FExtraDescription: String;
      function GetAccessKeyProp: String;
      function GetCFOPProp: String;
      function GetCSTIDProp: String;
      function GetDateProp: TDateTime;
      function GetExtraDescription: string;
      function GetInvoiceLink: string;
      function GetLinkNFEProp: string;
      function GetNumberProp: String;
      function GetSeriesProp: String;
      function AlreadyIn(AField: TNewInvoice.TNewInvoiceMetadataFields): Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      function LacksRequired: Boolean;
      function GetJSON: TJSONObject;
      property CFOP: String read GetCFOPProp;
      property LinkNFE: string read GetLinkNFEProp;
      property CompanyStateTaxID: String read GetCSTIDProp;
      function SetCFOP(AValue: String): TNewInvoice;
      function SetCompanyStateTaxID(AValue: String): TNewInvoice;
      function SetLinkNFE(AValue: String): TNewInvoice;

      //EN
      property AccessKey: String read GetAccessKeyProp;
      property Series: String read GetSeriesProp;
      property Number: String read GetNumberProp;
      property Date: TDateTime read GetDateProp;
      property InvoiceLink: string read GetInvoiceLink;
      property ExtraDescription: string read GetExtraDescription;

      function SetAccessKey(AValue: String): TNewInvoice;
      function SetSeries(AValue: String): TNewInvoice;
      function SetNumber(AValue: String): TNewInvoice;
      function SetDate(AValue: TDateTime): TNewInvoice;
      function SetInvoiceLink(AValue: String): TNewInvoice;
      function SetExtraDescription(AValue: String): TNewInvoice;

      //PT
      property ChaveDeAcesso: String read GetAccessKeyProp;
      property Serie: String read GetSeriesProp;
      property Numero: String read GetNumberProp;
      property Data: TDateTime read GetDateProp;
      property FaturaPDFLink: string read GetInvoiceLink;
      property DescricaoExtra: string read GetExtraDescription;

      function SetChaveDeAcesso(AValue: String): TNewInvoice;
      function SetSerie(AValue: String): TNewInvoice;
      function SetNumero(AValue: String): TNewInvoice;
      function SetData(AValue: TDateTime): TNewInvoice;
      function SetFaturaPDFLink(AValue: String): TNewInvoice;
      function SetDescricaoExtra(AValue: String): TNewInvoice;
    end;

    TNewInvoiceMetadata = class
    private
      FNumberOfPackages: Integer;
      FCEP: String;
    function GetCEPProp: string;
    function GetNOPProp: Integer;
    public
      constructor Create;
      function GetJSON: TJSONObject;
      function SetNumberOfPackages(AValue: Integer): TNewInvoiceMetadata;
      function SetNumeroDePacotes(AValue: Integer): TNewInvoiceMetadata;
      function SetCEP(AValue: String): TNewInvoiceMetadata;
      property CEP: string read GetCEPProp;
      property NumberOfPackages: Integer read GetNOPProp;
      property NumeroDePacotes: Integer read GetNOPProp;
    end;

    TNewTracking = class
    type TNewTrackingFields = (ntfURL, ntfNumber, ntfCarrier, ntfCarrierDocument, ntfEstimateDate, ntfShippedDate);
    private
      FUsedFields: TArray<TNewTrackingFields>;
      FURL: String;
      FNumber: String;
      FCarrier: String;
      FCarrierDocument: String;
      FEstimateDate: String;
      FShippedDate: String;
      function GetCarrierDocProp: string;
      function GetCarrierProp: string;
      function GetEstimateDateProp: TDateTime;
      function GetNumberProp: string;
      function GetShippedDateProp: TDateTime;
      function GetURLProp: string;
      function AlreadyIn(AField: TNewTracking.TNewTrackingFields): Boolean;
    public
      constructor Create;
      property URL: string read GetURLProp;
      function SetURL(AURL: String): TNewTracking;
      function GetJSON: TJSONObject;

      // EN
      property Number: string read GetNumberProp;
      property Carrier: string read GetCarrierProp;
      property CarrierDocument: string read GetCarrierDocProp;
      property EstimateDate: TDateTime read GetEstimateDateProp;
      property ShippedDate: TDateTime read GetShippedDateProp;
      function SetNumber(AValue: String): TNewTracking;
      function SetCarrier(AValue: String): TNewTracking;
      function SetCarrierDocument(AValue: String): TNewTracking;
      function SetEstimateDate(AValue: TDateTime): TNewTracking;
      function SetShippedDate(AValue: TDateTime): TNewTracking;

      // PT
      property Numero: string read GetNumberProp;
      property NomeTransportadora: string read GetCarrierProp;
      property DocumentoTransportadora: string read GetCarrierDocProp;
      property DataEstimada: TDateTime read GetEstimateDateProp;
      property DataDeEnvio: TDateTime read GetShippedDateProp;
      function SetNumero(AValue: String): TNewTracking;
      function SetNomeTransportadora(AValue: String): TNewTracking;
      function SetDocumentoTransportadora(AValue: String): TNewTracking;
      function SetDataEstimada(AValue: TDateTime): TNewTracking;
      function SetDataDeEnvio(AValue: TDateTime): TNewTracking;
    end;
implementation

{ TNewInvoice }

function TNewInvoice.AlreadyIn(
  AField: TNewInvoice.TNewInvoiceMetadataFields): Boolean;
var
  addedFld: TNewInvoice.TNewInvoiceMetadataFields;
begin
  Result := False;
  for addedFld in FUsedFields do
  begin
    Result := (addedFld = AField);
    if Result then
      break;
  end;
end;

constructor TNewInvoice.Create;
begin
  SetLength(FUsedFields, 0);
  FAccessKey:= '';
  FSeries := '';
  FNumber := '';
  FDate := '';
  FCFOP := '';
  FCompanyStateTaxID := '';
  FLinkNFE := '';
  FInvoiceLink := '';
  FExtraDescription := '';
end;

destructor TNewInvoice.Destroy;
begin
  SetLength(FUsedFields, 0);
  inherited;
end;

function TNewInvoice.SetDescricaoExtra(AValue: String): TNewInvoice;
begin
  Result := SetExtraDescription(AValue);
end;

function TNewInvoice.GetAccessKeyProp: String;
begin
  if AlreadyIn(_fdAccessKey) then
    Result := FAccessKey;
end;

function TNewInvoice.GetCFOPProp: String;
begin
  if AlreadyIn(_fdCFOP) then
    Result := FCFOP;
end;

function TNewInvoice.GetCSTIDProp: String;
begin
  if AlreadyIn(_fdCompanyStateTaxID) then
    Result := FCompanyStateTaxID;
end;

function TNewInvoice.GetDateProp: TDateTime;
begin
  if AlreadyIn(_fdDate) then
    Result := ISO8601ToDate(FDate);
end;

function TNewInvoice.GetExtraDescription: string;
begin
  if AlreadyIn(_fdExtraDescription) then
    Result := FExtraDescription;
end;

function TNewInvoice.GetInvoiceLink: string;
begin
  if AlreadyIn(_fdInvoiceLink) then
    Result := FInvoiceLink;
end;

function TNewInvoice.GetJSON: TJSONObject;
begin
  Result := TJSONObject.Create;

  if AlreadyIn(_fdAccessKey) then
    Result.AddPair('accessKey', TJSONString.Create(FAccessKey));

  if AlreadyIn(_fdSeries) then
    Result.AddPair('series', TJSONString.Create(FSeries));

  if AlreadyIn(_fdNumber) then
    Result.AddPair('number', TJSONString.Create(FNumber));

  if AlreadyIn(_fdDate) then
    Result.AddPair('date', TJSONString.Create(FDate));

  if AlreadyIn(_fdCFOP) then
    Result.AddPair('cfop', TJSONString.Create(FCFOP));

  if AlreadyIn(_fdCompanyStateTaxID) then
    Result.AddPair('companyStateTaxId', TJSONString.Create(FCompanyStateTaxID));

  if AlreadyIn(_fdLinkNFE) then
    Result.AddPair('linkNfe', TJSONString.Create(FLinkNFE));

  if AlreadyIn(_fdInvoiceLink) then
    Result.AddPair('invoiceLink', TJSONString.Create(FInvoiceLink));

  if AlreadyIn(_fdExtraDescription) then
    Result.AddPair('extraDescription', TJSONString.Create(FExtraDescription));


end;

function TNewInvoice.GetLinkNFEProp: string;
begin
  if AlreadyIn(_fdLinkNFE) then
    Result := FLinkNFE;
end;

function TNewInvoice.GetNumberProp: String;
begin
  if AlreadyIn(_fdNumber) then
    Result := FNumber;
end;

function TNewInvoice.GetSeriesProp: String;
begin
  if AlreadyIn(_fdSeries) then
    Result := FSeries;
end;

function TNewInvoice.LacksRequired: Boolean;
begin
  Result := not (AlreadyIn(_fdAccessKey) and AlreadyIn(_fdDate))
end;

function TNewInvoice.SetAccessKey(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdAccessKey) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdAccessKey;
    FAccessKey := AValue;
  end;
end;

function TNewInvoice.SetCFOP(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdCFOP) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdCFOP;
    FCFOP := AValue;
  end;
end;

function TNewInvoice.SetChaveDeAcesso(AValue: String): TNewInvoice;
begin
  Result := SetAccessKey(AValue);
end;

function TNewInvoice.SetCompanyStateTaxID(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdCompanyStateTaxID) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdCompanyStateTaxID;
    FCompanyStateTaxID := AValue;
  end;
end;

function TNewInvoice.SetData(AValue: TDateTime): TNewInvoice;
begin
  Result := SetDate(AValue);
end;

function TNewInvoice.SetDate(AValue: TDateTime): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdDate) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdDate;
    FDate := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss-03:00', AValue);
  end;
end;

function TNewInvoice.SetExtraDescription(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdExtraDescription) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdExtraDescription;
    FExtraDescription := AValue;
  end;
end;

function TNewInvoice.SetFaturaPDFLink(AValue: String): TNewInvoice;
begin
  Result := SetInvoiceLink(AValue);
end;

function TNewInvoice.SetInvoiceLink(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdInvoiceLink) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdInvoiceLink;
    FInvoiceLink := AValue;
  end;
end;

function TNewInvoice.SetLinkNFE(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdLinkNFE) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdLinkNFE;
    FLinkNFE := AValue;
  end;
end;

function TNewInvoice.SetNumber(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdNumber) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdNumber;
    FNumber := AValue;
  end;
end;

function TNewInvoice.SetNumero(AValue: String): TNewInvoice;
begin
  Result := SetNumber(AValue);
end;

function TNewInvoice.SetSerie(AValue: String): TNewInvoice;
begin
  Result := SetSeries(AValue);
end;

function TNewInvoice.SetSeries(AValue: String): TNewInvoice;
begin
  Result := Self;
  if not AlreadyIn(_fdSeries) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := _fdSeries;
    FSeries := AValue;
  end;
end;

{ TNewInvoiceMetadata }

constructor TNewInvoiceMetadata.Create;
begin
  FCEP := '';
  FNumberOfPackages := -1;
end;

function TNewInvoiceMetadata.GetCEPProp: string;
begin
  Result := FCEP;
end;

function TNewInvoiceMetadata.GetJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  if FCEP <> '' then
    Result.AddPair('cdZipCode', TJSONString.Create);

  if FNumberOfPackages <> -1 then
    Result.AddPair('number-of-packages', TJSONString.Create(IntToStr(FNumberOfPackages)));
end;

function TNewInvoiceMetadata.GetNOPProp: Integer;
begin
  Result := FNumberOfPackages;
end;

function TNewInvoiceMetadata.SetCEP(AValue: String): TNewInvoiceMetadata;
begin
  Result := Self;
  if FCEP = '' then
    FCEP := AValue;
end;

function TNewInvoiceMetadata.SetNumberOfPackages(
  AValue: Integer): TNewInvoiceMetadata;
begin
  Result := Self;
  if FNumberOfPackages = -1 then
    FNumberOfPackages := AValue;
end;

function TNewInvoiceMetadata.SetNumeroDePacotes(
  AValue: Integer): TNewInvoiceMetadata;
begin
  Result := SetNumberOfPackages(AValue);
end;

{ TNewTracking }

function TNewTracking.AlreadyIn(
  AField: TNewTracking.TNewTrackingFields): Boolean;
var
  addedFld: TNewTracking.TNewTrackingFields;
begin
  Result := False;
  for addedFld in FUsedFields do
  begin
    Result := (addedFld = AField);
    if Result then
      break;
  end;
end;

constructor TNewTracking.Create;
begin
  SetLength(FUsedFields, 0);
end;

function TNewTracking.GetCarrierDocProp: string;
begin
  if AlreadyIn(ntfCarrierDocument) then
    Result := FCarrierDocument;

end;

function TNewTracking.GetCarrierProp: string;
begin
  if AlreadyIn(ntfCarrier) then
    Result := FCarrier;
end;

function TNewTracking.GetEstimateDateProp: TDateTime;
begin
  if AlreadyIn(ntfEstimateDate) then
    Result := ISO8601ToDate(FEstimateDate);
end;

function TNewTracking.GetJSON: TJSONObject;
begin
  Result := TJSONObject.Create;

  if AlreadyIn(ntfURL) then
    Result.AddPair('url', TJSONString.Create(FURL));
  if AlreadyIn(ntfNumber) then
    Result.AddPair('number', TJSONString.Create(FNumber));
  if AlreadyIn(ntfCarrier) then
    Result.AddPair('carrier', TJSONString.Create(FCarrier));
  if AlreadyIn(ntfCarrierDocument) then
    Result.AddPair('carrierDocument', TJSONString.Create(FCarrierDocument));
  if AlreadyIn(ntfEstimateDate) then
    Result.AddPair('estimateDate', TJSONString.Create(FEstimateDate));
  if AlreadyIn(ntfShippedDate) then
    Result.AddPair('shippedDate', TJSONString.Create(FShippedDate));
end;

function TNewTracking.GetNumberProp: string;
begin
  if AlreadyIn(ntfNumber) then
    Result := FNumber;
end;

function TNewTracking.GetShippedDateProp: TDateTime;
begin
  if AlreadyIn(ntfShippedDate) then
    Result := ISO8601ToDate(FShippedDate);
end;

function TNewTracking.GetURLProp: string;
begin
  if AlreadyIn(ntfURL) then
    Result := FURL;
end;

function TNewTracking.SetCarrier(AValue: String): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfCarrier) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfCarrier;
    FCarrier := AValue;
  end;
end;

function TNewTracking.SetCarrierDocument(AValue: String): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfCarrierDocument) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfCarrierDocument;
    FCarrierDocument := AValue;
  end;
end;

function TNewTracking.SetDataDeEnvio(AValue: TDateTime): TNewTracking;
begin
  Result := SetShippedDate(AValue);
end;

function TNewTracking.SetDataEstimada(AValue: TDateTime): TNewTracking;
begin
  Result := SetEstimateDate(AValue);
end;

function TNewTracking.SetDocumentoTransportadora(
  AValue: String): TNewTracking;
begin
  Result := SetCarrierDocument(AValue);
end;

function TNewTracking.SetEstimateDate(AValue: TDateTime): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfEstimateDate) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfEstimateDate;
    FCarrierDocument := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss-03:00', AValue);
  end;
end;

function TNewTracking.SetNomeTransportadora(AValue: String): TNewTracking;
begin
  Result := SetCarrier(AValue);
end;

function TNewTracking.SetNumber(AValue: String): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfNumber) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfNumber;
    FNumber := AValue;
  end;
end;

function TNewTracking.SetNumero(AValue: String): TNewTracking;
begin
  Result := SetNumber(AValue);
end;

function TNewTracking.SetShippedDate(AValue: TDateTime): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfShippedDate) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfShippedDate;
    FShippedDate := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss-03:00', AValue);
  end;
end;

function TNewTracking.SetURL(AURL: String): TNewTracking;
begin
  Result := Self;
  if not AlreadyIn(ntfURL) then
  begin
    SetLength(FUsedFields, Length(FUsedFields) + 1);
    FUsedFields[Length(FUsedFields) - 1] := ntfURL;
    FURL := AURL;
  end;
end;

end.
