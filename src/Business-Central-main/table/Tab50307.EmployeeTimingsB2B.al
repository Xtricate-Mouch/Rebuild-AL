table 50307 "Employee Timings B2B"
{
    Caption = 'Employee Timings B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No.of Hours"; Decimal)
        {
            Caption = 'No.of Hours.';
        }
        field(2; "Employee No."; Code[10])
        {
            Caption = 'Employee No.';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
    }
    keys
    {
        key(PK; "No.of Hours")
        {
            Clustered = true;
        }
    }
}
