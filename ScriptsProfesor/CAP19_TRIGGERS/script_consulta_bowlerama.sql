REM 
REM       REGISTROS DE PAM BOWLERAMA
REM

 
 
 INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,1,'Y');
 
 
UPDATE frame
  SET strike = 'N',
  spare = 'Y'
  WHERE bowler_id = 1
  AND game_id = 1
  AND frame_number = 1;
  
DELETE frame
   WHERE bowler_id = 1
   AND game_id = 1
   AND frame_number = 1;
   
   
SELECT bowler_id, game_id, frame_number
 , old_strike, new_strike
 , old_spare, new_spare
 , change_date, operation
 FROM frame_audit;
 
 SELECT bowler_id, game_id, frame_number
 , old_strike, new_strike
 , old_spare, new_spare
 , TO_CHAR(change_date,'DD/MON/YYYY HH24:MI:SS') HORA_OPER, operation
 FROM frame_audit;
 
SET  NULL NADA

---                 PAGINA 700
 UPDATE FRAME
 SET strike = strike;
 
 SELECT old_strike,
  new_strike,
  old_spare,
  new_spare,
  old_score,
  new_score
  FROM frame_audit;
 
 
UPDATE frame
 SET strike = strike;
 
  INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,1,'Y');
	
 INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,2,'Y');
	
 INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,3,'Y');
	
 SELECT * FROM FRAME;
 
  INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,4,'N');
	
 INSERT INTO frame
	(BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE)
	VALUES(1,1,5,'N');


COL STRIKE FORMAT A5
COL SCORE FORMAT A5
COL SPARE FORMAT A5	
SELECT BOWLER_ID,GAME_ID,FRAME_NUMBER,STRIKE,
	SPARE,SCORE
	FROM FRAME ORDER BY 1;
COL BID FORMAT 99
COL GID FORMAT 99
COL FRID FORMAT 99
COL INSTANTE FORMAt a24
 SELECT BOWLER_ID BID ,GAME_ID GID,FRAME_NUMBER FRID, 
  old_strike,
  new_strike,
  old_spare,
  new_spare,
  old_score,
  new_score,
  to_char(change_date,'DD/MON/YYYY HH24:MI:SS') INSTANTE,
  operation
  FROM frame_audit;

------------------------------
----------------------------------
rem consultar los triggers 
--------------------------------------- ------------------

alter trigger  validate_score    disable;
alter trigger  audit_update      disable;
alter trigger  after_delete_row  disable;
alter trigger  after_insert_row  disable;
alter trigger  after_update_row  disable;
alter trigger  before_delete_row disable;
alter trigger  before_insert_row disable;
alter trigger  before_update_row disable;

rem borrar los triggers


drop  trigger  validate_score   ;
drop  trigger  audit_update     ;
drop  trigger  after_delete_row ;
drop  trigger  after_insert_row ;
drop  trigger  after_update_row ;
drop  trigger  before_delete_row;
drop  trigger  before_insert_row;
drop  trigger  before_update_row;
   

