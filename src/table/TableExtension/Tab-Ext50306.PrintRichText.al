namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

tableextension 50306 CustomerExt extends Customer
{
    fields
    {
        field(50300; RichText; Blob)
        {
            Caption = 'RichText';
            DataClassification = ToBeClassified;
        }
    }
}
