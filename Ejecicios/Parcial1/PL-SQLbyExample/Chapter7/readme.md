Resumen cápitulo siete.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 7, Iterative Control: Part II".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Chapter 7, Iterative Control: Part II

## The CONTINUE Statement

Tiene dos formas: 
* CONTINUE
* CONTINUE WHEN

### THE CONTINUE STATEMENT

La sentencia CONTINUE termina la iteración actual y pasa a la siguiente. Se puede evaluar con la ayuda de un IF.

Estructura 
```
LOOP
STATEMENT 1 ;
STATEMENT 2 ;
IF CONTINUE_CONDITION THEN
CONTINUE;
END IF;
EXIT WHEN EXIT_CONDITION;
END LOOP;
STATEMENT 3 ;
```

### THE CONTINUE WHEN STATEMENT

Es exactamente lo mismo que la anterior, pero esta incluye la condición, cuando esta se cumple pasa a la siguiente iteración.

Estructura 
```
LOOP
STATEMENT 1 ;
STATEMENT 2 ;
CONTINUE WHEN CONTINUE_CONDITION ;
EXIT WHEN EXIT_CONDITION ;
END LOOP;
STATEMENT 3 ;
```

## Nsted Loops
Todos los loops que se ven en este capítulo pueden ser anidar unos con otros sin problema.


Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009, p. 183):

```
DECLARE
	v_counter1 INTEGER := 0;
	v_counter2 INTEGER;
BEGIN
	WHILE v_counter1 < 3 LOOP
	DBMS_OUTPUT.PUT_LINE ('v_counter1: '||v_counter1);
	v_counter2 := 0;
		LOOP
			DBMS_OUTPUT.PUT_LINE ('v_counter2: '||v_counter2);
			v_counter2 := v_counter2 + 1;
			EXIT WHEN v_counter2 >= 2;
			END LOOP;
			v_counter1 := v_counter1 + 1;
		END LOOP;
END;
```
### LOOP Labels 

Como habíamos visto antes, también se pueden pnoer labels en los loop, aparacerán cada que empieza el loop.

Estructura:
```
<< label_name >>
FOR LOOP_COUNTER IN LOWER_LIMIT .. UPPER_LIMIT LOOP
STATEMENT 1 ;
...
STATEMENT N ;
END LOOP label_name ;
```

Ejemplo útil (ROSENZWEIG,B &  RAKHIMOV,E, 2009, p. 185): 


```
BEGIN
<<outer>>
FOR v_counter IN 1..3 LOOP
<<inner>>
FOR v_counter IN 1..2 LOOP
DBMS_OUTPUT.PUT_LINE ('outer.v_counter '||outer.v_counter);
DBMS_OUTPUT.PUT_LINE ('inner.v_counter '||inner.v_counter);
END LOOP inner;
END LOOP outer;
END;
```

Usar el mismo nombre de variable pero se diferencia por la etiqueta.



