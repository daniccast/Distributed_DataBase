SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\33\cap15-.txt


 SELECT REGEXP_SUBSTR('Joe Smith, 12345 Berry Lane, Orta, CA 91234', 
                      '[[:digit:]]{5}$') 
 AS substr 
 FROM dual;
 
  SELECT REGEXP_SUBSTR('Joe Smith, 123456 Berry Lane, Orta, CA 9123456', 
                      '[[:digit:]]{5}$') 
 AS substr 
 FROM dual;
 
   SELECT REGEXP_SUBSTR('Joe Smith, 12345678 Berry Lane, Orta, CA 912345', 
                      '[[:digit:]]{5}$') 
 AS substr 
 FROM dual;
 
    SELECT REGEXP_SUBSTR('Joe Smith, 125678 Berry Lane, Orta, CA 912345', 
                      '[[:digit:]]{5}') 
 AS substr 
 FROM dual;
 
     SELECT REGEXP_SUBSTR('Joe Smith, 125678 Berry Lane, Orta, CA 912345', 
                      '[[:digit:]]{3,5}') 
 AS substr 
 FROM dual;
 
 
 rem The REGEXP_INSTR Function 
 
 SELECT REGEXP_INSTR('NY 10032 USA', 
                     '[[:digit:]]{5}') 
             AS rx_instr 
 FROM dual;
 
  SELECT REGEXP_INSTR('NY        10032 USA', 
                     '[[:digit:]]{5}') 
             AS rx_instr 
 FROM dual;
 
   SELECT REGEXP_INSTR('    NY        10032 USA', 
                     '[[:digit:]]{5}') 
             AS rx_instr 
 FROM dual;
 
 
 rem The REGEXP_REPLACE Function 
SELECT REPLACE('Joe Smith',' ', ' ') 
				AS replace 
				FROM dual;
				
SELECT REPLACE('Joe Smith',' ', '------ ') 
				AS replace 
				FROM dual;
col replace format a80				
SELECT REPLACE('Joe Smith',' ', '----------->') 
				AS replace 
				FROM dual;
				
col replace format a120				
SELECT REPLACE('Joe Smith',' ', '----------->') 
				AS replace 
				FROM dual;
				
SELECT REGEXP_REPLACE('Joe Smith', 
                      '( ){2,}', ' ') 
               AS RX_REPLACE 
             FROM dual;
			 
			 
SELECT REGEXP_REPLACE('Joe Smith', 
                      '( ){2,}', '            ') 
               AS RX_REPLACE 
             FROM dual;
			 
SELECT first_name 
 FROM student 
 WHERE REGEXP_LIKE(first_name, 'ta', 'i');


rem Matching A Pattern That Crosses Multiple Lines
Treating A String As A Multiline Source 


SELECT REGEXP_INSTR('My cat 
followed the dog who followed another 
cat.', 
'^cat', 1,1,1,'m') AS cat_search 
 FROM dual ;
 
 
 /*
 

 */
 col cadenas format  a25
  SELECT REGEXP_REPLACE( 
                       'Ellen Hildi Smith', 
                       '(.*) (.*) (.*)', '\3, \1 \2') cadenas
 FROM dual;
 
 
 SELECT REGEXP_SUBSTR( 
                       'There is is a speed limit!', 
                       '([[:alnum:]]+)([[:space:]]+)\1') AS substr 
 FROM dual;
 
rem  Word Boundaries 
rem At times you may want to match entire words,
rem   not just individual characters within a word or string. 

SELECT REGEXP_REPLACE('The cat sat on the roof', 
                      '(^|[^[:alpha:]])cat($|[^[:alpha:]])', ' mouse ') cadenas
       FROM dual;
	   
rem  Applying Regular Expressions In Data 
rem    Validation
ALTER TABLE student 
 ADD CONSTRAINT stud_last_name_ck CHECK 
 (REGEXP_LIKE(last_name, '^[-[:alpha:] .,()'']*$'));
 
rem     Understanding Matching Mechanics
 
SELECT REGEXP_INSTR('This is an isolated issue', 
                      'is', 1, 1, 0) AS start_pos, 
                     REGEXP_INSTR('This is an isolated issue', 
                       'is', 1, 1, 1) AS after_end 
 FROM dual;
 
 
 
 SELECT REGEXP_SUBSTR('This is an isolated issue', 
                      '[[:space:]]*is.*') cadenas
                      FROM dual;
					  
SELECT zip, 
        REGEXP_INSTR(zip, '[[:digit:]]{5}') exp1, 
        REGEXP_INSTR(zip, '[[:digit:]{5}]') exp2 
 FROM zipcode_example;
 
 
 
 SELECT REGEXP_SUBSTR('first field, second field , third field', 
                      ', [^,]*,')  cadenas 
                    FROM dual;
					
					
SELECT zip, 
				REGEXP_INSTR(zip, '[[:digit:]]{5}') exp1, 
				REGEXP_INSTR(zip, '[[:digit:]{5}]') exp2 
 FROM zipcode_example;
 
 SELECT REGEXP_SUBSTR('first field, second field , third field', 
                      ', [^,]*,') cadenas 
         FROM dual;
		 
SELECT REGEXP_INSTR('Hello', '(xy)?', 1, 1, 0) 
 AS start_pos, 
 REGEXP_INSTR('Hello', '(xy)?', 1, 1, 1) 
 AS after_end 
 FROM dual;
 
 spool off;
 
 
 
 
 

 


