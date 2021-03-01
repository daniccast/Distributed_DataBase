SPOOL C:\Users\ORA_bases\2021_02_24_clase_2\salida\ejer_completo.txt
rem crea la base student 
rem pausa
set flush off
set termout off
rem @@C:\Users\ORA_bases\2021_02_24_clase_2\crea_usuario.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\desp_par_session.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\cambia_idioma_fecha.sql
@@C:\Users\ORA_bases\2021_02_24_clase_2\instala_base_student.sql
rem @@C:\Users\ORA_bases\2021_02_24_clase_2\desinstala_base_student.sql
spool off
