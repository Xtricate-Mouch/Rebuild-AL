namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50313 factbox extends "Customer List"
{
    layout
    {
        addafter(CustomerDetailsFactBox)
        {
            part(SalesOrders; MyFactbox)
            {
                ApplicationArea = All;
                Caption = 'Sale Orders';
                SubPageLink = "Sell-to Customer No." = field("No.");

            }
        }
    }
}
