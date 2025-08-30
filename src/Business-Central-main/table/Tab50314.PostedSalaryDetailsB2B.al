table 50314 "Posted Salary Details B2B"
{
    Caption = 'Posted Salary Details B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }

        field(2; "Employee Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(3; Month; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(4; Year; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Salary Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 2;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(EmployeeMonthYear; "Employee Code", Month, Year)
        {
        }
    }

}
