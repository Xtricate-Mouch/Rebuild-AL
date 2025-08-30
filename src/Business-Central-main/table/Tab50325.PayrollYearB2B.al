table 50325 "Payroll Year B2B"
{
    Caption = 'Payroll Year B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Year Code"; Code[10])
        {
            Caption = 'Year Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; "Year Type"; Code[20])
        {
            Caption = 'Year Type';
            DataClassification = CustomerContent;
            // Example: 'LEAVE YEAR', 'PAYROLL YEAR'
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;
        }
        field(5; "Year Start Date"; Date)
        {
            Caption = 'Year Start Date';
            DataClassification = CustomerContent;
        }
        field(6; "Year End Date"; Date)
        {
            Caption = 'Year End Date';
            DataClassification = CustomerContent;
        }
        field(7; Closed; Boolean)
        {
            Caption = 'Closed';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Year Code", "Year Type")
        {
            Clustered = true;
        }
    }
}
