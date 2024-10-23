unit UnitCheckOrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, JSON,
  Vcl.Grids, Vcl.Samples.Calendar, Vcl.WinXCalendars, Vcl.ExtCtrls, System.Generics.Collections;

type
  TFormCheckOrg = class(TForm)
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    PanelOrgHeader: TPanel;
    ComboBoxOrgs: TComboBox;
    LabelInnCaption: TLabel;
    LabelOkpoCaption: TLabel;
    LabelOgrnCaption: TLabel;
    StringGridOrgForms: TStringGrid;
    LabelOrgCount: TLabel;
    MemoOrgName: TMemo;
    EditOkpo: TEdit;
    EditOgrn: TEdit;
    EditInn: TEdit;
    Splitter1: TSplitter;
    procedure FormEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure StringGridOrgFormsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure checkOrg(inn: string);
  end;

var
  FormCheckOrg: TFormCheckOrg;

implementation

{$R *.dfm}

uses Main;

procedure TFormCheckOrg.FormCreate(Sender: TObject);
begin
  StringGridOrgForms.Cells[0,0] := 'Индекс формы';
  StringGridOrgForms.Cells[1,0] := 'ОКУД';
  StringGridOrgForms.Cells[2,0] := 'Периодичность';
end;

procedure TFormCheckOrg.FormEndDock(Sender, Target: TObject; X, Y: Integer);
begin
  if self.WindowState = wsMaximized then self.WindowState := wsNormal;
end;

procedure TFormCheckOrg.checkOrg(inn: string);
var data: TStringStream;
    HTTP: TIdHTTP;
    urlInn, urlOrg, orgsList, orgID, orgInfo: string;
    orgName, orgInn, okpo, ogrn: string;
    shortName, okud, period: string;
    orgsArray, innArray: TJSONArray;
    org, orgForm: TJSONObject;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  HTTP.Request.ContentType := 'application/json';
  data := TStringStream.Create(
  '{"inn":"' + inn +'",' +
  '"ogrn": "",' +
  '"okpo":""}');
  urlInn := 'https://websbor.rosstat.gov.ru/webstat/api/gs/organizations';
  try
    orgsList := HTTP.Post(urlInn,data);
    orgsArray := TJSONObject.ParseJSONValue(orgsList) as TJSONArray;
    for var orgs := 0 to orgsArray.Count-1 do begin
      org := orgsArray.Items[orgs] as TJSONObject;
      org.TryGetValue('name', orgName);
      org.TryGetValue('inn', orgInn);
      org.TryGetValue('okpo', okpo);
      org.TryGetValue('ogrn', ogrn);
      ComboBoxOrgs.Items.Add('ОКПО ' + okpo +' - '+orgName);
      MemoOrgName.Text := orgName;
      EditInn.Text := orgInn;
      EditOkpo.Text := okpo;
      EditOgrn.Text := ogrn;
      org.TryGetValue('id', orgID);
      urlOrg := 'https://websbor.rosstat.gov.ru/webstat/api/gs//organizations/'+orgID+'/forms';
      orgInfo := HTTP.Get(urlOrg);
      innArray := TJSONObject.ParseJSONValue(orgInfo) as TJSONArray;
      for var forms := 0 to innArray.Count-1 do begin
        orgForm := innArray.Items[forms] as TJSONObject;
        orgForm.TryGetValue('index', shortName);
        orgForm.TryGetValue('okud', okud);
        orgForm.TryGetValue('form_period', period);
        StringGridOrgForms.Cells[0, forms+1] := shortName;
        StringGridOrgForms.Cells[1, forms+1] := okud;
        StringGridOrgForms.Cells[2, forms+1] := period;
        StringGridOrgForms.RowCount := StringGridOrgForms.RowCount + 1;
      end;
      StringGridOrgForms.RowCount := StringGridOrgForms.RowCount - 1;
    end;
    ComboBoxOrgs.ItemIndex := 0;
    LabelOrgCount.Caption := 'Записей найдено: ' + IntToStr(comboBoxOrgs.items.Count);
  finally

  end;
end;

procedure TFormCheckOrg.StringGridOrgFormsDblClick(Sender: TObject);
begin
  FormMain.Show;
  FormMain.PageControlMain.ActivePageIndex := 0;
  FormMain.findForm('okud', StringGridOrgForms.Cells[1, StringGridOrgForms.Row]);
end;

end.
