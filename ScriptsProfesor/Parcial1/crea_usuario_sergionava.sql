create user sergionava identified by sergionava
default tablespace users
temporary tablespace temp;


GRANT CONNECT, RESOURCE TO sergionava;

rem para eliminar el usuario y sus objetos
-- drop user sergionava  cascade;

-- DROP USER sergionava CASCADE; 