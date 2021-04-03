Resumen cápitulo seis.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 6, Iterative Control: Part I".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Chapter 6, Iterative Control: Part I

PL/SQL tiene cuatro tipos de LOOPS:
* Simple loops
* WHILE loops
* Numeric FOR loops
* cursor FOR loops

## Simple loops

Estructura:
```
LOOP
STATEMENT 1;
STATEMENT 2;
...
STATEMENT N;
END LOOP;
```

Las sentencias se repetiran infinitamente, ya que no hay una condición que para el ciclo.

### EXIT STATEMNT
Termina un ciclo cuando la condición DE SALIDA sea TRUE. Nos apoyamos con los IF.

Estructura:

```
LOOP
STATEMENT 1;
STATEMENT 2;
IF CONDITION THEN
EXIT;
END IF;
END LOOP;
STATEMENT 3;
```

**Solo podemos usar la propiedad EXIT dentro de un loop, para poder terminar algún bloque de código podemos usar _RETURN_**

### EXIT WHEN STATEMENT
Causa que un loop termine, solo que ya no es necesario apoyarse de algún IF. La condición debe ser TRUE para que salga del ciclo. 

Estructura:

```
LOOP
STATEMENT 1;
STATEMENT 2;
EXIT WHEN CONDITION;
END LOOP;
STATEMENT 3;
```
## WHILE loops

Estructura:

```
WHILE CONDITION LOOP
STATEMENT 1;
STATEMENT 2;
...
STATEMENT N;
END LOOP;
```

Se detiene cuando la condición da FALSE.

Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009, p. 154): 
```
DECLARE
v_counter NUMBER := 1;
BEGIN
WHILE v_counter < 5 LOOP
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- decrement the value of v_counter by one
v_counter := v_counter + 1;
END LOOP;
END;
```



### PREMATURE TERMINATION OF THE LOOP

Podemos usar el EXIT y EXIT WHEN dentro del cuerpo del WHILE loop para terminar prematuramente el mismo.

## Numeric FOR Loops
Es llamado númerico porque requiere un integer como su valor terminal.

Estructura:
```
FOR loop_counter IN [REVERSE] lower_limit..upper_limit LOOP
STATEMENT 1;
STATEMENT 2;
...
STATEMENT N;
END LOOP;
```
El loop\_counter es nuestro _INDEX_. Lower y upper limit son dos numeros eteros o expresiones que evaluan el valor entero en tiempo de ejecución. Los (..) sirven como operador de rango. Si usamos la palabra REVERSE, el for itera del limite superior al inferior.
 
 Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009, p. 163): 
```
BEGIN
FOR v_counter IN 1..5 LOOP
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END LOOP;
END;
```

### PREMATURE TERMINATION OF THE LOOP
Podemos usar el EXIT y EXIT WHEN dentro del cuerpo del FOR loop para terminar prematuramente el mismo.





