unit pengprov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edit_id: TEdit;
    edit_cabor: TEdit;
    edit_ketua: TEdit;
    edit_sekretaris: TEdit;
    edit_alamat: TEdit;
    edit_kota: TEdit;
    edit_telp: TEdit;
    edit_web: TEdit;
    dt_tglberdiri: TDateTimePicker;
    bt_simpan: TButton;
    DBGridpengprov: TDBGrid;
    editfilter: TEdit;
    bt_bersih: TButton;
    bt_hapus: TButton;
    bt_ubah: TButton;
    procedure bt_simpanClick(Sender: TObject);
    procedure bt_bersihClick(Sender: TObject);
    procedure bt_hapusClick(Sender: TObject);
    procedure bt_ubahClick(Sender: TObject);
    procedure editfilterChange(Sender: TObject);
    procedure edit_idKeyPress(Sender: TObject; var Key: Char);
    procedure edit_caborKeyPress(Sender: TObject; var Key: Char);
    procedure dt_tglberdiriKeyPress(Sender: TObject; var Key: Char);
    procedure edit_ketuaKeyPress(Sender: TObject; var Key: Char);
    procedure edit_sekretarisKeyPress(Sender: TObject; var Key: Char);
    procedure edit_alamatKeyPress(Sender: TObject; var Key: Char);
    procedure edit_kotaKeyPress(Sender: TObject; var Key: Char);
    procedure edit_telpKeyPress(Sender: TObject; var Key: Char);
    procedure edit_webKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses mastermodule;

procedure TForm1.bt_bersihClick(Sender: TObject);
begin
   edit_id.clear;
   edit_cabor.clear;
   dt_tglberdiri.Date := now;
   edit_ketua.clear;
   edit_sekretaris.clear;
   edit_alamat.clear;
   edit_kota.clear;
   edit_telp.clear;
   edit_web.clear;

   edit_id.SetFocus;
end;


procedure TForm1.bt_hapusClick(Sender: TObject);
begin
 if (
  (Trim(edit_id.text)= '') and
  (Trim(edit_cabor.text)= '') and
  (Trim(edit_ketua.text)= '') and
  (Trim(edit_sekretaris.text)= '') and
  (Trim(edit_alamat.text)= '') and
  (Trim(edit_kota.text)= '') and
  (Trim(edit_telp.text)= '') and
  (Trim(edit_web.text)= '')
  ) then
 begin
   beep;
   ShowMessage('Silahkan Pilih data terlebih dahulu !!!');
   DBGridpengprov.SetFocus;
   Exit;
 end else master01.QueryPengprov.Delete;
end;

procedure TForm1.bt_simpanClick(Sender: TObject);
begin
 try
  with master01 do
  begin
    if Trim(edit_id.Text)='' then
      begin
        beep;
        ShowMessage('ID Belum Diisi');
        edit_id.SetFocus;
      end else
    if Trim(edit_cabor.Text)='' then
        begin
          beep;
          ShowMessage('cabang olahraga Belum Diisi');
          edit_cabor.SetFocus;
        end else
    if Trim(edit_ketua.text)='' then
        begin
          beep;
          ShowMessage('Nama Ketua Belum diisi');
          edit_ketua.SetFocus;
        end else
    if Trim(edit_sekretaris.text)='' then
        begin
          beep;
          ShowMessage('Nama Sekretaris Belum diisi');
          edit_sekretaris.SetFocus;
        end else
     if Trim(edit_alamat.text)='' then
        begin
          beep;
          ShowMessage('Alamat Belum diisi');
          edit_alamat.SetFocus;
        end else
      if Trim(edit_kota.text)='' then
        begin
          beep;
          ShowMessage('Nama Kota Belum diisi');
          edit_kota.SetFocus;
        end else
      if Trim(edit_telp.text)='' then
        begin
          beep;
          ShowMessage('Nomor telepon Belum diisi');
          edit_telp.SetFocus;
        end else
      if Trim(edit_web.text)='' then
        begin
          beep;
          ShowMessage('Website Belum diisi');
          edit_web.SetFocus;
        end else
    if QueryPengprov.locate('id_pengprov',edit_id.text,[]) then
        begin
          beep;
          ShowMessage('ID Sudah terdaftar');
          edit_cabor.text:= QueryPengprovnama_cabor.AsString;
          dt_tglberdiri.date := QueryPengprovtgl_berdiri.AsDateTime;
          edit_ketua.text:= QueryPengprovketua.AsString;
          edit_sekretaris.text:= QueryPengprovsekretaris.AsString;
          edit_alamat.text:= QueryPengprovalamat.AsString;
          edit_kota.text:= QueryPengprovkabkota.AsString;
          edit_telp.text:= QueryPengprovtlp.AsString;
          edit_web.text := QueryPengprovwebsite.AsString;
        end else
        begin
          QueryPengprov.Append;
          QueryPengprovid_pengprov.AsString:=edit_id.Text;
          QueryPengprovnama_cabor.AsString:=edit_cabor.Text;
          QueryPengprovtgl_berdiri.AsDateTime:=dt_Tglberdiri.date;
          QueryPengprovketua.AsString:=edit_ketua.text;
          QueryPengprovsekretaris.AsString:= edit_sekretaris.text;
          QueryPengprovalamat.AsString:= edit_alamat.text;
          QueryPengprovkabkota.AsString:=edit_kota.text;
          QueryPengprovtlp.AsString:=edit_telp.text;
          QueryPengprovwebsite.AsString:=edit_web.text;
          QueryPengprov.post;
        end;
  end;
 except
  on salah:Exception do
  ShowMessage(salah.Message);
 end;
