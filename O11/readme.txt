*******************************************************************************
This readme.txt file is identical to the readme.pdf file.  If you have Adobe 
Acrobat installed, you may prefer to the readme.pdf file as it contains graphic 
screenshots for further illustration.
*******************************************************************************

INSTALLATION INSTRUCTIONS FOR THE STUDENT SAMPLE SCHEMA 

PURPOSE
This document describes the files and steps used to create the STUDENT schema, 
which is used for all exercises in the Oracle by Example series.

OVERVIEW
This document is organized as follows:
I. Steps to create the STUDENT account
II. Steps to build STUDENT schema objects and load associated data
III. Steps to rebuild the objects and data in the STUDENT schema
IV. Additional example tables installation instructions
V. List of files used in the create and rebuild steps

NOTE
These instructions will work in Windows and UNIX environments and should work in 
just about any other OS environment. If you use UNIX, substitute the drive and 
path names with the appropriate UNIX directory structure.

If you use iSQL*Plus (browser-based SQL*Plus version), you will notice that some 
instructions are slightly different from the SQL*Plus version. The differences 
are pointed out as you read through this document.

I. STEPS TO CREATE THE STUDENT ACCOUNT
--------------------------------------
Before creating the STUDENT schema objects and loading data into them, it is 
necessary to create the STUDENT account (a schema/place/user in the database 
that will hold the objects and data). The default account and password used will 
be STUDENT and LEARN respectively.
If a DBA is managing your Oracle database, ask him/her to create an account 
named STUDENT with a password of LEARN and proceed with item II.Steps to Build 
STUDENT Schema Objects and Load Associated Data. If you need to create the 
account yourself, perform the following steps:

1. Connect to your database as SYSTEM and the appropriate password at the log on 
screen.  If you are unclear how to execute SQL statements or log on with 
SQL*Plus or iSQL*Plus, read through the Labs 2.1, 2.2, and 2.3 of the Oracle SQL 
by Example book. You probably remembered to write down the SYSTEM password 
when you performed your Oracle database system installation. 

