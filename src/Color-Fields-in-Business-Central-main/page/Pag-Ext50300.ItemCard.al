pageextension 50300 "Item Card color emoji" extends "Item Card"
{
    layout
    {
        addafter(VariantMandatoryDefaultNo)
        {
            field("color emoji"; Rec."color emoji")
            {
                ApplicationArea = All;
            }
        }
    }
}
