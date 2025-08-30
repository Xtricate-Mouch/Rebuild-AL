namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50306 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(RichTextGroup)
            {
                Caption = 'Rich Text Group';
                field(RichText; RichTextVar)
                {
                    Caption = 'Rich Text';
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetRichText();
                    end;

                }
            }
        }
    }

    actions
    {
        addafter(Contact)
        {
            action(PrintRichText)
            {
                Caption = 'Print Rich Text';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // run report rich text content
                    Report.Run(Report::"Rich Text Content", true, false, Rec);
                end;
            }
        }
    }

    var
        RichTextVar: Text;

    trigger OnAfterGetRecord()
    begin
        // Get Rich Text
        GetRichText();
    end;

    // Get Rich Text procedurce
    local procedure GetRichText()
    var
        RichTextInS: InStream;
    begin
        Rec.CalcFields(RichText);
        Rec.RichText.CreateInStream(RichTextInS, TextEncoding::UTF8);
        RichTextInS.Read(RichTextVar);
    end;

    // SetRich Text
    local procedure SetRichText();
    var
        RichTextOutS: OutStream;
    begin
        Rec.RichText.CreateOutStream(RichTextOutS, TextEncoding::UTF8);
        RichTextOutS.Write(RichTextVar);
        Rec.Modify(true);
    end;
}
report 50306 "Rich Text Content"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RichTextContent;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(RichTextVar; RichTextVar)
            {
            }

            trigger OnAfterGetRecord()
            var
                RichTextInS: InStream;
            begin
                Customer.CalcFields(RichText);
                Customer.RichText.CreateInStream(RichTextInS, TextEncoding::UTF8);
                RichTextInS.Read(RichTextVar);
            end;
        }
    }

    rendering
    {
        layout(RichTextContent)
        {
            Type = RDLC;
            LayoutFile = 'RichTextContent.rdl';
        }
    }

    var
        RichTextVar: Text;
}
