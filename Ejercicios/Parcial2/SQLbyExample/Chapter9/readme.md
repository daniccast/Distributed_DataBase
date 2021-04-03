Resumen cápitulo nueve.
Información recuperada de Rischert,A (2004)."Chapter 9. Complex Joins". Ramagnano,L, Oracle® SQLby Example(446-477). Pearson. 

# Complex Joins

## Outer JOINS

El _Outer Join_ es similar al _EQUIJOIN_ porque devuelve todos los registros que un _EQUIJOIN_ devuelve. Pero también devuelve registros que están en una tabla que no tiene coincidencias con otra. 

Este tiene tres tipos de sintaxis, es común usar la sintaxis ANSI.
 
Ejemplo (Rischert, 2004, 448):

```
SELECT c.course_no, c.description, s.section_id, s.course_no
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no
```
En el ejemplo observamos que se usan las palabras reservadas **LEFT OUTER** antes de **JOIN**. Esto indica que las filas en la tabla del lado izquiedo del JOIN (en este caso _COURSE_) tienen que ser listados, aún cuando haya filas que no tienen en común la llave. 

Si quisieramos incluir todas las filas de la tabla _SECTION_ podemos usar **RIGHT OUTER**. 

### The Oracle OUTER JOIN Operatos (+)

Oracle usa el operador (+) para el _outer JOIN_ para indicar que las filas con valores nulos también deben ser mostradas.

Ejemplo (Rischert, 2004, 450):

```
SELECT c.course_no, c.description,
	s.section_id, s.course_no
FROM course c, section s
WHERE c.course_no = s.course_no(+)
ORDER BY c.course_no
```

En Oracle solo se puede usar de esta manera, o podemos usar _UNION ALL_.


### The OUTER JOIN and The UNION ALL Operator

Podemos lograr el _OUTER JOIN_ con dos sentnecias _SQL_: un _equijoin_ y una _subquery_ correlaciona unidas con _UNION ALL_.
 
Ejemplo (Rischert, 2004, 450):

```
SELECT c1.course_no, c1.description,
	s.section_id, s.course_no
FROM course c1, section s
WHERE c1.course_no = s.course_no

UNION ALL

SELECT c2.course_no, c2.description,
	TO_NUMBER(NULL), TO_NUMBER(NULL)
FROM course c2
WHERE NOT EXISTS
	(SELECT 'X'
	FROM section
	WHERE c2.course_no = course_no)
```


### FULL OUTER JOIN

Este incluye todas las filas de ambas tablas. Oracle no tiene una sintaxis para esto, se debe usar la sintaxis ANSI: **FULL OUTER JOIN**

Ejemplo (Rischert, 2004, 452):

```
SELECT col1, col2
FROM t1 FULL OUTER JOIN t2
ON t1.col1 = t2.col2
```

## SELF- JOINS

Es un JOIN hacia la misma tabla. Se logra por medio de alias de tablas. Son bastante útiles para comparar y checar por inconsistecias en los datos. Algunas veces se necesitan para reportar en relaciones recursivas. 

Ejemplo (Rischert, 2004, 467):

```
SELECT c1.course_no, c1.description course_descr, c1.prerequisite, c2.description pre_req_descr
FROM course c1 JOIN course c2
ON (c1.prerequisite = c2.course_no)
ORDER BY 3
```

## The NON-EQUIJOIN

Para usarse en JOINS que no están basados en igualdad de valores. Por ejemplo (Rischert, 2004, 468):

```
SELECT grade_type_code, numeric_grade, letter_grade
FROM grade g JOIN grade_conversion c
ON (g.numeric_grade BETWEEN c.min_grade AND c.max_grade)
WHERE g.student_id = 107
ORDER BY 1, 2 DESC
```





