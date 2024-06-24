Program Task13;

(*
  Дан массив размера N. Найти два соседних элемента, сумма которых максимальна, 
  и вывести эти элементы в порядке возрастания их индексов.
*)

(*
  Файл:

  5 1 2 3 4 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Procedure MaxSupportElement(Var Arr: TArr; Var Frst, Scnd: Integer);
Var
    I: Integer;
Begin
    Frst := 0;
    Scnd := 1;
    For I := Low(Arr) + 1 To High(Arr) - 1 Do
    Begin
        If (Arr[I] + Arr[I + 1] > Arr[Frst] + Arr[Scnd]) Then
        Begin
            Frst := I;
            Scnd := I + 1;
        End;
    End;
End;

Var
    F: TextFile;
    N, First, Second: Integer;
    Arr: TArr;
    I: Integer;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, N);
    SetLength(Arr, N);
    For I := Low(Arr) To High(Arr) Do
        Read(F, Arr[I]);
    Close(F);
    MaxSupportElement(Arr, First, Second);
    Write(First, ' ', Second);
    Readln;

End.
