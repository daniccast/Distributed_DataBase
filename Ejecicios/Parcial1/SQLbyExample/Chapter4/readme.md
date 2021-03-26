Resumen cápitulo cuatro.
Información recuperada de Rischert,A (2004)."Chapter 4. Date and Conversion Functions". Ramagnano,L, Oracle® SQLby Example(164-221). Pearson. 


# Lab 4.1 Appling Oracle's DATE Format Models

## Changing The DATE Display Format

Formato default para imprimir fechas: **DD-MON-YY**
Para cambiarlo usamos ```TO_CHAR``` junto con el formato.
Ejemplo (Rischert, p. 224):
``` 
SELECT last_name, registration_date,
TO_CHAR(registration_date, 'MM/DD/YYYY'),
TO_CHAR(registration_date, 'Dy') AS "1.Day",
TO_CHAR(registration_date, 'Month DD, YYYY')
AS "Formatted"
FROM student
WHERE student_id IN (123, 161, 190);
```
De igual manera, si queremos pasar fecha a char, usamos ```TO_DATE```
(Rischert, p. 228)
```
SELECT last_name, registration_date
FROM student
WHERE registration_date = TO_DATE('22-JAN-2003', 'DD-MON-YYYY')
```
**Oracle a veces hace la conversion automática**
```
TO_CHAR(date[,format_mask])\n
TO_DATE(char[,format_mask])
```
	
### Tabla de datos comunes de fecha
(Rischert, p. 225)
Format | Description
-------|--------------------
YYYY |	Four-digit year.
YEAR |Year spelled out.
MM |Two-digit month.
MON |Three-letter abbreviation of the month in capital letters.
MONTH| Month spelled out in capital letters and padded with blanks.
Month |Month spelled with first letter in caps and padded with blanks to a length of nine characters.
DD| Numeric day (1–31).
DAY |Day of the week in capital letters and padded with blanks to a length of nine characters.
DY |Three-letter abbreviation of the day of the week in caps.
D |Day of the week number (1–7). Sunday is day 1, Monday is day 2, and so forth.
DDD |Day of the year (1–366).
DL |Day long format; equivalent to 'fmDay, Month DD, YYYY'.
HH |or
HH12 |Hours (0–12).
HH24 |Hours in military format (0–23).
MI |Minutes (0–59).
SS |Seconds (0–59).
SSSSS |Seconds past midnight (0–86399).
AM or PM |Meridian indicator.
TS| Short time format; the equivalent format mask is 'HH:MI:SS AM'.
WW |Week of the year (1–53).
W| Week of the month (1–5).
Q |Quarter of the year.



**Para cambiar el formato de la sesión tenemos que cambiar el atributo NLS_DATE_FORMAT**


Si el formato en el query es DD-MON-RR (century), los números del 50 al 99 se toma del siglo pasado y del 0 al 49 de este.\n
Ejemplo (Rischert, p. 230)
```
SELECT TO_CHAR(TO_DATE('17-OCT-67','DD-MON-RR'),'YYYY') "1900",
TO_CHAR(TO_DATE('17-OCT-17','DD-MON-RR'),'YYYY') "2000"
FROM dual;
```

**Cuando no se ingresan horas, Oracle asume que son las 00:00**

La funcion *TRUNC* sirve también con fechas, y eso hace que no importe la hora se redondea al día. 


## The ANSI DATE and ANSI TIMESTAMP, Formats
Se puede especificar la fecha en el formato ANSI: Ejemplo:
```
WHERE enroll_date >= DATE '2003-02-07'
AND enroll_date < TIMESTAMP '2003-02-08 00:00:00'
```
Date, solo para fecha, y timestamp para la hora también. 


# Lab 4.2 Performing Date And Time Math

## SYSDATE
La función **SYSDATE**devuelve la fecha y hora del sistema operativo actual. Ejemplo.  (Rischert, p. 243)
```
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI')
FROM dual;
```

Para hacer operaciones con fechas se tiene que convertir todo a formato DATE 'DD-MON-YYYY'. Ejemplo  (Rischert, p. 243)
```
SELECT TO_DATE('01-JAN-2005','DD-MON-YYYY')-TRUNC(SYSDATE) int,
TO_DATE('01-JAN-2005','DD-MON-YYYY')-SYSDATE dec,
TO_CHAR(SYSDATE+3/24, 'MM/DD HH24:MI:SS') AS now_plus_3hrs,
FROM dual
```

