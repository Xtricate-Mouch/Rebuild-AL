namespace MouchProject.MouchProject;

using Microsoft.Inventory.Item;

tableextension 50309 "QR Codes" extends Item
{
    fields
    {
        field(50309; QRCode; Blob)
        {
            Caption = 'QRCode';
            Subtype= Bitmap;
        }
    }
}
