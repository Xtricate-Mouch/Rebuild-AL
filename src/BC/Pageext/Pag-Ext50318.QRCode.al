pageextension 50318 "QR Code" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(QRCode; Rec.QRCode)
            {
                ApplicationArea = All;
            }

            field(GenerateQRCode; GenerateQRCodeTxt)
            {
                ApplicationArea = All;
                ShowCaption = true;
                Caption = 'Generate QR Code';
                AssistEdit = true;

                trigger OnAssistEdit()
                var
                    HttpClient: HttpClient;
                    HttpResponse: HttpResponseMessage;
                    InS: InStream;
                    OutS: OutStream;
                    Url: Text;
                begin
                    // Build your QR Code URL (replace Example with dynamic data if needed)
                    Url := 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + Format(Rec."No.");

                    if HttpClient.Get(Url, HttpResponse) then begin
                        if HttpResponse.IsSuccessStatusCode() then begin
                            HttpResponse.Content.ReadAs(InS);
                            Clear(Rec.QRCode);
                            Rec.QRCode.CreateOutStream(OutS);
                            CopyStream(OutS, InS);
                            Rec.Modify(true);
                            Message('QR Code generated successfully.');
                        end else
                            Error('Failed to fetch QR code. Status: %1', HttpResponse.HttpStatusCode);
                    end else
                        Error('Error calling QR service.');
                end;
            }
        }
    }

    var
        GenerateQRCodeTxt: Label 'Generate QR Code';
}
