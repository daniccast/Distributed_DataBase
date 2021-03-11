Resumen cápitulo tres.
Información recuperada de Rischert,A (2004)."Chapter 3. Character, Number,and Miscellaneous Functions". Ramagnano,L, Oracle® SQLby Example(164-221). Pearson. 


# Lab 4.1 APpling Oracle's DATE Format Models

## Changing The DATE Display Format

Formato default para imprimir fechas: **DD-MON-YY**
Para cambiarlo usamos ```TO_CHAR``` junto con el formato.
Ejemplo (Rischert, p. 224):
	SELECT last_name, registration_date,
	TO_CHAR(registration_date, 'MM/DD/YYYY'),
	TO_CHAR(registration_date, 'Dy') AS "1.Day",
	TO_CHAR(registration_date, 'Month DD, YYYY')
	
	AS "Formatted"
	FROM student
	WHERE student_id IN (123, 161, 190);
De igual manera, si queremos pasar fecha a char, usamos ```TO_DATE```
(Rischert, p. 228)
	SELECT last_name, registration_date
	FROM student
	WHERE registration_date = TO_DATE('22-JAN-2003', 'DD-MON-YYYY')
**Oracle a veces hace la convercion automática**

\n
	TO_CHAR(date[,format_mask])\n
	TO_DATE(char[,format_mask])
	
### Tabla de datos comunes de fecha
(Rischert, p. 225)
Format | Description
------------------------
YYYY |	Four-digit year.
YEAR |Year spelled out.
MM |Two-digit month.
MON |Three-letter abbreviation of the month in capital letters.
MONTH| Month spelled out in capital letters and padded with blanks.
Month |Month spelled with first letter in caps and padded with blanks to a length of nine
characters.
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


Si el formato en el query es DD-MON-RR (century), los números del 50 al 99 se toma del siglo pasado y del 0 al 49 de este.
Ejemplo (Rischert, p. 230)
	SELECT TO_CHAR(TO_DATE('17-OCT-67','DD-MON-RR'),'YYYY') "1900",
	TO_CHAR(TO_DATE('17-OCT-17','DD-MON-RR'),'YYYY') "2000"
	FROM dual;

**Cuando no se ingresan horas, Oracle asume que son las 00:00**

La funcion *TRUNC* sirve también con fechas, y eso hace que no importe la hora se redondea al día. 









