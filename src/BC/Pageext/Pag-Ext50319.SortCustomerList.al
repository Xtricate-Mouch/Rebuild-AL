namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Reminder;

pageextension 50319 "Sort Customer List" extends "Customer List"
{
    trigger OnOpenPage()
    var
        Sorting: Record "Sorting Table" temporary;
    begin
        Sorting.Init();
        Sorting.Integer := 1;
        Sorting.Code := 'Mouch';

        Sorting.Insert();
        Sorting.Init();
        Sorting.Integer := 2;
        Sorting.Code := 'Jonh';
        Sorting.Insert();

        Sorting.Init();
        Sorting.Integer := 3;
        Sorting.Code := 'ah Nop';
        Sorting.Insert();

        Sorting.Init();
        Sorting.Integer := 4;
        Sorting.Code := 'Jork';
        Sorting.Insert();
        // sorting by name
        Sorting.SetCurrentKey(Code);
        if Sorting.FindSet() then
            repeat
            // Message('%1 %2', Sorting.Integer, Sorting.Code);
            until Sorting.Next() = 0;
    end;
}
