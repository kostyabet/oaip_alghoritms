Program Translations;

{$APPTYPE CONSOLE}
{$R *.res}

Uses
    System.SysUtils;

///Translation between number systems
Function BinaryToDecimal(BinaryNum: String): Integer;
Const
    BaseNum: Integer = 2;
Var
    Degree, CurentNum, ResultNum: Integer;
Begin
    CurentNum := 1;
    ResultNum := 0;

    For Degree := Length(BinaryNum) DownTo 1 Do
    Begin
        If (BinaryNum[Degree] = '1') Then
            ResultNum := ResultNum + CurentNum;

        CurentNum := CurentNum * BaseNum;
    End;

    BinaryToDecimal := ResultNum;
End;

Function BinaryToOctal(BinaryNum: String): String;
Var
    HighNum, Step, StepNum: Integer;
    CurentPart, ResultNum: String;
Begin
    ResultNum := '';

    While (Length(BinaryNum) Mod 3 <> 0) Do
        Insert('0', BinaryNum, 1);

    HighNum := Length(BinaryNum) Div 3;
    StepNum := 1;
    For Step := 1 To HighNum Do
    Begin
        CurentPart := Copy(BinaryNum, StepNum, 3);
        StepNum := StepNum + 3;

        ResultNum := ResultNum + IntToStr(BinaryToDecimal(CurentPart));
    End;

    BinaryToOctal := ResultNum;
End;

Function BinaryToHexadecimal(BinaryNum: String): String;
Var
    HighNum, Step, StepNum, CurentNum: Integer;
    CurentPart, ResultNum: String;
Begin
    ResultNum := '$';
    While (Length(BinaryNum) Mod 4 <> 0) Do
        Insert('0', BinaryNum, 1);

    HighNum := Length(BinaryNum) Div 4;
    StepNum := 1;
    For Step := 1 To HighNum Do
    Begin
        CurentPart := Copy(BinaryNum, StepNum, 4);
        StepNum := StepNum + 4;

        CurentNum := BinaryToDecimal(CurentPart);

        Case CurentNum Of
            0 .. 9:
                ResultNum := ResultNum + IntToStr(CurentNum);
        Else
            ResultNum := ResultNum + Chr(CurentNum - 10 + 65);
        End;
    End;

    BinaryToHexadecimal := ResultNum;
End;

Function DecimalToBinary(Number: Integer): String;
Var
    ResultStr: String;
Begin
    ResultStr := '';
    While (Number >= 1) Do
    Begin
        Insert(IntToStr(Number Mod 2), ResultStr, 0);
        Number := Number Div 2;
    End;

    DecimalToBinary := ResultStr;
End;

Function DecimaltoOctal(Number: Integer): String;
Var
    ResultStr: String;
Begin
    ResultStr := '';
    While (Number >= 1) Do
    Begin
        Insert(IntToStr(Number Mod 8), ResultStr, 0);
        Number := Number Div 8;
    End;

    DecimaltoOctal := ResultStr;
End;

Function DecimalToHexadecimal(Number: Integer): String;
Var
    ResultStr: String;
    ResNum: Integer;
Begin
    ResultStr := '$';
    While (Number >= 1) Do
    Begin
        ResNum := Number Mod 16;
        Case ResNum Of
            0 .. 9:
                Insert(IntToStr(ResNum), ResultStr, 2);
        Else
            Insert(Chr(ResNum - 10 + 65), ResultStr, 2);
        End;
        Number := Number Div 16;
    End;

    DecimalToHexadecimal := ResultStr;
End;

Var
    BinaryNum: String;
    DecimalNum: Integer;

Begin
    BinaryNum := '11111';
    Writeln('Input Binary Number - ' + BinaryNum);
    Writeln('Binary To Decimal: ' + IntToStr(BinaryToDecimal(BinaryNum)));
    Writeln('Binary To Octal: ' + BinaryToOctal(BinaryNum));
    Writeln('Binary To Hexadecimal: ' + BinaryToHexadecimal(BinaryNum));

    Writeln('-----------------------------');

    DecimalNum := 31;
    Writeln('Input Decimal Number - ' + IntToStr(DecimalNum));
    Writeln('Decimal To Binary: ' + DecimalToBinary(DecimalNum));
    Writeln('Decimal To Octal: ' + DecimalToOctal(DecimalNum));
    Writeln('Decimal To Hexadecimal: ' + DecimalToHexadecimal(DecimalNum));

    Writeln('-----------------------------');

    ///
    Readln;

End.
