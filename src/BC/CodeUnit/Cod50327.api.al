namespace MouchProject.MouchProject;

codeunit 50327 api
{
    procedure getAPIDate()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Data: Text;
        Url: Text;
        JsonArr: JsonArray;
        JsonObj: JsonObject;
        AddrObj: JsonObject;
        GeoObj: JsonObject;
        Token: JsonToken;
        i: Integer;
    begin
        Url := 'https://jsonplaceholder.typicode.com/users';

        if not Client.Get(Url, Response) then
            Error('Could not reach URL: %1', Url);

        if not Response.IsSuccessStatusCode() then
            Error('Something went wrong. Status code: %1', Response.HttpStatusCode);

        Response.Content.ReadAs(Data);

        if JsonArr.ReadFrom(Data) then begin
            for i := 0 to JsonArr.Count() - 1 do begin
                JsonArr.Get(i, Token);
                JsonObj := Token.AsObject();

                // Basic fields
                if JsonObj.Get('id', Token) then
                    Message('ID: %1', Token.AsValue().AsInteger());
                if JsonObj.Get('name', Token) then
                    Message('Name: %1', Token.AsValue().AsText());
                if JsonObj.Get('email', Token) then
                    Message('Email: %1', Token.AsValue().AsText());

                // Nested object: address
                if JsonObj.Get('address', Token) then begin
                    AddrObj := Token.AsObject();

                    if AddrObj.Get('city', Token) then
                        Message('City: %1', Token.AsValue().AsText());
                    if AddrObj.Get('street', Token) then
                        Message('Street: %1', Token.AsValue().AsText());

                    // Nested geo object
                    if AddrObj.Get('geo', Token) then begin
                        GeoObj := Token.AsObject();
                        if GeoObj.Get('lat', Token) then
                            Message('Lat: %1', Token.AsValue().AsText());
                        if GeoObj.Get('lng', Token) then
                            Message('Lng: %1', Token.AsValue().AsText());
                    end;
                end;
            end;
        end else
            Error('Response is not a valid JSON array');
    end;

    var
        myInt: Integer;
}
