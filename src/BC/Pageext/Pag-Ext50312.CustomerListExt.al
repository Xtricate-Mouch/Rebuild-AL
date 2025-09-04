namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50312 "Customer List Ext" extends "Customer List"
{

    // Clear

    // trigger OnOpenPage()
    // var
    //     test: Codeunit Test;
    // begin
    //     test.Set('Hello');
    //     Clear(test);
    //     // Message(test.Get());
    // end;

    // Foreach

    // trigger OnOpenPage()
    // var
    //     Simple: Text[50];
    //     CurrentLetter: Text;
    //     CountLetter: Integer;
    // begin
    //     Simple := 'ADFdfkkja;kikjhdhjkcmnee8ix,enaadfertvhfghtyfvbdeu';
    //     foreach CurrentLetter in Simple do begin
    //         if CurrentLetter = 'A' then
    //             CountLetter += 1;
    //     end;
    //     Message(Format(CountLetter));
    // end;

    trigger OnOpenPage()
    var
        arr: array[10] of Text;
        i: Integer;
    begin
        arr[1] := 'Hello1';
        arr[2] := 'Hello2';
        arr[5] := 'Hello5';

        for i := 1 to 10 do begin
            // Message('%1', arr[i]);

        end;
    end;
}


