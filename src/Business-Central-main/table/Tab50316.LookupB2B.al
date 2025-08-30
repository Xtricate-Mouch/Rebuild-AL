table 50316 Lookup_B2B
{
    Caption = 'Lookup_B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Lookup Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Lookup Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "LookupType Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Lookup Type", "Lookup Name")
        {
            Clustered = true;
        }
    }
}
