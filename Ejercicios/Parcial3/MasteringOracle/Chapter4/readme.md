Resumen cápitulo siete.
Información recuperada de Mishra S., Beaulieu A. (2002). Chapter 4 Group Operations. en Mastering Oracle SQL (pp. 157-174).Gravenstein Highway North, Sebastopol, CA 95472. 		

# Chapter 4. Group Operations

## Aggregate Functions

La función agregada resume los resultados de una expresión sobre un número de filas, devolviendo un solo valor. Entre ellas están: SUM, COUNT, AVG, MAX,  MIN.

Ejemplo (Mishra y Beaulieu, 2002, 56):

```
SELECT MAX(SALARY) FROM EMPLOYEE;

```

Las funciones agregadas (a excepción de GROUPING) ignoran los NULL.

Para utilizar de manera correcta, se ppuede sustituir el NULL por 0 con la función NVL.

Ejemplo (Mishra y Beaulieu, 2002, 58):

```
SELECT AVG(NVL(SALE_PRICE,0)) FROM CUST_ORDER;
```

Podemos usar DISTINCT o ALL(DEFAULT) dentro de las funciones.
Aunque, hay funciones ue acetan únicamente un parámetro (omitir DISTINCT O ALL) como: STTDEV\_POP, STDDEV\_SAMP, VAR\_POP,VAR\_SAMP, and GROUPING.


## The GROUP BY Clause

La cláusula GROUP BY, junto con las funciones agregadas, agrupa un conjunto de resultados en
varios grupos, y luego produce una sola fila de información resumida para cada grupo.
Ejemplo (Mishra y Beaulieu, 2002, 59):

```
SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR;

```

### GROUP BY Clause and NULL Values

Cuando usamos GROUP BY en una columna que contiene valores NULL para algunas filas, todos los
Las filas con valores NULL se colocan en un solo grupo y se presentan como una suma
Mary Row en la salida. Por ejemplo (Mishra y Beaulieu, 2002, 68):
```
SELECT SALE_PRICE, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY SALE_PRICE;

```

También podemos usar WHERE para delimitar grupos.



## HAVING
Sirve como filtro.
**NOTA CUANDO USAMOS HAVING**, solo puede tener atributos que estén listados en la consulta.










