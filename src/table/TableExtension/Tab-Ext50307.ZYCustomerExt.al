namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

tableextension 50307 "ZYCustomerExt " extends Customer
{
    fields
    {
        field(50307; "Vehicle Visible"; Boolean)
        {
            Caption = 'Vehicle Visible';
            DataClassification = ToBeClassified;
        }
        field(50301; "Car Code"; Code[20])
        {
            Caption = 'Car Code';
            DataClassification = ToBeClassified;
        }
        field(50302; "Car Name"; Text[50])
        {
            Caption = 'Car Name';
            DataClassification = ToBeClassified;
        }
        field(50303; "Motorcycle Code"; Code[20])
        {
            Caption = 'Motorcycle Code';
            DataClassification = ToBeClassified;
        }
        field(50304; "Motorcycle Name"; Text[50])
        {
            Caption = 'Motorcycle Name';
            DataClassification = ToBeClassified;
        }
        field(50305; "Bicycle Code"; Text[50])
        {
            Caption = 'Bicycle Code';
            DataClassification = ToBeClassified;
        }
        field(50306; "Bicycle Name"; Text[50])
        {
            Caption = 'Bicycle Name';
            DataClassification = ToBeClassified;
        }
    }
}
