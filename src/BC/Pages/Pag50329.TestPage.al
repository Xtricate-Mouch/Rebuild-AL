namespace MouchProject.MouchProject;

page 50329 "Test Page"
{
    ApplicationArea = All;
    Caption = 'Test Page';
    PageType = Card;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(loop)
            {
                Caption = 'Loop For';

                trigger OnAction()
                var
                    loop: Codeunit LoopFor;
                begin
                    loop.Run()
                end;
            }
        }
    }
}
