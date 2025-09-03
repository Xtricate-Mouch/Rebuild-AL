namespace MouchProject.MouchProject;

using Microsoft.Sales.Customer;

pageextension 50315 "json-obj&arr-Customer-List ext" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("wtite Json")
            {
                Caption = 'write json';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Action;

                trigger OnAction()
                begin
                    callJson();
                end;
            }
            action("read Json")
            {
                Caption = 'call json';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Action;

                trigger OnAction()
                begin
                    readJson();
                end;
            }
        }
    }
    procedure callJson()
    begin
        // Create a JsonObject
        Obj.Add('name', 'jonhson');
        Obj.Add('age', 18);
        // Create a JsonArray
        arr.Add('apple');
        arr.Add('banana');
        // Add the JsonArray to the JsonObject
        Obj.Add('fruit', arr);
        // Show result
        Obj.WriteTo(JsonTxt);
        Message(JsonTxt);
    end;

    procedure readJson()
    var
        JsonObj: JsonObject;
        JsonTok: JsonToken;
        Fruits: JsonArray;
        FruitTok: JsonToken;
        FruitValue: JsonValue;
        Name: Text;
        Age: Integer;
        Fruit: Text;
        i: Integer;
    begin
        // Read JSON from your existing JsonTxt variable
        if not JsonObj.ReadFrom(JsonTxt) then
            Error('Invalid JSON: %1', JsonTxt);

        // Get "name"
        if JsonObj.Get('name', JsonTok) then
            Name := JsonTok.AsValue().AsText();

        // Get "age"
        if JsonObj.Get('age', JsonTok) then
            Age := JsonTok.AsValue().AsInteger();

        // Get "fruit" array
        if JsonObj.Get('fruit', JsonTok) then begin
            Fruits := JsonTok.AsArray();

            // Loop through array elements
            for i := 0 to Fruits.Count() - 1 do begin
                Fruits.Get(i, FruitTok); // ✅ correct usage
                FruitValue := FruitTok.AsValue();
                Fruit := FruitValue.AsText();
                Message('Fruit[%1] = %2', i, Fruit);
            end;
        end;

        // Show summary
        Message('Name: %1, Age: %2', Name, Age);
    end;


    var
        Obj: JsonObject;
        arr: JsonArray;
        JsonTxt: Text;
}
