codeunit 50302 "Library Assert"
{
    Subtype = Test;

    procedure AreEqual(Expected: Variant; Actual: Variant; Message: Text)
    begin
        if Format(Expected) <> Format(Actual) then
            Error('Assert.AreEqual failed. %1 Expected: %2. Actual: %3.', Message, Format(Expected), Format(Actual));
    end;

    procedure AreNotEqual(NotExpected: Variant; Actual: Variant; Message: Text)
    begin
        if Format(NotExpected) = Format(Actual) then
            Error('Assert.AreNotEqual failed. %1 Not Expected: %2.', Message, Format(NotExpected));
    end;


    procedure IsTrue(Condition: Boolean; Message: Text)
    begin
        if not Condition then
            Error('Assert.IsTrue failed. %1', Message);
    end;

    procedure IsFalse(Condition: Boolean; Message: Text)
    begin
        if Condition then
            Error('Assert.IsFalse failed. %1', Message);
    end;

    procedure IsNull(Value: Variant; Message: Text)
    begin
        if not IsNull(Value) then
            Error('Assert.IsNull failed. %1', Message);
    end;

    procedure IsNotNull(Value: Variant; Message: Text)
    begin
        if IsNull(Value) then
            Error('Assert.IsNotNull failed. %1', Message);
    end;

    local procedure IsNull(Value: Variant): Boolean
    begin
        exit(Format(Value) = '');
    end;
}
