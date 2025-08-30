page 50301 "TestPage"
{
    ApplicationArea = All;
    Caption = 'Test Sales Quote GET ALL Dimension';
    PageType = Card;
    SourceTable = "Sales Header";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                Caption = 'Click to run the CodeUnit';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestCodeUnit)
            {
                Caption = 'Test Get Sales Quotes With no Dimension';
                trigger OnAction()
                var
                    CopyDimension: Codeunit "Sales Doc Dimension Processor";
                begin
                    CopyDimension.ProcessSalesDocuments();
                end;
            }
        }
    }
}
