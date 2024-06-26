// This unit is autogenerated. Do not edit it manually.
// Source: JSON pasted from clipboard
// Date: 5/27/2024 5:48:44 AM

unit Anymarket.Binding.Pedido;

interface

uses
  System.Classes, System.JSON.Serializers;

type
  [JsonSerialize(TJsonMemberSerialization.Public)]
  TProduct = class(TPersistent)
  private
    Fid: Integer;
    Ftitle: string;
  public
    property id: Integer read Fid write Fid;
    property title: string read Ftitle write Ftitle;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TSku = class(TPersistent)
  private
    Fean: string;
    Fid: Integer;
    Ftitle: string;
    FpartnerId: string;
    FexternalId: string;
  public
    property ean: string read Fean write Fean;
    property id: Integer read Fid write Fid;
    property title: string read Ftitle write Ftitle;
    property partnerId: string read FpartnerId write FpartnerId;
    property externalId: string read FexternalId write FexternalId;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TShippings = class(TPersistent)
  private
    Fid: Integer;
    FshippingCarrierNormalized: string;
    FshippingCarrierTypeNormalized: string;
    Fshippingtype: string;
  public
    property id: Integer read Fid write Fid;
    property shippingCarrierNormalized: string read FshippingCarrierNormalized write FshippingCarrierNormalized;
    property shippingCarrierTypeNormalized: string read FshippingCarrierTypeNormalized write FshippingCarrierTypeNormalized;
    property shippingtype: string read Fshippingtype write Fshippingtype;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TCustomization = class(TPersistent)
  private
    FcustomizationType: string;
    FcustomizationQuantity: Double;
    FcustomizationPrice: string;
    FcustomizationValue: string;
  public
    property customizationType: string read FcustomizationType write FcustomizationType;
    property customizationQuantity: Double read FcustomizationQuantity write FcustomizationQuantity;
    property customizationPrice: string read FcustomizationPrice write FcustomizationPrice;
    property customizationValue: string read FcustomizationValue write FcustomizationValue;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TStock = class(TPersistent)
  private
    Famount: Double;
    FstockLocalId: Integer;
    FstockName: string;
  public
    property amount: Double read Famount write Famount;
    property stockLocalId: Integer read FstockLocalId write FstockLocalId;
    property stockName: string read FstockName write FstockName;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TQuoteReconciliation = class(TPersistent)
  private
    FquoteId: string;
    Fprice: Double;
  public
    property quoteId: string read FquoteId write FquoteId;
    property price: Double read Fprice write Fprice;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TInvoice = class(TPersistent)
  private
    FaccessKey: string;
    Fseries: string;
    Fnumber: string;
    Fdate: TDateTime;
    Fcfop: string;
    FcompanyStateTaxId: string;
    FlinkNfe: string;
    FinvoiceLink: string;
    FextraDescription: string;
  public
    property accessKey: string read FaccessKey write FaccessKey;
    property series: string read Fseries write Fseries;
    property number: string read Fnumber write Fnumber;
    property date: TDateTime read Fdate write Fdate;
    property cfop: string read Fcfop write Fcfop;
    property companyStateTaxId: string read FcompanyStateTaxId write FcompanyStateTaxId;
    property linkNfe: string read FlinkNfe write FlinkNfe;
    property invoiceLink: string read FinvoiceLink write FinvoiceLink;
    property extraDescription: string read FextraDescription write FextraDescription;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TShipping = class(TPersistent)
  private
    Faddress: string;
    Fcity: string;
    Fcomment: string;
    Fcountry: string;
    FcountryAcronymNormalized: string;
    FcountryNameNormalized: string;
    Fneighborhood: string;
    Fnumber: string;
    FpromisedShippingTime: TDateTime;
    FreceiverName: string;
    Freference: string;
    Fstate: string;
    FstateNameNormalized: string;
    Fstreet: string;
    FzipCode: string;
  public
    property address: string read Faddress write Faddress;
    property city: string read Fcity write Fcity;
    property comment: string read Fcomment write Fcomment;
    property country: string read Fcountry write Fcountry;
    property countryAcronymNormalized: string read FcountryAcronymNormalized write FcountryAcronymNormalized;
    property countryNameNormalized: string read FcountryNameNormalized write FcountryNameNormalized;
    property neighborhood: string read Fneighborhood write Fneighborhood;
    property number: string read Fnumber write Fnumber;
    property promisedShippingTime: TDateTime read FpromisedShippingTime write FpromisedShippingTime;
    property receiverName: string read FreceiverName write FreceiverName;
    property reference: string read Freference write Freference;
    property state: string read Fstate write Fstate;
    property stateNameNormalized: string read FstateNameNormalized write FstateNameNormalized;
    property street: string read Fstreet write Fstreet;
    property zipCode: string read FzipCode write FzipCode;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TBillingAddress = class(TPersistent)
  private
    Faddress: string;
    Fcity: string;
    Fcomment: string;
    Fcountry: string;
    FcountryAcronymNormalized: string;
    FcountryNameNormalized: string;
    Fneighborhood: string;
    Fnumber: string;
    Freference: string;
    FshipmentUserDocument: string;
    FshipmentUserDocumentType: string;
    FshipmentUserName: string;
    Fstate: string;
    FstateNameNormalized: string;
    Fstreet: string;
    FzipCode: string;
  public
    property address: string read Faddress write Faddress;
    property city: string read Fcity write Fcity;
    property comment: string read Fcomment write Fcomment;
    property country: string read Fcountry write Fcountry;
    property countryAcronymNormalized: string read FcountryAcronymNormalized write FcountryAcronymNormalized;
    property countryNameNormalized: string read FcountryNameNormalized write FcountryNameNormalized;
    property neighborhood: string read Fneighborhood write Fneighborhood;
    property number: string read Fnumber write Fnumber;
    property reference: string read Freference write Freference;
    property shipmentUserDocument: string read FshipmentUserDocument write FshipmentUserDocument;
    property shipmentUserDocumentType: string read FshipmentUserDocumentType write FshipmentUserDocumentType;
    property shipmentUserName: string read FshipmentUserName write FshipmentUserName;
    property state: string read Fstate write Fstate;
    property stateNameNormalized: string read FstateNameNormalized write FstateNameNormalized;
    property street: string read Fstreet write Fstreet;
    property zipCode: string read FzipCode write FzipCode;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TAnymarketAddress = class(TPersistent)
  private
    Faddress: string;
    Fcity: string;
    Fcomment: string;
    Fcountry: string;
    Fneighborhood: string;
    Fnumber: string;
    FpromisedShippingTime: string;
    FreceiverName: string;
    Freference: string;
    Fstate: string;
    FstateAcronymNormalized: string;
    Fstreet: string;
    FzipCode: string;
  public
    property address: string read Faddress write Faddress;
    property city: string read Fcity write Fcity;
    property comment: string read Fcomment write Fcomment;
    property country: string read Fcountry write Fcountry;
    property neighborhood: string read Fneighborhood write Fneighborhood;
    property number: string read Fnumber write Fnumber;
    property promisedShippingTime: string read FpromisedShippingTime write FpromisedShippingTime;
    property receiverName: string read FreceiverName write FreceiverName;
    property reference: string read Freference write Freference;
    property state: string read Fstate write Fstate;
    property stateAcronymNormalized: string read FstateAcronymNormalized write FstateAcronymNormalized;
    property street: string read Fstreet write Fstreet;
    property zipCode: string read FzipCode write FzipCode;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TBuyer = class(TPersistent)
  private
    FcellPhone: string;
    Fdocument: string;
    FdocumentNumberNormalized: string;
    FdocumentType: string;
    Femail: string;
    FmarketPlaceId: string;
    Fname: string;
    Fphone: string;
    FdateOfBirth: string;
    FcompanyStateTaxId: string;
  public
    property cellPhone: string read FcellPhone write FcellPhone;
    property document: string read Fdocument write Fdocument;
    property documentNumberNormalized: string read FdocumentNumberNormalized write FdocumentNumberNormalized;
    property documentType: string read FdocumentType write FdocumentType;
    property email: string read Femail write Femail;
    property marketPlaceId: string read FmarketPlaceId write FmarketPlaceId;
    property name: string read Fname write Fname;
    property phone: string read Fphone write Fphone;
    property dateOfBirth: string read FdateOfBirth write FdateOfBirth;
    property companyStateTaxId: string read FcompanyStateTaxId write FcompanyStateTaxId;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TPayment = class(TPersistent)
  private
    Finstallments: Integer;
    FmarketplaceId: string;
    Fmethod: string;
    FpaymentDetailNormalized: string;
    FpaymentMethodNormalized: string;
    Fstatus: string;
    Fvalue: Double;
    FgatewayFee: Double;
    FmarketplaceFee: Double;
  public
    property installments: Integer read Finstallments write Finstallments;
    property marketplaceId: string read FmarketplaceId write FmarketplaceId;
    property method: string read Fmethod write Fmethod;
    property paymentDetailNormalized: string read FpaymentDetailNormalized write FpaymentDetailNormalized;
    property paymentMethodNormalized: string read FpaymentMethodNormalized write FpaymentMethodNormalized;
    property status: string read Fstatus write Fstatus;
    property value: Double read Fvalue write Fvalue;
    property gatewayFee: Double read FgatewayFee write FgatewayFee;
    property marketplaceFee: Double read FmarketplaceFee write FmarketplaceFee;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TItem = class(TPersistent)
  private
    Fproduct: TProduct;
    Fsku: TSku;
    Famount: Double;
    Funit_: Double;
    Fgross: Double;
    Ftotal: Double;
    Fdiscount: Double;
    Fshippings: TShippings;
    Fcustomization: TCustomization;
    Fstocks: TArray<TStock>;
    FmarketPlaceId: string;
    ForderItemId: string;
    FidInMarketPlace: string;
    FofficialStoreId: string;
    FofficialStoreName: string;
    FlistingType: string;
    FfreeShipping: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property product:           TProduct        read Fproduct;
    property sku:               TSku            read Fsku;
    property amount:            Double          read Famount                write Famount;
    [JsonName('unit')]
    property unit_:             Double          read Funit_                 write Funit_;
    property gross:             Double          read Fgross                 write Fgross;
    property total:             Double          read Ftotal                 write Ftotal;
    property discount:          Double          read Fdiscount              write Fdiscount;
    property shippings:         TShippings      read Fshippings;
    property customization:     TCustomization  read Fcustomization;
    property stocks:            TArray<TStock>  read Fstocks                write Fstocks;
    property marketPlaceId:     string          read FmarketPlaceId         write FmarketPlaceId;
    property orderItemId:       string          read ForderItemId           write ForderItemId;
    property idInMarketPlace:   string          read FidInMarketPlace       write FidInMarketPlace;
    property officialStoreId:   string          read FofficialStoreId       write FofficialStoreId;
    property officialStoreName: string          read FofficialStoreName     write FofficialStoreName;
    property listingType:       string          read FlistingType           write FlistingType;
    property freeShipping:      Boolean         read FfreeShipping          write FfreeShipping;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TTracking = class(TPersistent)
  private
    Fcarrier: string;
    Fdate: TDateTime;
    FdeliveredDate: TDateTime;
    FestimateDate: TDateTime;
    Fnumber: string;
    FshippedDate: TDateTime;
    Furl: string;
    FcarrierDocument: string;
  public
    property carrier: string read Fcarrier write Fcarrier;
    property date: TDateTime read Fdate write Fdate;
    property deliveredDate: TDateTime read FdeliveredDate write FdeliveredDate;
    property estimateDate: TDateTime read FestimateDate write FestimateDate;
    property number: string read Fnumber write Fnumber;
    property shippedDate: TDateTime read FshippedDate write FshippedDate;
    property url: string read Furl write Furl;
    property carrierDocument: string read FcarrierDocument write FcarrierDocument;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TPickup = class(TPersistent)
  private
    Fid: Integer;
    Fdescription: string;
    FpartnerId: Integer;
    FmarketplaceId: string;
    FreceiverName: string;
  public
    property id: Integer read Fid write Fid;
    property description: string read Fdescription write Fdescription;
    property partnerId: Integer read FpartnerId write FpartnerId;
    property marketplaceId: string read FmarketplaceId write FmarketplaceId;
    property receiverName: string read FreceiverName write FreceiverName;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TMetadata = class(TPersistent)
  private
    Fnumber_of_packages: Integer;
    FcdZipCode: string;
    FneedInvoiceXML: Boolean;
    Fmshops: Boolean;
    FEnvvias: string;
    FVIAtotalDiscountAmount: string;
    FB2WshippingType: string;
    Flogistic_type: string;
    FprintTag: Boolean;
    Fcanceldetail_motivation: string;
    Fcanceldetail_code: string;
    Fcanceldetail_description: string;
    Fcanceldetail_requested_by: string;
  public
    [JsonName('number-of-packages')]
    property number_of_packages: Integer read Fnumber_of_packages write Fnumber_of_packages;
    property cdZipCode: string read FcdZipCode write FcdZipCode;
    property needInvoiceXML: Boolean read FneedInvoiceXML write FneedInvoiceXML;
    property mshops: Boolean read Fmshops write Fmshops;
    property Envvias: string read FEnvvias write FEnvvias;
    property VIAtotalDiscountAmount: string read FVIAtotalDiscountAmount write FVIAtotalDiscountAmount;
    property B2WshippingType: string read FB2WshippingType write FB2WshippingType;
    property logistic_type: string read Flogistic_type write Flogistic_type;
    property printTag: Boolean read FprintTag write FprintTag;
    property canceldetail_motivation: string read Fcanceldetail_motivation write Fcanceldetail_motivation;
    property canceldetail_code: string read Fcanceldetail_code write Fcanceldetail_code;
    property canceldetail_description: string read Fcanceldetail_description write Fcanceldetail_description;
    property canceldetail_requested_by: string read Fcanceldetail_requested_by write Fcanceldetail_requested_by;
  end;

  [JsonSerialize(TJsonMemberSerialization.Public)]
  TAnyPedido = class(TPersistent)
  private
    Fid: Integer;
    FaccountName: string;
    FmarketPlaceId: string;
    FmarketPlaceNumber: string;
    FpartnerId: string;
    FmarketPlace: string;
    FsubChannel: string;
    FsubChannelNormalized: string;
    FcreatedAt: TDateTime;
    FpaymentDate: TDateTime;
    FcancelDate: TDateTime;
    FshippingOptionId: string;
    FtransmissionStatus: string;
    Fstatus: string;
    FmarketPlaceStatus: string;
    FmarketPlaceStatusComplement: string;
    FdocumentIntermediator: string;
    FintermediateRegistrationId: string;
    FdocumentPaymentInstitution: string;
    Ffulfillment: Boolean;
    FquoteReconciliation: TQuoteReconciliation;
    Fdiscount: Double;
    Ffreight: Double;
    FsellerFreight: Double;
    FinterestValue: Double;
    Fgross: Double;
    Ftotal: Double;
    FmarketPlaceUrl: string;
    FmarketPlaceShipmentStatus: string;
    Finvoice: TInvoice;
    Fshipping: TShipping;
    FbillingAddress: TBillingAddress;
    FanymarketAddress: TAnymarketAddress;
    Fbuyer: TBuyer;
    Fpayments: TArray<TPayment>;
    Fitems: TArray<TItem>;
    Ftracking: TTracking;
    FdeliverStatus: string;
    FidAccount: Integer;
    Fpickup: TPickup;
    Fmetadata: TMetadata;
    ForderTypeName: string;
  public
    constructor Create;
    destructor Destroy; override;
    property id: Integer read Fid write Fid;
    property accountName: string read FaccountName write FaccountName;
    property marketPlaceId: string read FmarketPlaceId write FmarketPlaceId;
    property marketPlaceNumber: string read FmarketPlaceNumber write FmarketPlaceNumber;
    property partnerId: string read FpartnerId write FpartnerId;
    property marketPlace: string read FmarketPlace write FmarketPlace;
    property subChannel: string read FsubChannel write FsubChannel;
    property subChannelNormalized: string read FsubChannelNormalized write FsubChannelNormalized;
    property createdAt: TDateTime read FcreatedAt write FcreatedAt;
    property paymentDate: TDateTime read FpaymentDate write FpaymentDate;
    property cancelDate: TDateTime read FcancelDate write FcancelDate;
    property shippingOptionId: string read FshippingOptionId write FshippingOptionId;
    property transmissionStatus: string read FtransmissionStatus write FtransmissionStatus;
    property status: string read Fstatus write Fstatus;
    property marketPlaceStatus: string read FmarketPlaceStatus write FmarketPlaceStatus;
    property marketPlaceStatusComplement: string read FmarketPlaceStatusComplement write FmarketPlaceStatusComplement;
    property documentIntermediator: string read FdocumentIntermediator write FdocumentIntermediator;
    property intermediateRegistrationId: string read FintermediateRegistrationId write FintermediateRegistrationId;
    property documentPaymentInstitution: string read FdocumentPaymentInstitution write FdocumentPaymentInstitution;
    property fulfillment: Boolean read Ffulfillment write Ffulfillment;
    property quoteReconciliation: TQuoteReconciliation read FquoteReconciliation;
    property discount: Double read Fdiscount write Fdiscount;
    property freight: Double read Ffreight write Ffreight;
    property sellerFreight: Double read FsellerFreight write FsellerFreight;
    property interestValue: Double read FinterestValue write FinterestValue;
    property gross: Double read Fgross write Fgross;
    property total: Double read Ftotal write Ftotal;
    property marketPlaceUrl: string read FmarketPlaceUrl write FmarketPlaceUrl;
    property marketPlaceShipmentStatus: string read FmarketPlaceShipmentStatus write FmarketPlaceShipmentStatus;
    property invoice: TInvoice read Finvoice;
    property shipping: TShipping read Fshipping;
    property billingAddress: TBillingAddress read FbillingAddress;
    property anymarketAddress: TAnymarketAddress read FanymarketAddress;
    property buyer: TBuyer read Fbuyer;
    property payments: TArray<TPayment> read Fpayments write Fpayments;
    property items: TArray<TItem> read Fitems write Fitems;
    property tracking: TTracking read Ftracking;
    property deliverStatus: string read FdeliverStatus write FdeliverStatus;
    property idAccount: Integer read FidAccount write FidAccount;
    property pickup: TPickup read Fpickup;
    property metadata: TMetadata read Fmetadata;
    property orderTypeName: string read ForderTypeName write ForderTypeName;
  end;

