alter session set nls_date_language = 'SPANISH';
CLEAR SCREEN
SET PAGESIZE 99;
SET LINESIZE 150;
COL PARAMETER FORMAT A29;
COL VALUE     FORMAT A29;
SET COLSEP '|=|';
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
     ORDER BY 1;
REM CAMBIA EL IDIOMA DE LA FECHA
alter session set nls_date_language = 'ENGLISH';
REM Despliega nuevamente los parametros de la session 
clear screen
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS;
rem despliega solamente el parametro  nls_date_language
select parameter, value from nls_session_parameters
  where parameter = 'NLS_DATE_LANGUAGE' ;