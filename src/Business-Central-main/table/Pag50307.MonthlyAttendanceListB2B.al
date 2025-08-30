page 50307 "Monthly Attendance List B2B"
{
    ApplicationArea = All;
    Caption = 'Monthly Attendance List B2B';
    PageType = List;
    SourceTable = "Monthly Attendance B2B";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ToolTip = 'Specifies the value of the Employee Code field.', Comment = '%';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ToolTip = 'Specifies the value of the Cheque No. field.', Comment = '%';
                }
                field("C Off Hours"; Rec."C Off Hours")
                {
                    ToolTip = 'Specifies the value of the C Off Hours field.', Comment = '%';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ToolTip = 'Specifies the value of the Cheque Date field.', Comment = '%';
                }
                field(Days; Rec.Days)
                {
                    ToolTip = 'Specifies the value of the Days field.', Comment = '%';
                }
                field("Early Going Hours"; Rec."Early Going Hours")
                {
                    ToolTip = 'Specifies the value of the Early Going Hours field.', Comment = '%';
                }
                field(Holidays; Rec.Holidays)
                {
                    ToolTip = 'Specifies the value of the Holidays field.', Comment = '%';
                }
                field("Late Hours"; Rec."Late Hours")
                {
                    ToolTip = 'Specifies the value of the Late Hours field.', Comment = '%';
                }
            }
        }
    }
}
