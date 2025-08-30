table 50305 "Employee B2B"
{
    Caption = 'Employee B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[10])
        {
            Caption = 'Employee No.';
        }
        field(2; "First Name"; Text[20])
        {
            Caption = 'First Name';
        }
        field(3; "Leave Pay Cadre"; Code[20])
        {
            Caption = 'Leave Pay Cadre';
        }
        field(4; "Location Code"; Code[30])
        {
            Caption = 'Location Code';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
