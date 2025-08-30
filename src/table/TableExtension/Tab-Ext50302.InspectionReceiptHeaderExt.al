tableextension 50302 "Inspection Receipt Header Ext" extends "Inspection Receipt Header B2B"
{
    fields
    {
        field(50300; "Approval Status"; Enum "Approval Status")
        {
            Caption = 'Approval Status';
            DataClassification = ToBeClassified;
        }
        field(50301; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
    }
}
