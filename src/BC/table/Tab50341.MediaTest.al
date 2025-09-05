table 50341 "Media Test"
{
    Caption = 'Media Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Code[50])
        {
            Caption = 'Name';
        }
        field(3; "Blob Test"; Blob)
        {
            Caption = 'Blob Test';
        }
        field(4; "Media Test"; Media)
        {
            Caption = 'Media Test';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "No.", "Blob Test", "Media Test") { }
    }
}
