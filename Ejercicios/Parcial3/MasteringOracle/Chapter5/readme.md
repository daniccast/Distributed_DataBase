Resumen cápitulo cinco.
Información recuperada de Mishra S., Beaulieu A. (2002). Chapter 5 Subqueries. en Mastering Oracle SQL (pp. 68-95).Gravenstein Highway North, Sebastopol, CA 95472. 		

# Chapter 5 Subqueries

Una _subquery_ es una sentencia SELECT que está anidada en cualquier otra sentencia SQL.
Puede verse como una tabla temporal de alcance en únicamente la sentencia.
Se encierran en paréntesis.

Ejemplo(Mishra y Beaulieu, 2002, 68):
```
SELECT * FROM customer
WHERE cust_nbr = (SELECT 123 FROM dual);

```

Son usualmente usadas en la cláusula WHERE en sentencias SELECT, UPDATE o  DELETE.
Son útiles porque permiten hacer comparaciones sin cambiar el tamaño del conjunto resultante.

## Noncorrelated Subqueries

Permiten compararun conjunto de valores con cada fila.
Se dividen en:

## Single-Row, Single-Column subqueries.

Devuelve una sola fila de una sola columna. Se conocen como _scalar-subqueries_. 
Ejemplo(Mishra y Beaulieu, 2002, 69):
```
SELECT lname
FROM employee
WHERE salary > (SELECT AVG(salary)
FROM EMPLOYEE);

```

De hecho, las subconsultas se utilizan con frecuencia para aislar un subconjunto de registros dentro de una tabla.

Exploremos dónde más las consultas pueden y no pueden utilizarse en declaraciones SQL:
* La cláusula FROM puede contener cualquier tipo de subconsulta no correlacionada.
* Las cláusulas SELECT y ORDER BY pueden contener subconsultas escalares.
* La cláusula GROUP BY no puede contener subconsultas.
* Las cláusulas START WITH y CONNECT BY, utilizadas para realizar consultas jerárquicas
datos, pueden contener subconsultas.

### Multiple-Row Subqueries

Cuando una subconsulta devuelve más De una fila, no es posible utilizar solo operadores de comparación, ya que un solo valor no se puede comparar directamente con un conjunto de valores. Sin embargo, se puede comparar un solo valor comparado con cada valor en un conjunto. Para ellos se pueden utiizar any, all o IN.


### Multiple-Column Subqueries

Regularmente se utilizan con IN. 

Ejemplo(Mishra y Beaulieu, 2002, 69):
```
UPDATE monthly_orders
SET (tot_orders, max_order_amt, min_order_amt, tot_amt) =
(SELECT COUNT(*), MAX(sale_price), MIN(sale_price), SUM(sale_price)
FROM cust_order
WHERE order_dt >= TO_DATE('01-NOV-2001','DD-MON-YYYY')
AND order_dt < TO_DATE('01-DEC-2001','DD-MON-YYYY')
AND cancelled_dt IS NULL)
WHERE month = 11 and year = 2001;

```

### Correlated Subqueries

Una subconsulta que hace referencia a una o más columnas de la declaración SQL que la contiene, se llama subconsulta correlacionada.

Ejemplo(Mishra y Beaulieu, 2002, 75):
```
SELECT p.part_nbr, p.name
FROM supplier s, part p
WHERE s.name = 'Acme Industries'
AND s.supplier_id = p.supplier_id
AND 10 <=
(SELECT COUNT(*)
FROM cust_order co, line_item li
WHERE li.part_nbr = p.part_nbr
AND li.order_nbr = co.order_nbr
AND co.order_dt >= TO_DATE('01-DEC-2001','DD-MON-YYYY'));
```



## Inline Views

Una instrucción SELECT que contiene en la cláusula FROM una instrucción SELECT  se conoce como vista en línea.

Ejemplo(Mishra y Beaulieu, 2002, 75):
```
SELECT d.dept_id, d.name, emp_cnt.tot
FROM department d,
(SELECT dept_id, COUNT(*) tot
FROM employee
GROUP BY dept_id) emp_cnt
WHERE d.dept_id = emp_cnt.dept_id;
```









