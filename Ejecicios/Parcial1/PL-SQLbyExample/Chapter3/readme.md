Resumen cápitulo tres.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 3. "SQL in PL/SQL".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Chapter 3. SQL in PL/SQL

Una transacción es una serie de ordenes SQL que el programador agrupa en una unidad lógica.

## LAB 3.1 Making use od DML in PL/SQL

### Variable initialization with select into
Podemos usar dos métodos para inicialzar una variable, primero usar el ya antes visto ':=' ousando _SELECT INTO_.

Ejemplo. (ROSENZWEIG,B &  RAKHIMOV,E, 209, p. 69)

```
SET SERVEROUTPUT ON
DECLARE
v_average_cost VARCHAR2(10);
BEGIN
SELECT TO_CHAR(AVG(cost), '$9,999.99')
INTO v_average_cost
FROM course;
DBMS_OUTPUT.PUT_LINE('The average cost of a '||
'course in the CTA program is '||
v_average_cost);
END;
```
Podemos insertar datos de esta manera. 


### Using an Oracle sequence
Una secuencia de Oracle es un objeto que puede ser usado para generar números únicos. 

### Accesing and incrementing sqequence values
Despues de crear una secuencia, podemos acceder a ella con:

* **CURRVAL** returns the current value of the sequence.
* **NEXTVAL** increments the sequence and returns the new value.

Ejemplo de creación de secuencia (ROSENZWEIG,B &  RAKHIMOV,E, 209, p. 72):
```
CREATE SEQUENCE eseq
INCREMENT BY 10
```
La primer referencia a ESEQ.NEXTVAL será uno y la siguiente 11.

### Drawing numbers from a sequence
Ejemplo de uso de una secuencia (ROSENZWEIG,B &  RAKHIMOV,E, 209, p. 73):

```
-- ch03_3a.sql
CREATE TABLE test01 (col1 number);
CREATE SEQUENCE test_seq
INCREMENT BY 5;
BEGIN
INSERT INTO test01
VALUES (test_seq.NEXTVAL);
END;
/
Select * FROM test01;
```

## LAB 3.2 Making use of SAVEPOINT

"When a user issues DML statements in an application, the changes are not visible to other users until a COMMIT or ROLLBACK has been issued"(ROSENZWEIG,B &  RAKHIMOV,E, 209, p. 74)

Usamos
* **COMMIT** hacer que los eventos dentro de una transacción sean permanentes.
* **ROLLBACK** borrar los eventos en una transacción.
* **SAVEPOINT** controlar transacciones.

**IMPORTANTE** El inicio de un bloque PL/SQL no necesariamente significa que inicia una transacción.

Usamos transacciones también para evitar inconsistencias en las bases de datos.

### COMMIT 

Cuando emitimos el COMMIT la transacción acaba y los resultados son:
* Todo lo que se trabajó en la transacción se vuelve permanente.
* Otros usuarios pueden ver los cambio hechos en los datos.
* Se liberan los bloqueos adquiridos.

#### Sintaxis
```
 COMMIT [WORK]; 
```

### ROLLBAK
Cuando emitimos el ROLLBACK la transacción acaba y los resultados son:
* Todo lo que se hizo en la transacción se deshace, como si nada hubiese pasado.
* Se liberan los bloqueos adquiridos.
#### Sintaxis
```
 ROLLBACK [WORK]; 
```


### SAVEPOINT
Con SAVEPOINT, solo una parte de la transacción se puede deshacer.
#### Sintaxis
```
 SAVEPOINT name; 
```
Name es el nombre del SAVEPOINT. Cuando se declara un SAVEPOINT, el programa puede hacer un rollback al SAVEPOINT, de la siguiente manera:
```
 ROLLBACK [WORK] to SAVEPOINT name; 
```
**Los SAVEPOINT se usan antes de una sección complicada de la transacción.**







