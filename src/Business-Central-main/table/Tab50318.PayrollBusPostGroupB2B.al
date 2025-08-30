table 50318 "Payroll Bus. Post Group B2B"
{
    Caption = 'Payroll Bus. Post Group B2B';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
