unit Unit1;

interface

Procedure Sum(N1, N2: Integer; Var Res: Integer);

implementation

Procedure Sum(N1, N2: Integer; Var Res: Integer);
begin
    Res := N1 + N2;
end;

initialization

finalization

end.