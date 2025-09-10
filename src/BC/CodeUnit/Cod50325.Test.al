namespace MouchProject.MouchProject;

codeunit 50325 Test
{
    SingleInstance = true;

    var
        Value: Text;

    procedure Set(Val: text)
    begin
        Value := Val;
    end;

    procedure Get(): Text
    begin
        exit(Value)
    end;

    // for each
    procedure PrintCustomerName(CustomerNames: List of [Text])
    var
        name: Text;
    begin
        foreach name in CustomerNames do
            Message(name);
    end;


}
