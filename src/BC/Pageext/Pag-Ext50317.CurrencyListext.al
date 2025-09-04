namespace MouchProject.MouchProject;

using Microsoft.Finance.Currency;

pageextension 50317 "Currency List ext" extends Currencies
{
    actions
    {
        addafter("Exch. &Rates")
        {
            action(GetExchangeRate)
            {
                CaptionML = ENU = 'Get Exchange Rate';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ExchangeRate: Codeunit ExchangeRate;
                begin
                    ExchangeRate.GetExchangeRate(Rec);
                end;
            }
        }
    }
}
