Resumen cápitulo ocho.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 8. Error Handling and Built-in Exceptions".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Error Handling and Built-in Exceptions

La sección de manejo de errores permite a los programadores especificar que acciones se deben tomar cuando un excepción específica ocurra. 

PL/SQL tiene dos tipos de excepciones: **built-in y user-defined**.

## Handling Errors

Pra manejar los erores en tiempo de ejecución, o *runtime errors*, debemos agregar un manejador de expeciones. Este tiene la siguiente estructura:

```
EXCEPTION
	WHEN EXCEPTION_NAME THEN
		ERROR-PROCESSING STATEMENTS;
```

Esta sección se coloca después de la sección de bloque de código. 

Ejemplo (ROSENZWEIG y RAKHIMOV, 2009, 166):
```
DECLARE
	v_num1 INTEGER := &sv_num1;
	v_num2 INTEGER := &sv_num2;
	v_result NUMBER;
BEGIN
	v_result := v_num1 / v_num2;
	DBMS_OUTPUT.PUT_LINE ('v_result: '||v_result);
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE ('A number cannot be divided by zero.');
END;
```

Con esto logramas tener una salida más limpia e informativa.

## Built-in Exceptions

Es importante recalcar que después de que la sección de manejo de errores termina, el bloque lo hace, no regresará a la sección de ejecución.


Tabla de algunas excepciones predefinidas.

Excepción      |  Descripción
---------------|--------------------------
NO\_DATA\_FOUND| Esta excepción se genera cuando algún select que usemoss en alguna función devulva 0 filas. Claramente su usamos una función de grupo como SUM O COUNT no se levanta esta excepción, pues estás devolverían 0;
TOO\_MANY\_ROWS| Esta excepción se genera cuando algún select  devuelva más de una fila, para funciones que solo necesiten una. 
ZERO_DIVIDE    | Esta excepción se genera cuando en una división el divisor es 0;
LOGIN_DENIED   |  Esta excepción se genera cuando un usuario trata de ingresar a Oracle con un usuario o contraseña inválidos.
PROGRAM_ERROR  | Esta excepción se genera cuando un programa PL/SQL tiene un problema interno.
VALUE_ERROR    |Esta excepción se genera cuando se produce un error de conversión o de discrepancia de tamaño. 
DUP\_VALUE\_ON\_INDEX | Esta excepción se genera cuando un programa trata de almacenar un valor duplicado en una columna que solo tiene valores únicos.


Ejemplo de uso de más de una excepción (ROSENZWEIG y RAKHIMOV, 2009, 171):

```
DECLARE
	v_student_id NUMBER := &sv_student_id;
	v_enrolled VARCHAR2(3) := 'NO';
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if the student is enrolled');
	SELECT 'YES'
		INTO v_enrolled
		FROM enrollment
		WHERE student_id = v_student_id;
	DBMS_OUTPUT.PUT_LINE ('The student is enrolled into one course');
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('The student is not enrolled');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('The student is enrolled in too many courses');
END;
```

**No siempre podremos saber que excepción será generada, para eso se usa OTHERS.**

Ejemplo de uso de más de una excepción (ROSENZWEIG y RAKHIMOV, 2009, 173):

```
DECLARE
	v_instructor_id NUMBER := &sv_instructor_id;
	v_instructor_name VARCHAR2(50);
BEGIN
	SELECT first_name||' '||last_name
		INTO v_instructor_name
		FROM instructor
		WHERE instructor_id = v_instructor_id;
	DBMS_OUTPUT.PUT_LINE ('Instructor name is '||v_instructor_name);
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
```



