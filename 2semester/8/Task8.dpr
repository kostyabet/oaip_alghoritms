Program Task8;

(*
  Поменять элементы местами, четные индексы с нечетными индексами

  P.S.Типизированный файл
*)

(*
  Файл:

  10 1 2 3 4 5 6 7 8 9 10
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Procedure SwapElements(Var Arr: TArr);
Var
    I, Temp: Integer;
Begin
    I := 0;
    While I < High(Arr) Do
    Begin
        Temp := Arr[I];
        Arr[I] := Arr[I + 1];
        Arr[I + 1] := Temp;
        Inc(I, 2);
    End;
End;

Var
    Arr: TArr;
    Size, I: Integer;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, Size);
    SetLength(Arr, Size);
    For I := Low(Arr) To High(Arr) Do
        Read(F, Arr[I]);
    Close(F);
    SwapElements(Arr);
    For I := Low(Arr) To High(Arr) Do
        Write(Arr[I], ' ');
    Readln;

End.
