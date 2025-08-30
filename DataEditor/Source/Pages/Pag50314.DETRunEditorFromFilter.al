namespace MouchProject.MouchProject;

page 50314 "DET Run Editor From Filter"
{

    Caption = 'Close Me';
    PageType = ConfirmationDialog;
    SourceTable = "New DET Data Editor Buffer";
    SourceTableTemporary = true;
    trigger OnOpenPage()
    begin
        RunDataEditorList();
        Error('');
    end;

    local procedure RunDataEditorList()
    var
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        DataEditorBufferList: Page "DET Data Editor Buffer";
        SourceTableNo: Integer;
        ExcludeFlowFields: Boolean;
        WithoutValidate: Boolean;
    begin
        if Rec.GetFilter("Table Number") = '' then
            exit;
        Evaluate(SourceTableNo, Rec.GetFilter("Table Number"));
        DataEditorMgt.TestTableEditable(SourceTableNo);
        if Rec.GetFilter("Without Validate") <> '' then
            Evaluate(WithoutValidate, Rec.GetFilter("Without Validate"));
        if Rec.GetFilter("Exclude FlowFields") <> '' then
            Evaluate(ExcludeFlowFields, Rec.GetFilter("Exclude FlowFields"));
        DataEditorBufferList.LoadRecords(SourceTableNo, '', '', WithoutValidate, ExcludeFlowFields, false, false);
        DataEditorBufferList.Run();
    end;
}
