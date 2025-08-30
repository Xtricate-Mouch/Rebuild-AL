tableextension 50304 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50300; "PO Indent"; Boolean)
        {
            Caption = 'PO Indent';
            DataClassification = ToBeClassified;
        }
    }
}
