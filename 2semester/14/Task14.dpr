Program Task14;

(*
  Дана матрица размера M и N и целое число K (1 <= K <= M). 
  Найти сумму и произведение элементов K-ой строки.

  P.S. Текстовый файл
*)

(*
  Файл:

  5 5 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 2
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TMatrix = Array Of Array Of Integer;

Procedure SearchSumAndMulti(Var Matrix: TMatrix; Var Sum, Multi: Integer; K: Integer);
Var
    I: Integer;
Begin
    Multi := 1;
    Sum := 0;
    For I := Low(Matrix[K]) To High(Matrix[K]) Do
    Begin
        Inc(Sum, Matrix[K, I]);
        Multi := Multi * Matrix[K, I];
    End;
End;

Var
    Matrix: TMatrix;
    F: TextFile;
    M, N, K, I, J: Integer;
    Sum, Multi: Integer;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, M, N);
    SetLength(Matrix, M, N);
    For I := Low(Matrix) To High(Matrix) Do
        For J := Low(Matrix[I]) To High(Matrix[I]) Do
            Read(F, Matrix[I][J]);
    Read(F, K);
    Close(F);
    SearchSumAndMulti(Matrix, Sum, Multi, K - 1);
    Write('Сумма: ', Sum, '. Произведение: ', Multi, '.');
    Readln;

End.
