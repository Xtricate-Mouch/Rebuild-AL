page 50305 "Indent Header Card"
{
    ApplicationArea = All;
    Caption = 'Indent Header';
    SourceTable = "Indent Header";
    UsageCategory = Administration;

    actions
    {
        area(Navigation)
        {
            group(Manage)
            {
                Caption = 'Manage';
                action(CopyDocument)
                {
                    ApplicationArea = All;
                    Caption = 'Copy Document';
                    Image = Copy;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortcutKey = 'F7';
                    ToolTip = 'Copy Document';

                    trigger OnAction()

                    var
                        CopyDocumentCU: Codeunit "CopyDocument";
                    begin
                        CopyDocumentCU.CopyDoc(Rec);
                        Message('Successfully Copied Document');
                    end;

                }
            }
        }
    }
}
