Program Task11;

(*
  Дан массив точек А, точка В, найти точку с минимальной длиной до 
  точки В. Точки заданы координатами X и Y. (Массив считывать из текстового 
  файла, все кроме вывода в подпрограмме)    
*)

(*
  Файл:

  5
 -2 -2
  1 -1
  5  1
  0  2
 -2  1
  0  0
*)

{$APPTYPE CONSOLE}
{$R *.res}

Uses
    Math;

Type
    TCoord = Record
        X, Y: Real;
    End;

    TA = Array Of TCoord;

Function SearchDot(Var A: TA; B: TCoord): TCoord;
Var
    Res: TCoord;
    CurentLen, Len: Double;
    X2, Y2: Real;
Begin
    Len := Math.MaxDouble;
    For Var I := Low(A) To High(A) Do
    Begin
        X2 := Math.Power(Abs(A[I].X - B.X), 2);
        Y2 := Math.Power(Abs(A[I].Y - B.Y), 2);
        CurentLen := Sqrt(X2 + Y2);
        If (CurentLen < Len) Then
        Begin
            Len := CurentLen;
            Res := A[I];
        End;
    End;
    Result := Res;
End;

Var
    ASize: Integer;
    A: TA;
    B, Res: TCoord;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Read(F, ASize);
    SetLength(A, ASize);
    For Var I := Low(A) To High(A) Do
        Read(F, A[I].X, A[I].Y);
    Read(F, B.X, B.Y);
    Close(F);
    Res := SearchDot(A, B);
    Write('Координаты точки ближайшей к B: ', Res.X:5:3, ' ', Res.Y:5:3);
    Readln;

End.
