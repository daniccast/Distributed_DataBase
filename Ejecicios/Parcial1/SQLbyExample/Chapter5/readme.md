Resumen cápitulo tres.
Información recuperada de Rischert,A (2004)."Chapter 4. Aggregate Functions,GROUP BY, and HAVING". Ramagnano,L, Oracle® SQLby Example(301-326). Pearson. 

# Chapter 5. Aggregate Functions,GROUP BY, and HAVING

Las _Aggregate_ functions nos permiten trabajar con un grupo de columnas.



## Lab 5.1 AGGREGATE FUNCTIONS
Las _Aggregate functions_ agregan, o agrupan, datos para
producir un solo resultado. 

### The COUNT Function
Permite contar valores en la tabla. 
Ejemplo (Rischert,302). Cuenta las filas en la tabla.

```
SELECT COUNT(*)
FROM enrollment
```

SI usamos COUNT(valor\_de\_Tabla) no cuenta los NULL, si ponemos (*) los cuenta.


Usamos **DISTINCT(valor\_de\_Tabla)** para agrupar solo los valores que son diferentes.

### The SUM Function
Esta función suma todos los valores de un grupo de datos.
Ejemplo (Rischert,303).
```
SELECT SUM(capacity)
FROM section
```
### The AVG Function
Devuelve el promedio de un grupo de filas. 
Los NULL son ignorados, se pueden sustituir también con NVL.
Ejemplo (Rischert,303).
```
SELECT AVG(capacity), AVG(NVL(capacity,0))
FROM section
```
### The MIN and MAX Functions

Proveen el valor mínimo o máximos de un grupo de valores. 
Ejemplo (Rischert,304).
```
SELECT MIN(capacity), MAX(capacity)
FROM section
```
Pueden tomar diferentes tipos de datos, como fechas o cadenas.

### AGGREGATE Functions and CASE
Poner un CASE puede ser útil para manipular los datos.
Ejemplo (Rischert,305).
```
SELECT AVG(CASE WHEN prerequisite IS NOT NULL THEN cost*1.1
WHEN prerequisite = 20 THEN cost*1.2
ELSE cost
END) AS avg
FROM course
```

## Lab 5.2 The GROUP BY and HAVING Clauses

### The GROUP BY Clause

GROUP BY determina como se van a agrupasr las filas. 

Ejemplo (Rischert,312). Similar a DISTINCT
```
SELECT location, COUNT(*)
FROM section
GROUP BY location
```
GROUP BY y las _Aggregate functions_ trabajan juntas.

**Se pueden agrupar por varias columnas**
Ejemplo (Rischert,314). Similar a DISTINCT
```
SELECT location, instructor_id,
COUNT(*), SUM(capacity) AS sum,
MIN(capacity) AS min, MAX(capacity) AS max
FROM section
GROUP BY location, instructor_id
```

**ERROR COMÚN. SI listamos una columna debe usarse en el group by (si lo hay) -ORA-00979 _Se puede agregar alguna constante sin obtener este error_**


### Sorting Data

Para ordenar los datos usamos **ORDER_BY** 

### The HAVING Clause
Usamos **HAVING** para eliminar grupos (como el WHERE las columnas)
Ejemplo (Rischert,316). 
```
SELECT location "Location", instructor_id,
COUNT(location) "Total Locations",
SUM(capacity) "Total Capacity"
FROM section
GROUP BY location, instructor_id
HAVING SUM(capacity) > 50
ORDER BY "Total Capacity" DESC
```
**Podemos usar WHERE con HAVING**
**Podemos tener múltiples condiciones en HAVING -AND**

## Nesting Aggregate Functions

Las _Aggregate functions_ se pueden usar una dentro de otra. 
Ejemplo (Rischert,318). 
```
SELECT MAX(COUNT(*))
FROM enrollment
GROUP BY section_id
```



