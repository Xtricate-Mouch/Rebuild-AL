namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50312 "Customer List Ext" extends "Customer List"
{
    trigger OnOpenPage()
    var
        test: Codeunit Test;
    begin
        test.Set('Hello');
        Clear(test);
        Message(test.Get());
    end;
}


