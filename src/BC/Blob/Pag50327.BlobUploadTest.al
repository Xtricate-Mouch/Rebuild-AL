namespace MouchProject.MouchProject;

page 50327 "Blob Upload Test"
{
    ApplicationArea = All;
    Caption = 'Media Upload';
    PageType = CardPart;
    SourceTable = "Media Test";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Blob Test"; Rec."Blob Test")
                {
                    ToolTip = 'Specifies the value of the Blob Test field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportBlob)
            {
                Caption = 'Import Blob';
                ApplicationArea = All;
                trigger OnAction()
                var
                    InStream: InStream;
                    OutStream: OutStream;
                    FileName: Text[250];
                begin
                    if UploadIntoStream('Select File', '', '', FileName, InStream) then begin
                        Rec."Blob Test".CreateOutStream(OutStream);
                        CopyStream(OutStream, InStream);
                        Rec.Modify(true);
                        Message('File %1 uploaded to Blob.', FileName);
                    end;
                end;
            }

            action(ExportBlob)
            {
                Caption = 'Export Blob';
                ApplicationArea = All;
                trigger OnAction()
                var
                    InStream: InStream;
                    FileName: Text[250];
                begin
                    Rec.CalcFields("Blob Test");
                    if Rec."Blob Test".HasValue then begin
                        Rec."Blob Test".CreateInStream(InStream);
                        FileName := Rec.Name + '_Blob.bin';
                        DownloadFromStream(InStream, 'Export Blob', '', '', FileName);
                    end else
                        Message('No blob data to export.');
                end;
            }
        }
    }


}
