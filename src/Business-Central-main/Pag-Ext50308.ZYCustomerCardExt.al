namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50308 ZYCustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(VehicleText; Vehicle)
            {
                ApplicationArea = All;
                Caption = 'Vehicle';
                Editable = false;
                trigger OnDrillDown()
                begin
                    if Rec."Vehicle Visible" = true then
                        exit;
                    Rec."Vehicle Visible" := true;
                    Rec.Modify(true);
                end;
            }
            group(VehicleGroup)
            {
                Visible = Rec."Vehicle Visible";
                Caption = 'Vehicle Group';

                field("Car Code"; Rec."Car Code")
                {
                    ApplicationArea = All;
                }
                field("Car Name"; Rec."Car Name")
                {
                    ApplicationArea = All;
                }

                field("Motorcycle Code"; Rec."Motorcycle Code")
                {
                    ApplicationArea = All;
                }
                field("Motorcycle Name"; Rec."Motorcycle Name")
                {
                    ApplicationArea = All;
                }

                field("Bicycle Code"; Rec."Bicycle Code")
                {
                    ApplicationArea = All;
                }
                field("Bicycle Name"; Rec."Bicycle Name")
                {
                    ApplicationArea = All;
                }
                field(HideVehicleLbl; HideVehicleLbl)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    trigger OnDrillDown()
                    begin
                        if Rec."Vehicle Visible" = false then
                            exit;
                        Rec."Vehicle Visible" := false;
                        Rec.Modify(true);
                    end;
                }

            }
        }
    }
    var
        Vehicle: Text;
        HideVehicleLbl: Label 'Show less';

    trigger OnOpenPage();
    begin
        Vehicle := 'Show More';
    end;
}
