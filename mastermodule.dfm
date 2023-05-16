object master01: Tmaster01
  OldCreateOrder = False
  Height = 361
  Width = 697
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=ON')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = '2110020056'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\USER\Documents\Embarcadero\Studio\Projects\Praktikum 00' +
      '56\Win32\Debug\libmysql.dll'
    Left = 56
    Top = 88
  end
  object QueryPengprov: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM tabel_pengprov ORDER BY id_pengprov ASC ')
    Params = <>
    Left = 152
    Top = 88
    object QueryPengprovid_pengprov: TWideStringField
      FieldName = 'id_pengprov'
      Required = True
      Size = 9
    end
    object QueryPengprovnama_cabor: TWideStringField
      FieldName = 'nama_cabor'
      Required = True
      Size = 30
    end
    object QueryPengprovtgl_berdiri: TDateField
      FieldName = 'tgl_berdiri'
      Required = True
    end
    object QueryPengprovketua: TWideStringField
      FieldName = 'ketua'
      Required = True
      Size = 30
    end
    object QueryPengprovsekretaris: TWideStringField
      FieldName = 'sekretaris'
      Required = True
      Size = 30
    end
    object QueryPengprovalamat: TWideStringField
      FieldName = 'alamat'
      Required = True
      Size = 100
    end
    object QueryPengprovkabkota: TWideStringField
      FieldName = 'kab/kota'
      Required = True
      Size = 30
    end
    object QueryPengprovtlp: TWideStringField
      FieldName = 'tlp'
      Required = True
      Size = 35
    end
    object QueryPengprovwebsite: TWideStringField
      FieldName = 'website'
      Required = True
      Size = 35
    end
  end
  object Dspengprov: TDataSource
    DataSet = QueryPengprov
    Left = 232
    Top = 88
  end
end
