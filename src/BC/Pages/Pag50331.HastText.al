namespace MouchProject.MouchProject;
using System.Security.Encryption;

page 50331 "Hast Text"
{
    ApplicationArea = All;
    Caption = 'Hast Text';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            field("Input Text"; Input)
            {
                ApplicationArea = All;
                MultiLine = true;
            }
            field("Hash"; Hash)
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(ConvertTextHashText)
            {
                Caption = 'Text To Hash';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    crypt: Codeunit "Cryptography Management";
                begin
                    Hash := crypt.GenerateHashAsBase64String(Input, 2);
                end;
            }
        }
    }

    var
        Input: Text;
        Hash: Text;
}
