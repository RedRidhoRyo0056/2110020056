unit mastermodule;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tmaster01 = class(TDataModule)
    ZConnection1: TZConnection;
    QueryPengprov: TZQuery;
    Dspengprov: TDataSource;
    QueryPengprovid_pengprov: TWideStringField;
    QueryPengprovnama_cabor: TWideStringField;
    QueryPengprovtgl_berdiri: TDateField;
    QueryPengprovketua: TWideStringField;
    QueryPengprovsekretaris: TWideStringField;
    QueryPengprovalamat: TWideStringField;
    QueryPengprovkabkota: TWideStringField;
    QueryPengprovtlp: TWideStringField;
    QueryPengprovwebsite: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  master01: Tmaster01;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
