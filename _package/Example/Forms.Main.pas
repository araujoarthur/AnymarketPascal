unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ConsultaJP.Anymarket, System.JSON,
  System.IOUtils,
  Anymarket.Bridge.Types,
  Anymarket.Utils,
  Anymarket.Constants;

type
  TtfrmExemplos = class(TForm)
    Button1: TButton;
    testResult: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tfrmExemplos: TtfrmExemplos;

implementation

{$R *.dfm}

procedure TtfrmExemplos.Button10Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.AtualizarPedidoPago(StrToInt(Edit2.Text));

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button11Click(Sender: TObject);
var
  Resultado: TJSONObject;
  InformacoesFatura: TNewInvoice; // TNewInvoice vive no Anymarket.Bridge.Types.
begin
  InformacoesFatura := TNewInvoice.Create;
  try
    InformacoesFatura.SetChaveDeAcesso('Chave de Acesso Aqui'); // Obrigatório
    InformacoesFatura.SetData(Now); // Data de emissao da nota em TDateTime. Obrigatório

    // Opcionais:
    InformacoesFatura.SetSerie('Serie da Nota aqui');
    InformacoesFatura.SetNumero('Numero da nota aqui');
    InformacoesFatura.SetFaturaPDFLink('Link do PDF da Nota');
    InformacoesFatura.SetDescricaoExtra('Dados descritivos adicionais');
    InformacoesFatura.SetCFOP('CFOP Aqui');
    InformacoesFatura.SetCompanyStateTaxID('Nao faço a menor ideia. Deve ser inscrição estadual');
    InformacoesFatura.SetLinkNFE('Link para consulta da NFE com chave de acesso');

    {
      O código acima também pode ser escrito assim:
    InformacoesFatura.SetSerie('Serie da Nota aqui')
                     .SetNumero('Numero da nota aqui')
                     .SetFaturaPDFLink('Link do PDF da Nota')
                     .SetDescricaoExtra('Dados descritivos adicionais')
                     .SetCFOP('CFOP Aqui')
                     .SetCompanyStateTaxID('Nao faço a menor ideia. Deve ser inscrição estadual')
                     .SetLinkNFE('Link para consulta da NFE com chave de acesso');
    }
    Resultado := Anym.AtualizarPedidoFaturado(StrToInt(Edit2.Text), InformacoesFatura);

    testResult.Lines.Add(Resultado.ToString);
  finally
    InformacoesFatura.Free;
  end;

end;

procedure TtfrmExemplos.Button12Click(Sender: TObject);
var
  Resultado: TJSONObject;
  InfoRastreamento: TNewTracking;
begin

  InfoRastreamento := TNewTracking.Create;
  try
    InfoRastreamento.SetNumero('Codigo de Rastreio'); // Obrigatório
    InfoRastreamento.SetNomeTransportadora('Nome da Transportadora'); // Obrigatório
    InfoRastreamento.SetDataDeEnvio(Now); // Obrigatório

    // Opcionais:
    InfoRastreamento.SetDocumentoTransportadora('CNPJ da transportadora');
    InfoRastreamento.SetDataEstimada(Now); // Data de entrega estimada.
    InfoRastreamento.SetURL('URL De rastreamento');
  
    Resultado := Anym.AtualizarPedidoEnviado(StrToInt(Edit2.Text), InfoRastreamento);

    testResult.Lines.Add(Resultado.ToString);
  finally
    InfoRastreamento.Free;
  end;

end;

procedure TtfrmExemplos.Button13Click(Sender: TObject);
var
  Resultado: TJSONObject;
  DataDeEntrega: TDateTime;
begin
  DataDeEntrega := Now;

  Resultado := Anym.AtualizarPedidoConcluido(StrToInt(Edit2.Text), DataDeEntrega);

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button14Click(Sender: TObject);
var
  Resultado: TJSONObject;
  JustificativaDoCancelamento: String;
begin
  JustificativaDoCancelamento := 'Alguma justificativa';
  
  Resultado := Anym.AtualizarPedidoCancelado(StrToInt(Edit2.Text), JustificativaDoCancelamento);

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button15Click(Sender: TObject);
var
  fd: TFileOpenDialog;
  XMLTxt: TStringList;
begin
  fd := TFileOpenDialog.Create(Self);
  try
    fd.DefaultFolder := TPath.GetDownloadsPath;
    if fd.Execute then
    begin
      XMLTxt := TStringList.Create;
      try
        XMLTxt.LoadFromFile(fd.FileName);
        testResult.Lines.Add(Anym.EnviarXMLNotaFiscal(StrToInt(Edit2.Text), XMLTxt.Text).ToString);
      finally
        XMLTxt.Free;
      end;
    end else
    begin
      ShowMessage('Cancelou');
    end;
  finally
    fd.Free;
  end;
end;

procedure TtfrmExemplos.Button1Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.FiltrarPedidos();
  { A maioria dos metodos retorna um JSON.

    Esse JSON tem sempre um campo "data" com o objeto enviado pelo anymarket,
    um campo "response_code" com o código de resposta do anymarket e um campo
    "status", que contem uma das seguintes strings: "success", "success - no content", "failed".
  }


  testResult.Lines.Add(Resultado.toString);
end;

procedure TtfrmExemplos.Button2Click(Sender: TObject);
var
  Filtro: TOrderFilter; // TOrderFilter existe na unit Anymarket.Utils;
  Resultado: TJSONObject;
begin
  Filtro := TOrderFilter.Create;
  Filtro.SetCreatedAfter(Now); // Define data minima do filtro.
  Filtro.SetCreatedBefore(Now); // Define data máxima do filtro.
  Filtro.SetLimit(10); // Define o limite de resultados (pelo menos 5, no máximo 100).
  Filtro.SetMarketplaceId('MERCADOLIVRE'); // Define o ID do pedido no marketplace.
  Filtro.SetOffset(5); // Define a partir de qual resultado da lista a primeira pagina começa.
  Filtro.SetSort('createdBefore'); // Define atributo a ser utilizado na odernação.
  Filtro.SetSortDirection('ASC'); // Pode ser ASC (ascendente) ou DESC (descendente). A direção da ordenação dos resultados.
  Filtro.SetIncludeQuoteId('true'); // Define se o reconciliationQuoteId vai ser retornado junto.
  Filtro.SetStatus(OS_CONCLUIDO); // Define o status para filtrar os pedidos. As constantes estão definidas no Anymarket.Constants.

  // Nenhum dos filtros é obrigatorio, deve utilizar somente os Set... que forem necessários.

  Resultado := Anym.FiltrarPedidos(Filtro);

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button3Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.DetalhesPedido(StrToInt(Edit1.Text));
  // Chamar o DetalhesPedido com o ID como Integer.

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button4Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosPagos();

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button5Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosPendentes();

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button6Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosCancelados();

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button7Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosConcluidos();

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button8Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosEnviados();

  testResult.Lines.Add(Resultado.ToString);
end;

procedure TtfrmExemplos.Button9Click(Sender: TObject);
var
  Resultado: TJSONObject;
begin
  Resultado := Anym.ObterPedidosFaturados();

  testResult.Lines.Add(Resultado.ToString);
end;

end.
