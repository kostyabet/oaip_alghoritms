Program Task16;

(*
  Дан массив из N элементов. Заменить каждый элемент массива значением среднего 
  арифметического его самого и его соседей.
*)

(*
  Файл:

  5 1 2 3 4 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Procedure SwapElems(Var Arr: TArr);
Var
    Temp, I, NewTemp: Integer;
Begin
    Temp := (Arr[0] + Arr[1] + 1) Div 2;
    For I := Low(Arr) + 1 To High(Arr) - 1 Do
    Begin
        NewTemp := (Arr[I] + Arr[I - 1] + Arr[I + 1] + 1) Div 2;
        Arr[I - 1] := Temp;
        Temp := NewTemp;
    End;
    Arr[High(Arr)] := (Arr[High(Arr)] + Arr[High(Arr) - 1] + 1) Div 2;
    Arr[High(Arr) - 1] := Temp;
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
    SwapElems(Arr);
    For I := Low(Arr) To High(Arr) Do
        Write(Arr[I], ' ');
    Readln;

End.
