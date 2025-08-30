codeunit 50303 "Library - Sales"
{
    Subtype = Test;

    procedure CreateCustomer(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer."No." := 'CUST-' + Format(Random(10000));
        Customer.Name := 'Test Customer';
        Customer.Insert();
    end;

    procedure CreateSalesHeader(var SalesHeader: Record "Sales Header"; DocType: Enum "Sales Document Type"; CustomerNo: Code[20])
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := DocType;
        SalesHeader."No." := 'SORD-' + Format(Random(10000));
        SalesHeader."Sell-to Customer No." := CustomerNo;
        SalesHeader.Insert();
    end;

    procedure CreateSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; LineType: Enum "Sales Line Type"; ItemNo: Code[20]; Quantity: Decimal)
    begin
        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine.Type := LineType;
        SalesLine."No." := ItemNo;
        SalesLine.Quantity := Quantity;
        SalesLine."Line No." := 10000;
        SalesLine.Insert();
    end;

    procedure CreateStandardText(var StandardText: Record "Standard Text")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        StandardText.Init();
        StandardText.Code := CopyStr(Format(CreateGuid()), 1, MaxStrLen(StandardText.Code));
        StandardText.Description := 'Test Standard Text ' + Format(CurrentDateTime());
        StandardText.Insert(true);
    end;
}
