// namespace MouchProject.MouchProject;
// codeunit 50315 "SKU Creation Automation"
// {
//     var
//         StockkeepingUnit: Record "Stockkeeping Unit";

//     procedure CreateSKUsForAllVariantsAndLocations()
//     var
//         ItemRec: Record Item;
//         ItemVariantTempRec: Record "Item Variant" temporary;
//         SalesShipmentLineRec: Record "Sales Shipment Line";
//         PurchaseReceiptLineRec: Record "Purch. Rcpt. Line";
//         LocationTempRec: Record "Location" temporary;
//     begin
//         SalesShipmentLineRec.Reset();
//         SalesShipmentLineRec.SetRange(Type, SalesShipmentLineRec.Type::Item);
//         SalesShipmentLineRec.SetRange("Posting Date", CalcDate('<-6M>', Today), Today);
//         if SalesShipmentLineRec.FindSet() then
//             repeat
//                 if not LocationTempRec.Get(SalesShipmentLineRec."Location Code") then begin
//                     LocationTempRec.Init();
//                     LocationTempRec."Code" := SalesShipmentLineRec."Location Code";
//                     LocationTempRec.Insert();
//                 end;
//                 if Not ItemVariantTempRec.Get(SalesShipmentLineRec."No.", SalesShipmentLineRec."Variant Code") then begin
//                     ItemVariantTempRec.Init();
//                     ItemVariantTempRec."Item No." := SalesShipmentLineRec."No.";
//                     ItemVariantTempRec.Code := SalesShipmentLineRec."Variant Code";
//                     ItemVariantTempRec.Insert();
//                 end;
//             until SalesShipmentLineRec.Next() = 0;

//         PurchaseReceiptLineRec.Reset();
//         PurchaseReceiptLineRec.SetRange(Type, SalesShipmentLineRec.Type::Item);
//         SalesShipmentLineRec.SetRange("Posting Date", CalcDate('<-6M>', Today), Today);
//         if PurchaseReceiptLineRec.FindSet() then
//             repeat
//                 if not LocationTempRec.Get(PurchaseReceiptLineRec."Location Code") then begin
//                     LocationTempRec.Init();
//                     LocationTempRec."Code" := SalesShipmentLineRec."Location Code";
//                     LocationTempRec.Insert();
//                 end;
//                 if Not ItemVariantTempRec.Get(SalesShipmentLineRec."No.", SalesShipmentLineRec."Variant Code") then begin
//                     ItemVariantTempRec.Init();
//                     ItemVariantTempRec."Item No." := SalesShipmentLineRec."No.";
//                     ItemVariantTempRec.Code := SalesShipmentLineRec."Variant Code";
//                     ItemVariantTempRec.Insert();
//                 end;
//             until PurchaseReceiptLineRec.Next() = 0;

//         ItemRec.Reset();
//         ItemRec.SetFilter("Reordering Policy", '<>%1', ItemRec."Reordering Policy"::" ");
//         if ItemRec.FindSet() then
//             repeat
//                 LocationTempRec.Reset();
//                 LocationTempRec.SetFilter(Code, ItemRec.GetFilter("Location Filter"));
//                 if LocationTempRec.FindSet() then
//                     repeat
//                         ItemRec.SetRange("Location Filter", LocationTempRec.Code);
//                         CreateSKUIfRequired(ItemRec, LocationTempRec.Code, '');
//                     until LocationTempRec.Next() = 0;

//                 ItemVariantTempRec.Reset();
//                 ItemVariantTempRec.SetRange("Item No.", ItemRec."No.");
//                 ItemVariantTempRec.SetFilter(Code, ItemRec.GetFilter("Variant Filter"));
//                 if ItemVariantTempRec.FindSet() then
//                     repeat
//                         ItemRec.SetRange("Variant Filter", ItemVariantTempRec.Code);
//                         CreateSKUIfRequired(ItemRec, '', ItemVariantTempRec.Code);
//                     until ItemVariantTempRec.Next() = 0;

//                 LocationTempRec.Reset();
//                 LocationTempRec.SetFilter(Code, ItemRec.GetFilter("Location Filter"));
//                 if LocationTempRec.FindSet() then
//                     repeat
//                         ItemRec.SetRange("Location Filter", LocationTempRec.Code);
//                         ItemVariantTempRec.Reset();
//                         ItemVariantTempRec.SetRange("Item No.", ItemRec."No.");
//                         ItemVariantTempRec.SetFilter(Code, ItemRec.GetFilter("Variant Filter"));
//                         if ItemVariantTempRec.FindSet() then
//                             repeat
//                                 ItemRec.SetRange("Variant Filter", ItemVariantTempRec.Code);
//                                 CreateSKUIfRequired(ItemRec, LocationTempRec.Code, ItemVariantTempRec.Code);
//                             until ItemVariantTempRec.Next() = 0;
//                     until LocationTempRec.Next() = 0;
//             until ItemRec.Next() = 0;
//         LocationTempRec.DeleteAll();
//         ItemVariantTempRec.DeleteAll();
//     end;

//     procedure CreateSKUIfRequired(var Item2: Record Item; LocationCode: Code[10]; VariantCode: Code[10])
//     begin
//         if not StockkeepingUnit.Get(LocationCode, Item2."No.", VariantCode) then
//             CreateSKU(Item2, LocationCode, VariantCode);
//     end;

//     procedure CreateSKU(var Item2: Record Item; LocationCode: Code[10]; VariantCode: Code[10])
//     begin
//         StockkeepingUnit.Init();
//         StockkeepingUnit."Item No." := Item2."No.";
//         StockkeepingUnit."Location Code" := LocationCode;
//         StockkeepingUnit."Variant Code" := VariantCode;
//         StockkeepingUnit.CopyFromItem(Item2);
//         StockkeepingUnit."Last Date Modified" := WorkDate();
//         StockkeepingUnit."Special Equipment Code" := Item2."Special Equipment Code";
//         StockkeepingUnit."Put-away Template Code" := Item2."Put-away Template Code";
//         StockkeepingUnit.SetHideValidationDialog(true);
//         StockkeepingUnit.Validate("Phys Invt Counting Period Code", Item2."Phys Invt Counting Period Code");
//         StockkeepingUnit."Put-away Unit of Measure Code" := Item2."Put-away Unit of Measure Code";
//         StockkeepingUnit."Use Cross-Docking" := Item2."Use Cross-Docking";
//         StockkeepingUnit.Insert(true);
//     end;
// }
