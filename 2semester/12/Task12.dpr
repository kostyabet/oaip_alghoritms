Program Task12;

(*
  Дан массив А размера N, сформировать и вывести новый массив того же размера 
  где каждый элемент B[k] равен сумме всех элементов исходного массива с 
  номерами от 1 до k.

  P.S. Текстовый файл
*)

(*
  Файл:

  5 1 2 3 4 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Function CreateArray(Var A: TArr; Size: Integer): TArr;
Var
    Res: TArr;
    I: Integer;
Begin
    SetLength(Res, Size);
    Res[0] := A[0];
    For I := Low(A) + 1 To High(A) Do
        Res[I] := Res[I - 1] + A[I];
    Result := Res;
End;

Var
    F: TextFile;
    A, B: TArr;
    N, I: Integer;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, N);
    SetLength(A, N);
    For I := Low(A) To High(A) Do
        Read(F, A[I]);
    Close(F);
    B := CreateArray(A, N);
    For I := Low(B) To High(B) Do
        Write(B[I], ' ');
    A := Nil;
    Readln;

End.
