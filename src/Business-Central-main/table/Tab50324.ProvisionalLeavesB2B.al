table 50324 "Provisional Leaves B2B"
{
    Caption = 'Provisional Leaves B2B';
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
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
        field(4; "Leave Code"; Code[10])
        {
            Caption = 'Leave Code';
            DataClassification = CustomerContent;
        }
        field(5; "Leave Descriptioon"; Text[100]) // spelling kept as per your code
        {
            Caption = 'Leave Description';
            DataClassification = CustomerContent;
        }
        field(6; "No.of Leaves"; Decimal)
        {
            Caption = 'No. of Leaves';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(7; "Remaining Leaves"; Decimal)
        {
            Caption = 'Remaining Leaves';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Approved,Rejected,Closed;
            DataClassification = CustomerContent;
        }
        field(9; Month; Integer)
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
        field(10; Year; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(11; "Leave Year Start Date"; Date)
        {
            Caption = 'Leave Year Start Date';
            DataClassification = CustomerContent;
        }
        field(12; "Leave Year End Date"; Date)
        {
            Caption = 'Leave Year End Date';
            DataClassification = CustomerContent;
        }
        field(13; "Prev. Month  Balance"; Decimal)
        {
            Caption = 'Previous Month Balance';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(14; "Period Start Date"; Date)
        {
            Caption = 'Period Start Date';
            DataClassification = CustomerContent;
        }
        field(15; "Period End Date"; Date)
        {
            Caption = 'Period End Date';
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
