Program Task17;

(*
  Дана матрицы M*N, найти строку с максимальной суммой элементов, вывести эту 
  сумму и номер строки.
*)

(*
  Файл:

  5 5 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 2 2 2 2 2 1 1 1 1 1
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TMatrix = Array Of Array Of Integer;

Procedure SearchHighestString(Matrix: TMatrix; Var Sum, Index: Integer);
Var
    CurentSum: Integer;
Begin
    Sum := -MaxInt;
    Index := -1;
    For Var I := Low(Matrix) To High(Matrix) Do
    Begin
        CurentSum := 0;
        For Var J := Low(Matrix[I]) To High(Matrix[I]) Do
            Inc(CurentSum, Matrix[I][J]);
        If (CurentSum > Sum) Then
        Begin
            Sum := CurentSum;
            Index := I;
        End;
    End;
End;

Var
    Matrix: TMatrix;
    M, N, Sum, Index: Integer;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, M, N);
    SetLength(Matrix, M, N);
    For Var I := Low(Matrix) To High(Matrix) Do
        For Var J := Low(Matrix[I]) To High(Matrix[I]) Do
            Read(F, Matrix[I, J]);
    Close(F);
    SearchHighestString(Matrix, Sum, Index);
    Write('Сумма: ', Sum, '. Номер строки: ', Index + 1, '.');
    Readln;

End.
