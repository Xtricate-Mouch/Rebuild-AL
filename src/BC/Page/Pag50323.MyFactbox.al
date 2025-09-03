namespace MouchProject.MouchProject;
using Microsoft.Sales.Document;

page 50323 MyFactbox
{
    ApplicationArea = All;
    Caption = 'MyFactbox';
    PageType = ListPart;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Order));
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Sales Order", Rec);
                    end;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }

        }
    }
}

