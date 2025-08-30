report 50301 "Copy Service Order"
{
    Caption = 'Copy Service Document';
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    { }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentType; FromDocType)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the type of document that is processed by the report or batch job.';

                        trigger OnValidate()
                        begin
                            FromDocNo := '';
                            ValidateDocNo();
                        end;
                    }
                    field(DocumentNo; FromDocNo)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Document No.';
                        ShowMandatory = true;
                        ToolTip = 'Specifies the number of the document that is processed by the report or batch job.';

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            LookupDocNo();
                        end;

                        trigger OnValidate()
                        begin
                            ValidateDocNo();
                        end;
                    }
                    field(FromDocNoOccurrence; FromDocNoOccurrence)
                    {
                        ApplicationArea = Suite;
                        BlankZero = true;
                        Caption = 'Doc. No. Occurrence';
                        Editable = false;
                        ToolTip = 'Specifies the number of times the No. value has been used in the number series.';
                    }
                    field(FromDocVersionNo; FromDocVersionNo)
                    {
                        ApplicationArea = Suite;
                        BlankZero = true;
                        Caption = 'Version No.';
                        Editable = false;
                        ToolTip = 'Specifies the version of the document to be copied.';
                    }
                    field(SellToCustNo; FromServiceInvHeader."Customer No.")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Sell-to Customer No.';
                        Editable = false;
                        ToolTip = 'Specifies the sell-to customer number that will appear on the new service document.';
                    }
                    field(SellToCustName; FromServiceInvHeader.Name)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Sell-to Customer Name';
                        Editable = false;
                        ToolTip = 'Specifies the sell-to customer name that will appear on the new service document.';
                    }
                    field(IncludeHeader_Options; IncludeHeader)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Include Header';
                        ToolTip = 'Specifies if you also want to copy the information from the document header. When you copy quotes, if the posting date field of the new document is empty, the work date is used as the posting date of the new document.';

                        trigger OnValidate()
                        begin
                            ValidateIncludeHeader();
                        end;
                    }
                    field(RecalculateLines; RecalculateLines)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Recalculate Lines';
                        ToolTip = 'Specifies that lines are recalculate and inserted on the service document you are creating. The batch job retains the item numbers and item quantities but recalculates the amounts on the lines based on the customer information on the new document header. In this way, the batch job accounts for item prices and discounts that are specifically linked to the customer on the new header.';

                        trigger OnValidate()
                        begin
                            if not IncludeHeader then
                                RecalculateLines := true;
                        end;
                    }
                }
            }
        }
        actions { }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            if CloseAction = Action::OK then
                if FromDocNo = '' then
                    Error(DocNoNotSerErr)
        end;
    }
    trigger OnPreReport()
    begin
        Case true of
            FromDocType in [FromDocType::Invoice]:
                begin
                    CopyServDocMgt.SetProperties(IncludeHeader, RecalculateLines);
                    CopyServDocMgt.CopyServiceDoc(FromDocType, FromDocNo, FromDocVersionNo, ServiceHeader);
                end;
        End;
    end;

    procedure SetServiceHeader(Var NewServiceHeader: Record "Service Header")
    begin
        ServiceHeader := NewServiceHeader;
    end;

    procedure LookupDocNo()
    begin
        Case FromDocType of
            FromDocType::Invoice:
                begin
                    FromServiceInvHeader.FilterGroup := 0;
                    if Page.RunModal(0, FromServiceInvHeader) = Action::LookupOK then
                        FromDocNo := FromServiceInvHeader."No.";
                end;
        End;
    end;

    local procedure ValidateDocNo()
    begin
        if ServiceHeader."Document Type" = ServiceHeader."Document Type"::Invoice then begin
            if FromDocNo = '' then begin
                FromServiceInvHeader.Init();
            end
            else if FromServiceInvHeader."No." <> FromDocNo then begin
                FromServiceInvHeader.Init();
                case FromDocType of
                    FromDocType::Invoice:
                        FromServiceInvHeader.Get(CopyServDocMgt.GetServiceDocumentType(FromDocType), FromDocNo);
                end;
            end;
            IncludeHeader := true;
            ValidateIncludeHeader();
        end;
    end;

    procedure ValidateIncludeHeader()
    begin
        RecalculateLines := not IncludeHeader;
    end;

    var
        CopyServDocMgt: Codeunit CopyServiceDocMgt;
        ServiceHeader: Record "Service Header";
        FromDocType: Enum "Service Document Type";
        FromDocNo: Code[20];
        FromDocNoOccurrence, FromDocVersionNo : Integer;
        IncludeHeader, RecalculateLines : Boolean;
        FromServiceInvHeader: Record "Service Invoice Header";
        Text001: Label 'Copy to %1 requires Document Type "Invoice" as Source Document';
        DocNoNotSerErr: Label 'Select a document number to continue, or choose Cancel to close the page.';
}


// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

codeunit 50313 CopyServiceDocMgt
{

    procedure GetServiceDocumentType(DocType: Enum "Service Document Type"): Integer
    var
        ServiceHeader: Record "Service Header";
    begin
        case DocType of
            ServiceDocType::Invoice:
                exit(ServiceHeader."Document Type"::Invoice.AsInteger());
        end;
    end;

    procedure SetProperties(NewIncludeHeader: Boolean; NewRecalculateLines: Boolean)
    begin
        IncludeHeader := NewIncludeHeader;
        RecalculateLines := NewRecalculateLines;
    end;

    procedure CopyServiceDoc(Var ServDocType: enum "Service Document Type"; DocNo: Code[20]; DocVersionNo: Integer; ToserviceHeader: Record "Service Header")
    var
        FromServiceInvHeader: Record "Service Invoice Header";
        OldServiceHeader: Record "Service Header";
        RecRef: RecordRef;
    begin
        ToserviceHeader.TestField("Release Status", ToserviceHeader."Release Status"::Open);
        if DocNo = '' then
            Error(Text000);
        // ToserviceHeader.Find;
        TransferOldExtLines.ClearLineNumbers();
        //OldServiceHeader := ToserviceHeader;

        Case ServDocType of
            ServiceDocType::Invoice:
                begin
                    if IncludeHeader then begin
                        FromServiceInvHeader.Get(DocNo);
                        ToserviceHeader.TransferFields(FromServiceInvHeader, false);
                        ToserviceHeader.Modify(true);
                    end;
                    if not IncludeHeader then;
                end;
        end;

        Case ServDocType of
            ServiceDocType::Invoice:
                begin
                    FromServiceInvHeader.Get(DocNo);
                    if RecalculateLines then
                        CopyServiceLines(FromServiceInvHeader, ToserviceHeader);
                    if not RecalculateLines then;
                end;
        end;
    End;

    procedure CopyServiceLines(FromserviceInvHeader: Record "Service Invoice Header"; ToserviceHeader: Record "Service Header")
    var
        FromserviceInvLines: Record "Service Invoice Line";
        ToserviceLines: Record "Service Line";
        LineNo: Integer;
    begin
        if ToserviceHeader."Document Type" = ToserviceHeader."Document Type"::"Credit Memo" then begin
            FromserviceInvLines.SetRange("Document No.", FromserviceInvHeader."No.");
            FromserviceInvLines.SetFilter("No.", '<>%1', '');
            if FromserviceInvLines.FindSet() then
                repeat
                    if FromserviceInvLines.Quantity > 0 then begin
                        ToserviceLines.Init();
                        LineNo += 10000;
                        ToserviceLines."Document Type" := ToserviceHeader."Document Type";
                        ToserviceLines."Document No." := ToserviceHeader."No.";
                        ToserviceLines."Line No." := LineNo;
                        ToserviceLines.Insert(true);
                        ToserviceLines.TransferFields(FromserviceInvLines, false);
                        ToserviceLines.Modify(true);
                    end;
                until FromserviceInvLines.Next() = 0;
        end;
    end;

    var
        ServiceDocType: Enum "Service Document Type";
        IncludeHeader, RecalculateLines : Boolean;
        Text000: Label 'Enter a Document No.';
        Text001: Label '%1 %1 cannot be Copied on itself';
        TransferOldExtLines: Codeunit "Transfer Old Ext. Text Lines";
}
// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pageextension 50303 Serviceorderext extends "Service Credit Memo"
{
    actions
    {
        addbefore("&Cr. Memo")
        {
            action(CopyDocument)
            {
                ApplicationArea = All;
                Caption = 'Copy Document';
                Ellipsis = true;
                Enabled = Rec."No." <> '';
                Image = CopyDocument;
                ToolTip = 'Copy document lines and header information from another Service document to this document. You can copy a posted Service invoice into a new Service invoice to quickly create a similar document.';
                trigger OnAction()
                var
                    CopyServiceDocument: Report "Copy Service Order";
                begin
                    Rec.TestField("Customer No.");
                    CopyServiceDocument.SetServiceHeader(Rec);
                    CopyServiceDocument.RunModal();
                    Clear(CopyServiceDocument);
                end;
            }
        }
    }
}
