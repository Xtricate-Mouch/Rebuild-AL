namespace MouchProject.MouchProject;

page 50325 "Media Test Card"
{
    ApplicationArea = All;
    Caption = 'Media Test Card';
    PageType = Card;
    SourceTable = "Media Test";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
        area(FactBoxes)
        {
            part(MediaControl; "Media Upload Test")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
            part(BlobControl; "Blob Upload Test")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}
