page 50306 "Employee Payment Details B2B"
{
    ApplicationArea = All;
    Caption = 'Employee Payment Details B2B';
    PageType = List;
    SourceTable = "Employee Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the number of the employee account that the entry is linked to.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the amount of the entry.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the amount of the entry in LCY.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the employee entry.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the employee entry''s document number.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the employee entry''s document type.';
                }
            }
        }
    }
}
