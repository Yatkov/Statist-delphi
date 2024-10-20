unit UnitFormUtils;

interface

uses IdHTTP, IdSSL, IdSSLOpenSSL, Classes, Json, System.Generics.Collections, System.RegularExpressions,
     sysUtils, XmlIntf, XmlDoc;

function parseXML(fileLink: string; key: TStringList): TDictionary<String, String>;
procedure SplitByMultipleSpaces(const Input: string; List: TStringList);
function formatText(inputText, firstPos, lastPos: String):String;
function JSONUnescape(const Source: string; CRLF: string = #13#10): string;
function downloadXML(fileLink: string): TMemoryStream;

implementation

// Скачивание .xml
function downloadXML(fileLink: string): TMemoryStream;
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    xmlFile: TMemoryStream;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  xmlFile := TMemoryStream.Create();
  try
    HTTP.Get(fileLink, xmlFile);
    downloadXML := xmlFile;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

// Парсинг .xml
function parseXML(fileLink: string; key: TStringList): TDictionary<String, String>;
var XMLDoc: IXMLDocument;
    XMLNode: IXMLNode;
    xmlFile: TMemoryStream;

    keyValue: String;
    keyDict: TDictionary<String, String>;
begin
  XMLDoc := TXMLDocument.Create(nil);
  xmlFile := TMemoryStream.Create();
  keyDict := TDictionary<String, String>.Create;
  try
    XMLDoc.LoadFromStream(downloadXML(fileLink));
    XMLDoc.Active := True;
    for var i := 0 to key.Count-1 do begin
      keyValue := XMLDoc.ChildNodes['metaForm'].AttributeNodes[key[i]].Text;
      keyDict.Add(key[i], keyValue);
    end;
    parseXML := keyDict;
  finally
    xmlFile.Free;
  end;
end;

// Удаление пробелов и перенос строк
procedure SplitByMultipleSpaces(const Input: string; List: TStringList);
var
  Matches: TMatchCollection;
  Match: TMatch;
  LastIndex, StartIndex: Integer;
begin
  List.Clear;
  Matches := TRegEx.Matches(Input, '\s{2,}'); // Ищем последовательности из двух или более пробелов
  LastIndex := 1;
  for Match in Matches do
  begin
    StartIndex := Match.Index;
    List.Add(Copy(Input, LastIndex, StartIndex - LastIndex));
    LastIndex := StartIndex + Match.Length;
  end;
  if LastIndex <= Length(Input) then
    List.Add(Copy(Input, LastIndex, MaxInt));
end;

// Форматирование данных из HTML
function formatText(inputText, firstPos, lastPos: String):String;
var text: String;
    firstPosCount: Integer;
begin
  text:= inputText;
  Delete(text, 1, Length(firstPos));
  firstPosCount := AnsiPos(lastPos, text);
  Delete(text, firstPosCount, Length(text)-1);
  formatText := text;
end;

// Юникод декодер
function JSONUnescape(const Source: string; CRLF: string = #13#10): string;
const
  ESCAPE_CHAR = '\';
  QUOTE_CHAR = '"';
  EXCEPTION_FMT = 'Invalid escape at position %d';
var
  EscapeCharPos, TempPos: Integer;
  Temp: string;
  IsQuotedString: Boolean;
begin
  result := '';
  IsQuotedString := (Source[1] = QUOTE_CHAR) and
    (Source[Length(Source)] = QUOTE_CHAR);
  EscapeCharPos := Pos(ESCAPE_CHAR, Source);
  TempPos := 1;
  while EscapeCharPos > 0 do
  begin
    result := result + Copy(Source, TempPos, EscapeCharPos - TempPos);
    TempPos := EscapeCharPos;
    if EscapeCharPos < Length(Source) - Integer(IsQuotedString) then
      case Source[EscapeCharPos + 1] of
        't':
          Temp := #9;
        'n':
          Temp := CRLF;
        '\':
          Temp := '\';
        '"':
          Temp := '"';
        'u':
          begin
            if EscapeCharPos + 4 < Length(Source) - Integer(IsQuotedString) then
              Temp := Chr(StrToInt('$' + Copy(Source, EscapeCharPos + 2, 4)))
            else
              raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
            Inc(TempPos, 4);
          end;
      else
        raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
      end
    else
      raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
    Inc(TempPos, 2);
    result := result + Temp;
    EscapeCharPos := Pos(ESCAPE_CHAR, Source, TempPos);
  end;
  result := result + Copy(Source, TempPos, Length(Source) - TempPos + 1);
end;

end.
