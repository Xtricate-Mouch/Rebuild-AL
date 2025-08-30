namespace MouchProject.MouchProject;

using Microsoft.Inventory.Requisition;

permissionset 50300 "DET Data Editor Tool"
{
    Assignable = true;
    Caption = 'Data Editor Tool';
    Permissions = table "New DET Data Editor Buffer" = X,
        tabledata "New DET Data Editor Buffer" = RMID,
        tabledata "New DET Field" = RIMD,
        table "New DET Field" = X,
        codeunit "DET Single Instance Storage" = X,
        page "DET Data Editor" = X,
        page "DET Data Editor Buffer" = X,
        page "DET Edit Value" = X,
        page "DET Insert New Record" = X,
        page "DET Run Editor From Filter" = X,
        page "DET Select Fields" = X,
        tabledata "New DET Find and Replace" = RIMD,
        table "New DET Find and Replace" = X,
        codeunit "DET Data Editor Mgt." = X,
        page "DET Find and Replace" = X,
        page "DET Key" = X,
        table "DET Query Preset" = X,
        tabledata "DET Query Preset" = RMID,
        page "DET Query Preset" = X,
        tabledata "DET Data Editor Setup" = RIMD,
        table "DET Data Editor Setup" = X,
        tabledata "DET Data Editor Log" = RIMD,
        table "DET Data Editor Log" = X,
        page "DET Data Editor Setup" = X,
        tabledata "DET Binary Data Buffer" = RIMD,
        table "DET Binary Data Buffer" = X,
        page "DET Data Editor Log" = X,
        page "DET Import/Export Dialog" = X,
        codeunit "DET Data Operations" = X,
        codeunit "DET Read Data Batch" = X;
}
