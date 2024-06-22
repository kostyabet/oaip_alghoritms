# Выводы по теории
  
## Формальные параметры
Procedure CalcSum(Res: Integer); <- `параметр-значение` </br>
Procedure CalcSum(Var Res: Integer); <- `параметр-переменная` </br>
Procedure CalcSum(Const Res: Integer); <- `параметр-константа` </br>  
  
Procedure CalcSum(Var Res); <- `параметр без типа` </br>
Procedure CalcSum(Const Res); <- `параметр без типа`
  - через Absolute;
  - через приведение типов.

Procedure CalcSum(Arr: Array Of Byte); <- `open array параметр`
  - это не динамический массив.

## Виды переменных
  `Глобальные переменные` - объявлены в начале программы и доступны везде; </br>
  `Локальные переменные` - объявлены в каком-либо составном операторе и доступны в его пределах; </br>
  `Фактические параметры` - то, что передаётся в подпрограмму; </br>
  `Формальные параметры` - то, что принимается в подпрограмму.

## Директивы подпрограмм
  `Inline` - подставляется машинный код; </br>
  `External` - ```procedure ExternalProcedure; stdcall; external 'MyLibrary.dll';``` </br>
  `Forward` - опережающее описание.

## Открытие файла
  `Append(F);` // открыть для дозаписи </br>
  `Reset(F);` // только для чтения </br>
  `Rewrite(F);` // только для записи

# Пример кода на явную рекурсию

## Число Фиббоначи
```
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
```

## Факториал
```
Function Fact(Num: Integer): Integer;
Begin
    If (Num > 1) Then
        Fact := Num * Fact(Num - 1)
    Else
        Fact := 1;
End;
```