Program Task6;

(*
  Занулить между min и max

  P.S. Текстовый файл
*)

(*
  Файл:

  5 2 5 3 4 1
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TArr = Array Of Integer;

Procedure SearchMinMax(Var Arr: TArr; Var Min, Max: Integer);
Var
    Temp, I: Integer;
Begin
    Min := 0;
    Max := 0;
    For I := Low(Arr) + 1 To High(Arr) Do
    Begin
        If (Arr[I] > Arr[Max]) Then
            Max := I;
        If (Arr[I] < Arr[Min]) Then
            Min := I;
    End;
    If (Min > Max) Then
    Begin
        Temp := Min;
        Min := Max;
        Max := Temp;
    End;
End;

Procedure MakeZeroInArr(Var Arr: TArr; Min, Max: Integer);
Var
    I: Integer;
Begin
    For I := Min + 1 To Max - 1 Do
        Arr[I] := 0;
End;

Var
    F: TextFile;
    Size: Integer;
    Arr: TArr;
    Min, Max, I: Integer;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, Size);
    SetLength(Arr, Size);
    For I := Low(Arr) To High(Arr) Do
        Read(F, Arr[I]);
    Close(F);
    SearchMinMax(Arr, Min, Max);
    MakeZeroInArr(Arr, Min, Max);
    For I := Low(Arr) To High(Arr) Do
        Write(Arr[I], ' ');
    Arr := Nil;
    Readln;

End.
