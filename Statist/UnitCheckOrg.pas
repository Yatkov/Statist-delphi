unit UnitCheckOrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, JSON,
  Vcl.Grids, Vcl.Samples.Calendar, Vcl.WinXCalendars;

type
  TFormCheckOrg = class(TForm)
    ScrollBox1: TScrollBox;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    procedure FormEndDock(Sender, Target: TObject; X, Y: Integer);
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

procedure TFormCheckOrg.FormEndDock(Sender, Target: TObject; X, Y: Integer);
begin
  if self.WindowState = wsMaximized then self.WindowState := wsNormal;
end;

procedure TFormCheckOrg.checkOrg(inn: string);
var data: TStringStream;
    HTTP: TIdHTTP;
    urlInn, urlOrg, orgsList, orgID, orgInfo: string;
    shortName: string;
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
      org.TryGetValue('id', orgID);

      urlOrg := 'https://websbor.rosstat.gov.ru/webstat/api/gs//organizations/'+orgID+'/forms';
      orgInfo := HTTP.Get(urlOrg);
      innArray := TJSONObject.ParseJSONValue(orgInfo) as TJSONArray;
      for var forms := 0 to innArray.Count-1 do begin
        orgForm := innArray.Items[forms] as TJSONObject;
        orgForm.TryGetValue('index', shortName);
      end;
    end;
  finally

  end;
end;

end.
