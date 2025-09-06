namespace MouchProject.MouchProject;
using Microsoft.Sales.Customer;

codeunit 50329 "Find The Right Way"
{
    procedure Test()
    var
        customer: Record Customer;
    begin
        // customer."No." := '10000';
        // customer.Get('10000');
        // customer.Find('>');
        // repeat
        // until customer.Next(1) = 0;

        if customer.FindFirst() then begin
            repeat
            until customer.Next(1) = 0;
        end;
    end;
}
