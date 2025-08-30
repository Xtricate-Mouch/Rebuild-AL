// How to restrict certain tables from importing data through Configuration Package
// ______________________________________________________________________________________

// There are two restrictions on import tables when using Configuration Package.

// 1. For posted tables and entry tables, we cannot insert, modify, or delete them through the Configuration Package. For example, G/L Entry (17)
// 2. We also cannot import or export system tables through Configuration Package.
// For example,

// You cannot use system table 2000000006 in the package.

// ------------------------------------------------------------------------------------------------------------------------------------------------------
// So we can only do it through customization, there are many ways. I will mainly introduce one that uses a standard event, OnAfterIsSystemTable(TableID: Integer; var Result: Boolean).
// Of course, you can create a new table to manage the tables that users are prohibited from importing, or you can add user IDs to control in more detail who can import what tables.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

codeunit 50312 ConfigPackageHandler
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Config. Management", OnAfterIsSystemTable, '', false, false)]
    local procedure "ConfigManagement_OnAfterIsSystemTable"(TableID: Integer; var Result: Boolean)
    begin
        if TableID = Database::"Payment Terms" then
            Result := true; // Mark "Payment Terms" as a system table
    end;
}
