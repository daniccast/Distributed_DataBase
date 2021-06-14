Resumen cápitulo veintiuno.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 21. Packages".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Packages
Un paquete es una colección de objetos PL / SQL agrupados bajo un nombre de paquete. Los paquetes incluyen procedimientos, funciones, cursores, declaraciones, tipos y variables.

## The Benefits of Using Packages

El uso de paquetes como método para agrupar sus funciones y procedimientos ofrece numerosos beneficios. La primera es que un paquete bien diseñado es una agrupación lógica de objetos como funciones, procedimientos, variables globales y cursores. Por lo tanto, los paquetes se utilizan a menudo en aplicaciones que utilizan procedimientos y funciones repetidamente.
Los paquetes le permiten incorporar algunos de los conceptos involucrados en la programación orientada a objetos.

Usar paquetes ofrece un nivel adicional de seguridad.

### THE PACKAGE SPECIFICATION
La especificación del paquete contiene información sobre el contenido del paquete, pero no el código de los procedimientos y funciones. También contiene declaraciones de variables públicas / globales.

Todos los objetos colocados en la especificación del paquete se denominan objetos públicos. Cualquier función o procedimiento que no esté en la especificación del paquete pero que esté codificado en el cuerpo de un paquete se denomina función privada.
ción o procedimiento.

Sintaxis:

```
PACKAGE package_name
IS
[declarations of variables and types]
[specifications of cursors]
[specifications of modules]
END [package_name];

```
### THE PACKAGE BODY
El cuerpo del paquete contiene el código ejecutable real para los objetos descritos (y también los que no) en la especificación del paquete.

Sintaxis:

```
PACKAGE BODY package_name
IS
	[declarations of variables and types]
	[specification and SELECT statement of cursors]
	[specification and body of modules]
	[BEGIN
	executable statements]
	[EXCEPTION
	exception handlers]
END [package_name];
```

### RULES FOR THE PACKAGE BODY

Debe seguir varias reglas en el código del cuerpo del paquete:

* Debe haber una coincidencia exacta entre los encabezados del cursor y del módulo y sus definiciones en la especificación del paquete.
* No repita en el cuerpo la declaración de variables, excepciones, tipos o constantes de la especificación.
* Se puede hacer referencia a cualquier elemento declarado en la especificación en el cuerpo.


### REFERENCING PACKAGE ELEMENTS

Sintaxis:
```
package_name.element
```


## Cursor Variables

Una variable de cursor es solo una referencia o un identificador de un cursor estático. Permite a un programador pasar esta referencia al mismo cursor entre todas las unidades del programa que necesitan acceso al cursor.







