Resumen cápitulo OCHO.
Información recuperada de Mishra S., Beaulieu A. (2002). Chapter 13 Advanced Analytic SQL. en Mastering Oracle SQL (pp. 157-174).Gravenstein Highway North, Sebastopol, CA 95472. 		

# Chapter 13 Advanced Analytic SQL

Muchas veces creamos consultas bastate complejas para poder obtener datos relevantes de nuestra información. Estás pueden ser simplificadas con funciones análiticas.

## Ranking Functions
### RANK, DENSE_RANK, and ROW_NUMBER

Generan un integer entre 1 a N, dónde N es menor o igual a el fumero de filas del conjunto resultante. 

* ROW_NUMBER devuelve un número único para cada fila que comienza con 1. Para
filas que tienen valores duplicados, los números se asignan arbitrariamente.
* DENSE_RANK asigna un número único para cada fila que comienza con 1, excepto para
filas que tienen valores duplicados, en cuyo caso se asigna la misma clasificación.
* RANK asigna un número único para cada fila que comienza con 1, excepto para las filas
que tienen valores duplicados, en cuyo caso se asigna la misma clasificación y una brecha
aparece en la secuencia para cada clasificación duplicada.


Podemos especificar como tratar los NULLS.(Mishra y Beaulieu, 2002, 270)
```
SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
RANK( ) OVER (ORDER BY SUM(tot_sales) DESC NULLS LAST) sales_rank
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr;

```
Oracle proporciona funcionalidad para identificar el primero (top 1) o el último (bottom 1) registros en un conjunto clasificado.

Estas funciones
se componen de tres partes:
* Una cláusula ORDER BY que especifica cómo clasificar el conjunto de resultados.
* Las palabras clave FIRST y LAST para especificar si se utilizará la parte superior o la inferior.
fila clasificada.
* Una función agregada (es decir, MIN, MAX, AVG, COUNT) utilizada como desempate en
caso más de una fila del conjunto de resultados empate para el PRIMER o ÚLTIMO lugar en el
clasificación.

Ejemplo (Mishra y Beaulieu, 2002, 278)
```
SELECT
MIN(region_id)
KEEP (DENSE_RANK FIRST ORDER BY SUM(tot_sales) DESC) best_region,
MIN(region_id)
KEEP (DENSE_RANK LAST ORDER BY SUM(tot_sales) DESC) worst_region
FROM orders
WHERE year = 2001
GROUP BY region_id;
```

## NTILE

Otra forma en que se usan comúnmente las clasificaciones es generar depósitos en los que conjuntos de las clasificaciones que están agrupadas. Por ejemplo, es posible que deseemos encontrar aquellos clientes cuyas ventas totales se ubicaron en el 25% superior. La siguiente consulta usa la función NTILE para agrupar a los clientes en cuatro categorías (o cuartiles):


Ejemplo (Mishra y Beaulieu, 2002, 279)

```
SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
NTILE(4) OVER (ORDER BY SUM(tot_sales) DESC) sales_quartile
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 4,3 DESC;

```

## WIDTH_BUCKET

Similar a la función NTILE, la función WIDTH\_BUCKET agrupa filas del conjunto de resultados en cubos. Sin embargo, a diferencia de NTILE, la función WIDTH_BUCKET intenta crear cubos de ancho equivalente, lo que significa que el rango de valores se distribuye uniformemente a través de los cubos


## CUME_DIST and PERCENT_RANK

CUME\_DIST y PERCENT\_RANK, usan la clasificación de una fila en particular para calcular información adicional. La función CUME\_DIST (abreviatura de Distribución acumulativa) calcula la proporción del número de filas que tienen una clasificación menor o igual al número total de filas en la partición. La función PERCENT_RANK calcula la relación entre la clasificación de una fila y el número de filas en la partición usando la fórmula:
(PVP - 1) / (PVR - 1)
dónde:
PVP
Significa "rango de fila en la partición".
NRP
Significa "número de filas en la partición".


















