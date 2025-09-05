namespace MouchProject.MouchProject;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;

page 50328 OneListTwoTable
{
    ApplicationArea = All;
    Caption = 'OneListTwoTable';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = ALL;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field(customerBalanceLCY; customer."Balance (LCY)")
                {
                    BlankZero = true;
                }
                field(customerPaymentTermCode; customer."Payment Terms Code")
                {
                    trigger OnValidate()
                    begin
                        customer.Validate("Payment Terms Code");
                        customer.Modify();
                    end;

                }
            }
        }
    }


    var
        customer: Record Customer;

    trigger OnAfterGetRecord()
    begin
        RefreshLine();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        RefreshLine();
    end;

    procedure RefreshLine()
    begin
        customer.SetAutoCalcFields("Balance (LCY)");
        if not customer.Get(Rec."Sell-to Customer No.") then begin

        end
        else
            Clear(customer);
    end;
}
