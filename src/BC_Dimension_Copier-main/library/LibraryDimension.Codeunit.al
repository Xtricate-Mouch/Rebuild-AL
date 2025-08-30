codeunit 50304 "Library - Dimension"
{
    Subtype = Test;

    procedure CreateDimWithDimValue(var DimensionValue: Record "Dimension Value")
    var
        Dimension: Record Dimension;
    begin
        Dimension.Init();
        Dimension.Code := 'DEPT';
        Dimension.Name := 'Department';
        if not Dimension.Get(Dimension.Code) then
            Dimension.Insert();

        DimensionValue.Init();
        DimensionValue."Dimension Code" := Dimension.Code;
        DimensionValue.Code := 'SALES';
        DimensionValue.Name := 'Sales Department';
        if not DimensionValue.Get(DimensionValue."Dimension Code", DimensionValue.Code) then
            DimensionValue.Insert();
    end;

    procedure CreateDefaultDimensionCustomer(var DefaultDim: Record "Default Dimension"; CustomerNo: Code[20]; DimCode: Code[20]; DimValue: Code[20])
    begin
        DefaultDim.Init();
        DefaultDim."Table ID" := Database::Customer;
        DefaultDim."No." := CustomerNo;
        DefaultDim."Dimension Code" := DimCode;
        DefaultDim."Dimension Value Code" := DimValue;
        DefaultDim.Insert();
    end;

    procedure CreateDefaultDimensionItem(var DefaultDim: Record "Default Dimension"; ItemNo: Code[20]; DimCode: Code[20]; DimValue: Code[20])
    begin
        DefaultDim.Init();
        DefaultDim."Table ID" := Database::Item;
        DefaultDim."No." := ItemNo;
        DefaultDim."Dimension Code" := DimCode;
        DefaultDim."Dimension Value Code" := DimValue;
        DefaultDim.Insert();
    end;
}
