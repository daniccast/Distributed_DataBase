Resumen cápitulo once.
Información recuperada de ROSENZWEIG,B &  RAKHIMOV,E (2009)."Chapter 13. Triggers".Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. 

# Triggers

##What triggers are? 
Es un bloque PL/SQL nombrado que está almacenado en la base de datos y se ejecuta implícitamente cuando un *triggering event* pasa. Ejecutar un trigger se dice *firing a trigger* o disparar un _trigger_, en español. Puede ser algo de lo siguiente:
* Una declaración DML, como INSERT, UPDATE, DELETE; ejecuada sobre una tabla de la basa de datos. El trigger se puede disparar antes o después del evento. 
* Una declaración DDL, como CREATE o ALTER, ejecutada por usuario en particular sobre un esquema. 
* Un evento del sistema, como el inicio o apagado de la base de datos.
* Un evento de usuario, como iniciar o cerrar sesión.

Sintaxis:
```
CREATE [OR REPLACE] TRIGGER Ttrigger_name
{BEFORE|AFTER} Triggering_event ON table_name
[FOR EACH ROW]
[FOLLOWS another_trigger]
[ENABLE/DISABLE]
[WHEN condition]
DECLARE
	declaration statements
BEGIN
	executable statements
EXCEPTION
	exception-handling statements
END;
```
FOR EACH ROW especifica que es un _row trigger_ y se dispara por cada fila que sea insertada, acutalizada o eliminada.
WHEN especifica una condición para que el _trigger_ sea disparado.
ENABLE/DISABLE marcan el estado del _trigger_, por default su estado es ENABLE, sin embargo, se puede cambiar de la siguiente manera:
```
ALTER TRIGGER trigger_name DISABLE;
```

Los _triggers_ se usan con diferentes propósitos:
* Aplicar reglas de negocio complejas que no pueden ser deefinidas con restricciones de integridad.
* Mantener reglas de seguridad complejas.
* Recolectar información estadísitica en la tabla de acceso.
* Prevenir transacciones inválidas.


Restricciones:
* Un trigger no puede hacer COMMIT, SAVEPOINT o ROLLBACK.
* Cualquier función o procedimiento que llame a un trigger no puede realizar declaraciones de control transaccional.
* No se permite declarar variables LONG o LONG RAW en el cuerpo del trigger.

#### BEFORE TRIGGERS
Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 267):
```
CREATE OR REPLACE TRIGGER student_bi
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
	:NEW.student_id
	:= STUDENT_ID_SEQ.NEXTVAL;
	:NEW.created_by
	:= USER;
	:NEW.created_date := SYSDATE;
	:NEW.modified_by
	:= USER;
	:NEW.modified_date := SYSDATE;
END;
```

:NEW permite acceder a una fila que está siendo procesada.

Se deben usar en las siguientes situaciones:
* Cuando el trigger te puede dar el valor de una columna antes de insertar o actualizar.
* Cando puedes validar algo mediante el trigger.

#### AFTER TRIGGERS

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 269):
```
CREATE OR REPLACE TRIGGER instructor_aud
AFTER UPDATE OR DELETE ON INSTRUCTOR
DECLARE
	v_type VARCHAR2(10);
BEGIN
	IF UPDATING THEN
		v_type := 'UPDATE';
	ELSIF DELETING THEN
		v_type := 'DELETE';
	END IF;
	UPDATE statistics
	SET transaction_user = USER,
		transaction_date= SYSDATE
	WHERE table_name = 'INSTRUCTOR'
	AND transaction_name = v_type;

	IF SQL%NOTFOUND THEN
		INSERT INTO statistics
		VALUES ('INSTRUCTOR', v_type, USER, SYSDATE);
	END IF;
END;
```
Se deben usar en las siguientes situaciones:
* Caundo un _trigger_ se debe disparar despues de una declaración DML.
* Cuando un _trigger_ hace acciones no específicadas en un _BEFORE trigger_.

### AUTONOMOUS TRANSACTION

Una transacción autónoma es una transacción independiente comenzada por otra transacción que usaulmente llamada por una transacción main.

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 271):
```
CREATE OR REPLACE TRIGGER instructor_aud
AFTER UPDATE OR DELETE ON INSTRUCTOR
DECLARE
	v_type VARCHAR2(10);
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	IF UPDATING THEN
		v_type := 'UPDATE';
	ELSIF DELETING THEN
		v_type := 'DELETE';
	END IF;
	UPDATE statistics
	SET transaction_user = USER,
		transaction_date= SYSDATE
	WHERE table_name = 'INSTRUCTOR'
	AND transaction_name = v_type;

	IF SQL%NOTFOUND THEN
		INSERT INTO statistics
		VALUES ('INSTRUCTOR', v_type, USER, SYSDATE);
	END IF;
	COMMIT;
END;	
```
## Types of triggers


Un **row trigger** es aquel que se dispara cada que las filas son afectadas por alguna declaración. Para eso se utiliza _FOR EACH ROW_. Imaginemos que actualizamos 20 filas en una sola vez, este trigger se ejecuta 20 veces.

Un **statement trigger** se ejecuta una vez, cuando el trigger se dispara. Si actualizamos 20 filas, este solo se disparará una vez.


### Instead of triggers
PL/SQL nos permite usar otro tipo de triggers, definidos en las vistas de la base de datos.

Privilegios de vistas: 
```
GRANT CREATE VIEW TO student;
```

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 280):
```
CREATE VIEW instructor_summary_view AS
	SELECT i.instructor_id, COUNT(s.section_id) total_courses
		FROM instructor i
		LEFT OUTER JOIN section s
			ON (i.instructor_id = s.instructor_id)
		GROUP BY i.instructor_id;
```

Hay un tipo de trigger llamado **Instead of trigger**,este se dispara  en lugar de una declarión de trigger con sentencias DML, que han sido hechas en una vista.

Ejemplo (ROSENZWEIG &  RAKHIMOV, 2009, 280):
```
	DELETE FROM instructor_summary_view
		WHERE instructor_id = 109;-- error
		
	CREATE OR REPLACE TRIGGER instructor_summary_del
		INSTEAD OF DELETE ON instructor_summary_view
		FOR EACH ROW
	BEGIN
		DELETE FROM section
			WHERE instructor_id = :OLD.INSTRUCTOR_ID;
		DELETE FROM instructor
			WHERE instructor_id = :OLD.INSTRUCTOR_ID;
	END;
```

Recordar tablas hijas.







 



