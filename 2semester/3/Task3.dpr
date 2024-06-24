Program Task3;

(*
  Найти самую дешевую книгу.

  P.S. Текстовый файл.
*)

(*
  Файл:

  1
  1
  1 1 1
  2
  2
  2 2 2
  3
  3
  3 3 3
  4
  4
  4 4 4
  5
  5
  5 5 5
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TInfo = Record
        Name, Author: String;
        Cost, Amount, Isi: Integer;
    End;

    TArr = Array Of TInfo;

Const
    N: Byte = 5;

Function GetLowestPrice(Var Arr: TArr): Byte;
Var
    Index: Byte;
    Temp, I: Integer;
Begin
    Index := 0;
    Temp := Arr[0].Cost * Arr[0].Amount + Arr[0].Isi;
    For I := Low(Arr) + 1 To High(Arr) Do
        If (Temp > Arr[I].Cost * Arr[I].Amount + Arr[I].Isi) Then
        Begin
            Index := I;
            Temp := Arr[I].Cost * Arr[I].Amount + Arr[I].Isi;
        End;
    Result := Index;
End;

Var
    F: TextFile;
    Arr: TArr;
    I: Integer;

Begin
    SetLength(Arr, N);
    Assign(F, 'test.txt');
    Reset(F);
    For I := Low(Arr) To High(Arr) Do
    Begin
        ReadLn(F, Arr[I].Name);
        ReadLn(F, Arr[I].Author);
        Readln(F, Arr[I].Cost, Arr[I].Amount, Arr[I].Isi);
    End;
    Close(F);
    Write(Arr[GetLowestPrice(Arr)].Name);
    Arr := nil;
    Readln;

End.
