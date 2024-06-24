Program Task4;

(*
  Сумма элементов массива от 1 до K.

  P.S. Текстовый файл.
*)

(*
  Файл:

  5 1 2 3 4 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Function SumInArray(Var Arr: TArr; Size: Integer): Integer;
Var
    Res, I: Integer;
Begin
    Res := 0;
    For I := 0 To Size - 1 Do
        Inc(Res, Arr[I]);
    Result := Res;
End;

Var
    F: TextFile;
    K, I: Integer;
    Arr: TArr;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, K);
    SetLength(Arr, K);
    For I := 0 To K - 1 Do
        Read(F, Arr[I]);
    Close(F);
    Write(SumInArray(Arr, K));
    Arr := nil;
    Readln;

End.
