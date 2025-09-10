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
}
