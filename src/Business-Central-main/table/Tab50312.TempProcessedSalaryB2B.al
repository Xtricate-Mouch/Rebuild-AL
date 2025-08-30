table 50312 "Temp Processed Salary B2B"
{
    Caption = 'Temp Processed Salary B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Employee Code"; Code[20]) { }
        field(3; Year; Integer) { }
        field(4; "Pay Slip Month"; Integer) { }
        field(5; "Add/Deduct"; Option)
        {
            OptionMembers = Addition,Deduction,Other;
        }
        field(6; "Add/Deduct Code"; Code[20]) { }
        field(7; "Earned Amount"; Decimal) { }
        // Add your other fields here
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
