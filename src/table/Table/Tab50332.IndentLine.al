table 50332 "Indent Line"
{
    Caption = 'Indent Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[10])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Indent Header No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Type; Option)
        {
            OptionMembers = Item,"GL Account",Service,Resource; // Add more as needed
            DataClassification = ToBeClassified;
        }
        field(6; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document Type"; Option)
        {
            OptionMembers = Order,Invoice,CreditMemo; // add your document types
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
        key(IndentHeaderLine; "Indent Header No.", "Line No.")
        {
            Clustered = false;
        }
    }
}
