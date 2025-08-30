table 50326 "Grade Wise Leaves B2B"
{
    Caption = 'Grade Wise Leaves B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Leave Code"; Code[10])
        {
            Caption = 'Leave Code';
            DataClassification = CustomerContent;
        }
        field(3; "Leave Pay Cadre"; Code[50])
        {
            Caption = 'Leave Pay Cadre';
            TableRelation = Lookup_B2B."Lookup Name" WHERE("Lookup Type" = CONST(22));
            DataClassification = CustomerContent;
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location.Code;
            DataClassification = CustomerContent;
        }
        field(5; "Crediting Interval"; DateFormula)
        {
            Caption = 'Crediting Interval';
            DataClassification = ToBeClassified; // or your classification
        }

        field(6; "Max Leaves Allowed"; Decimal)
        {
            Caption = 'Max Leaves Allowed';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(7; "Carry Forward Allowed"; Boolean)
        {
            Caption = 'Carry Forward Allowed';
            DataClassification = CustomerContent;
        }
        field(8; "Carry Forward Limit"; Decimal)
        {
            Caption = 'Carry Forward Limit';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(9; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
