/* File on web: bowlerama_tables.sql */
TABLE frame
(bowler_id NUMBER,
 game_id NUMBER,
 frame_number NUMBER,
 strike VARCHAR2(1) DEFAULT 'N',
 spare VARCHAR2(1) DEFAULT 'N',
 score NUMBER,
 CONSTRAINT frame_pk
 PRIMARY KEY (bowler_id, game_id, frame_number));
 
 
 /* File on web: bowlerama_tables.sql */
TABLE frame
(bowler_id NUMBER,
 game_id NUMBER,
 frame_number NUMBER,
 strike VARCHAR2(1) DEFAULT 'N',
 spare VARCHAR2(1) DEFAULT 'N',
 score NUMBER,
 CONSTRAINT frame_pk
 PRIMARY KEY (bowler_id, game_id, frame_number));