implementation

uses
  System.SysUtils, System.Generics.Collections,Core.Utils;

constructor TItem.Create;
begin
  inherited Create;
  Fproduct := TProduct.Create;
  Fsku := TSku.Create;
  Fshippings := TShippings.Create;
  Fcustomization := TCustomization.Create;
end;

destructor TItem.Destroy;
begin
  FreeAndNil(Fproduct);
  FreeAndNil(Fsku);
  FreeAndNil(Fshippings);
  FreeAndNil(Fcustomization);
  {$IF CompilerVersion >= 36}
  TArray.FreeValues<TStock>(Fstocks);
  {$ELSE}
  // Treat for Delphi before FreeValeus were available.
  TGenericArrayLiberator.FreeVals<TStock>(FStocks);
  {$ENDIF}
  inherited Destroy;
end;

constructor TAnyPedido.Create;
begin
  inherited Create;
  FquoteReconciliation := TQuoteReconciliation.Create;
  Finvoice := TInvoice.Create;
  Fshipping := TShipping.Create;
  FbillingAddress := TBillingAddress.Create;
  FanymarketAddress := TAnymarketAddress.Create;
  Fbuyer := TBuyer.Create;
  Ftracking := TTracking.Create;
  Fpickup := TPickup.Create;
  Fmetadata := TMetadata.Create;
