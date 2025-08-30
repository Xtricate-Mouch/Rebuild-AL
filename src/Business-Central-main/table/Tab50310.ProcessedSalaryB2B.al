table 50310 "Processed Salary B2B"
{
    Caption = 'Processed Salary B2B';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Employee Code"; Code[20]) { }
        field(2; Year; Integer) { }
        field(3; "Pay Slip Month"; Integer) { }
        field(4; "Add/Deduct"; Option)
        {
            OptionMembers = Addition,Deduction;
        }
        field(5; "Add/Deduct Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(6; "Earned Amount"; Decimal) { }
        field(7; "Arrear Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Arrears Not Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Employee Code", Year, "Pay Slip Month") { Clustered = true; }
    }
}
