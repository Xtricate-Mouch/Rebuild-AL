table 50323 "Employee Leaves B2B"
{
    Caption = 'Employee Leaves B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(2; "Leave Code"; Code[20])
        {
            Caption = 'Leave Code';
            DataClassification = CustomerContent;
            // Could relate to a Leave Setup / Leave Type table
        }
        field(3; "Leave Description"; Text[100])
        {
            Caption = 'Leave Description';
            DataClassification = CustomerContent;
        }
        field(4; "Leave Balance"; Decimal)
        {
            Caption = 'Leave Balance';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(5; "Accrued Leave"; Decimal)
        {
            Caption = 'Accrued Leave';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(6; "Used Leave"; Decimal)
        {
            Caption = 'Used Leave';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(7; "Leave Pay Cadre"; Code[50])
        {
            Caption = 'Leave Pay Cadre';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.", "Leave Code")
        {
            Clustered = true;
        }
    }
}
