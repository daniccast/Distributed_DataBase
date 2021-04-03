Resumen cápitulo siete.
Información recuperada de Rischert,A (2004)."Chapter 7. Subqueries". Ramagnano,L, Oracle® SQLby Example(366-423). Pearson. 

# Chapter 7. Subqueries

Una _subquery_ es una sentencia _SELECT_ anidada en varias clausulas de sentencias SQL. Te permite usar la salida de una _query_ como entreda de una sentencia y dividir los problemas en piezas (Rischert,A, 2004, 366).


## Scalar Subqueries

Estas retornan una solo columna con un solo valor. Ejemplo (Rischert,A, 2004, 368):
```
SELECT course_no, description, cost
FROM course
WHERE cost =
	(SELECT MIN(cost)
		FROM course)
```
 En lugar de = se puede usar: >, <, >=, <=, or <>.
 
## Subqueries Returning Multiple Rows

Pueden devolver una o más filas. En lugar de los operadores anteriormente mencionados se usan: **IN con NOT opcional, ANY, ALL, or SOME**. Ejemplo (Rischert,A, 2004, 369):
```
SELECT course_no, description, cost
FROM course
WHERE cost IN
	(SELECT cost
		FROM course
		WHERE prerequisite = 20)
```

### Tabla de operadores de comparació para _subqueries_.
Comparison Operador | Subquery Returns One Row | Subquery Returns Multiple Rows
--------------------|--------------------------|------------------
Equality | = | IN
Inequality| <> |NOT IN
Greater than | > | Use the ANY, ALL, SOME
Less than | < | operators (see Lab 7.4).
Greater than and equal | >= | 
Less than and equal | <= |


## Nesting Multiple Subqueries
Se pueden anidar muchas _subqueries_. Ejemplo (Rischert,A, 2004, 370):
```
SELECT last_name, first_name
FROM student
WHERE student_id IN
	(SELECT student_id
	FROM enrollment
	WHERE section_id IN
		(SELECT section_id
		FROM section
		WHERE section_no = 8
		AND course_no = 20))
```

## Subqueries and JOINS

Una _subquery_ que usa el operador IN o = puede ser expresada cómo un equijoin, en la mayoría de los casos.  Ejemplo (Rischert,A, 2004, 371):

```
SELECT course_no, description
FROM course
WHERE course_no IN
	(SELECT course_no
	FROM section
	WHERE location = 'L211')
```
Ahora como equijoin:
```
SELECT c.course_no, c.description
FROM course c, section s
WHERE c.course_no = s.course_no
AND s.location = 'L211'
```

## Subqueries Returning Multiple Columns

SQL te permite comparar múltiples columnas en el WHERE con múltiples columanas de una _subquery_. Ejemplo (Rischert,A, 2004, 371):

```
SELECT student_id, section_id, numeric_grade
FROM grade
WHERE grade_type_code = 'PJ'
AND (section_id, numeric_grade) IN
		(SELECT section_id, MAX(numeric_grade)
		FROM grade
		WHERE grade_type_code = 'PJ'
		GROUP BY section_id)
```

## SUBQUERIES and NULLS

Debemos ser cuidadosos al usar el **NOT IN** en las subqueries que pueden retornar valores NULL.

## ORDER BY Clause In Subqueries
 
 La clausula _ORDER BY_ **NO ESTÁ PERMITIDA EN LAS _SUBQUERIES_**.
 Manda un error.
 
## Correlated Subqueries

Te permiten hacer referencia a columnas de la _query_ externa en la _subquery_ y te permiten ejecutar la consulta interna repetidamente.
Se usa cuando necesitas revisar cada fila de la _query_ externa a través de la interna. Ejemplo (Rischert,A, 2004, 383):

```
SELECT student_id, section_id, numeric_grade
FROM grade outer
WHERE grade_type_code = 'PJ'
AND numeric_grade =
	(SELECT MAX(numeric_grade)
	FROM grade
	WHERE grade_type_code = outer.grade_type_code
	AND section_id = outer.section_id)
```

