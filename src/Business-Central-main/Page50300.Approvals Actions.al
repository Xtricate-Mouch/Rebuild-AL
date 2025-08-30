page 50311 "Approvals Action"
{
    ApplicationArea = All;
    Caption = 'Approvals Action';
    PageType = List;
    SourceTable = "Approvals Activities Cue";
    // UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(OpenApprovalEntriesExist; OpenApprovalEntriesExist)
                {
                    ApplicationArea = all;
                }
                field(OpenApprovalEntriesExistForCurrUser; OpenApprovalEntriesExistForCurrUser)
                {
                    ApplicationArea = all;
                }
                field("Spec ID"; Rec."Spec ID")
                {
                    ApplicationArea = all;
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Approvals)
            {
                Caption = 'Approvals';
                ToolTip = 'The User Can Send The documents For Approvals';
                action(Approve)
                {
                    ApplicationArea = All;
                    Image = Action;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        approvalmngmt: Codeunit "Approvals Mgmt.";
                    begin
                        approvalmngmt.ApproveRecordApprovalRequest(rec.RecordId());
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalsCodeunit: Codeunit "Approvals Codeunit";
                        InspectionReceipt: Record "Inspection Receipt Header B2B";
                        // Replace this with the actual field name that relates to the Inspection Receipt document
                        InspectionReceiptNo: Code[20];
                    begin
                        // For example, assume 'Primary Key' holds the Inspection Receipt No or some key to fetch it
                        InspectionReceiptNo := Rec."Primary Key";

                        if InspectionReceipt.Get(InspectionReceiptNo) then begin
                            DueDateL(InspectionReceipt);
                            if ApprovalsCodeunit.CheckInspectionReceiptApprovalsWorkflowEnabled(InspectionReceipt) then
                                ApprovalsCodeunit.OnSendInspectionReceiptForApproval(InspectionReceipt);
                        end else
                            Error('Related Inspection Receipt not found.');
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = All;
                    Image = CancelApprovalRequest;
                    //   Visible = CanCancelapprovalforrecord or CanCancelapprovalforflow;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalsCodeunit: Codeunit "Approvals Codeunit";
                        InspectionReceipt: Record "Inspection Receipt Header B2B";
                    begin
                        // Assuming you have a way to get the key from your current Rec:
                        if InspectionReceipt.Get(Activate()) then begin
                            ApprovalsCodeunit.OnCancelInspectionReceiptForApproval(InspectionReceipt);
                            if InspectionReceipt."Approval Status" = InspectionReceipt."Approval Status"::Approved then
                                InspectionReceipt."Approval Status" := InspectionReceipt."Approval Status"::Open;
                            InspectionReceipt.Modify();
                        end else
                            Error('Related Inspection Receipt not found.');
                    end;

                }
                action("Approval Entries")
                {
                    ApplicationArea = All;
                    Image = Entries;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalEntry: Record "Approval Entry";
                    begin
                        ApprovalEntry.Reset();
                        ApprovalEntry.SetRange("Table ID", DATABASE::"Inspection Receipt Header B2B");
                        ApprovalEntry.SetRange("Document No.", Rec."Spec ID");
                        ApprovalEntries.SetTableView(ApprovalEntry);
                        ApprovalEntries.RUN;
                    end;
                }
                action("Re&lease")
                {
                    ApplicationArea = all;
                    Caption = 'Re&lease';
                    ShortCutKey = 'Ctrl+F11';
                    Image = ReleaseDoc;
                    Promoted = true;
                    //PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        WorkflowManagement: Codeunit "Workflow Management";
                        ApprovalsCodeunit: Codeunit "Approvals Codeunit";
                        InspectionReceipt: Record "Inspection Receipt Header B2B";
                    begin
                        // Assuming Rec has a field you can use to get Inspection Receipt, e.g. Document No.
                        if InspectionReceipt.Get(Rec."Spec ID") then begin
                            DueDateL(InspectionReceipt);

                            if WorkflowManagement.CanExecuteWorkflow(InspectionReceipt, ApprovalsCodeunit.RunworkflowOnSendInspectionReceiptforApprovalCode()) then
                                error('Workflow is enabled. You cannot release manually.');

                            if InspectionReceipt."Approval Status" <> InspectionReceipt."Approval Status"::Approved then begin
                                InspectionReceipt."Approval Status" := InspectionReceipt."Approval Status"::Approved;
                                InspectionReceipt.Modify();
                                Message('Document has been Released.');
                            end;
                        end else
                            error('Related Inspection Receipt not found.');
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = all;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        RecordRest: Record "Restricted Record";
                        InspectionReceipt: Record "Inspection Receipt Header B2B";
                    begin
                        // Example: Use a field from Rec to find the related Inspection Receipt
                        // Replace "Spec ID" with the actual field name in Approvals Activities Cue that links to Inspection Receipt
                        if not InspectionReceipt.Get(Rec."Spec ID") then
                            Error('Related Inspection Receipt not found.');

                        RecordRest.Reset();
                        RecordRest.SetRange(ID, Database::"PDC Registration");
                        RecordRest.SetRange("Record ID", InspectionReceipt.RecordId());
                        if RecordRest.FindFirst() then
                            Error('This record is in workflow process. Please cancel approval request if not required.');

                        if InspectionReceipt."Approval Status" <> InspectionReceipt."Approval Status"::Open then begin
                            InspectionReceipt."Approval Status" := InspectionReceipt."Approval Status"::Open;
                            InspectionReceipt.Modify();
                            Message('Document has been Reopened.');
                        end;
                    end;
                }

            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Enabled = false;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalsCodeunit: Codeunit "Routing Approvals";
                        RoutingHeader: Record "Routing Header";
                    begin
                        if RoutingHeader.Get(Rec."Spec ID") then begin
                            if ApprovalsCodeunit.CheckRoutingHeaderApprovalsWorkflowEnabled(RoutingHeader) then
                                ApprovalsCodeunit.OnSendRoutingHeaderForApproval(RoutingHeader);
                        end else
                            Error('Routing Header with Spec ID %1 not found.', Rec."Spec ID");
                    end;
                }
                action("Cancel Approval Request Duplicate")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        ApprovalsCodeunit: Codeunit "Routing Approvals";
                        RoutingHeader: Record "Routing Header";
                    begin
                        // Find the Routing Header that matches this Cue's Spec ID
                        if RoutingHeader.Get(Rec."Spec ID") then begin
                            ApprovalsCodeunit.OnCancelRoutingHeaderForApproval(RoutingHeader);

                            // Since no Approval Status field, skip that check and update
                            Message('Approval request for Routing Header %1 has been cancelled.', RoutingHeader."No.");
                        end else
                            Message('No Routing Header found for Spec ID %1.', Rec."Spec ID");
                    end;
                }
            }
            group("Approvals Duplicate")
            {
                Caption = 'Approval Duplicate';
                action("Approval Duplicate")
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Enabled = OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action("Approval Entries Duplicate")
                {
                    ApplicationArea = All;
                    Image = Entries;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalEntry: Record "Approval Entry";
                    begin
                        ApprovalEntry.Reset();
                        ApprovalEntry.SetRange("Table ID", DATABASE::"Routing Header");
                        ApprovalEntry.SetRange("Document No.", Rec."Spec ID");
                        ApprovalEntries.SetTableView(ApprovalEntry);
                        ApprovalEntries.RUN;
                    end;
                }
            }
        }

    }
    // Local procedure outside layout/actions
    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    local procedure DueDateL(var InspectionReceipt: Record "Inspection Receipt Header B2B")
    begin
        // your logic here, e.g.:
        InspectionReceipt."Due Date" := WorkDate;
        InspectionReceipt.Modify();
    end;

    // local procedure OpenApprovalEntriesExistForCurrUser(): Boolean
    // var
    //     ApprovalEntry: Record "Approval Entry";
    // begin
    //     ApprovalEntry.SetRange("Approval Code", USERID);
    //     ApprovalEntry.SetRange("Status", ApprovalEntry.Status::Open); // Or whatever status means 'open'
    //     exit(ApprovalEntry.FindFirst());
    // end;


}
