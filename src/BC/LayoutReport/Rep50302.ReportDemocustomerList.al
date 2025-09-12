namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

report 50302 "Report DemocustomerList"
{
    ApplicationArea = All;
    Caption = 'Report DemocustomerList';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layout/ReportCustomer.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Contact; Contact) { }
            column(Address; Address) { }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
