SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\33\REG_EXP_MANUAL.TXT
/*
Krishnamurthy,Usha(2021).Oracle Database SQL Language Reference, 21c,F31301-02, USA:Oracle Corp.

Copyright © 1996, 2021, Oracle and/or its affiliates.
Primary Author: Usha Krishnamurthy
*/
/*
REGEXP_COUNT
Purpose
REGEXP_COUNT complements the functionality of the REGEXP_INSTR function by returning
the number of times a pattern occurs in a source string
 It returns an integer indicating
the number of occurrences of pattern.
*/
rem [Krishnamurthy,2021,589]

SELECT REGEXP_COUNT('123123123123123', '(12)3', 1, 'i') REGEXP_COUNT
 FROM DUAL;
 
/* the following example, the function begins to evaluate the source string at the third
character, so skips over the first occurrence of pattern:
 'i' specifies case-insensitive matching
 
*/
rem [Krishnamurthy,2021,589]

SELECT REGEXP_COUNT('123123123123', '123', 3, 'i') COUNT FROM DUAL; 

rem [Krishnamurthy,2021,589]
rem The following example shows that subexpressions parentheses in pattern are ignored

SELECT REGEXP_COUNT('123123123123123', '(12)3', 1, 'i') REGEXP_COUNT
 FROM DUAL;

rem [Krishnamurthy,2021,589]
rem In the following example, the function begins to evaluate 
rem the source string at the third
rem character, so skips over the first occurrence of pattern:
SELECT REGEXP_COUNT('123123123123', '123', 3, 'i') COUNT FROM DUAL; 

/*
REGEXP_COUNT simple matching: Examples
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters:
*/
rem [Krishnamurthy,2021,590]
select regexp_count('ABC123', '[A-Z]') cadena1, 
       regexp_count('A1B2C3', '[A-Z]')  cadena2
	   from dual;

select regexp_count('ABC123456', '[A-Z]') cadena1, 
       regexp_count('A1B2C3567892ANF', '[A-Z]')  cadena2
	   from dual;
/*	   
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number:
*/
rem [Krishnamurthy,2021,590]

select regexp_count('ABC123', '[A-Z][0-9]') CADENA1,
        regexp_count('A1B2C3', '[A-Z][0-9]') CADENA2 from dual;
/*		
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number
only at the beginning of the string:
*/
select regexp_count('ABC123', '[A-Z][0-9]') CADENA1,
		regexp_count('A1B2C3', '[A-Z][0-9]') cadena2 from dual;

rem [Krishnamurthy,2021,590]
/*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number
only at the beginning of the string:
*/
rem [Krishnamurthy,2021,590]
select regexp_count('ABC123', '[A-Z][0-9]') cadena1 ,
        regexp_count('A1B2C3', '[A-Z] [0-9]') cadena2 from dual;

 /*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by two digits of number
only contained within the string:
*/
rem [Krishnamurthy,2021,590]

select regexp_count('ABC123', '[A-Z][0-9]{2}') cadena1,
       regexp_count('A1B2C3', '[A-Z] [0-9]{2}') cadena2 from dual;

 /*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number
within the first two occurrences from the beginning of the string:
*/
rem [Krishnamurthy,2021,590]

select regexp_count('ABC123', '([A-Z][0-9]){2}') cadena1 , 
        regexp_count('A1B2C3', '([A-Z] [0-9]){2}')  cadena2 
		from dual;
rem [Krishnamurthy,2021,590]		
/*
REGEXP_COUNT advanced matching: Examples
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters:
*/

select regexp_count('ABC123', '[A-Z]') Match_char_ABC_count, 
       regexp_count('A1B2C3', '[A-Z]') Match_char_ABC_count 
	   from dual;

/*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number:
*/
rem [Krishnamurthy,2021,592]
select regexp_count('ABC123', '[A-Z][0-9]') Match_string_C1_count, 
        regexp_count('A1B2C3', '[A-Z][0-9]') Match_strings_A1_B2_C3_count 
		from dual;

/*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number
only at the beginning of the string:
*/
rem [Krishnamurthy,2021,592]
select regexp_count('ABC123A5', '^[A-Z][0-9]') Char_num_like_A1_at_start, 
        regexp_count('A1B2C3', '^[A-Z][0-9]')  Char_num_like_A1_at_start 
		from dual;

/*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by two digits of number
only contained within the string:
*/
rem [Krishnamurthy,2021,592]
select regexp_count('ABC123', '[A-Z][0-9]{2}') Char_num_like_A12_anywhere, 
       regexp_count('A1B2C34', '[A-Z][0-9]{2}') Char_num_like_A12_anywhere 
	   from dual;

/*
In the following example, REGEXP_COUNT validates the supplied string for the given
pattern and returns the number of alphabetic letters followed by a single digit number
within the first two occurrences from the beginning of the string:
*/
rem [Krishnamurthy,2021,592]
select regexp_count('ABC12D3', '([A-Z][0-9]){2}') Char_num_within_2_places, 
        regexp_count('A1B2C3', '([A-Z][0-9]){2}') Char_num_within_2_places 
		from dual;
spool off
		


		
		

