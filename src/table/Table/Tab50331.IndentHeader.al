table 50331 "Indent Header"
{
    Caption = 'Indent Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No';
            DataClassification = CustomerContent;
        }
        field(2; "Document Type"; Option)
        {
            OptionMembers = Order,Invoice,CreditMemo; // add your document types
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
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
