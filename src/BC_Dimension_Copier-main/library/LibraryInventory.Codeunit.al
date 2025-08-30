codeunit 50305 "Library - Inventory"
{
    Subtype = Test;

    procedure CreateItem(var Item: Record Item)
    begin
        Item.Init();
        Item."No." := 'ITEM-' + Format(Random(10000));
        Item.Description := 'Test Item';
        Item.Insert();
    end;
}
