namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50316 "Customer Test Card" extends "Customer Card"
{
    layout
    {
        addafter("Balance Due (LCY)")
        {
            field(Test; Rec.Test)
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
    }
}
