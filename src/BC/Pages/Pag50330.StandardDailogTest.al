namespace MouchProject.MouchProject;
using Microsoft.Finance.Dimension;

page 50330 "Standard Dailog Test"
{
    ApplicationArea = All;
    Caption = 'Standard Dailog Test';
    PageType = StandardDialog;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(x; x)
            {
                ApplicationArea = All;
                Caption = 'This is X';
            }
            field(y; y)
            {
                ApplicationArea = All;
                Caption = 'This is Y';
            }
            field(z; z)
            {
                ApplicationArea = All;
                Caption = 'This is Z';
            }
        }
    }

    procedure Setup(_x: Text; _y: Text; _z: Text)

    begin
        x := _x;
        y := _y;
        z := _z;

    end;

    procedure GetX(): text
    begin
        exit(x);
    end;

    procedure GetY(): text
    begin
        exit(y);
    end;

    procedure GetZ(): text
    begin
        exit(z);
    end;

    var
        x: Text;
        y: Text;
        z: Text;
}
