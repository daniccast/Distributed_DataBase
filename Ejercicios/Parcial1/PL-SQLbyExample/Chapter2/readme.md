Resumen cápitulo dos.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 2. General Programming Language Fundamentals".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# LAB 2.1, PL/SQL Programming Fundamentals

## Notas útiles del cápitulo

* **Comentarios con '--' o '/* */'**
* **PL/SQL is not case-sensitive.**
* Tipos de dato anclados. Sirvan para hacer referencia a un dato de las tablas. Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, p. 28): 
```
SET SERVEROUTPUT ON
DECLARE
v_name student.first_name%TYPE;
v_grade grade.numeric_grade%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE(NVL(v_name, 'No Name ')||' has grade of '||NVL(v_grade, 0));
END;
```

* Declaraciones. Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, p. 30):
```
DECLARE
v_cookies_amt NUMBER := 2;
v_calories_per_cookie CONSTANT NUMBER := 300;
```

## OPERADORES
Tabla de operadores cómunes.(ROSENZWEIG,B &  RAKHIMOV,E, p. 30)

* Arithmetic (** , * , / , + , –)
* Comparison (=, <>, !=, <, >, <=, >=, LIKE, IN, BETWEEN, IS NULL, IS NOT NULL, NOT IN)
* Logical (AND, OR, NOT)
* String (||, LIKE)
* Expressions
* Operator precedence
* ** , NOT
* . +, – (arithmetic identity and negation) *, /, +, –, || =, <>, !=, <=
* >=, <, >, LIKE, BETWEEN, IN, IS NULL
* AND (logical conjunction)
* OR (logical inclusion)
