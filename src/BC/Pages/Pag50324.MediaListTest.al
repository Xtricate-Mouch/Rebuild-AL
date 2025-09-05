namespace MouchProject.MouchProject;

page 50324 "Media List Test"
{
    ApplicationArea = All;
    Caption = 'Media List Test';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Media Test";
    CardPageId = "Media Test Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Blob Test"; Rec."Blob Test")
                {
                    ToolTip = 'Specifies the value of the Blob Test field.', Comment = '%';
                }
                field("Media Test"; Rec."Media Test")
                {
                    ToolTip = 'Specifies the value of the Media Test field.', Comment = '%';
                }
            }
        }
    }
}
