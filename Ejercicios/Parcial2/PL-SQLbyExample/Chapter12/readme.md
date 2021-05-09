Resumen cápitulo doce.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 12. Advanced Cursors".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Advanced Cursors

## Using Parameters with Cursors and Complex Nested Cursors

### Cursors with parameters

Podemos declarar cursores con parámetros. De esta manera nuestro cursor podrá generar un resultado específico pero rehusable. 

Ejemplo (ROSENZWEIG & RAKHIMOV, 2009, 254):
```
CURSOR c_zip (p_state IN zipcode.state%TYPE) IS
	SELECT zip, city, state
	FROM zipcode
	WHERE state = p_state;
```

Considerar:

* Los parámetros hacen el cursor más rehusable.
* A los parámetros se les pueden asignar valores por default. 
* El alcance del parámetro es local al cursor.
* El modo de los parámetros es solo IN.

La llamada es así:
```
OPEN c_zip (parameter_value)
o para LOOP:

FOR r_zip IN c_zip('NY')
LOOP ...
```

##  FOR UPDATE and WHERE CURRENT Cursors

El FOR UPDATE se usa solo cuando quieres actualizar las tablas de una base de datos. Usualmente se utiliza para bloquear las filas de la tabla que queremos actualizar, de esta manera otro usuario no puede hacer ningun cambio hasa que las liberemos.

Síntaxis:
```
FOR UPDATE OF <item_name>
```

Usamos **WHERE CURRENT OF** cuando queremos actualizar la fila recuperada más recientemente.












