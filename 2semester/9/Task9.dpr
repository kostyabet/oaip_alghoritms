Program Task9;

(*
  Дан массив размера N. В нем указаны поля: <Фамилия студента>, <Номер группы>, 
  <Год поступления>. Найти и вывести группу с наибольшим количеством студентов. 
  Если групп таких несколько, то вывести последнюю из них.

  P.S.  Текстовый файл
*)

(*
  Файл:

  5
  Костя
  351005 2006
  Павел
  351005 2006
  Александр Б.
  351004 2005
  Александр Е.
  351005 2005
  Ваня
  351005 2005
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TInfo = Record
        FIO: String;
        GroupNum, Year: Integer;
    End;

    TArr = Array Of TInfo;

Function GetHighestIndexGroup(Var Arr: TArr): Integer;
Var
    Index, Count, Curent, I, J: Integer;
Begin
    Index := 0;
    Curent := 0;
    For I := Low(Arr) To High(Arr) Do
    Begin
        Count := 0;
        For J := Low(Arr) To High(Arr) Do
            Inc(Count, Ord(Arr[J].GroupNum = Arr[I].GroupNum));
        If (Count >= Curent) Then
        Begin
            Curent := Count;
            Index := I;
        End;
    End;
    Result := Index;
End;

Var
    N, I: Integer;
    Arr: TArr;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, N);
    Readln(F);
    SetLength(Arr, N);
    For I := Low(Arr) To High(Arr) Do
    Begin
        Readln(F, Arr[I].FIO);
        Read(F, Arr[I].GroupNum, Arr[I].Year);
        Readln(F);
    End;
    Close(F);
    Write(Arr[GetHighestIndexGroup(Arr)].GroupNum);
    Readln;

End.
