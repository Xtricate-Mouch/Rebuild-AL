// namespace MouchProject.MouchProject;

// using Microsoft.Sales.Customer;

// pageextension 50312 DateCustomerListExt extends "Customer List"
// {
//     trigger OnOpenPage();
//     var
//         DateTime1: Datetime;
//         DateTime2: Datetime;
//         Duration: Duration;
//         InputString: Text[1024];
//         StringList: List of [Text];
//         OutputString: Label 'The value of Duration is %1.';

//     begin
//         DateTime1 := CreateDateTime(20210101D, 000000T);
//         DateTime2 := CreateDateTime(20210210D, 094235T);
//         Duration := DateTime2 - DateTime1;
//         Message(Format(Duration));

//         Message(OutputString, Format(Duration / 1));

//     end;
// }
