unit Anymarket.Constants;

interface
  // Marketplaces
  const
    MKP_ALIEXPRESS = 'ALIEXPRESS';
    MKP_AMAZON = 'AMAZON';
    MKP_ARMAZEM_PARAIBA = 'ARMAZEM_PARAIBA';
    MKP_B2W_NEW_API = 'B2W_NEW_API';
    MKP_BAIANAO = 'BAIANAO';
    MKP_BALAROTI = 'BALAROTI';
    MKP_BANCO_INTER = 'BANCO_INTER';
    MKP_BELEZA_NA_WEB = 'BELEZA_NA_WEB';
    MKP_BRAVIUM = 'BRAVIUM';
    MKP_CAMICADO = 'CAMICADO';
    MKP_CARREFOUR = 'CARREFOUR';
    MKP_CASA_VIDEO = 'CASA_VIDEO';
    MKP_CASSOL_CENTERLAR = 'CASSOL_CENTERLAR';
    MKP_CENTAURO_NEW_API = 'CENTAURO_NEW_API';
    MKP_CLAROPROMO = 'CLAROPROMO';
    MKP_CLUBE_DE_MARCAS = 'CLUBE_DE_MARCAS';
    MKP_COBASI = 'COBASI';
    MKP_COLOMBO = 'COLOMBO';
    MKP_COMFORTFLEX = 'COMFORTFLEX';
    MKP_COMPRA_CERTA = 'COMPRA_CERTA';
    MKP_CONNECT_PARTS = 'CONNECT_PARTS';
    MKP_CREDITAS = 'CREDITAS';
    MKP_C_A = 'C_A';
    MKP_CNOVA = 'CNOVA';
    MKP_DECATHLON = 'DECATHLON';
    MKP_DROGA_RAIA = 'DROGA_RAIA';
    MKP_EFACIL = 'EFACIL';
    MKP_ECOMMERCE = 'ECOMMERCE';
    MKP_ELETRUM = 'ELETRUM';
    MKP_ESTANTE_VIRTUAL = 'ESTANTE_VIRTUAL';
    MKP_FACILY = 'FACILY';
    MKP_FAST_SHOP = 'FAST_SHOP';
    MKP_FENICIO = 'FENICIO';
    MKP_FOODIES_STORE = 'FOODIES_STORE';
    MKP_FRAVEGA_MARKET = 'FRAVEGA_MARKET';
    MKP_GFG = 'GFG';
    MKP_GIMBA = 'GIMBA';
    MKP_ICBC_MALL = 'ICBC_MALL';
    MKP_KABUM = 'KABUM';
    MKP_LEROY_MERLIN = 'LEROY_MERLIN';
    MKP_LIVESHOP = 'LIVESHOP';
    MKP_LOJAS_LEBES_NEW_API = 'LOJAS_LEBES_NEW_API';
    MKP_LOJA_DO_MECANICO = 'LOJA_DO_MECANICO';
    MKP_LOJA_SUMUP = 'LOJA_SUMUP';
    MKP_LOJA_VIVO = 'LOJA_VIVO';
    MKP_MADEIRA_MADEIRA = 'MADEIRA_MADEIRA';
    MKP_MAGAZINE_LUIZA = 'MAGAZINE_LUIZA';
    MKP_MAGENTO = 'MAGENTO';
    MKP_MAXMANIA = 'MAXMANIA';
    MKP_MERCADO_LIVRE = 'MERCADO_LIVRE';
    MKP_MEGATONE = 'MEGATONE';
    MKP_MESBLA = 'MESBLA';
    MKP_MOBLY = 'MOBLY';
    MKP_MULTIVAREJO_GPA = 'MULTIVAREJO_GPA';
    MKP_NETSHOES = 'NETSHOES';
    MKP_NEXTSHOP = 'NEXTSHOP';
    MKP_NOVO_MUNDO_NEW_API = 'NOVO_MUNDO_NEW_API';
    MKP_NUVEMSHOP = 'NUVEMSHOP';
    MKP_OLIST_NEW_API = 'OLIST_NEW_API';
    MKP_ONSTORES = 'ONSTORES';
    MKP_ON_STORES_VTEX = 'ON_STORES_VTEX';
    MKP_PASSARELA = 'PASSARELA';
    MKP_PHILIPS_STORE = 'PHILIPS_STORE';
    MKP_POSTHAUS_NEW_API = 'POSTHAUS_NEW_API';
    MKP_PRIVALIA = 'PRIVALIA';
    MKP_RAIA_DROGASIL = 'RAIA_DROGASIL';
    MKP_RAMARIM = 'RAMARIM';
    MKP_RENNER = 'RENNER';
    MKP_RIACHUELO = 'RIACHUELO';
    MKP_RI_HAPPY = 'RI_HAPPY';
    MKP_SARAIVA = 'SARAIVA';
    MKP_SHOPEE = 'SHOPEE';
    MKP_SHOPHUB = 'SHOPHUB';
    MKP_SHOPPING_LEBLON = 'SHOPPING_LEBLON';
    MKP_SHOPPING_LIVELO = 'SHOPPING_LIVELO';
    MKP_SICREDI = 'SICREDI';
    MKP_SUA_COMPRA = 'SUA_COMPRA';
    MKP_TA_TASHOP = 'TA_TASHOP';
    MKP_TIENDA_CLIC = 'TIENDA_CLIC';
    MKP_TIENDA_SUPERVIELLE = 'TIENDA_SUPERVIELLE';
    MKP_TRAY = 'TRAY';
    MKP_VINKLO_BY_FESTALAB = 'VINKLO_BY_FESTALAB';
    MKP_VTEX = 'VTEX';
    MKP_WALMART = 'WALMART';
    MKP_WEBAR = 'WEBAR';
    MKP_WEB_CONTINENTAL_NEW_API = 'WEB_CONTINENTAL_NEW_API';
    MKP_WOOCOMMERCE = 'WOOCOMMERCE';
    MKP_WOOD_PRIME = 'WOOD_PRIME';
    MKP_ZEMA = 'ZEMA';
    MKP_ZOOM = 'ZOOM';

  const ANY_MARKETPLACES: array[0..88] of string =
  (
    MKP_ALIEXPRESS,
    MKP_AMAZON,
    MKP_ARMAZEM_PARAIBA,
    MKP_B2W_NEW_API,
    MKP_BAIANAO,
    MKP_BALAROTI,
    MKP_BANCO_INTER,
    MKP_BELEZA_NA_WEB,
    MKP_BRAVIUM,
    MKP_CAMICADO,
    MKP_CARREFOUR,
    MKP_CASA_VIDEO,
    MKP_CASSOL_CENTERLAR,
    MKP_CENTAURO_NEW_API,
    MKP_CLAROPROMO,
    MKP_CLUBE_DE_MARCAS,
    MKP_COBASI,
    MKP_COLOMBO,
    MKP_COMFORTFLEX,
    MKP_COMPRA_CERTA,
    MKP_CONNECT_PARTS,
    MKP_CREDITAS,
    MKP_C_A,
    MKP_CNOVA,
    MKP_DECATHLON,
    MKP_DROGA_RAIA,
    MKP_EFACIL,
    MKP_ECOMMERCE,
    MKP_ELETRUM,
    MKP_ESTANTE_VIRTUAL,
    MKP_FACILY,
    MKP_FAST_SHOP,
    MKP_FENICIO,
    MKP_FOODIES_STORE,
    MKP_FRAVEGA_MARKET,
    MKP_GFG,
    MKP_GIMBA,
    MKP_ICBC_MALL,
    MKP_KABUM,
    MKP_LEROY_MERLIN,
    MKP_LIVESHOP,
    MKP_LOJAS_LEBES_NEW_API,
    MKP_LOJA_DO_MECANICO,
    MKP_LOJA_SUMUP,
    MKP_LOJA_VIVO,
    MKP_MADEIRA_MADEIRA,
    MKP_MAGAZINE_LUIZA,
    MKP_MAGENTO,
    MKP_MAXMANIA,
    MKP_MERCADO_LIVRE,
    MKP_MEGATONE,
    MKP_MESBLA,
    MKP_MOBLY,
    MKP_MULTIVAREJO_GPA,
    MKP_NETSHOES,
    MKP_NEXTSHOP,
    MKP_NOVO_MUNDO_NEW_API,
    MKP_NUVEMSHOP,
    MKP_OLIST_NEW_API,
    MKP_ONSTORES,
    MKP_ON_STORES_VTEX,
    MKP_PASSARELA,
    MKP_PHILIPS_STORE,
    MKP_POSTHAUS_NEW_API,
    MKP_PRIVALIA,
    MKP_RAIA_DROGASIL,
    MKP_RAMARIM,
    MKP_RENNER,
    MKP_RIACHUELO,
    MKP_RI_HAPPY,
    MKP_SARAIVA,
    MKP_SHOPEE,
    MKP_SHOPHUB,
    MKP_SHOPPING_LEBLON,
    MKP_SHOPPING_LIVELO,
    MKP_SICREDI,
    MKP_SUA_COMPRA,
    MKP_TA_TASHOP,
    MKP_TIENDA_CLIC,
    MKP_TIENDA_SUPERVIELLE,
    MKP_TRAY,
    MKP_VINKLO_BY_FESTALAB,
    MKP_VTEX,
    MKP_WALMART,
    MKP_WEBAR,
    MKP_WEB_CONTINENTAL_NEW_API,
    MKP_WOOCOMMERCE,
    MKP_WOOD_PRIME,
    MKP_ZEMA
  );

  // Transmission Status
  const
    TS_OK = 'OK';
    TS_ERROR = 'ERROR';
    TS_WAITING = 'WAITING';

  const ANY_TRANSMISSION_STATUS: array[0..2] of String =
  (
    TS_OK,
    TS_ERROR,
    TS_WAITING
  );


  // Order Status
  const
    OS_CONCLUDED = 'CONCLUDED'; //  Pedido entregue (é a última situação do pedido). Mudando para essa situação é necessário informar: data de entrega
    OS_CANCELED = 'CANCELED'; // Cancelado
    OS_INVOICED = 'INVOICED'; // Faturado. Mudando para essa situação é necessário informar: número da nota, número de série, data de emissão e chave de acesso
    OS_PAID_WAITING_DELIVERY = 'PAID_WAITING_DELIVERY'; // Enviado (aguardando entrega). Mudando para essa situação é necessário informar: URL de rastreamento, número de rastreio, nome da transportadora, data de envio
    OS_PAID_WAITING_SHIP = 'PAID_WAITING_SHIP'; // Pago (está aguardando envio)
    OS_PENDING = 'PENDING'; // Pendente (Ainda não foi pago. Existe parâmetro para que o ANYMARKET importe do MarketPlace o pedido que ainda não foi pago)
    OS_DELIVERY_ISSUE = 'DELIVERY_ISSUE';

  const ANY_ORDER_STATUS: array[0..6] of String =
  (
    OS_CONCLUDED,
    OS_CANCELED,
    OS_INVOICED,
    OS_PAID_WAITING_DELIVERY,
    OS_PAID_WAITING_SHIP,
    OS_PENDING,
    OS_DELIVERY_ISSUE
  );

  // Order Status - Generic PT-BR

  OS_CONCLUIDO = 'CONCLUDED'; //  Pedido entregue (é a última situação do pedido). Mudando para essa situação é necessário informar: data de entrega
  OS_CANCELADO = 'CANCELED'; // Cancelado
  OS_FATURADO = 'INVOICED'; // Faturado. Mudando para essa situação é necessário informar: número da nota, número de série, data de emissão e chave de acesso
  OS_ENVIADO = 'PAID_WAITING_DELIVERY'; // Enviado (aguardando entrega). Mudando para essa situação é necessário informar: URL de rastreamento, número de rastreio, nome da transportadora, data de envio
  OS_PAGO = 'PAID_WAITING_SHIP'; // Pago (está aguardando envio)
  OS_PENDENTE = 'PENDING'; // Pendente (Ainda não foi pago. Existe parâmetro para que o ANYMARKET importe do MarketPlace o pedido que ainda não foi pago)
  OS_PROBLEMA_NA_ENTREGA = 'DELIVERY_ISSUE';

  // Document Types
  const
    DT_CPF = 'CPF';
    DT_CNPJ = 'CNPJ';
    DT_OTHER = 'OTHER';
    DT_DNI = 'DNI';

  const ANY_DOCUMENT_TYPES: array[0..3] of String =
  (
    DT_CPF,
    DT_CNPJ,
    DT_OTHER,
    DT_DNI
  );

  // Delivery Status
  const
    DS_UNKNOWN = 'UNKNOWN';
    DS_IN_TRANSIT = 'IN_TRANSIT';
    DS_DELIVERED = 'DELIVERED';
    DS_HOLD_FOR_PICKUP = 'HOLD_FOR_PICKUP';
    DS_DELAYED = 'DELAYED';
    DS_DELIVERED_LATE = 'DELIVERED_LATE';

  const ANY_DELIVERY_STATUS: array[0..5] of String =
  (
    DS_UNKNOWN,
    DS_IN_TRANSIT,
    DS_DELIVERED,
    DS_HOLD_FOR_PICKUP,
    DS_DELAYED,
    DS_DELIVERED_LATE
  );

  // Logistics Types
  const
    LT_DROP_OFF = 'drop_off';
    LT_CROSS_DOCKING = 'cross_docking';
    LT_XD_DROP_OFF = 'xd_drop_off';
    LT_SELF_SERVICE = 'self_service';

  const ANY_ML_LOGISTICS_TYPES: array[0..3] of String =
  (
    LT_DROP_OFF,
    LT_CROSS_DOCKING,
    LT_XD_DROP_OFF,
    LT_SELF_SERVICE
  );

  // Sort Directions
  const
    SD_ASC = 'ASC';
    SD_DESC = 'DESC';

  const ANY_SORT_DIRECTIONS: array[0..1] of String =
  (
    SD_ASC,
    SD_DESC
  );


implementation

end.
