table 50319 "Attendance Lines B2B"
{
    Caption = 'Attendance Lines B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Document Type"; Option)
        {
            OptionMembers = "Lop Adj","OtherType1","OtherType2"; // Add other document types here
            DataClassification = ToBeClassified;
        }
        field(3; "Employee Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; Month; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Year; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Status; Option)
        {
            OptionMembers = Pending,Approved,Rejected; // Adjust status options
            DataClassification = ToBeClassified;
        }
        field(7; "LOP Adj."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        // Add other fields as needed
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(SecondaryKey; "Employee Code", Month, Year, "Document Type")
        {
        }
    }
}