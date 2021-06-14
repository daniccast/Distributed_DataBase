Resumen cápitulo veinte.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 20. Functions".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Functions


La diferencia entre una función y procedimiento que es la función es que reorna un valor siempre. Pueden aceptar o no parámetros, pero siempre deven devolver algo.

Sintaxis:

```
CREATE [OR REPLACE] FUNCTION function_name
	(parameter list)
RETURN datatype
IS
BEGIN
	<body>
	RETURN (return_value);
END;

```



