program pvlv;

uses
  Vcl.Forms,
  main in 'Source\main.pas' {MainForm} ,
  packetdefs in 'Source\packetdefs.pas',
  packetparser in 'Source\packetparser.pas',
  datalookups in 'Source\datalookups.pas',
  searchdialog in 'Source\searchdialog.pas' {DlgSearch} ,
  filterdialog in 'Source\filterdialog.pas' {DlgFilter} ,
  loadingform in 'Source\loadingform.pas' {FormLoading} ,
  videoform in 'Source\videoform.pas' {VideoLink} ,
  settingsdialog in 'Source\settingsdialog.pas' {DlgSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDlgSettings, DlgSettings);
  Application.CreateForm(TFormLoading, FormLoading);
  Application.CreateForm(TDlgSearch, DlgSearch);
  Application.CreateForm(TDlgFilter, DlgFilter);
  Application.CreateForm(TVideoLink, VideoLink);
  Application.Run;

end.
