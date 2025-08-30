table 50322 "HR Setup B2B"
{
    Caption = 'HR Setup B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
        }
        field(2; "Compensatory Leave Code"; Code[10])
        {
            Caption = 'Compensatory Leave Code';
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
