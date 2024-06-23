﻿Program Task7;

(*
  Задана матрица М на N, нужно посчитать строки, где все элементы идут по возрастанию

  P.S. Текстовый файл
*)

(*
  Файл:

  5 5 1 2 3 4 5 1 2 3 3 4 2 3 4 5 5 3 3 3 3 3 4 5 6 7 8
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TMatrix = Array Of Array Of Integer;

Function AmountOfIncreasing(Var Matrix: TMatrix): Integer;
Var
    Count: Integer;
    IsIncreasing: Boolean;
Begin
    Count := 0;
    For Var I := Low(Matrix) To High(Matrix) Do
    Begin
        IsIncreasing := True;
        For Var J := Low(Matrix[I]) To High(Matrix[I]) - 1 Do
            IsIncreasing := IsIncreasing And (Matrix[I][J] < Matrix[I][J + 1]);
        Inc(Count, Ord(IsIncreasing));
    End;
    Result := Count;
End;

Var
    F: TextFile;
    M, N: Integer;
    Matrix: TMatrix;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, M, N);
    SetLength(Matrix, M, N);
    For Var I := Low(Matrix) To High(Matrix) Do
        For Var J := Low(Matrix[I]) To High(Matrix[I]) Do
            Read(F, Matrix[I, J]);
    Write(AmountOfIncreasing(Matrix));
    Readln;
End.
