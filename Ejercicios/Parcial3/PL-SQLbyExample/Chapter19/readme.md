Resumen cápitulo diez y nueve.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 19. Procedures".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Procedures.

El código modular es una forma de construir un programa a partir de distintas partes (módulos), cada una de las cuales realiza una función o tarea específica para lograr el objetivo final del programa.

### BENEFITS OF MODULAR CODE

Usar código modular ofrece dos beneficios principales: reusabilidad y manejabilidad.

### BLOCK STRUCTURE

La estructura de bloques es común para todos los tipos de módulos. El bloque comienza con un encabezado (solo para bloques con nombre), que consta del nombre del módulo y una lista de parámetros (si se usa).
La sección de declaración consta de variables, cursores y subbloques que se necesitan en la siguiente sección.
La parte principal del módulo es la sección ejecutable, que es donde se realizan todos los cálculos y procesamientos. Esta sección contiene código ejecutable como IF-THEN-ELSE, bucles, llamadas a otros módulos PL / SQL, etc.
La última sección del módulo es una sección de manejo de excepciones opcional, que es donde se coloca el código para manejar las excepciones.

### ANONYMOUS BLOCK

Como los que se escribieron en capítulos anteriores, no tienen header así que no tienen nombre.

## CreatingProcedures
Un procedimiento es un módulo que realiza una o más acciones; no necesita devolver ningún valor.

Sintaxis:
```
CREATE OR REPLACE PROCEDURE name
	[(parameter[, parameter, ...])]
AS
	[local declarations]
BEGIN
	executable statements
[EXCEPTION
	exception handlers]
END [name];
```

## Passing Parameters into and out of Procedures
Hay tres tipos de parámetros IN, OUT, IN OUT.
Tabla (ROSENZWEIG y RAKHIMOV, 2009, 445).
|MODE | DESCRIPTION | USAGE |
|-----|-------------|---------|
|IN |  Passes a value into the program. Constants, literals, expressions. Cannot be changed within the program’s default mode. | Read-only value|
|OUT | Passes a value back from the program. Cannot assign default values. Must be a variable. A value is assigned only if the program is successful | Write-only value|
|IN OUT |  Passes values in and also sends values back | Has to be a variable|


### MATCHING ACTUAL AND FORMAL PARAMETERS

Puede utilizar dos métodos para hacer coincidir los parámetros **reales(actual) y formales**: notación posicional y notación con nombre. La notación posicional es simplemente asociación por posición: el orden de los parámetros utilizados al ejecutar el procedimiento coincide con el orden en el encabezado del procedimiento. La notación con nombre es una asociación explícita usando el símbolo =>:
formal_parameter_name => argument_value











