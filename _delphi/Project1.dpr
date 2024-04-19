program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Anymarket in 'Anymarket.pas',
  Core.Utils in 'Core.Utils.pas',
  Anymarket.MasterDetail.Categoria in 'Anymarket.MasterDetail.Categoria.pas' {frmCatMasterDetail},
  Core.UI in 'Core.UI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCatMasterDetail, frmCatMasterDetail);
  Application.Run;
end.