2. Once you successfully connect to the database with the SYSTEM account, issue 
the following SQL statement to find the names of the tablespaces in your 
database. (Note tablespaces are areas that hold database objects in an Oracle 
database. If you are not familiar with tablespaces right now, don't worry.)
	SELECT tablespace_name
	  FROM dba_tablespaces
	 ORDER BY tablespace_name;
3. After you pressed the Execute button in iSQL*Plus or the Enter key in 
SQL*Plus, you will see the resulting output. You need to find two particular 
tablespaces:
(a) A tablespace used as the default place to store your objects. The name of 
this tablespace will vary depending on your operating system platform and your 
Oracle database version. Your DEFAULT TABLESPACE will have a name similar to one 
of the following:
	USERS
	USER_DATA
	USR
(b) A tablespace known as the TEMPORARY TABLESPACE. Typical names for TEMPORARY
TABLESPACEs are:
	TEMP
	TEMPORARY
	TEMPORARY_DATA
4. Once you have found your DEFAULT TABLESPACE and TEMPORARY TABLESPACE names 
write them down for the next step. Note that the most common two names will be 
USERS and TEMP.
5. Now you are ready to create the STUDENT database account.
a. Still logged on as SYSTEM, issue the following statement, substituting the 
tablespace names from steps 3 (a) and 3 (b):
	CREATE USER student IDENTIFIED by learn
	DEFAULT TABLESPACE <name from step 3 (a)>
	TEMPORARY TABLESPACE <name from step 3 (b)>;
b. Your final statement should look similar to the following:
	CREATE USER student IDENTIFIED by learn
	DEFAULT TABLESPACE users
	TEMPORARY TABLESPACE temp;
6. Next you need to give the STUDENT account the ability to use the database. 
Execute the following statement while connected as the SYSTEM user:
	GRANT CONNECT, RESOURCE TO student;
7. Now you can test to see if you can connect as the STUDENT account.
a. In iSQL*Plus (browser-based SQL*Plus version), click the Logout icon and 
login as the new STUDENT user with the password LEARN.
b. If you use SQL*Plus, issue the following statement at the SQL> prompt to 
connect as STUDENT:
	CONNECT student/learn
Execute the SHOW USER command.
	SHOW USER
You should receive this message:
	USER is "STUDENT"
Now you are connected as the STUDENT user. You are ready to proceed to item 2 
"Steps to Build STUDENT Schema Objects and Load Associated Data."

II. STEPS TO BUILD STUDENT SCHEMA OBJECTS AND LOAD ASSOCIATED DATA
------------------------------------------------------------------
Connect via iSQL*Plus or SQL*Plus to the database as STUDENT with the password 
of LEARN. Make a note of the directory where you found this readme file you are 
reading right now. A common place where you may have this file and all others 
you need for installation is C:\guest\schemasetup.

If you are using iSQL*Plus, do the following: Click the Load Script... button and 
then the Browse button to locate in the C:\guest\schemasetup directory the script 
named createStudent.sql.  Open the file and then click the Load button to load the 
script into the Workspace of iSQL*Plus. Once the script is visible in the input area, 
press the Execute button to run the script.

If you using SQL*Plus rather than iSQL*Plus and using the C:\guest\schemasetup 
directory, issue this command at the SQL> prompt:
	@C:\guest\schemasetup\createStudent.sql
After the script completes (approximately 3-5 minutes), it will show a list of 
counts representing the number of rows it created for each table. Compare that 
list on screen with the following list. The two lists should match. If you used 
iSQL*Plus, you may need to scroll all the way to the bottom of the screen to see the 
result.
	Count of COURSE Table: 30
	Count of ENROLLMENT Table: 226
	Count of GRADE Table: 2004
	Count of GRADE_CONVERSION Table: 15
	Count of GRADE_TYPE Table: 6
	Count of GRADE_TYPE_WEIGHT Table: 300
	Count of INSTRUCTOR Table: 10
	Count of SECTION Table: 78
	Count of STUDENT Table: 268
	Count of ZIPCODE Table: 227

III. STEPS TO REBUILD THE STUDENT SCHEMA
--------------------------------------
This step will rebuild the objects in the STUDENT schema. You may wish to 
perform this step if you want to return the STUDENT schema objects to their 
pristine state. This is especially useful after you have worked through the 
chapters that focus on data manipulation. For example, if you have just been 
working on DELETing data, you may wish to restore that data to practice 
SELECTing the data. Caution: Running this script removes the objects and then
reinserts the data!

Connect to the database as STUDENT/LEARN. A common place that you may have 
your script is C:\guest\schemasetup.
 

If you are logged into the database with iSQL*Plus, use the Browse button to 
locate the rebuildStudent.sql script. Load the script into the Workspace area of 
iSQL*Plus and press the Execute button.

If you are using SQL*Plus and the C:\guest\schemasetup directory, issue the 
following at the SQL*Plus prompt:
	@C:\guest\schemasetup\rebuildStudent.sql
When the rebuildStudent.sql script has completed, it will show a list of 
counts representing the number of rows it created for each table. Compare that 
list on screen with the following list. The two lists should match.
	Count of COURSE Table: 30
	Count of ENROLLMENT Table: 226
	Count of GRADE Table: 2004
	Count of GRADE_CONVERSION Table: 15
	Count of GRADE_TYPE Table: 6
	Count of GRADE_TYPE_WEIGHT Table: 300
	Count of INSTRUCTOR Table: 10
	Count of SECTION Table: 78
	Count of STUDENT Table: 268
	Count of ZIPCODE Table: 227

IV. ADDITIONAL EXAMPLE TABLES INSTALLATION INSTRUCTIONS
-------------------------------------------------------
The Oracle SQL by Example, 3rd edition contains additional example 
tables that help illustrate extra functionality and concepts. If you want to 
try out some of these exercises in the book, I suggest you install these 
tables in the STUDENT schema.

In iSQL*Plus: To run the script sql_book_add_tables.sql click the Browse... 
button to locate the C:\guest\schemasetup directory where you will find the 
sql_book_add_tables.sql script. Click the Load Script button to retrieve the 
file into the Workspace area of iSQL*Plus. Press the Execute 
button to run the script.

In SQL*Plus for Windows: At the SQL prompt, issue the following command:
	@C:\guest\schemasetup\sql_book_add_tables.sql 
If you want to remove these tables from the schema, run the 
drop_extra_tables.sql script.

V. LIST OF FILES IN THE ZIP FILE
--------------------------------
The following is a list of the files included in the downloaded zipped file. 

File Name                   Description 
--------------------------------------------------------------------------------------
createStudent.sql           The primary script that creates the objects in the STUDENT
                            schema.
dropStudent.sql             A script that drops STUDENT objects.
readme.pdf                  The Adobe version of the readme.txt file.
readme.txt                  The text-only version of readme.pdf.  This is the file
                            you are currently reading.
rebuildStudent.sql          The script to run for recreating and reloading the STUDENT
                            schema tables.
AppendixD.pdf               This file graphically displays the STUDENT schema diagram; 
                            you need Adobe Acrobat to view it.
sql_book_add_tables.sql     This script creates additional example tables not 
                            created by the createStudent.sql script.
drop_extra_tables.sql       This script drops the additional example tables created by 
                            the sql_book_add_tables.sql script.

