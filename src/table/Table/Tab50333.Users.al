table 50333 Users
{
    Caption = 'Users';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
        }
        field(2; "Name"; Text[20])
        {
            Caption = 'Name';
        }
        field(3; "Username"; Text[20])
        {
            Caption = 'Username';
        }
        field(4; "Email"; Text[20])
        {
            Caption = 'Email';
        }
        field(5; "Street"; Text[20])
        {
            Caption = 'Street';
        }
        field(6; "Suite"; Text[20])
        {
            Caption = 'Suite';
        }
        field(7; "City"; Text[20])
        {
            Caption = 'City';
        }
        field(8; "Zipcode"; Code[20])
        {
            Caption = 'Zipcode';
        }
        field(9; "Geo Lat"; Text[20])
        {
            Caption = 'Geo Latitude';
        }
        field(10; "Geo Lng"; Text[20])
        {
            Caption = 'Geo Longitude';
        }
        field(11; "Phone"; Text[20])
        {
            Caption = 'Phone';
        }
        field(12; "Website"; Text[20])
        {
            Caption = 'Website';
        }
        field(13; "Company Name"; Text[20])
        {
            Caption = 'Company Name';
        }
        field(14; "Catch Phrase"; Text[20])
        {
            Caption = 'Company Catch Phrase';
        }
        field(15; "Business Statement"; Text[100])
        {
            Caption = 'Company Business Statement';
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }
}
