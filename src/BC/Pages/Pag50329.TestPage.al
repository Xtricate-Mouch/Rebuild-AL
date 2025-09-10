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
            action(sum)
            {
                Caption = 'Sum';
                trigger OnAction()
                var
                    sum: Codeunit LoopFor;
                begin
                    sum.add(10, 5);
                end;
            }
        }
    }
}
