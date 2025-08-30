table 50300 TestUserTable
{
    Caption = 'TestUserTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; Name; Code[20])
        {
            Caption = 'Name';
        }
        field(3; Address; Code[20])
        {
            Caption = 'Address';
        }
        field(4; Age; Integer)
        {
            Caption = 'Age';
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
