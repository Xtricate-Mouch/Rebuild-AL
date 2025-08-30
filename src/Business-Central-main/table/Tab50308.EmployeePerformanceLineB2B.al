table 50308 "Employee Performance Line B2B"
{
    Caption = 'Employee Performance Line B2B';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Employee No."; Code[10])
        {
            Caption = 'Employee No.';
        }
    }
    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }
}
