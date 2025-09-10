// dotnet
// {
//     assembly(mscorlib)
//     {
//         type(System.DateTime; MyDateTime)
//         {

//         }
//     }
// }
// pageextension 50320 CustomerListdotnet extends "Customer List"
// {
//     trigger OnOpenPage()
//     var
//         now: DotNet MyDateTime;
//     begin
//         now := now.UtcNow;
//         Message('Hello, world! It is: %1 ' + now.ToString());
//     end;
// }