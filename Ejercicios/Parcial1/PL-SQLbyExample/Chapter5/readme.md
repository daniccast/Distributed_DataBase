Resumen cápitulo cinco.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 5. Conditional Control: CASE Statements".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 


# Chapter 5. Conditional COntrol: CASE Statements

## CASE STATEMENTS

Nos permiten especificar un selector que dertermina que grupo de acciones tomar.

### CASE STATEMENTS
Estructura:
```
CASE SELECTOR
WHEN EXPRESSION 1 THEN STATEMENT 1;
WHEN EXPRESSION 2 THEN STATEMENT 2;
...
WHEN EXPRESSION N THEN STATEMENT N;
ELSE STATEMENT N+1;
END CASE;
```

**El selector se evalua solo una vez, y se hace de arriba a abajo.**
Ejemplo de uso(ROSENZWEIG,B &  RAKHIMOV,E,2009,113)

```
DECLARE
v_num NUMBER := &sv_user_num;
v_num_flag NUMBER;
BEGIN
v_num_flag := MOD(v_num,2);

-- test if the number provided by the user is even

CASE v_num_flag
	WHEN 0 THEN
		DBMS_OUTPUT.PUT_LINE (v_num||’ is even number’);
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_num||’ is odd number’);
END CASE;

DBMS_OUTPUT.PUT_LINE ('Done’);
END;
```

### SEARCHED CASE STATEMENTS

Esta variante busca por condiciones que produzcan **TRUE, FALSE, NULL**. Cuando un _SEARCH CONDITION_ cumple con el TRUE se ejecutan los STATEMENTS. 

Estructura:
```
CASE
WHEN SEARCH CONDITION 1 THEN STATEMENT 1;
WHEN SEARCH CONDITION 2 THEN STATEMENT 2;
...
WHEN SEARCH CONDITION N THEN STATEMENT N;
ELSE STATEMENT N+1;
END CASE;
```

**El ELSE es opcional**

Ejemplo de uso(ROSENZWEIG,B &  RAKHIMOV,E,2009,115)

```
DECLARE
v_num NUMBER := &sv_user_num;
BEGIN
-- test if the number provided by the user is even
CASE
	WHEN MOD(v_num,2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE (v_num||' is even number');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_num||' is odd number');
END CASE;
DBMS_OUTPUT.PUT_LINE ('Done');
END;
```
### DIFFERENCES BETWEEN CASE AND SEARCHED CASE STATEMENTS
La principal diferencia es que el SEARCH CASE **no necesita un selector** 

## CASE Expressions

Tiene la misma estrucutura. Queda mejor explicado en un ejemplo (ROSENZWEIG,B &  RAKHIMOV,E,2009,126).

Ejemplo:
```
DECLARE
v_num 		NUMBER := &sv_user_num;
v_num_flag	NUMBER;
v_result	VARCHAR2(30);
BEGIN
v_num_flag:= MOD(v_num,2);

v_result := 
	CASE v_num_flag
		WHEN 0 THEN v_num||' is even number'
		ELSE v_num||' is odd number'
	END;
DBMS_OUTPUT.PUT_LINE (v_result);
DBMS_OUTPUT.PUT_LINE ('Done');
END;
```
When y else, contienen una expreion  que no es ejecutable. 
Se pueden usar con CASE o SEARCHED CASE.

Se puede usar en un SELECT INTO. Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E,2009,127): 
```
DECLARE
v_course_no 	NUMBER;
v_description 	VARCHAR2(50);
v_prereq 	VARCHAR2(35);
BEGIN
SELECT course_no, description,
	CASE
		WHEN prerequisite IS NULL THEN
			'No prerequisite course required'
		ELSE TO_CHAR(prerequisite)
	END prerequisite
INTO v_course_no, v_description, v_prereq
FROM course
WHERE course_no = 20;

DBMS_OUTPUT.PUT_LINE ('Course: '||v_course_no);
DBMS_OUTPUT.PUT_LINE ('Description: '||v_description);
DBMS_OUTPUT.PUT_LINE ('Prerequisite: '||v_prereq);
END;	
```

##NULLIF and COALESCE Functions

### The NULLIF Function
La funcion compara dos expresiones y si son iguales devuelve NULL, si no son iguales regresa la expresion 1.

Sintaxis
```
NULLIF (expression1, expression2)
```
**No puedes poner _NULL_ a la expresión 1**

### The COALESCE Function
Compara todas las expresiones con NULL, y devuelve el valor de la primera expresion que no sea NULL.

Estructura:
```
COALESCE (expression1, expression2, ..., expressionN)
```

Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E,2009,135): 
```
SELECT e.student_id, e.section_id, e.final_grade, g.numeric_grade,
COALESCE(e.final_grade, g.numeric_grade, 0) grade
FROM enrollment e, grade g
WHERE e.student_id = g.student_id
AND e.section_id = g.section_id
AND e.student_id = 102
AND g.grade_type_code = 'FI';
```


