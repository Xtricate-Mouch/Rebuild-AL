namespace MouchProject.MouchProject;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.Currency;

codeunit 50328 "ExchangeRate"
{

    procedure GetExchangeRate(Currency: Record Currency)
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        url: Text;
        ResponseTxt: Text;
    begin
        // Only one ? allowed in query string, if needed
        url := 'https://api.primeapi.io/fx/quote?pairs=EUR/USD';

        // Use Bearer token (same as Postman)
        HttpClient.DefaultRequestHeaders.Add('Authorization', 'Bearer 5775ce1bfb-6929c05349-t21kyz');

        if HttpClient.Get(url, HttpResponse) then begin
            HttpResponse.Content.ReadAs(ResponseTxt);
            Message(ResponseTxt);
        end else
            Error('Unable to reach API. URL: %1', url);
    end;
}
