namespace MouchProject.MouchProject;

codeunit 50330 LoopFor
{
    trigger OnRun()
    begin
        for iterator := 1 to 10 do begin
            Message(Format(iterator));
        end;
        for iterator := 10 downto 1 do begin
            Message(Format(iterator));
        end;
    end;

    var
        iterator: Integer;

    //sum two number

    procedure add(num1: Integer; num2: Integer)
    var
        total: Integer;
    begin
        total := num1 + num2;
        Message('Sum of %1,%2 = %3', num1, num2, total);
    end;
}
