program Ridho_56;

uses
  Vcl.Forms,
  pengprov in 'pengprov.pas' {Form1},
  mastermodule in 'mastermodule.pas' {master01: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tmaster01, master01);
  Application.Run;
end.
