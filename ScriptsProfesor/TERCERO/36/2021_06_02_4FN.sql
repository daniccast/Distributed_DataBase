spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\36\4fn.txt

/*

set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON
normalizazion de la cuarta forma normal 
de dependencias multivaluadas

DF   1      [modelo]  ->  Marca
  
DMV 1       [modelo]  -->>  motor 
DMV 2       [modelo]  -->>   COLOR
DMV 3       [modelo, COLOR ]  -->>   adornos |  toldo

DMV 3a      [modelo, COLOR ]  -->>   adornos 
DMV 3b      [modelo, COLOR]   -->>  toldo

*/


drop table AUTOS;
create table AUTOS(
	modelo varchar2(10),
	color  varchar2(10),
	motor  varchar2(10),
	adornos varchar2(10),
	toldo   varchar2(10),
	marca   varchar2(10));


INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','blue','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','blue','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','blue','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','blue','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F3.2L','red','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F3.2L','red','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F3.2L','black','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F3.2L','black','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F4.5L','red','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F4.5L','red','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F4.5L','black','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White','F4.5L','black','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','white','white	Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','yellow','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','yellow','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','yellow','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','yellow','white','Ford');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','white','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','white','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','black','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','black','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','white','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','white','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','black','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','black','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','white','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','white','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','brown','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','brown','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','white','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','white','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','brown','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','brown','white','Chrysler');


--           ----------------------------------------------------
rem desplegar de la relación universal
rem  los valores distintos de cada atributo
rem 
select distinct modelo from autos order by 1;
select distinct color from autos order by 1;
select distinct motor from autos order by 1;
select distinct adornos from autos order by 1;
select distinct toldo from autos order by 1;
select distinct marca from autos order by 1;

rem determinar el numero de tuplas de cada categoria
prompt modelo
select  modelo, count(*) total
	from autos
	group by modelo
    order by 1;
	
rem determinar el numero de tuplas de cada categoria
prompt color
select  color, count(*) total
	from autos
	group by color
    order by 1;
	
rem determinar el numero de tuplas de cada categoria
prompt motor
select  motor, count(*) total
	from autos
	group by motor
    order by 1;
	
rem determinar el numero de tuplas de cada categoria
prompt adornos
select  adornos, count(*) total
	from autos
	group by adornos
    order by 1;
	
	

rem determinar el numero de tuplas de cada categoria
prompt toldo
select toldo, count(*) total
	from autos
	group by toldo
    order by 1;
	
rem determinar el numero de tuplas de cada categoria
prompt marca
select  marca, count(*) total
	from autos
	group by marca 
    order by 1;
	
rem desplegar marcas y modelo
rem en la relacion universal de atributos
rem sin normalizar
rem  despleguemos marca y modelo 
rem   sin agrupar  por esos atributos

select marca,modelo 
	from autos 
	order by 1;
	
rem despleguemos por marca modelo
rem agrupandolos y contandolos
	
select marca,modelo, count(*) total
	from autos 
	group by marca, modelo
	order by 1;	
	
rem despleguemos por marca modelo, color 
rem agrupandolos por marca modelo color 	
select marca,modelo,color, count(*) total
	from autos 
	group by marca, modelo, color
	order by 1;

rem despleguemos por marca modelo, color, adornos 
rem agrupandolos por marca modelo, color, adornos	
select marca,modelo,color, adornos, count(*) total
	from autos 
	group by marca, modelo, color,adornos 
	order by 1,2,3;

rem despleguemos por marca modelo, color, adornos, toldo 
rem agrupandolos por marca modelo, color, adornos, toldo 	
select marca,modelo,color,adornos, toldo, count(*) total
	from autos 
	group by marca, modelo, color, adornos, toldo
	order by 1,2,3,4;
	
rem ahora eliminando atributos a desplegar
rem sin eliminarlos de la clausula group by 
rem observemos con cuidado !!!!!!!!

rem tengan cuidado con la interpretación de los resultados
select marca,modelo,color,adornos,  count(*) total
	from autos 
	group by marca, modelo, color, adornos, toldo
	order by 1,2,3,4;
	
rem desplegando solo tres atributos pero agrupandolos por 5
rem tengan cuidado con la interpretación de los resultados
select marca,modelo,color,  count(*) total
	from autos 
	group by marca, modelo, color, adornos, toldo
	order by 1,2,3;

rem desplegando solo dos atributos pero agrupandolos por 5	
rem tengan cuidado con la interpretación de los resultados

select marca,modelo,  count(*) total
	from autos 
	group by marca, modelo, color, adornos, toldo
	order by 1,2,3;	
	
rem desplegando solo un atributo pero agrupandolos por 5	
rem tengan cuidado con la interpretación de los resultados

