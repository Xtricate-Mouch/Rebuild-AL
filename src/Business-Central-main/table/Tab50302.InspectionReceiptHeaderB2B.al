table 50302 "Inspection Receipt Header B2B"
{
    Caption = 'Inspection Receipt Header B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