end;

destructor TAnyPedido.Destroy;
begin
  FreeAndNil(FquoteReconciliation);
  FreeAndNil(Finvoice);
  FreeAndNil(Fshipping);
  FreeAndNil(FbillingAddress);
  FreeAndNil(FanymarketAddress);
  FreeAndNil(Fbuyer);
  {$IF CompilerVersion >= 36}
  TArray.FreeValues<TPayment>(Fpayments);
  TArray.FreeValues<TItem>(Fitems);
  {$ELSE}
  // Treat for Delphi before FreeValeus were available.
  TGenericArrayLiberator.FreeVals<TPayment>(FPayments);
  TGenericArrayLiberator.FreeVals<TItem>(Fitems);
  {$ENDIF}
  FreeAndNil(Ftracking);
  FreeAndNil(Fpickup);
  FreeAndNil(Fmetadata);
  inherited Destroy;
end;

initialization

  RegisterClass(TProduct);
  RegisterClass(TSku);
  RegisterClass(TShippings);
  RegisterClass(TCustomization);
  RegisterClass(TStock);
  RegisterClass(TQuoteReconciliation);
  RegisterClass(TInvoice);
  RegisterClass(TShipping);
  RegisterClass(TBillingAddress);
  RegisterClass(TAnymarketAddress);
  RegisterClass(TBuyer);
  RegisterClass(TPayment);
  RegisterClass(TItem);
  RegisterClass(TTracking);
  RegisterClass(TPickup);
  RegisterClass(TMetadata);
  RegisterClass(TAnyPedido);

end.
