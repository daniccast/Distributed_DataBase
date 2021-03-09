rem lanza_scripts

set flush off
set termout off
set echo on
CLEAR SCREEN
set colsep '| =|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

@@C:\Users\ORA_bases\2021_02_24_clase_2\desc_entidades.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\cifras_22.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\instala_base_student.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\Lanza_create_student.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\desinstala_base_student.sql

@@C:\Users\ORA_bases\2021_02_24_clase_2\Lanza_drop_student.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\lanza_ejer_completo.sql
