unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Anymarket, Core.Utils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Anym: TAnymarket;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ReqParam: TRequestParams;
begin
  ReqParam.AddItem('limit', '10');
  ReqParam.AddItem('offset', '0');
  ReqParam.AddItem('Status', 'SCHEDULED');
  Memo1.Lines.Add(RemoveEscaping(Anym.MakeGet('http://sandbox-api.anymarket.com.br/v2/categories', ReqParam).ToString));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Anym := TAnymarket.Create('SB39983035L39961202E1804795779127C171148377912700O891.I');
end;

end.
