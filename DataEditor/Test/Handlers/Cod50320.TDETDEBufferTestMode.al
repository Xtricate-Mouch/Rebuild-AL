namespace MouchProject.MouchProject;

codeunit 50320 "TDET DE Buffer Test Mode"
{
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Page, Page::"DET Data Editor Buffer", 'OnPageInitialization', '', false, false)]
    local procedure OnPageInitialization(var IsTestMode: Boolean)
    begin
        IsTestMode := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"New DET Data Editor Buffer", 'OnBeforeModifyEvent', '', false, false)]
    local procedure DataEditorBuffer_OnBeforeModifyEvent(RunTrigger: Boolean; var Rec: Record "New DET Data Editor Buffer")
    begin
        Rec."Modified At" := CurrentDateTime();
    end;

    [EventSubscriber(ObjectType::Table, Database::"New DET Data Editor Buffer", 'OnBeforeInsertEvent', '', false, false)]
    local procedure DataEditorBuffer_OnBeforeInsertEvent(RunTrigger: Boolean; var Rec: Record "New DET Data Editor Buffer")
    begin
        Rec."Modified At" := CurrentDateTime();
    end;
}
