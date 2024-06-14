program TestProj;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {tfrmExemplos},
  Anymarket.Binding.Pedido in 'Anymarket.Binding.Pedido.pas',
  Anymarket.Bridge.Types in 'Anymarket.Bridge.Types.pas',
  Anymarket.Constants in 'Anymarket.Constants.pas',
  Anymarket.Feed in 'Anymarket.Feed.pas',
  Anymarket in 'Anymarket.pas',
  Anymarket.Produtos.Builder in 'Anymarket.Produtos.Builder.pas',
  Anymarket.Produtos in 'Anymarket.Produtos.pas',
  Anymarket.Produtos.Subtypes in 'Anymarket.Produtos.Subtypes.pas',
  Anymarket.Utils in 'Anymarket.Utils.pas',
  Core.Bitfield in 'Core.Bitfield.pas',
  Core.UI in 'Core.UI.pas',
  Core.Utils in 'Core.Utils.pas',
  ConsultaJP.Anymarket in 'ConsultaJP.Anymarket.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TtfrmExemplos, tfrmExemplos);
  Application.Run;
end.
