unit TGBot;

interface

uses IdHTTP, IdSSL, IdSSLOpenSSL, Classes, Json, System.Generics.Collections, Dialogs;

function getChatData():TStringList;
procedure sendMsg(msg, chatId: string);
var token: string = '7596876057:AAFnG-2H_WZs2c5Jcm6RhvcKShrlILJ0quA';
    tgURL: string = 'https://api.telegram.org/bot';

implementation

function getChatData():TStringList;
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    request, response: string;
    JSONObject, MessageObject, FromObject: TJSONObject;
    JSONValue: TJSONValue;
    JSONArray: TJSONArray;
    idValue: string;

    userData: TStringList;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  userData := TStringList.Create;
  userData.Sorted := True;
  userData.Duplicates := dupIgnore;
  request := tgURL + token + '/getUpdates';
  try
    response := HTTP.get(request);
    JSONValue := TJSONObject.ParseJSONValue(response);
    try
      if (Assigned(JSONValue)) and (JSONValue is TJSONObject) then begin
        JSONObject := JSONValue as TJSONObject;
        if JSONObject.TryGetValue<TJSONArray>('result', JSONArray) then begin
          for var i := 0 to JSONArray.Count - 1 do begin
            MessageObject := JSONArray.Items[i] as TJSONObject;
            if MessageObject.TryGetValue<TJSONObject>('message', FromObject) then begin
              if FromObject.TryGetValue<TJSONObject>('from', FromObject) then begin
                if FromObject.TryGetValue('id', idValue) then begin
                  userData.Add(idValue);
                end;
              end;
            end;
          end;
        end;

        getChatData := userData;
      end;
    finally

    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

procedure sendMsg(msg, chatId: string);
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    msgToSend: string;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  msgToSend := tgURL + token + '/sendMessage?chat_id=' + chatId + '&text=' + msg;
  try
    HTTP.Get(msgToSend);
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;
end.
