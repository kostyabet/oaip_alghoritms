Program Task19;

(*
  Есть запись. В ней фамилия, отдел работы, год принятия на работу, зарплата. 
  Имеется массив таких записей. Найти максимальный выгодный отдел. Т.е где 
  средняя зарплата самая высокая. Вывести этот отдел и среднюю зарплату.
*)

(*
  Файл:

  5
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  2
  2
  2
  2
  2
  2
  2
  4
*)

{$APPTYPE CONSOLE}
{$R *.res}

Type
    TInfo = Record
        Surname, Department: String;
        Year, Salary: Integer;
    End;

    TArr = Array Of TInfo;

Procedure FindBestDepartment(Var Arr: TArr; Var Department: String; Var AverageSalary: Integer);
Var
    Count, Salary, I, J: Integer;
Begin
    AverageSalary := 0;
    For I := Low(Arr) To High(Arr) Do
    Begin
        Count := 0;
        Salary := 0;
        For J := Low(Arr) To High(Arr) Do
            If (Arr[I].Department = Arr[J].Department) Then
            Begin
                Inc(Salary, Arr[J].Salary);
                Inc(Count);
            End;
        Salary := Salary Div Count;
        If (Salary > AverageSalary) Then
        Begin
            AverageSalary := Salary;
            Department := Arr[I].Department;
        End;
    End;
End;

Var
    Arr: TArr;
    Size, I, AverageSalary: Integer;
    Department: String;
    F: TextFile;

Begin
    Assign(F, 'test.txt');
    Reset(F);
    Readln(F, Size);
    SetLength(Arr, Size);
    For I := Low(Arr) To High(Arr) Do
    Begin
        Readln(F, Arr[I].Surname);
        Readln(F, Arr[I].Department);
        Readln(F, Arr[I].Year);
        Readln(F, Arr[I].Salary);
    End;
    Close(F);
    FindBestDepartment(Arr, Department, AverageSalary);
    Write('На предприятии ', Department, ' средняя зароботная плата = ', AverageSalary);
    Arr := Nil;
    Readln;

End.
