page 50303 "Daily Attendance List B2B"
{
    ApplicationArea = All;
    Caption = 'Daily Attendance List B2B';
    PageType = Worksheet;
    SourceTable = "Daily Attendance B2B";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specify the Employee No';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specify the Employee name';
                }
                field(Absent; Rec.Absent)
                {
                    ToolTip = 'Specifies the value of the Absent field.', Comment = '%';
                }
                field("Actual Time In"; Rec."Actual Time In")
                {
                    ToolTip = 'Specifies the value of the Actual Time In field.', Comment = '%';
                }
                field("Actual Time Out"; Rec."Actual Time Out")
                {
                    ToolTip = 'Specifies the value of the Actual Time Out field.', Comment = '%';
                }

            }
        }
    }
}
