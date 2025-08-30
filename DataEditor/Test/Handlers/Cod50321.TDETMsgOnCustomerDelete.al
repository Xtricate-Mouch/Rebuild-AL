namespace MouchProject.MouchProject;
using Microsoft.Sales.Customer;

codeunit 50321 "TDET Msg On Customer Delete"
{
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterDeleteEvent', '', false, false)]
    local procedure Customer_OnAfterDeleteEvent(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        if RunTrigger then
            Message('test');
    end;
}
