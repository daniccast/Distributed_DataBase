Resumen cápitulo seis.
Información recuperada de Rischert,A (2004)."Chapter 6. Equijoins". Ramagnano,L, Oracle® SQLby Example(326-366). Pearson. 

# Chapter 6. Equijoins


## Lab 6.1 The Two-Table Join

### Steps To Formulate The SQL Statement


* Escoger que columnas queremos incluir en el resultado.
* Ver en qué tablas están esas columnas.
* Determinar si exite una relación uno a uno o uno a muchos entre esas columnas. _Los JOINS se usan usualmente entre una llave primaria y una foránea._ _Cuando hacemos un JOIN entre relaciones muchos a muchos se convierte en un producto cartesiano._

Ejemplo (Rischert, 329)
```
SELECT course.course_no, section_no, description,
location, instructor_id
FROM course, section
WHERE course.course_no = section.course_no
```
En el where va la condición para el _JOIN_.

### Table Alias
 Podemos usar un alias para hacer referencias más pequeñas.
 Ejemplo (Rischert, 330)
```
SELECT c.course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c, section s
WHERE c.course_no = s.course_no
```

### Narrowing Down Your Result Set

Claramente, podemos agregar más codiciones al WHERE para cambiar o hacer la consulta más específica.

### NULLS and JOINS
En los _EQUIJOINS_ si la fila tiene un NULL no se incluye. _Ver capítulo 9_


### ANSI JOIN Syntax

#### The INNER JOIN
Se usa para expresar un _JOIN_ que satisface una condición. Típicamente una igualdad que lo convierte en un _EQUIJOIN_. Es formato requiere usar la palabra _JOIN_, _INNER_ por lo regular es omitida. Para expresar una condión se puede especiificar usando _USING_ o _ON_. 


##### The USING Condition
Identifica la columna en común entre las tablas.
 Ejemplo (Rischert, 331)
```
SELECT course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c INNER JOIN section s
USING (course_no);
```
**_USING()_ implica que AMBAS COLUMNAS SE LLAMAN IGUAL. De igual manera no es necesario específicar la tabla a la que pertenece al mostrar la columna.**

##### The ON Condition

Si los nombre de las columnas son diferentes usamos _ON_. Aquí sí se específica el nombre de las tablas. 

##### SELECT c.course_no, s.section_no, c.description,

 Ejemplo (Rischert, 333)
```
SELECT c.course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c JOIN section s
ON (c.course_no = s.course_no)
```
##### Additional WHERE Clause Conditions
Claramente podemos agregar condiciones específicas con _WHERE_. 
La ventaja de _ON_ y _USING_ es que podemos poner en f¿diferentes lados la condición del _JOIN_ con la de la consulta en general.

##### The NATURAL JOIN
Se usa para hacer un _JOIN_ entre las columnas comunes de las tablas, aquí no es necesario específicar con _ON_ o _USING_.
 Ejemplo (Rischert, 333)
```
SELECT course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c NATURAL JOIN section s
```
Esta consulta no devuelve nada, porque hay varias columanas entre las tablas que se llaman igual. **HAY QUE SER CUIDADOSOS AL USAR ESTE MÉTODO.**

### Cartesian Product
 Se usa raramente. Indica que no hay un _JOIN_ entre columnas. Indica relacion muchos a muchos.
**COMANDO SET PAUSE ON, para ver poco a poco**
#### The ANSI Standard Cross-Join
Nos devuelve lo mismo que el producto cartesiano.
Ejemplo (Rischert, 335)
```
SELECT COUNT(*)
FROM section CROSS JOIN instructor
```



## Lab 6.2 Joining Three Or More Tables
### Three Or More Table Joins

Ejemplo (Rischert, 347)
```
SELECT c.course_no, s.section_no, c.description, s.location,
s.instructor_id, i.last_name, i.first_name
FROM course c, section s, instructor i
WHERE c.course_no = s.course_no
AND s.instructor_id = i.instructor_id
```
### ANSI JOIN Syntax For Three And More Table Joins
Para usar _JOIN_ tenemos que hacer el _JOIN_ entre las dos tablas primero, y luego en la tercera. 
Ejemplo (Rischert, 348)
```
SELECT c.course_no, s.section_no, c.description, s.location,
s.instructor_id, i.last_name, i.first_name
FROM course c JOIN section s
ON (c.course_no = s.course_no)
JOIN instructor i
ON (s.instructor_id = i.instructor_id)
```
### Multicolumn Joins
Hacer a las claves multicolumna parte de la criteria.
Ejemplo (Rischert, 350)
```
ELECT g.student_id, g.section_id,
g.grade_type_code type,
g.grade_code_occurrence no,
g.numeric_grade indiv_gr,
TO_CHAR(e.enroll_date, 'MM/DD/YY') enrolldt
FROM grade g JOIN enrollment e
ON (g.student_id = e.student_id AND g.section_id = e.section_id)
WHERE g.student_id = 220
AND g.section_id = 119
```
Para usar _USING_ los separamos por una coma.

```
USING (student_id, section_id)
```

### Joining Across Many Tables
_JOIN_ varias tablas con varias columnas requiere repetir los pasos anteriores varias vecas. Para unir _N_ tablas necesitas al menos _N-1_ condiciones.


### Tipos de JOINS
(Rischert, 352)
Join Type | Base of Join Condition | Syntax
----------|------------------------|---------------
Equijoin or Inner Join| Equality| Traditional comma-separated join or ANSI JOIN syntax (including optional INNER keyword).
Natural Join|Equality| NATURAL JOIN keyword.
Cross-Join or Cartesian Product | NO | Traditional comma-separated with the missing join condition in the WHERE clause or CROSS JOIN keyword.
Self-Join | Equality | (See Equijoin or Inner Join).
Outer Join (left, right, full) | Equality and extending the resultset |  OUTER JOIN keywords or outer join operator(+).
Non-Equijoin | Nonequality of values | Traditional comma-separated join or ANSIjoin syntax with the ON clause.




