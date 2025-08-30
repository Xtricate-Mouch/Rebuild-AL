tableextension 50305 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(50300; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            DataClassification = ToBeClassified;
        }
        field(50301; "Sales Order No. Cus"; Code[20])
        {
            Caption = 'Sales Order No. Cus';
        }
        field(50302; "PO Indent"; Boolean)
        {
            Caption = 'PO Indent';
        }
    }
}
