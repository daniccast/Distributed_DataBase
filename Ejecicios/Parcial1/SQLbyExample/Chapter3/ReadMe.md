Resumen cápitulo tres.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Funciones

1. LOWER 
Nos permite transformar los datos a minúsculas.
	LOWER(cadena)

1. UPPER
Nos permite transformar los datos a mayúsculas.
	UPPER(cadena)

1. INITCAP
Nos permite transformar la primera letra mayúscula.(Capitalize)
	INITCAP(cadena)

1. LPAD, left pad
Agrega caracterres a la izquierda
	LPAD(char1, n [, char2])
	cadena1,n tamaño total, cadena a agregar opcional

1. RPAD. rigth pad
Agrega caracterres a la derecha
	RPAD(char1, n [, char2])
	cadena1,n tamaño total, cadena a agregar opcional


1. DUAL TABLE
Tabla especial de Oracle, no contiene nada importante, pero es usada junto con otras funciones para ver valores que NO existen en la tabla.

1. LTRIM
Elimina carácteres a a izquierda.
	LTRIM(char1 [, char2])
	cadena, caracteres a eliminar (si no pones ninguno quita espacios)

1. RTRIM
Elimina carácteres a a derecha.
	RTRIM(char1 [, char2])

1. TRIM
	TRIM([LEADING|TRAILING| BOTH ] char1 FROM char2)
	Si quieremos que funcione como LTRIM ponemos LEADING, como RTRIM TRAILING y ambos BOTH (o no especificas). 
	Char1 es lo que vamos a quitar y char2 de donde lo vamos a quitar.

1. SUBSTR
	SUBSTR(char1, starting_position [, substring_length])
Devuelve subcadenas, con la posicion inicial de donde queremos que onicie la subcadena (dividir), y el tercer parametro de la longitud de la subcadena, si no se pone toma lo restante.

1. INSTR
Busca la ocurrencia de una cadena Char2 en otra Char1, devuelve la posicion inicial de esa cadena buscada.

	INSTR(char1, char2 [,start_position [, occurrence]])
Puede tomar la pocision inicial de la búsqueda y cual ocurrencia de la cadena búscamos.

1. LENGTH
Devuelve longitud de una cadena.
	LENGTH(cadena)


*TODAS LAS FUNCIONES SE PUEDEN USAR TAMBIEN DENTRO DEL WHERE Y EL ORDER BY. Ejemplos: -- Página 172 *

	SELECT first_name, last_name
	FROM student
	WHERE SUBSTR(last_name, 1, 2) = 'Mo'

	SELECT first_name, last_name
	FROM student
	WHERE INSTR(first_name, '.') > 0
	ORDER BY LENGTH(last_name)

*También se pueden hacer funciones dentro de funciones.*
Ejemplo: --Página 173

	SELECT RPAD(UPPER(city), 20,'.')
	FROM zipcode
	WHERE state = 'CT'


1. Concatenación
Podemos usar la función
	CONCAT(char1, char2) o el operador ||

1. REPLACE
Remplazar una cadena con ora
	REPLACE(char, if, then)
	if lo que buscamos, then lo que reemplazamos

1. TRANSLATE
ONE FOR ONE sustitución de carácteres.
	TRANSLATE(char, if, then)

1. SOUNDEX
Comparar palabras que suenan igual, pero se escriben diferente.
	SOUNDEX(Cadena)
Ejemplo --Página 176
	SELECT student_id, last_name
	FROM student
	WHERE SOUNDEX(last_name) = SOUNDEX('MARTIN')

STUDENT_ID LAST_NAME
---------- ---------
110 Martin
324 Marten
393 Martin

## Number Functions

1. ABS
Devuelve el valor absoluto de un número
	ABS(N)
	
1. SIGN
Devuelve 1 si es positivo, -1 si es negativo
	SIGN(N)
	
1. ROUND
Redondea un valor.
	ROUND(value [, precision])
	Numero de lugares 
1. TRUNC	
Trunca (o corta) un valor.
	TRUNC(value [, precision])

1. FLOOR
Devuelve el entero cercano menor o igual al numero.
	FLOOR(N)
1. CEIL
Devuelve el entero mas pequeño mayor o igual al numero
	CEIL(N)

1. MOD
Módulo de un numro
	MOD(value, divisor)

1. REMAINDER
Residuo de numero
	REMAINDER(value, divisor)
	
*Se pueden usar operadores aritméticos.*

## Más funciones

1. NVL
Reemplaza null por algun valor
	NVL(input_expression, substitution_expression)
1. NULLIF
The function compares two
expressions; if the values are equal, the function returns a null; otherwise, the function returns the
first expression.

	NULLIF(expression1, equal_expression2)

1. NANVL
Sustituye un valor si el dato es NaN.
	NANVL(input_value, substitution_value)
	
1. DECODE
Susttución basada en lógica IF -> THEN

	DECODE (if_expr, equals_search,
	then_result [,else_default])

Ejemplo -- Página 205

	DECODE(state, 'NY',
	'NJ',
	DECODE(state, 'NY',
	'NJ',
	'New York',
	'New Jersey') no_default,
	'New York',
	'New Jersey',
	'OTHER') with_default

1. CASE

	CASE {WHEN condition THEN return_expr
	[WHEN condition THEN return_expr]... }
	[ELSE else_expr]
	END