select marca,  count(*) total
	from autos 
	group by marca, modelo, color, adornos, toldo
	order by 1;		
	
	
------
rem ahora utilizamos las dependencias funcionales
rem con  la extracción de las tuplas de la relación universal
rem    DF:1      [modelo]  ->  Marca

drop  table modelo_marca;
create table modelo_marca as
select distinct modelo,marca from autos order by 1,2;

select * from modelo_marca;
--- ---
rem    DMV 1:       [modeo]  -->>  motor 
drop table modelo_motor; 
create table modelo_motor as 
select distinct modelo, motor from autos   ORDER BY 1,2;

select * from modelo_motor;
----
---------------

rem    DMV 2:       [modelo]  -->>   COLOR 
drop table modelo_color;
create table modelo_color as
select distinct modelo, color from autos order by 1,2;

select * from modelo_color;

----
-----------------

rem    DMV 3:       [modelo, COLOR ]  -->>   adornos |  toldo
drop  table modelo_color_adornos_toldo;
create  table modelo_color_adornos_toldo as
select distinct modelo, color, adornos,toldo from autos ORDER BY 1,2,3;

SELECT * FROM modelo_color_adornos_toldo order by 1,2,3,4;

rem    DMV 3a:      [modelo, COLOR ]  -->>   adornos 

drop  table modelo_color_adornos;
create table modelo_color_adornos as 
select distinct modelo, color, adornos from autos ORDER BY 1,2,3;

select * from modelo_color_adornos;

-----  ----------------

rem     DMV 3b:      [modelo, COLOR]   -->>  toldo

drop  table modelo_color_toldo;
create table modelo_color_toldo as
select distinct modelo,color,toldo  from autos order by 1,2,3;

select * from modelo_color_toldo;
--- ------------------------------

rem resumen dependencias funcionales 
rem rem    DMV 1       [modeo]  -->>  motor 
select count (*) from modelo_motor;

--
rem DMV 2       [modelo]  -->>   COLOR 
select * from modelo_color;
--
DMV 3a      [modelo, COLOR ]  -->>   adornos
select count (*) from modelo_color_adornos;
--
DMV 3b      [modelo, COLOR]   -->>  toldo
select count (*) from modelo_color_adornos;

rem ahora querys que intervengan las dependencias funcionales
REM    ----------------------------
rem desplegar adornos de vehiculos tenemos de 
rem acuerdo a la marca, modelo y color
REM ---------------
REM GEBERA TUPLAS ESPUREAS AL NO INCLUIR EL PREDICADO
REM 
REM 
select marca, mm.modelo, color, adornos
	from modelo_marca mm, modelo_color_adornos mca
	order by 1,2,3,4;
REM --------------------------

REM DEBEMOS INCLUIR UNA CONDICION DE IGUALDAD
REM DEL ATRIBUTO COMUN EN AMBAS ENTIDADES	
select marca, mm.modelo, color, adornos
	from modelo_marca mm, modelo_color_adornos mca
	where mm.modelo = mca.modelo
	order by 1,2,3,4;
REM COMPARANDOLO CON LA RELACIÓN UNIVERSAL  DE ESTE EJEMPLO
rem ahora con la relación universal
select DISTINCT marca, modelo, color, adornos
		FROM AUTOS
		ORDER BY 1,2,3,4;
----
REM DESPLEGAR QUE MODELOS DE VEHICULOS TENEMOS 
REM DE ACUERDO A LA MARCA Y EL MOTOR
select marca, MMA.modelo, MOTOR
	FROM MODELO_MARCA MMA, MODELO_MOTOR MMO
	WHERE MMA.MODELO = MMO.MODELO;
----
REM COMPARANDOLO CON LA RELACIÓN UNIVERSAL  DE ESTE EJEMPLO
select DISTINCT marca, modelo, MOTOR
		FROM AUTOS
		ORDER BY 1,2,3;
-----
---
REM
rem desplegar TOLDOS de vehiculos tenemos de 
rem acuerdo a la marca, modelo y color
select marca, mm.modelo, color, toldo
	from modelo_marca mm, modelo_color_TOLDO mct
	where mm.modelo = mct.modelo
	order by 1,2,3,4;
	
----
REM COMPARANDOLO CON LA RELACIÓN UNIVERSAL  DE ESTE EJEMPLO
rem ahora con la relación universal
select DISTINCT marca, modelo, color, toldo
		FROM AUTOS
		ORDER BY 1,2,3,4; 
	

select count (*) from modelo_marca;
select count (*) from modelo_color;
select count (*) from modelo_color_adornos;
select count (*) from modelo_color_toldo;
select count (*) from modelo_motor;

spool off 