## EXTRACT Function
Extraes ÚNICAMENTE día, mes o año de una fecha.
Ejemplo. (Rischert, p. 245)
```
SELECT TO_CHAR(start_date_time, 'DD-MON-YYYY') "Start Date",
EXTRACT(MONTH FROM start_date_time) "Month",
EXTRACT(YEAR FROM start_date_time) "Year",
EXTRACT(DAY FROM start_date_time) "Day"
FROM section
WHERE EXTRACT(MONTH FROM start_date_time) = 4
ORDER BY start_date_time
```

## Commonly Used Oracle Datetime-Related Calculation Functions
(Rischert, p. 246)


Function |Purpose |Return Datatype
---------|-------------|-----
ADD_MONTHS(date, integer) |Adds or subtracts number of months from a certaindate. |DATE
MONTHS_BETWEEN (date2, date1) |Determines the number of months between two dates. |NUMBER
LAST_DAY(date) |Returns the last date of the month. |DATE
NEXT_DAY(date,day_of_the_week)| Returns the first day of the week that is later than the date parameter passed.| DATE
TRUNC(date)| Ignores the hours, minutes, and seconds on DATE datatype. |DATE
ROUND(date [,format_mask])| Rounds to various DATE components depending on the optional supplied format mask.| DATE
NEW_TIME(date,current_time_zone,new_time_zone)| Returns the date and time in another time zone; for example, EST (Eastern Standard Time), PST (Pacific Standard Time), PDT (Pacific Daylight Time). |DATE

# Lab 4.3 Understanding TIMESTAMP and TIME, ZONE DATATYPES
	
## The TIMESTAMP Datatype
	
Permite almacenar fracciones de segundo con una precisión de 9, la default es 6. Ejemplo: '14-MAR-02 08.29.01.000123 AM'. FORMATO **'DD-MON-RRHH.MI.SS.FFN AM'** donde N es la precisión.

## The TIMESTAMP WITH TIME ZONE Datatype
Toma en cuenta la zona del sistema donde estas. UTC -> según el meridiano.  Formato: *DD-MON-RR HH.MI.SS.FF AM TZH:TZM'* 
```
SELECT DBTIMEZONE
FROM dual
```
## The TIMESTAMP WITH LOCAL TIME ZONE Datatype
Almacena la fecha y hora de la base de datos de la zona local.

	
## Session and Server Datetime Functions
(Rischert, p. 255)	
	
