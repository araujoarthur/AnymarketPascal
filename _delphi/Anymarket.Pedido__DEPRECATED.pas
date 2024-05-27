unit Anymarket.Pedido__DEPRECATED;

interface

type
  TQuoteReconciliation = class;
  TAnymarketInvoice = class;
  TAnymarketShipping = class;
  TAnymarketBillingAddress = class;
  TAnymarketAddress = class;
  TAnymarketBuyer = class;
  TAnymarketPayment = class;
  TAnymarketPedidoItem = class;
  TAnymarketPedidoItemProduct = class;
  TAnymarketPedidoItemSKU = class;
  TAnymarketPedidoItemShipping = class;
  TAnymarketPedidoItemCustomization = class;
  TAnymarketPedidoItemStock = class;
  TAnymarketTracking = class;
  TAnymarketPickup = class;


  TAnymarketPayments = array of TAnymarketPayment;
  TAnymarketPedidoItens = array of TAnymarketPedidoItem;
  TAnymarketPedidoItemStocks = array of TAnymarketPedidoItemStock;


  TAnymarketPedido = class
  private
    FId: Integer;
    FAccountName: String;
    FMarketPlaceId: String;
    FMarketPlaceNumber: String;
    FPartnerID: String;
    FMarketPlace: String;
    FSubChannel: String;
    FSubChannelNormalized: String;
    FCreatedAt: TDateTime;
    FPaymentDate: TDateTime;
    FCancelDate: TDateTime;
    FShippingOptionId: String;
    FTransmissionStatus: String;
    FStatus: String;
    FMarketplaceStatus: String;
    FMarketPlaceStatusComplement: String;
    FDocumentIntermediator: String;
    FIntermediateRegistrationID: String;
    FDocumentPaymentInstitution: String;
    FFullfilment: Boolean;
    FQuoteReconciliation: TQuoteReconciliation;
    FDiscount: Double;
    FFreight: Double;
    FSellerFreight: Double;
    FInterestValue: Double;
    FGross: Double;
    FTotal: Double;
    FMarketPlaceURL: String;
    FMarketPlaceShipmentStatus: String;
    FInvoice: TAnymarketInvoice;
    FShipping: TAnymarketShipping;
    FBillingAddress: TAnymarketBillingAddress;
    FAnymarketAddress: TAnymarketAddress;
    FBuyer: TAnymarketBuyer;
    FPayments: TAnymarketPayments;
    FItems: TAnymarketPedidoItens;
    FTracking: TAnymarketTracking;
    FDeliverStatus: String;
    FIDAccount: Integer;
    FPickup: TAnymarketPickup;
  public
  end;

  TQuoteReconciliation = class
  private
    FQuoteID: string;
    FPrice: Double;
  public
    constructor Create(AQuoteID: String = ''; FPrice: Double = -1);
    //Set properties;
  end;

  TAnymarketInvoice = class // Doesnt need a builder, always comes from Server.
  private
    FAccessKey: String;
    FSeries: String;
    FNumber: String;
    FDate: TDateTime;
    FCFOP: String;
    FCompanyStateTaxId: String;
    FLinkNfe: String;
    FInvoiceLink: String;
    FExtraDescription: String;
  public
  // Set constructor
  //Set properties
  end;

  TAnymarketShipping = class
  private
    FAddress: String;
    FCity: String;
    FComment: String;
    FCountry: String;
    FCountryAcronymNormalize: String;
    FCountryNameNormalized: String;
    FNeighborhood: String;
    FNumber: String;
    FPromisedShippingTIme: TDateTime;
    FReceiverName: String;
    FReference: String;
    FState: String;
    FStateNormalized: String;
    FStreet: String;
    FZipCode: String;
  public
    // Set constructor
    // Set Properties
  end;

  TAnymarketBillingAddress = class
  private
    FAddress: String;
    FCity: String;
    FComment: String;
    FCountry: String;
    FCountryAcronymNormalized: String;
    FCountryNameNormalized: String;
    FNeighborhood: String;
    FNumber: String;
    FReference: String;
    FShipmentUserDocument: String;
    FShipmentUserDocumentType: String;
    FShipmentUserName: String;
    FState: String;
    FStateNameNormalized: String;
    FStreet: String;
    FZipCode: String;
  public
  // Set constructor
  // Set Properties
  end;

  TAnymarketAddress = class
  private
    FAddress: String;
    FCity: String;
    FComment: String;
    FCountry: String;
    FNeighborhood: String;
    FNumber: String;
    FPromisedShippingTime: String;
    FReceiverName: String;
    FReference: String;
    FState: String;
    FStateAcronymNormalized: String;
    FStreet: String;
    FZipCode: String;
  public
  // Set Constructor
  // Set Properties
  end;

  TAnymarketBuyer = class
  public
    FCellPhone: String;
    FDocument: String;
    FDocumentNumberNormalized: String;
    FDocumentType: String;
    FEmail: String;
    FMarketPlaceID: String;
    FName: String;
    FPhone: String;
    FDateOfBirth: String;
    FCompanyStateTaxId: String;
  private
  // Set Constructor
  // Set Properties
  end;

  TAnymarketPayment = class
  private
    FInstallments: Integer;
    FMarketPlaceID: String;
    FMethod: String;
    FPaymentDetailNormalized: String;
    FPaymentMethodNormalized: String;
    FStatus: String;
    FValue: Double;
    FGatewayFee: Double;
    FMarketplaceFee: Double;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPedidoItem = class
  private
    FProduct: TAnymarketPedidoItemProduct;
    FSKU: TAnymarketPedidoItemSKU;
    FAmount: Double;
    FUnit: Double;
    FGross: Double;
    FTotal: Double;
    FDiscount: Double;
    FShipping: TAnymarketPedidoItemShipping;
    FCustomization: TAnymarketPedidoItemCustomization;
    FStocks: TAnymarketPedidoItemStocks;
    FMarketPlaceID: String;
    FOrderId: String;
    FIDInMarketPlace: String;
    FOfficalStoreId: String;
    FOfficialStoreName: String;
    FListingType: String;
    FFreeShipping: Boolean;
  public
    // Set Constructor
    // Set Destructor
    // Set Properties
  end;

  TAnymarketPedidoItemProduct = class
  private
    FID: Integer;
    FTitle: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPedidoItemSKU = class
  private
    FEan: String;
    FID: Integer;
    FTitle: String;
    FPartnerID: String;
    FExternalID: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPedidoItemShipping = class
  private
    FID: Integer;
    FShippingCarrierNormalized: String;
    FShippingCarrierTypeNormalized: String;
    FShippingType: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPedidoItemCustomization = class
  private
    FCustomizationType: String;
    FCustomizationQuantity: Double;
    FCustomizationPrice: String;
    FCustomizationValue: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPedidoItemStock = class
  private
    FAmount: Double;
    FStockLocalId: Integer;
    FStockName: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketTracking = class
  private
    FCarrier: String;
    FDate: TDateTime;
    FDeliveredDate: TDateTime;
    FEstimateDate: TDateTime;
    FNumber: String;
    FShippingDate: TDateTime;
    FUrl: String;
    FCarrierDocument: String;
  public
    // Set Constructor
    // Set Properties
  end;

  TAnymarketPickup = class
  private

  public
    //
  end;

implementation

{ TQuoteReconciliation }

constructor TQuoteReconciliation.Create(AQuoteID: String; FPrice: Double);
begin
  //TO-DO
end;

end.
