namespace MouchProject.MouchProject;

using Microsoft.Inventory.Item;

pageextension 50301 ItemListExt extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(FindDuplicates)
            {
                Caption = 'Find Duplicates';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = FilterLines;
                trigger OnAction()
                var
                    Item1: Record Item;
                    Item2: Record Item;
                    DuplicateFilter: Text[2048];
                    ItemDescription: Text[100];
                begin
                    DuplicateFilter := '';
                    ItemDescription := '';
                    // Remove all filter
                    Item1.Reset();
                    Item1.SetCurrentKey(Description);
                    Item1.Ascending(true);
                    if Item1.FindSet() then
                        repeat
                            if ItemDescription <> Item1.Description then begin
                                Item2.Reset();
                                Item2.SetRange(Description, Item1.Description);
                                if Item2.Count > 1 then begin
                                    ItemDescription := Item1.Description;
                                    if DuplicateFilter = '' then
                                        DuplicateFilter := Item1.Description
                                    else
                                        DuplicateFilter := DuplicateFilter + '|' + Item1.Description;
                                end;
                            end;
                        until Item1.Next() = 0;
                    //Message(DuplicatesFilter);
                    Rec.SetFilter(Description, DuplicateFilter);
                    CurrPage.Update();

                end;
            }
        }
    }
}
