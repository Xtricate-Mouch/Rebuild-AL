namespace MouchProject.MouchProject;

using Microsoft.Inventory.Item;

pageextension 50314 "item ext" extends "Item List"
{

    layout
    {
        // add layout
    }
    actions
    {
        addafter("Ledger E&ntries")
        {
            action(CallAPI)
            {
                ApplicationArea = All;
                Caption = 'Call API';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    fact: Codeunit api;
                begin
                    fact.getAPIDate();
                end;
            }

        }
    }
    var
        myInt: Integer;
}