Function |Purpose |Return Datatype
---------|--------|---------------
CURRENT_DATE |Returns the date and time of the local session time zone in DATE datatype. (The local session time can be different than the server's date and time, if the client session is in a different time zone.) |DATE
CURRENT_TIMESTAMP[(optional_precision)]| Returns the individual's session date and time in the datatype TIMESTAMP WITH TIME ZONE value.| TIMESTAMP WITH TIME ZONE
DBTIMEZONE |Returns the time zone offset value of the database server time zone or time zone region name, depending on the setup of the database. | VARCHAR2 
LOCALTIMESTAMP[(optional_precision)] | Returns in the TIMESTAMP format the current date and time in the local session time.| TIMESTAMP
SESSIONTIMEZONE| Returns the time zone offset value of the session time zone or the time zone region name, depending on the setup of the database.	|VARCHAR2
SYSDATE | Returns the database server operating system current date and time. | DATE
SYSTIMESTAMP |Returns date, time, and six-digit fractional seconds and time zone of the server . This is similar to the SYSDATE function, but includes the fractional seconds and time zone.| TIMESTAMP	
	
## Changing The Local Time Zone

Se puede cambiar la Time Zone de la sesion con:
```
ALTER SESSION SET TIME_ZONE = 'America/New_York'
ALTER SESSION SET TIME_ZONE = dbtimezone
ALTER SESSION SET TIME_ZONE = local
```
## Extract Functions
(Rischert, p. 259)	

Function | Purpose | Return Datatype
---------|---------|----------------------
EXTRACT(YEAR FROM date) |Extracts year from a DATE datatype.Valid keyword choices are YEAR,MONTH, and DAY to extract the year,month, and day, respectively.| NUMBER
EXTRACT(YEAR FROM timestamp)| Extracts year from a TIMESTAMP datatype. Valid keyword choices are YEAR, MONTH, DAY, HOUR, MINUTE, SECOND to extract the year, month, day, hour, minute, and seconds including fractional seconds, respectively.| NUMBER
EXTRACT(YEAR FROM timestamp\_with\_time\_zone)|Valid keywords are YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, TIMEZONE\_HOUR, TIMEZONE\_MINUTE, TIMEZONE\_REGION, TIMEZONE\_ABBR. The values are returned in UTC.| NUMBER for TIME-ZONE\_REGION (If TIMEZONE\_ABBR is passed, the EXTRACT function returns VARCHAR2)
SYS_EXTRACT_UTC(timestamp_with_time zone) | Returns the date and time in UTC. | TIMESTAMP WITH TIME ZONE 
TZ_OFFSET(time_zone) | Returns the time difference between UTC and passed time zone value. | VARCHAR2	


## Conversiones
(Rischert, p. 262)

```
TO_TIMESTAMP(char[,format_mask])
TO_TIMESTAMP_TZ(char[,format_mask])
TO_DATE(char[,format_mask])
TO_CHAR(date[,format_mask])
FROM_TZ(timestamp,hour_min_offset)
```
# Lab 4.4 Performing Calculations With The Interval Datatypes


## Tabla de intervalos
(Rischert, p. 275)
Datatype | Purpose and Example Literals
---------|---------------------------------------
INTERVAL YEAR [(year_precision)] TO MONTH | Values are expressed in years and months. The default year precision is 2. Literal examples: INTERVAL '3-2' YEAR TO MONTH (3 years and 2 months) INTERVAL '2' YEAR (2 years) INTERVAL '4' MONTH (4 months) INTERVAL '36' MONTH (36 months or 3 years)
INTERVAL DAY [(day_precision)] TO SECOND [(fractional_seconds_precision)] | Values are expressed in days, hours, minutes, and seconds. The default value for the day precision is 2, the fractional seconds precision has a six-digit default value. Literal examples: INTERVAL '30' DAY (30 days)INTERVAL '200' DAY (3) (300 days. Because the literal exceeds the default DAY precision of 2 you need to explicitly specify the precision.) INTERVAL '12:51' HOUR TO MINUTE (12 hours and 51 minutes) INTERVAL '15' MINUTE (15 minutes) INTERVAL '3 5:10:15.10' DAY TO SECONDS (3 days, 5 hours, 10 minutes, 15 seconds, and 10 fractional seconds) Note the components must be contiguous; for example, you cannot skip the MINUTE component between the HOUR and SECOND component.

#Tabla de funciones de intervalos.
(Rischert, p. 275)
Function |Purpose |Return Datatype
---------|--------|-----------------------
TO_YMINTERVAL(char) | Convert a text literal to an INTERVAL YEAR TOMONTH datatype | INTERVAL YEAR TO MONTH
TO_DSINTERVAL(char) | Convert a text literal to an INTERVAL DAY TO SECOND datatype|  INTERVAL DAY TO SECOND
NUMTOYMINTERVAL(number, 'YEAR') \\ NUMTOYMINTERVAL(number, 'MONTH') | Convert a number to an INTERVAL YEAR TO MONTH literal. | INTERVAL YEAR TO MONTH
NUMTODSINTERVAL(number, 'DAY')| Convert a number to an INTERVAL DAY TO SECOND literal. Instead of the DAY parameter you can pass the HOUR, MINUTE, or SECOND instead. | INTERVAL DAY TO SECOND
EXTRACT(MINUTE FROM interval_datatype) | Extract specific components (i.e., YEAR, MONTH, DAY, HOUR, MINUTE, SECOND). | NUMBER

# Determining OVERLAPS
Se implementa para ver si dos periodos/fechas se traslapan.
Ejemplo
```
SELECT meeting_id,
TO_CHAR(meeting_start, 'DD-MON-YYYY HH:MI PM') "Start",
TO_CHAR(meeting_end, 'DD-MON-YYYY HH:MI PM') "End"
FROM meeting
WHERE (meeting_start, meeting_end)
OVERLAPS
(TO_DATE('01-JUL-2002 3:30PM', 'DD-MON-YYYY HH:MI PM'),
INTERVAL '2' HOUR);
```
Sintaxis:
```
event OVERLAPS event, event es:
(start_event_date_time, end_event_start_time)
Or:
(start_event_date_time, interval_duration)
```
# Lab 4.5 Converting From One Datatype To Another

Aunque Oracle muchas veces hace conversiones ímplicitas, debemos dejarlo claro en el código, para evitar errores.

## CAST FUNCTION
Pasar de un tipo de dato a otro.

```
CAST(expression AS datatype)
```
_Para convertir a varchar2 o char hay que especificar la longitud._
Ejemplo  (Rischert, p. 287)
```
SELECT *
FROM conversion_example
WHERE course_no = CAST(123 AS VARCHAR2(3))

SELECT CAST('29-Mar-02' AS DATE),
CAST('29-MAR-02' AS TIMESTAMP WITH LOCAL TIME ZONE)
FROM dual
```

## Formatting Data
Podemos usar TO_CHAR para dar formato a los datos.
Ejemplo  (Rischert, p. 289)

```
COL "SQL*PLUS" FORMAT 999,999
SELECT course_no, cost "SQL*PLUS",
TO_CHAR(cost, '999,999') "CHAR"
FROM course
WHERE course_no < 25;
```




