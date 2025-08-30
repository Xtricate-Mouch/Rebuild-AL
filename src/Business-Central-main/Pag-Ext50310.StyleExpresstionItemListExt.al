namespace MouchProject.MouchProject;

using Microsoft.Inventory.Item;

pageextension 50310 "ItemListExt " extends "Item List"
{
    layout
    {
        modify("Description")
        {
            StyleExpr = nameStyle;
        }
    }
    actions
    {
        addafter(AdjustInventory)
        {
            action(StandardAccent)
            {
                ApplicationArea = All;
                Caption = 'StandardAccent';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    // Message('Hello Trigger from Item Style Expression In Items');
                    ChangeNameStyle(PageStyle::StandardAccent);
                end;
            }
            action(Strong)
            {
                ApplicationArea = All;
                Caption = 'Strong';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ChangeNameStyle(PageStyle::Strong);
                end;
            }
            action(Favorable)
            {
                ApplicationArea = All;
                Caption = 'Favorable';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ChangeNameStyle(PageStyle::Favorable);
                end;
            }
            action(Ambiguous)
            {
                ApplicationArea = All;
                Caption = 'Ambiguous';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ChangeNameStyle(PageStyle::Ambiguous);
                end;
            }
        }
    }

    var
        nameStyle: Text;

    local procedure ChangeNameStyle(newPageStyle: PageStyle)
    begin
        nameStyle := Format(newPageStyle);
    end;
}
