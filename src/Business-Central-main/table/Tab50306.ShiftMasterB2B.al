table 50306 "Shift Master B2B"
{
    Caption = 'Shift Master B2B';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Shift Code"; Code[20])
        {
            Caption = 'Shift Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(3; "Break Duration"; Decimal)
        {
            Caption = 'Break Duration (Hours)';
            DataClassification = ToBeClassified;
        }
        field(4; "Start Time"; Time)
        {
            Caption = 'Start Time';
            DataClassification = ToBeClassified;
        }
        field(5; "End Time"; Time)
        {
            Caption = 'End Time';
            DataClassification = ToBeClassified;
        }
    }
}