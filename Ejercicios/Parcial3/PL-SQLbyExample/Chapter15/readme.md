Resumen cápitulo quince.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 15. Collections".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Collections

Una colección es un grupo de elementos del mismo tipo de datos. Cada elemento está identificado por un subíndice único que representa su posición en la colección.

## PL/SQLTables

Una tabla PL / SQL es similar a una tabla de base de datos de una columna. Las filas de una tabla PL / SQL no se almacenan en ningún orden predefinido, sin embargo, cuando se recuperan en una variable, a cada fila se le asigna un subíndice consecutivo a partir de 1.


###  ASSOCIATIVE ARRAYS


Sintaxis:

```
TYPE type_name IS TABLE OF element_type [NOT NULL]
	INDEX BY element_type;

table_name TYPE_NAME;
```

Ejemplo (ROSENZWEIG y RAKHIMOV, 2009, 317):
```
DECLARE
	TYPE last_name_type IS TABLE OF student.last_name%TYPE
	INDEX BY BINARY_INTEGER;
last_name_tab last_name_type;
```

### NESTED TABLES

Sintaxis:

```
TYPE type_name IS TABLE OF element_type [NOT NULL];
table_name TYPE_NAME;
```

Estas deben ser inicializdas antes de que sus elementos puedan ser referenciados.
Deben ser **inicializadas** con un constructor.

Ejemplo (ROSENZWEIG y RAKHIMOV, 2009, 321):
```
DECLARE
	CURSOR name_cur IS
		SELECT last_name
		FROM student
		WHERE rownum <= 10;
	TYPE last_name_type IS TABLE OF student.last_name%TYPE;
	last_name_tab last_name_type := last_name_type();
	v_counter INTEGER := 0;
BEGIN
	FOR name_rec IN name_cur LOOP
		v_counter := v_counter + 1;
		last_name_tab.EXTEND;
		last_name_tab(v_counter) := name_rec.last_name;
		DBMS_OUTPUT.PUT_LINE ('last_name('||v_counter||'): '||
		last_name_tab(v_counter));
	END LOOP;
END;

```
Usaar := significa que está vacía pero no es NULL.
EXTEND sirvve para incrementar el tamaño de la colección.


### COLLECTION METHODS

Sintaxis
```
collection_name.method_name
```


* **EXISTS**. Devuelve TRUE si un elemento específico existe en la colección. Spuede usar para evitar las excepciones SUBSCRIPT\_OUTSIDE_LIMIT.
* **COUNT**. Devuelve el número total de elementos en la colección.
* **EXTEND**. Incrementa el tamaño de la colección.
* **DELETE**. Borra todos los elementos, un rango de elementos o un solo elemento. 
* **FIRS and LAST**. Devuelve subíndices del primer y último elemento de una colección.
* **PRIOR and NEXT**. Devuelve subíndices que preceden y suceden a un subíndice de colección específico.
* **TRIM**. Elimina uno o un número específico de elementos del final de una colección.




## Varrays

Similar a las tablas PL/SQL. Tiene un tamaño máximo.

Sintaxis
```
TYPE type_name IS {VARRAY | VARYING ARRAY} (size_limit) OF
	element_type [NOT NULL];
varray_name TYPE_NAME;
```
Tienen que ser **inicializados**.
Podemos usar los métodos en los varrays. Y se agrega LIMIT. Pero, nos se puede usar 


## Multilevel Collections

A partir de Oracle 9i, PL / SQL le permite crear colecciones cuyo tipo de elemento se basa en un tipo de colección. Estas colecciones se denominan colecciones multinivel.

Practicámente es un varray de varrays.

Sintaxis:
```
varray_name(subscript of the outer varray)(subscript of the inner
varray)

```










