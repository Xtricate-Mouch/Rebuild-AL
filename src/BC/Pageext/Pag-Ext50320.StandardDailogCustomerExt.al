namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50320 "Standard Dailog CustomerExt" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test Standard Dailog';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SD: Page "Standard Dailog Test";
                begin
                    SD.Setup('Kvay Luy', 'Banteay Meanchey', 'Cambodia');
                    if SD.RunModal() = Action::OK then
                        Message('%1,%2,%3', SD.GetX(), SD.GetY(), SD.GetZ());
                end;
            }
        }
    }
}