end;


procedure TForm1.bt_ubahClick(Sender: TObject);
begin
if (
  (Trim(edit_id.text)= '') and
  (Trim(edit_cabor.text)= '') and
  (Trim(edit_ketua.text)= '') and
  (Trim(edit_sekretaris.text)= '') and
  (Trim(edit_alamat.text)= '') and
  (Trim(edit_kota.text)= '') and
  (Trim(edit_telp.text)= '') and
  (Trim(edit_web.text)= '')
  ) then
 begin
   beep;
   ShowMessage('Silahkan Pilih data terlebih dahulu !!!');
   DBGridpengprov.SetFocus;
   Exit;
 end else
   with master01 do
  begin
    QueryPengprov.edit;
    QueryPengprovid_pengprov.AsString:=edit_id.Text;
    QueryPengprovnama_cabor.AsString:=edit_cabor.Text;
    QueryPengprovtgl_berdiri.AsDateTime:=dt_Tglberdiri.date;
    QueryPengprovketua.AsString:=edit_ketua.text;
    QueryPengprovsekretaris.AsString:= edit_sekretaris.text;
    QueryPengprovalamat.AsString:= edit_alamat.text;
    QueryPengprovkabkota.AsString:=edit_kota.text;
    QueryPengprovtlp.AsString:=edit_telp.text;
    QueryPengprovwebsite.AsString:=edit_web.text;
    QueryPengprov.post;
  end;
 end;


procedure TForm1.dt_tglberdiriKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_ketua.SetFocus;
end;

procedure TForm1.editfilterChange(Sender: TObject);
var cari: string;
begin
  try
  cari:= QuotedStr('%'+editfilter.text+'%');
  with master01 do
  begin
      QueryPengprov.SQL.Clear;
      QueryPengprov.SQL.Text:='SELECT * FROM tabel_pengprov WHERE id_pengprov LIKE '+cari+' OR nama_cabor LIKE '+cari+' OR ketua LIKE '+cari+' OR sekretaris LIKE '+cari+' OR alamat LIKE '+cari+' OR tlp LIKE '+cari+' OR website LIKE '+cari;
      QueryPengprov.open;
  end;
  except
    on salah:Exception do
    ShowMessage (salah.Message);
  end;
end;

procedure TForm1.edit_alamatKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_kota.SetFocus;
end;

procedure TForm1.edit_caborKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then dt_tglberdiri.SetFocus;
end;

procedure TForm1.edit_idKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_cabor.SetFocus;
end;

procedure TForm1.edit_ketuaKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_sekretaris.SetFocus;
end;

procedure TForm1.edit_kotaKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_telp.SetFocus;
end;

procedure TForm1.edit_sekretarisKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_alamat.SetFocus;
end;

procedure TForm1.edit_telpKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then edit_web.SetFocus;
end;

procedure TForm1.edit_webKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then bt_simpan.SetFocus;
end;

end.
