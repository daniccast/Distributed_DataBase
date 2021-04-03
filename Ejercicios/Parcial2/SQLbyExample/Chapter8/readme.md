Resumen cápitulo ocho.
Información recuperada de Rischert,A (2004)."Chapter 8. Set Operators". Ramagnano,L, Oracle® SQLby Example(423-446). Pearson. 

# Set Operators

Los operadores de conjuntos combinan dos o más conjuntos de datos para producir un solo conjunto resultado.
En Oracle se usan **UNION, UNION ALL, MINUS AND INTERSECT**-
Se combinan resultados con _UNION y UNION ALL_. EL operador _INTERSECT_ determina las filas comunes. Y el operador _MINUS_ muestra las filas diferentes entre los conjuntos.

Cosas importantes:
* Cada SELECT debe contener las mismas columnas.
* La columna para unir debe ser del mismo tipo de dato.

## The powe od UNION and UNION ALL

Ejemplo UNION(Ramagnano, 2004, 424):
```
SELECT first_name, last_name, phone
FROM instructor
UNION
SELECT first_name, last_name, phone
FROM student
```

Hay que tener en cuenta que UNION no cuenta los datos duplicados, lo que quiere decir que muestra solo las filas únicas.

UNION ALL, por el contrario, también incluye filas duplicadas. Este tiene mejor desempeño, así que es preferible usarlo.
Ejemplo(Ramagnano, 2004, 425): 

```
SELECT first_name, last_name, phone
FROM instructor
UNION ALL
SELECT first_name, last_name, phone
FROM student
```

### ORDER BY and SET Operations

El resultado de ua operación de conjuntos puede ser ordendo, en lugar de poner el nombre de la columna se pone la posición en la que está en el SELECT. Ejemplo(Ramagnano, 2004, 426): 
```
SELECT instructor_id id, first_name, last_name, phone
FROM instructor
UNION
SELECT student_id, first_name, last_name, phone
FROM student
ORDER BY 3
```


## The MINUS And INTERSECT SET Operators

### The MINUS Operator

Devuelve la diferencua entre dos conjuntos.Ejemplo(Ramagnano, 2004, 434) muestra los instructores que no enseñan en una seccion: 

```
SELECT instructor_id
FROM instructor
MINUS
SELECT instructor_id
FROM section
```

Igual que UNION, MINUS elimina los duplicados cuando evalua los datos. NO ES NECESARIO USAR DISTINCT en el SELECT, a menos que se hagan por separado. 


### The INTERSECT Operato

Determina los valores comunes entre dos conjuntos. Ejemplo(Ramagnano, 2004, 437):

```
SELECT created_by
FROM enrollment
INTERSECT
SELECT created_by
FROM course
```

Este operador puede reemplazar el EQUIJOIN. 


## Execution Order Of Set Operations

El orden va hacia abajo, a menos de que se usen paréntesis. Como en el álgebra, se e da prioridad a los que está dentro de los paréntesis. 

**Los operadores nos sirvnen principalmente para determinar diferencias entre tablas.**




