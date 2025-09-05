namespace MouchProject.MouchProject;

page 50326 "Media Upload Test"
{
    ApplicationArea = All;
    Caption = 'Media Upload Test';
    PageType = CardPart;
    SourceTable = "Media Test";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Media Test"; Rec."Media Test")
                {
                    ToolTip = 'Specifies the value of the Media Test field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Upload)
            {
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    InstreamPic: InStream;
                    FromFieldName: Text;
                begin
                    if UploadIntoStream('Import Pic', '', 'All field(*.*)|*.*', FromFieldName, InstreamPic) then begin
                        Rec."Media Test".ImportStream(InstreamPic, FromFieldName);
                        Rec.Modify(true);
                        Message('Done');
                    end;
                end;
            }
            action(Delete)
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()

                begin
                    if Rec."Media Test".HasValue then begin
                        Clear(Rec."Media Test");
                        Rec.Modify(true);
                        Message('Done');
                    end;
                end;
            }
        }
    }
}
