﻿Program OAiP_Algo;

{$APPTYPE CONSOLE}
{$R *.res}

Uses
    System.SysUtils,
    Unit1 In 'Unit1.pas',
    Unit2 In 'Unit2.pas';

(*
  Procedure CalcSum(Res: Integer); <- параметр-значение
  Procedure CalcSum(Var Res: Integer); <- параметр-переменная
  Procedure CalcSum(Const Res: Integer); <- параметр-константа   
  
  Procedure CalcSum(Var Res); <- параметр без типа
  Procedure CalcSum(Const Res); <- параметр без типа
  - через Absolute;
  - через приведение типов.
  
  Procedure CalcSum(Arr: Array Of Byte); <- open array параметр
  - это не динамический массив.

  Виды переменных:
  Глобальные переменные - объявлены в начале программы и доступны везде.
  Локальные переменные - объявлены в каком-либо составном операторе и 
  доступны в его пределах.
  Фактические параметры - то, что передаётся в подпрограмму.
  Формальные параметры - то, что принимается в подпрограмму. 

  Директивы подпрограмм
  Inline - подставляется машинный код;
  External - procedure ExternalProcedure; stdcall; external 'MyLibrary.dll';
  Forward - опережающее описание.
*)

//Фибоначи через рекурсию
Function Fibo(Num: Integer): Integer;
Begin
    If Num < 0 Then
        Fibo := 0
    Else
        If (Num <= 1) Then
            Fibo := 1
        Else
            Fibo := Fibo(Num - 1) + Fibo(Num - 2);
End;

//Факториал через рекурсию
Function Fact(Num: Integer): Integer;
Begin
    If (Num > 1) Then
        Fact := Num * Fact(Num - 1)
    Else
        Fact := 1;
End;     
    
Begin
    Readln;
End.
