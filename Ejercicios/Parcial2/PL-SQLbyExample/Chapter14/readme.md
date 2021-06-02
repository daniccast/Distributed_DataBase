Resumen cápitulo catorce.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 14. Compound triggers".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Compound Triggers

## Mutating table Issues

Una tabla que tiene una declaración DML emitida en su contra se llama tabla mutante (_mutating table_). Para un _trigger_, es la tabla en la que fue definido. Si un trigger trata de leer o modificar esa tabla, causa un error de tabla mutante (_mutating table error_). Esto aplica a _triggers_ de nivel fila.

Ejemplo de un _trigger_ que causa el error de tabla mutante (ROSENZWEIG &  RAKHIMOV, 2009, 292):

```
CREATE OR REPLACE TRIGGER section_biu
	BEFORE INSERT OR UPDATE ON section
	FOR EACH ROW
DECLARE
	v_total NUMBER;
	v_name VARCHAR2(30);
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM section -- SECTION is MUTATING
		WHERE instructor_id = :NEW. instructor_id;
-- check if the current instructor is overbooked
	IF v_total >= 10 THEN
		SELECT first_name||' '||last_name
			INTO v_name
			FROM instructor
			WHERE instructor_id = :NEW.instructor_id;
		RAISE_APPLICATION_ERROR
		(-20000, 'Instructor, '||v_name||', is overbooked');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR
			(-20001, 'This is not a valid instructor');
END;
```


**Para corregir estos errores se siguen los siguientes pasos:**
* Para registrar el ID del instructpr y su nombre hayq que usar dos variables globales con la ayuda de los paquetes PL/SQL.
* Se dbe modificar el trigger existente para registrar el ID de instructor y nombre, las consultas  a la tabla INSTRUCTOR.
* Se debe crear un nuevo trigger en la tabla SECTION. Este trigger debe ser un trigger a nivel sentencia que se dispara después del INSERT o UPDATE de la sentencia con problemas.




```
--Creación de las variables globales
CREATE OR REPLACE PACKAGE instructor_adm AS
	v_instructor_id 	instructor.instructor_id%TYPE;
	v_instructor_name 	varchar2(50);
END;

--Modificar el trigger

CREATE OR REPLACE TRIGGER section_biu
	BEFORE INSERT OR UPDATE ON section
	FOR EACH ROW
BEGIN
	IF :NEW. instructor_id IS NOT NULL THEN
		BEGIN
			instructor_adm.v_instructor_id := :NEW.INSTRUCTOR_ID;
			SELECT first_name||' '||last_name
			INTO instructor_adm.v_instructor_name
			FROM instructor
			WHERE instructor_id = instructor_adm.v_instructor_id;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RAISE_APPLICATION_ERROR
				(-20001, 'This is not a valid instructor');
	 	END;
	END IF;
END;

--Creación del nuevo trigger

CREATE OR REPLACE TRIGGER section_aiu
	AFTER INSERT OR UPDATE ON section
DECLARE
	v_total INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM section
		WHERE instructor_id = instructor_adm.v_instructor_id;
		
-- check if the current instructor is overbooked
	IF v_total >= 10 THEN
		RAISE_APPLICATION_ERROR
		(-20000, 'Instructor, '||instructor_adm.v_instructor_name|| ', is overbooked');
	END IF;
END;

```



## Compound Triggers

Se introducen en Oracle 11g.
Un trigger compuesto te permite combinar diferentes tipos de triggers en uno solo. Puedes combinar:
* Un trigger de sentencia que se dispara antes de una sentencia de disparo.
* Un trigger de sentencia que se dispara después de una sentencia de disparo.
* Un trigger de fila que  se dispara antes de cada sentencia que afecta a una fila.
* Un trigger de fila que  se dispara después de cada sentencia que afecta a una fila.

Estructura:

```
CREATE [OR REPLACE] TRIGGER trigger_name
	triggering_event ON table_name
	COMPOUND TRIGGER

--declaration statements

BEFORE STATEMENT IS
	BEGIN
	-- executable statements
	END BEFORE STATEMENT;
BEFORE EACH ROW IS
	BEGIN
	--executable statements
	END BEFORE EACH ROW;
AFTER EACH ROW IS
	BEGIN
	--executable statements
	END AFTER EACH ROW;
AFTER STATEMENT IS
	BEGIN
	executable statements
	END AFTER STATEMENT;
END trigger_name;
```

**Las secciones son opcionales.**

Restricciones:
* Se deben definir únicamente en una tabla o vista.
* Se limita a sentencias DML.
* No puede contener transacciones autónomas.
* Una excepcion que ocurre en una sección debe ser manejada por esa sección, no se propagan.
* :OLD y :NEW no pueden aparecer en BEFORE/AFTER STATEMENTS
* Si una sentencia DML falla, todos los valores se pierden.
* :NEW solo puede ser cambiada en BEFORE EACH ROW.

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 302):

```
CREATE OR REPLACE TRIGGER student_compound
	FOR INSERT ON STUDENT
	COMPOUND TRIGGER
-- Declaration section
	v_day VARCHAR2(10);
	v_date DATE;
	v_user VARCHAR2(30);
BEFORE STATEMENT IS
	BEGIN
		v_day := RTRIM(TO_CHAR(SYSDATE, 'DAY'));
		IF v_day LIKE ('S%') THEN
			RAISE_APPLICATION_ERROR
			(-20000, 'A table cannot be modified during off hours');
		END IF;
		v_date := SYSDATE;
		v_user := USER;
	END BEFORE STATEMENT;
BEFORE EACH ROW IS
	BEGIN
	:NEW.student_id 	:= STUDENT_ID_SEQ.NEXTVAL;
	:NEW.created_by 	:= v_user;
	:NEW.created_date  	:= v_date;
	:NEW.modified_by 	:= v_user;
	:NEW.modified_date 	:= v_date;
	END BEFORE EACH ROW;
END student_compound;
```

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 305):


```
CREATE OR REPLACE TRIGGER section_compound
	FOR INSERT OR UPDATE ON SECTION
	COMPOUND TRIGGER
-- Declaration Section
	v_instructor_id INSTRUCTOR.INSTRUCTOR_ID%TYPE;
	v_instructor_name VARCHAR2(50);
	v_total INTEGER;
BEFORE EACH ROW IS
	BEGIN
		IF :NEW. instructor_id IS NOT NULL THEN
			BEGIN
			v_instructor_id := :NEW. instructor_id;
			SELECT first_name||' '||last_name
				INTO instructor_adm.v_instructor_name
				FROM instructor
				WHERE instructor_id = instructor_adm.v_instructor_id;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					RAISE_APPLICATION_ERROR
						(-20001, 'This is not a valid instructor');
			END;
		END IF;
	END BEFORE EACH ROW;
AFTER STATEMENT IS
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM section
		WHERE instructor_id = v_instructor_id;
	-- check if the current instructor is overbooked
	IF v_total >= 10 THEN
		RAISE_APPLICATION_ERROR
		(-20000, 'Instructor, '||instructor_adm.v_instructor_name||
		', is overbooked');
	END IF;
	END AFTER STATEMENT;
END section_compound;

```






