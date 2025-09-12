namespace MouchProject.MouchProject;

using Microsoft.Projects.Project.Job;

tableextension 50310 "My Job" extends Job
{
    fields
    {
        field(50300; "MyProgress"; Integer)
        {
            Caption = 'Progress';
            DataClassification = ToBeClassified;
        }
    }
}

// page extension

pageextension 50330 "My Job" extends "Job Card"
{
    layout
    {
        addlast(General)
        {
            field(MyProgress; Rec.MyProgress)
            {
                ApplicationArea = All;
                Caption = 'Progress';
                ToolTip = 'Progress';
                trigger OnValidate()
                begin
                    CurrPage.bar.setProgress(Rec.MyProgress);
                end;
            }
            usercontrol(bar; MyProgressBar)
            {
                ApplicationArea = All;

                trigger IamReady()
                begin
                    // Message('Hello from MyProgressBar');
                end;
            }
        }
    }
}