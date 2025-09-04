namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

tableextension 50308 "Customer Test Ext" extends Customer
{
    fields
    {
        field(50310; Test; Code[50])
        {
            Caption = 'Test';
            DataClassification = ToBeClassified;
        }
    }
}
