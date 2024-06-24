Program Task10;

(*
  Дан массив из n элементов, n > 5. В каждом компоненте массива 
  записано имя человека, кол-во лайков и сообщений и друзей.
  (Вывести 5 человек, у которых наибольшее количество лайков)

  P.S. Текстовый файл
*)

(*
  Файл:

  8
  1
  1 1 1
  2
  2 2 2
  3
  3 3 3
  4
  4 4 4
  5
  5 5 5
  6
  6 6 6
  7
  7 7 7
  8
  8 8 8
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TPerson = Record
        Name: String;
        Likes, Messages, Friends: Integer;
    End;

    TArr = Array Of TPerson;

Procedure Sort(Var Arr: TArr);
Var
    I, J: Integer;
    Temp: TPerson;
Begin
    For I := Low(Arr) To Low(Arr) + 4 Do
    Begin
        J := I + 1;
        While (J < Length(Arr)) And (Arr[J].Likes > Arr[I].Likes) Do
        Begin
            Temp := Arr[I];
            Arr[I] := Arr[J];
            Arr[J] := Temp;
            Inc(J);
        End;
    End;
End;

Var
    Arr: TArr;
    N, I: Integer;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Readln(F, N);
    SetLength(Arr, N);
    For I := Low(Arr) To High(Arr) Do
    Begin
        Readln(F, Arr[I].Name);
        Read(F, Arr[I].Likes, Arr[I].Messages, Arr[I].Friends);
        Readln(F);
    End;
    Close(F);
    Sort(Arr);
    For I := Low(Arr) To Low(Arr) + 4 Do
        Write(Arr[I].Name, ' ');
    Arr := Nil; // по сути тут ещё и string в record очищать надо, но это уже слишком
    Readln;

End.
