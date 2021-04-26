Resumen cápitulo nueve.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 9. Exceptions".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Exceptions

## Exception Scope

"El alcance de una excepción es la porción del bloque que es cubierta por esa misma excepción."

Si tu defines una excepción en un bloque, esta es local para ese bloque. Pero, es global para cualquir bloque dentro del mismo (bloques anidados). **Cualquier exceción definida en un outer block se convierte global para los inner block.**

##User-Defined Exceptions

Algunas veces necesitamos usar excepciones especificas para nuestros programas, por lo que habrá que declararlas:

```
DECLARE
exception_name EXCEPTION;
```

Se declaran como las variables, y las sentencias ejecutables asociadas con la excepción se ponen en el bloque de majeo de excepciones. 

```
DECLARE
	exception_name EXCEPTION;
BEGIN
	...
	IF CONDITION THEN
		RAISE exception_name;
	ELSE
		...
	END IF;
EXCEPTION
	WHEN exception_name THEN
		ERROR-PROCESSING STATEMENTS;
	END;
```
## Exception Propagation

Un error en tiempo de ejecución ambién puede ocurrir en la sección de declaración o en la de manejo de errores. 

* Cuando un error en tiempo de ejecución sucede en la sección de declaración del bloque PL/SQL, la sección de manejo de errores no _atrapa_ el error.
* Cuando un error en tiempo de ejecución sucede en la sección de declaración del inner block, la excepción inmediatamente se propaga al outer block.
* Cuando un error en tiempo de ejecución sucede en la sección de manejo de errores en un bloque PL/SQL, esta sección no puede prevenir este error.
* Cuando un error en tiempo de ejecución sucede en la sección de manejo de errores del inner block, la excepción inmediatamente se propaga al outer block.

No se pueden alzar dos o más excepciones simultáneamente.

### Reraising an exception

Lo llamamos así cuando queremos manejar una excepción en un inner block y después pasarla al outer block.

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 201): 

```
-- outer block
DECLARE
	e_exception EXCEPTION;
BEGIN
	-- inner block
	BEGIN
		RAISE e_exception;
		EXCEPTION
			WHEN e_exception THEN
		RAISE;
	END;
EXCEPTION
	WHEN e_exception THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
```












