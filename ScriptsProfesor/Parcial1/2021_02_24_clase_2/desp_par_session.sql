spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\desp_par_session.txt
CLEAR SCREEN
SET PAGESIZE 99;
SET LINESIZE 150;
SET COLSEP '|=|';
SET UNDERLINE =
COL PARAMETER FORMAT A29;
COL VALUE     FORMAT A29;
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
     ORDER BY 1;
	 
REM CAMBIA EL IDIOMA DE LA FECHA
alter session set nls_date_language = 'ENGLISH';

REM Despliega nuevamente los parametros de la session 
clear screen
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
ORDER BY 1;

rem despliega solamente el parametro  nls_date_language
select parameter, value from nls_session_parameters
  where parameter = 'NLS_DATE_LANGUAGE' ;

spool off
