table 50309 "Daily Time Punches B2B"
{
    Caption = 'Daily Time Punches B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No."; Code[10])
        {
            Caption = 'Employee No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
    }
    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }
}
