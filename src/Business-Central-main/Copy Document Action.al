// change name CopyDoc to CopyDocument
codeunit 50314 "CopyDocument"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    Procedure CopyDoc(VAR ToIndentHeader: Record "Indent Header")
    var
        FromIndentHeader: Record "Indent Header";
        ToIndentLine: record "Indent Line";
        FromIndentLine: record "Indent Line";
        LineNo: Integer;

    begin
        FromIndentHeader.SetRange("Document Type", FromIndentHeader."Document Type"::Order);
        IF PAGE.RUNMODAL(52000, FromIndentHeader) = ACTION::LookupOK THEN BEGIN
            ToIndentHeader.Init();
            ToIndentHeader."Document Type" := ToIndentHeader."Document Type"::Order;
            ToIndentHeader.Validate("Customer No.", FromIndentHeader."Customer No.");
            ToIndentHeader."Location Code" := FromIndentHeader."Location Code";
            ToIndentHeader."Posting Date" := FromIndentHeader."Posting Date";
            ToIndentHeader.Modify();


            FromIndentLIne.RESET;
            FromIndentLine.SetRange("Document Type", FromIndentHeader."Document Type");
            FromIndentLIne.SETRANGE("Document No.", FromIndentHeader."No.");
            IF FromIndentLIne.FINDSET THEN
                REPEAT
                    ToIndentLine.Init();
                    ToIndentHeader."Document Type" := FromIndentHeader."Document Type"::Order;
                    ToIndentLine."Document No." := FromIndentHeader."No.";
                    if ToIndentLine.FindLast() then
                        LineNo := ToIndentLine."Line No." + 10000
                    Else
                        LineNo := 10000;
                    ToIndentLine."Location Code" := FromIndentLine."Location Code";
                    if FromIndentLine.Type = FromIndentLine.Type::Item then begin
                        ToIndentLine.Type := ToIndentLine.Type::Item;
                        ToIndentLine."No." := FromIndentLine."No.";
                        ToIndentLine.Description := FromIndentLine.Description;
                    end;
                    if FromIndentLine.type = FromIndentLine.Type::"GL Account" Then Begin
                        ToIndentLine.Type := FromIndentLine.Type::"GL Account";
                        ToIndentLine."No." := FromIndentLine."No.";
                        ToIndentLine.Description := FromIndentLine.Description;
                    End;
                    ToIndentLine.Modify();
                UNTIL FromIndentLIne.NEXT = 0;
        END;

    end;

}
// actions
// {
//     area(Navigation)
//     {
//         group(Manage)
//         {
//             Caption = 'Manage';
//             action(CopyDocument)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Copy Document';
//                 Image = Copy;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 ShortcutKey = 'F7';
//                 ToolTip = 'Copy Document';

//                 trigger OnAction()
//                 var
//                     CopyDocumentCU: Codeunit "CopyDocument";
//                 begin
//                     CopyDocumentCU.CopyDocument(Rec);
//                     Message('Successfully Copied Document');
//                 end;
//             }
//         }
//     }
// }

