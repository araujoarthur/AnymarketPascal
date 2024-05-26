unit Anymarket.MasterDetail.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Anymarket.MasterDetail,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmMasterDetailProduto = class(TTFormMasterDetail)
    gbGeneral: TGroupBox;
    memoDescricaoProduto: TMemo;
    edtIDAnymarketProduto: TLabeledEdit;
    edtTituloProduto: TLabeledEdit;
    lblDescricaoProduto: TLabel;
    edtIDExternoProduto: TLabeledEdit;
    panelLeftColumn: TPanel;
    panelLeftTopRow: TPanel;
    Panel1: TPanel;
    cbCategoriaProduto: TComboBox;
    gbDetails: TGroupBox;
    lblCategoriaObj: TLabel;
    lblMarcaObj: TLabel;
    cbMarcaProduto: TComboBox;
    edtNCMProduto: TEdit;
    lblNCMProduto: TLabel;
    cbOrigemProduto: TComboBox;
    lblOrigemProduto: TLabel;
    edtModeloProduto: TEdit;
    lblModeloProduto: TLabel;
    lblTipoProduto: TLabel;
    edtTipoProduto: TEdit;
    cbGeneroProduto: TComboBox;
    lblGeneroProduto: TLabel;
    gpWarranty: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    memoWarrantyText: TMemo;
    lblWarrantyText: TLabel;
    lblWarrantyTimeDesc: TLabel;
    chkAllowAutomaticSKUMarketplaceCreation: TCheckBox;
    gbDimensions: TGroupBox;
    edtHeight: TLabeledEdit;
    edtLength: TLabeledEdit;
    edtWidth: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    chkIsActiveProduct: TCheckBox;
    panelBottomMenu: TPanel;
    panelRightColumn: TPanel;
    pgTabularData: TPageControl;
    tsAnymarket: TTabSheet;
    LabeledEdit2: TLabeledEdit;
    cbDefinitionPriceScope: TComboBox;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    pgMedia: TTabSheet;
    ListBox1: TListBox;
    edtImageUrl: TLabeledEdit;
    btnAddImageURL: TButton;
    btnUrlRemove: TButton;
    gbImagens: TGroupBox;
    gbVideo: TGroupBox;
    edtVideoURL: TLabeledEdit;
    tsCharacteristics: TTabSheet;
    tsSKUS: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetailProduto: TfrmMasterDetailProduto;

implementation

{$R *.dfm}

end.
