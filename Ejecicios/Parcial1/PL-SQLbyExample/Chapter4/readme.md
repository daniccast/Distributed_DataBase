Resumen cápitulo cuatro.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 4. Conditional Control: IF Statements".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Chapter 4. Conditional Control: IF Statements

## IF-THEN STATEMENTS

Estructura: 

```
IF CONDITION THEN
STATEMENT 1;
...
STATEMENT N;
END IF;
```
Dónde la condición es lo que tiene que cumplir para ejecutar las STATEMENTs. Cuando lo que está en la condición no se cumple, se pasa a ejecutar lo que está después del IF.


Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009,p.85)

```
DECLARE
v_num1 NUMBER := 5;
v_num2 NUMBER := 3;
v_temp NUMBER;
BEGIN
-- if v_num1 is greater than v_num2 rearrange their values
IF v_num1 > v_num2 THEN
v_temp := v_num1;
v_num1 := v_num2;
v_num2 := v_temp;
END IF;
-- display the values of v_num1 and v_num2
DBMS_OUTPUT.PUT_LINE ('v_num1 = '||v_num1);
DBMS_OUTPUT.PUT_LINE ('v_num2 = '||v_num2);
END;
```

## IF-THEN-ELSE STATEMENT
Aquí especificamos que hacer si se cumple la condición, y que hacer si no se cumple.

Estructura: 

```
IF CONDITION THEN
STATEMENT 1;
ELSE
STATEMENT 2;
END IF;
STATEMENT 3;
```

**Se usa el IF-THEN-ELSE cuando quieres escoger entre dos acciones mutuamente exclusivas.**

Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009,p.86)

```
DECLARE
v_num NUMBER := &sv_user_num;
BEGIN
-- test if the number provided by the user is even
IF MOD(v_num,2) = 0 THEN
DBMS_OUTPUT.PUT_LINE (v_num||' is even number');
ELSE
DBMS_OUTPUT.PUT_LINE (v_num||' is odd number');
END IF;
DBMS_OUTPUT.PUT_LINE ('Done');
END;
```

## ELSIF Statements

La usamos para cuandotenemos una secuencia de condiciones.

Estrucutura: 
```
IF CONDITION 1 THEN
STATEMENT 1;
ELSIF CONDITION 2 THEN
STATEMENT 2;
ELSIF CONDITION 3 THEN
STATEMENT 3;
...
ELSE
STATEMENT N;
END IF;
```

Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, 2009,p.86)

```
DECLARE
v_num NUMBER := &sv_num;
BEGIN
IF v_num < 0 THEN
DBMS_OUTPUT.PUT_LINE (v_num||' is a negative number');
ELSIF v_num = 0 THEN
DBMS_OUTPUT.PUT_LINE (v_num||' is equal to zero');
ELSE
DBMS_OUTPUT.PUT_LINE (v_num||' is a positive number');
END IF;

END;
```

* **Las condiciones deben ser mutuamente exclusivas, y se evaluan de arriba a abajo.**
* El _ELSE_ es completamente opcional.

## Nested IF STATEMENTS

AL igual que en otros entornos, podemos anidar los IF para hacer comparaciones más elaboradas. 

Ejemplo de uso (ROSENZWEIG,B &  RAKHIMOV,E, 2009,p.103)

```
DECLARE
v_num1 NUMBER := &sv_num1;
v_num2 NUMBER := &sv_num2;
v_total NUMBER;
BEGIN
IF v_num1 > v_num2 THEN
DBMS_OUTPUT.PUT_LINE ('IF part of the outer IF');
v_total := v_num1 - v_num2;
ELSE
DBMS_OUTPUT.PUT_LINE ('ELSE part of the outer IF');
v_total := v_num1 + v_num2;
IF v_total < 0 THEN
DBMS_OUTPUT.PUT_LINE ('Inner IF');
v_total := v_total * (-1);
END IF;
END IF;
DBMS_OUTPUT.PUT_LINE ('v_total = '||v_total);
END;
```

### Operadores lógicos
Podemos usar operadores como >, <, <=, >=, AND, OR, IN, BETWEEN.