## The EXISTS Operator

El operador EXISTS revisa si una fila existe. LO que se muestra en el SELECT es irrelevante, así que por convención se usa '1' o 'X'. Ejemplo (Rischert,A, 2004, 386):

```
SELECT instructor_id, last_name, first_name, zip
FROM instructor i
WHERE EXISTS
	(SELECT 'X'
		FROM section
		WHERE i.instructor_id = instructor_id)
```


## The NOT EXISTS Operator

Hace lo contrario que EXIST. Checa si una fila no existe.
Este prueba para NULL, al contrario de si usamos *NOT IN*.


## Inline Views

Las _Inline views_, o las _queries_ que están dentro de la cláusula FROM, te permiten tratar una _query_ como una tabla virtual o una vista. Ejemplo (Rischert,A, 2004, 400):

```
SELECT e.student_id, e.section_id, s.last_name
FROM (SELECT student_id, section_id, enroll_date
		FROM enrollment
		WHERE student_id = 123) e,
student s
WHERE e.student_id = s.student_id
```

### Top-N Query
Ejemplo (Rischert,A, 2004, 402):
```
SELECT last_name, first_name
FROM student
WHERE ROWNUM <=5
```
En este ejemplo devuelve las cinco primeras columnas. ROWNUM es una _pseudocolumna_, podemos mostrarla pero jamás manipularla.


## Scalar Subquery Expressions

### Scalar Subquery Expression In The SELECT Clause
Ejemplo (Rischert,A, 2004, 403):

```
SELECT city, state, zip,
	(SELECT COUNT(*)
	FROM student s
	WHERE s.zip = z.zip) AS student_count
FROM zipcode z
WHERE state = 'CT'
```

### Scalar Subquery Expression In The WHERE Clause
Ejemplo (Rischert,A, 2004, 404):

```
SELECT student_id, last_name
FROM student s
WHERE (SELECT COUNT(*)
FROM enrollment e
WHERE s.student_id = e.student_id) >
	(SELECT AVG(COUNT(*))
	FROM enrollment
	GROUP BY student_id)
ORDER BY 1
```
### Scalar Subquery Expression In The ORDER BY Clause
Ejemplo (Rischert,A, 2004, 405):

```
SELECT student_id, last_name
FROM student s
WHERE student_id BETWEEN 230 AND 235
ORDER BY (SELECT COUNT(*)
	FROM enrollment e
	WHERE s.student_id = e.student_id) DESC
```

### Scalar Subquery Expression And The Case Expression
Ejemplo (Rischert,A, 2004, 405):
```
SELECT course_no, cost,
CASE WHEN cost <= (SELECT AVG(cost)
cost *1.5
WHEN cost = (SELECT MAX(cost)
	(SELECT cost FROM
	WHERE course_no =
	ELSE cost
	END "Test CASE"
	FROM course
	WHERE course_no IN (20, 80)
ORDER BY 2
```

### Scalar Subquery Expressions And Functions
Ejemplo (Rischert,A, 2004, 406):
```
SELECT student_id, section_id,
UPPER((SELECT last_name
	FROM student
	WHERE student_id = e.student_id))
	"Last Name in Caps"
FROM enrollment e
WHERE student_id BETWEEN 100 AND 110
```

## ANY, SOME, and ALL Operators In Subqueries

El operador ANY revisa si hay algún valor en la lista que haga que la condición sea TRUE, el operador SOME tiene la misma función. ALL retorna las filas si la condición es verdadera para todos los valores de la lista.

### ANY
Ejemplo (Rischert,A, 2004, 414):

```
SELECT section_id, numeric_grade
FROM grade
WHERE section_id = 84
AND numeric_grade < ANY (80, 90)
```

## ALL
Ejemplo (Rischert,A, 2004, 414):
```
SELECT section_id, numeric_grade
FROM grade
WHERE section_id = 84
AND numeric_grade < ALL (80, 90)
```

