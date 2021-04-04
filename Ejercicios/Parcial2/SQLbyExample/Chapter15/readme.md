Resumen cápitulo quince.
Información recuperada de Rischert,A (2004)."Chapter 15. Regular Expressions and Hierarchical Queries". Ramagnano,L, Oracle® SQLby Example(711-758). Pearson. 

# Regular Expressions and Hierarchical Queries

## Regular expressions

Una expresión regular es una notación para describir patrones textuales. Se usan para hacer búsquedas avanzadas o modificaciones. 

## Regular Expressions And The Oracle Database

Oracle usa operadores como REGEXP_LIKE y las funciones REGEXP_INSTR, REGEXP_REPLACE, y REGEXP_SUBSTR. Estas son similares a operador LIKE o a las funciones INSTR, REPLACE y SUBSTR.

Oracle soporta POSIX ERE (Portable Operating System Interface Extended Regular Expressions).

## Metacaracteres

Metacarácter | Descripción
-------------|---------------
.    | Empareja cualquier carácter excepto la nueva linea.
^    | Marca el inicio de una línea.
$    | Marca el final de una línea.
*    | Empareja con 0 o más veces.
?    | Empareja con 0 o 1 vez.
+    | Empareja con 1 o más veces.
{m}  | Empareja con examctamente m veces.
{m,} | Empareja con m o más veces.
{m,n}| Empareja con al menos m vecesm per no más de n veces.


## The POSIX Character Classes

Clase de carácter | Descripción
------------------|---------------------------
[:alpha:] | Carácter alfabéticos.
[:lower:] | Carácter alfabéticos en minúsculas. 
[:upper:] | Carácter alfabéticos en mayúsculas.
[:digit:] | Dígitos númericos.
[:alnum:] | Carácteres alfanuméricos.
[:space:] | Carácteres de espacios (' ','\t', etc.).
[:punct:] | Carácteres de puntuación.
[:cntrl:] | Carácteres de control.
[:print:] | Carácteres imprimibles.



Ejemplo: '[[:digit:]]{ 5}'.

Los [] indican una lista de caráteres. Se pueden usar rangos también, como: [a-z][0-5].
 

## Character List Metacharacters

Metacarácter | Descripción
-------------|-------------------
[^] Negated character list | Si ^ está al inicio de una lista, este niega la lista, o sea que empareja cualquier cosa que NO esté en la lista.
[char] Matching character list | Indica una lista de carácteres- La mayoría de los metacaracteres dentro de la lista se interpretan como literales, a excepción de '^' y '-'.
'-' Range | Representa un rango de carácteres.
[: :] Character class | El estándar POSIX.
[.char.] Collating sequence| Indica un elemento de colación POSIX muy útil para otros lenguajes-
[=char=] Character equivalence class| Te permite buscar por carácteres equivalentes en la configuracion regional actual. Es útil para ignorar hacentos en idiomas extranjeros.

## Subexpressions And Alternate Matches

Una subexpresión es parte de una exxpresión regular y se encierra en parentesís. Podemos usarlos también para alternancia con el símbolo '|'.

Metacaracter | Descripción
-------------|---------------------
\| Alternation | Separa alternativas, usualmente se agrupan con ().
() Group |Agrupa subexpresiones en unidades de alternación, para cuantificadores, o para backreferencing.


## The REGEXP_LIKE Operator

Sintaxis:

```
REGEXP_LIKE(source_string, pattern
	[, match_parameter])
```

El parámetro MATCH_PARAMETER permite agregar parámetors opcionales como  el manejo del carácter de nueva línea, conservando el formato de varias líneas. 


## The REGEXP_SUBSTR Function

Devuelve la subcadena que empareja con el patrón. 

Sintaxis:

```
REGEXP_SUBSTR(source_string, pattern
	[, position [, occurrence
	[, match_parameter]]])
```

El parámetro de posición índica la posición donde se iniciará la búsqueda, el default es 1. El parámetro OCCURRENCE tiene valor default 1, o sea que busca por la primera ocurrencia.


Ejemplo (Ramagnano, 2004, 717):
```
SELECT REGEXP_SUBSTR('Joe Smith, 12345 Berry Lane, Orta, CA 91234',
	'[[:digit:]]{5}$')
	AS substr
FROM dual
```

## The REGEXP_INSTR Function

Tiene un funcionamiento igual a INSTR. 

Sintaxis:

```
REGEXP_INSTR(source_string, pattern
	[, startposition [, occurrence [, return_option
	[, match_parameter]]]])
```
Por default RETURN_OPTION tiene valor de 0 y devuelve la posción inical donde es encuentra el match. Si, por ejemplo, lo cambiamos a 1 devolvería la posición del siguiente carácter del match.

Ejemplo (Ramagnano, 2004, 718):
```
SELECT REGEXP_INSTR('NY 10032 USA',
'[[:digit:]]{5}')
AS rx_instr
FROM dual
```
## The REGEXP_REPLACE Function

Reemplaza una cadena con otra. 

Sintaxis:

```
REGEXP_REPLACE(source_string, pattern
[, replace_string [, position [,occurrence, [match_parameter]]]])
```

Por default la posión de inicio es 1 la ocurrencia 0, lo que indica que todos los matches serán reemplazados.

Ejemplo (Ramagnano, 2004, 719):
```
SELECT REGEXP_REPLACE('Joe    Smith', '( ){2,}', ' ')
	AS RX_REPLACE
FROM dual
```

## Exploring The MATCH PARAMETER Option

### Case-Sensitive Matches.

Con el valor 'i' se hace una búsqueda case.insensitive. Con 'c' la búsqueda es case sensitive.

Ejemplo (Ramagnano, 2004, 719):
```
SELECT first_name
FROM student
WHERE REGEXP_LIKE(first_name, 'ta', 'i')
```

