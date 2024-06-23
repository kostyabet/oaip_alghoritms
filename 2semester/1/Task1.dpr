Program Task1;

(*
  Найти количество различных символов в строке.

  P.S. Ввод строки через текстовый файл!
*)

(*
  Состояние файла сейчас:

  ABCCCDDDEF
*)

{$APPTYPE CONSOLE}
{$R *.res}

Function CountOfDifSymb(Var Str: String): Integer;
Var
    Symb: Set Of Char;
    Count: Integer;
Begin
    Count := 0;
    Symb := [];
    For Var I := 1 To Length(Str) Do
    Begin
        If Not(Str[I] In Symb) Then
        Begin
            //Include(Symb, AnsiChar(str[i]));
            Symb := Symb + [Str[I]]; //лучше это
            Inc(Count);
        End;
    End;
    Result := Count;
End;

Var
    Str: String;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Readln(F, Str);
    //именное ln, потому что нужно считать всю строку,
    //а не до первого разделителя
    Close(F);
    Write('Различных символов в строке: ', CountOfDifSymb(Str));
    Readln; //<- на листике это писать не нужно :)

End.
