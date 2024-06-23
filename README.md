# Разбор алгоритмических задач по `(Основам Алгоритмизации и Программирования)`

Данный репозиторий создан для подготовки к практической части экзамена по ОАиП (часть 1 и 2).</br>
Весь репозиторий разбит на 3 части:
  - ОАиП (1 часть); </br>
  - ОАиП (2 часть); </brs>
  - Перевод между системами исчисления.

Далее более подробно описано о каждом данном "модуле".

## 1 семестр `(1semester / часть 1)`
Все задачи организованы в виде подпрограмм, где __`1 задача = 1 подпрограмма`__! Если вы сдаёте ОАиП 1 часть, то не пишите на экзамене задачу через подпрограмму, так будет лучше (_По идее вы ещё не должы знать их синтаксис_). </br></br>
У каждый подпрограммы есть коментарий над ней где расположены:
  - порядковый номер задачи; </br>
  - условие задачи. 

Чтобы `"протестировать"` задачу, вызовите её из `блока Main` (__имя_функции(параметр, параметр, ...)__).

## 2 семестр `(2semester / часть 2)`
  - `ReadMe.md` даёт добавочную (объясняющую информацию по поводу некоторых _приколов_ синтаксиса и терминалогии).
Тамже распологаются условия задач. </br>
  - Папки с номерами _(номера задач)_. __Одна папка - одна задача!__ </br>
    - Все задачи организованы через ввод из `Текстового файла`. Данный файл можно найти от файла проекта (`*.dproj`) по следующему пути: _Win32/Debag/test.txt_. В коде проекта в первых строках приведено __условие текущей задачи__ и __информация о текузем состоянии файла__.

## Переводы `(translations)`
В данной папке находится код проекта с процедурами перевода между системами исчисления:
  - `2`-ичная;</br>
  - `8`-ричная;</br>
  - `10`-ричная;</br>
  - `16`-ричная.

Написаны подпрограммы, которые способны перевести число между всеми системами:
  - `2  -> 8`, `2  -> 10`, `2  -> 16`; </br>
  - `8  -> 2`, `8  -> 10`, `8  -> 16`; </br>
  - `10 -> 2`, `10 -> 8 `, `10 -> 16`; </br>
  - `16 -> 2`, `16 -> 8 `, `16 -> 10`.