unit ConsultaJP.Anymarket;

interface
  uses
    Anymarket,
    Anymarket.Binding.Pedido,
    Anymarket.Bridge.Types,
    Anymarket.Constants,
    Anymarket.Feed,
    Anymarket.Produtos,
    Anymarket.Produtos.Subtypes,
    Anymarket.Produtos.Builder,
    Anymarket.Utils,
    Core.Bitfield,
    Core.UI,
    Core.Utils;
var
  Anym: TAnymarket;
implementation

initialization
  Anym := TAnymarket.Create('Token');

finalization
  Anym.Free;
end.