### Matching A Pattern That Crosses Multiple Lines

Con 'n' se incluye la nueva línea en el carácter '.'.
Ejemplo (Ramagnano, 2004, 720):
```
SELECT REGEXP_SUBSTR('My cat could have
followed the dog almost
immediately.', 'cat.*dog', 1, 1, 'n')
```


### Treating A String As A Multiline Source

El modo multilinea 'm', trata la cadena como varias líneas, y se puden usar los metacaracteres '^' y '$'.

Ejemplo (Ramagnano, 2004, 720):
```
SELECT REGEXP_INSTR('My cat
followed the dog who followed another
cat.',
'^cat', 1,1,1,'m') AS cat_search
FROM dual
```

**SE PUEDEN COMBINA LOS MATCH PARAMETERS**

Parameter |  Description
----------|-----------------
i | Match case-insensitive
c | Match case-sensitive, the default.
n | A match for any character (.) in the pattern allows your search to include the newline character.
m | The source string is retained as multiple lines and the anchoring metacharacters (^ and $) are respected as the start and end of each line.

## Backreferences

Se guardan en un buffer ñas subexpresiones, así que después podemos referenciarlas. 

Ejemplo (Ramagnano, 2004, 721):
```
SELECT REGEXP_REPLACE(
'Ellen Hildi Smith',
'(.*) (.*) (.*)', '\3, \1 \2')
FROM dual
```

Estas también se usan para encontrar palabras repetidas.

Ejemplo (Ramagnano, 2004, 722):
```
SELECT REGEXP_SUBSTR(
	'There is is a speed limit!',
	'([[:alnum:]]+)([[:space:]]+)\1') AS substr
FROM dual
```


**Usamos el '\'- Backslash para hacer backeference o para escapar los metacaracteres.**

## Applying Regular Expressions In Data Validation

Las expresiones regulares son útilies para validación de datos.

Ejemplo (Ramagnano, 2004, 723):
```
ALTER TABLE student
ADD CONSTRAINT stud_last_name_ck CHECK
(REGEXP_LIKE(last_name, '^[-[:alpha:] .,()'']*$'))
```

## Hierarchical queries
 
### The Connect By Clause And The Prior Operator

Para lograr una visualización jerárquica se necesita construir una _query_ con la cláusula **_CONNECT BY_** y el operador **_PRIOR_**. _Prior_ va antes que el padre.

La condición _CONNECT BY_ puede contener condiciones adicionales para filtrar las filas y eliminar las ramas del árbol de jerarquía, pero no puede contener una _subquery_ o una _subquery_ escalar.

### The Start With Clause

La cláusula **_STAR WITH_** determina las filas raíz de la jerarquía.

Ejemplo (Ramagnano, 2004, 738):
```
SELECT LPAD(' ', 3*(LEVEL-1)) ||course_no
|| ' ' ||description
FROM course
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
```

Sintaxis:
```
[START WITH condition]
CONNECT BY [NOCYCLE] condition
```
El parámetro opcional NOCYCLE permite que la _query_ continue aunque exista un ciclo que la jerarquía. 

### Hierarchy Path

Se puede mostrar el path de un valor desde la raíz. Ejemplo (Ramagnano, 2004, 739):
```
SELECT LPAD(' ', 1*(LEVEL-1))
	||SYS_CONNECT_BY_PATH(course_no, '/') AS "Path" ,
	description
FROM course
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
```

### Pruning The Hierarchy Tree

Podemos usar el _CONNCET BY_  con _WHERE_ para eliminar filas.

Ejemplo (Ramagnano, 2004, 741):
```
SELECT LPAD(' ', 3*(LEVEL-1)) ||course_no
	|| ' ' ||description AS hierarchy
FROM course
WHERE course_no <> 132
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
```

Con la misma cláusula se elimina toda la rama. 

Ejemplo (Ramagnano, 2004, 742):

```
SELECT LPAD(' ', 3*(LEVEL-1)) ||course_no
	|| ' ' ||description AS hierarchy
FROM course
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
AND course_no <> '132'
```

### Accessing Root Row Data With The CONNECT_BY_ROOT Operator

Retorna los datos de la fila raíz.
Ejemplo (Ramagnano, 2004, 743):

```
SELECT description, course_no,
	CONNECT_BY_ROOT course_no AS root,
	LPAD(' ', 1*(LEVEL-1))
	||SYS_CONNECT_BY_PATH(course_no, '/') AS "Path"
FROM course
START WITH course_no IN (310, 130)
CONNECT BY PRIOR course_no = prerequisite
```
### The CONNECT_BY_ISLEAF Pseudocolumn
Devuelve 1 si la fila es una hoja.
Ejemplo (Ramagnano, 2004, 744):

```
SELECT course_no, LPAD(' ', 1*(LEVEL-1))
	||SYS_CONNECT_BY_PATH(course_no, '/') AS "Path",
	LEVEL, CONNECT_BY_ISLEAF AS leaf
FROM course
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
```

### Joining Tables 

Ejemplo (Ramagnano, 2004, 744):
```
SELECT LPAD(' ', 3*(LEVEL-1)) || c.course_no||' '||
	description AS hierarchy, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no
START WITH c.course_no = 310
CONNECT BY PRIOR c.course_no = prerequisite
```

### Sorting

Para ordenar sin destruir la jerarquía usamos _ORDER SIBLINGS_

Ejemplo (Ramagnano, 2004, 745):
```
SELECT LEVEL, LPAD(' ', 2*(LEVEL-1)) || c.course_no
AS course_no,
description, prerequisite AS pre
FROM course c
START WITH c.course_no = 20
CONNECT BY PRIOR c.course_no = prerequisite
ORDER SIBLINGS BY description
```












