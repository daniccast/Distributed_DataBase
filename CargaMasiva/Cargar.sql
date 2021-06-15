spool C:\Users\ozkr_\Desktop\loader\salida\cifras.txt


@C:\Users\ozkr_\Desktop\loader\script\CIFRAS.SQL 

REM  DESPLIEGA TUPLAS

spool off;


spool C:\Users\ozkr_\Desktop\loader\salida\despliega_atrib.txt

SET COLSEP '|=|'

@@C:\Users\ozkr_\Desktop\loader\script\DESPLIEGA_ATRIB.SQL
spool off

