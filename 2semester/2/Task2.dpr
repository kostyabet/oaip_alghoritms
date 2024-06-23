Program Task2;

(*
  Самый долгий вызов. 

  P.S. Текстовый файл.
*)

(*
  Состояние файла:

  1 1 1 2 2 2 3 3 3 4 4 4 5 5 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TInfo = Record
        Index, Long, Cost: Byte;
    End;

    TArr = Array Of TInfo;

Const
    Len: Byte = 5;

Function GetLongest(Var Arr: TArr): Integer;
Var
    Index, Temp: Integer;
Begin
    Index := 0;
    Temp := Arr[0].Long * Arr[0].Cost;
    For Var I := Low(Arr) + 1 To High(Arr) Do
        If (Temp < Arr[I].Long * Arr[I].Cost) Then
        Begin
            Index := I;
            Temp := Arr[I].Long * Arr[I].Cost;
        End;
    Result := Index;
End;

Var
    F: TextFile;
    Arr: TArr;
    Index: Integer;

Begin
    SetLength(Arr, Len);
    Assign(F, 'test.txt');
    Reset(F);
    For Var I := Low(Arr) To High(Arr) Do
        Read(F, Arr[I].Index, Arr[I].Long, Arr[I].Cost);
    Close(F);
    Index := GetLongest(Arr);
    Write(Arr[Index].Index, ' ', Arr[Index].Long, ' ', Arr[Index].Cost);
    Readln;

End.
