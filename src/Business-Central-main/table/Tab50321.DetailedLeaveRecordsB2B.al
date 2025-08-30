table 50321 "Detailed Leave Records B2B"
{
    Caption = 'Detailed Leave Records B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(3; "Entry Date"; Date)
        {
            Caption = 'Entry Date';
            DataClassification = CustomerContent;
        }
        field(4; "Leave Description"; Text[100])
        {
            Caption = 'Leave Description';
            DataClassification = CustomerContent;
        }
        field(5; "Leave Pay Cadre"; Code[50])
        {
            Caption = 'Leave Pay Cadre';
            TableRelation = Lookup_B2B."Lookup Name" WHERE("Lookup Type" = CONST(22));
            DataClassification = CustomerContent;
        }
        field(6; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionMembers = Taken,Accrued,Adjusted,Entitlement,Lapse;
            DataClassification = CustomerContent;
        }

        field(7; "No. of Leaves"; Decimal)
        {
            Caption = 'No. of Leaves';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(8; Month; Integer)
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
        field(9; Year; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(10; "Leave Code"; Code[10])
        {
            Caption = 'Leave Code.';
            DataClassification = CustomerContent;
        }
        field(11; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(12; "Lapse"; Boolean)
        {
            Caption = 'Lapse';
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
