table 50320 "Leave Master B2B"
{
    Caption = 'Leave Master B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
        }
        field(2; "Leave Code"; Code[10])
        {
            Caption = 'Leave Code';
        }
        field(3; "Description"; Code[100])
        {
            Caption = 'Description';
        }
        field(4; "Lapse Period"; Code[30])
        {
            Caption = 'Lapse Period';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
