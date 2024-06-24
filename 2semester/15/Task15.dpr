Program Task15;

(*
  Дано число N, L, K (1 < L <= K <= N) и массив (N элементов), найти сумму 
  элементов массива, индексы которых не входят в промежуток от L до K включительно.
*)

(*
  Файл:

  5 2 4 1 2 3 4 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Function SearchSum(Var Arr: TArr; L, K: Integer): Integer;
Var
    Sum, I: Integer;
Begin
    Sum := 0;
    For I := Low(Arr) To L - 1 Do
        Inc(Sum, Arr[I]);
    For I := K + 1 To High(Arr) Do
        Inc(Sum, Arr[I]);
    Result := Sum;
End;

Var
    Arr: TArr;
    N, I, L, K: Integer;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, N, L, K);
    SetLength(Arr, N);
    For I := Low(Arr) To High(Arr) Do
        Read(F, Arr[I]);
    Close(F);
    Write(SearchSum(Arr, L - 1, K - 1));
    Readln;

End.
