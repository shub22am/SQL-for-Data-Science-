----------------------- ANSWER1 -------------------

CREATE DATABASE alumni;

USE alumni;

----------------------- ANSWER2 --------------------
-- Imported by right click on Schema "alumni"
-- select 'Table Data Import Wizard'
-- select path
-- click next -> next -> next -> next -> next -> finish
-- data imported
-- for all six .csv files

SELECT * FROM college_a_hs;
SELECT * FROM college_a_se;
SELECT * FROM college_a_sj;
SELECT * FROM college_b_hs;
SELECT * FROM college_b_se;
SELECT * FROM college_b_sj;

-------------------- ANSWER3 ---------------------

DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;

----------------------------- ANSWER4 -------------------
-- It Is Peroform On python(Jyupter Notebook)

-------------------------- ANSWER5 ----------------
-- It Is Peroform On MS Excel

-------------------------- ANSWER6 ----------------------

CREATE VIEW college_A_HS_V AS (SELECT * FROM college_a_hs 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND HSDegree IS NOT NULL 
AND EntranceExam IS NOT NULL 
AND Institute IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM college_A_HS_V;

----------------------- ANSWER7 -----------------------------

CREATE VIEW College_A_SE_V AS (SELECT * FROM college_a_se 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND Organization IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM College_A_SE_V;

----------------------- ANSWER8 ------------------------------

CREATE VIEW College_A_SJ_V AS (SELECT * FROM college_a_sj 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND Organization IS NOT NULL 
AND Designation IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM College_A_SJ_V;

-------------------------- ANSWER9 -------------------

CREATE VIEW College_B_HS_V AS (SELECT * FROM college_b_hs 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL
AND Branch IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND HSDegree IS NOT NULL 
AND EntranceExam IS NOT NULL 
AND Institute IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM College_B_HS_V;

-------------------- ANSWER10 ------------------------

CREATE VIEW College_B_SE_V AS (SELECT * FROM college_b_se 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL 
AND Branch IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND Organization IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM College_B_SE_V;

-------------------- ANSWER11 ---------------------------

CREATE VIEW College_B_SJ_V AS (SELECT * FROM college_b_sj 
WHERE RollNo IS NOT NULL 
AND LastUpdate IS NOT NULL 
AND Name IS NOT NULL 
AND FatherName IS NOT NULL 
AND MotherName IS NOT NULL 
AND Branch IS NOT NULL 
AND Batch IS NOT NULL 
AND Degree IS NOT NULL 
AND PresentStatus IS NOT NULL 
AND Organization IS NOT NULL 
AND Designation IS NOT NULL 
AND Location IS NOT NULL);

SELECT * FROM College_B_SJ_V;

----------------- ANSWER12 ------------------------

USE alumni;
DROP procedure IF EXISTS A_HS;
DELIMITER $$
CREATE PROCEDURE A_HS() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_A_HS_V;  
END $$

DELIMITER ;

call A_HS();
-------------------------------------------------------------------
DROP procedure IF EXISTS A_SE;
DELIMITER $$
CREATE PROCEDURE A_SE() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_A_SE_V;  
END $$

DELIMITER ;

call A_SE();
--------------------------------------------------------------------
DROP procedure IF EXISTS A_SJ;
DELIMITER $$
CREATE PROCEDURE A_SJ() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_A_SJ_V;  
END $$

DELIMITER ;

call A_SJ();
---------------------------------------------------------------------
DROP procedure IF EXISTS B_HS;
DELIMITER $$
CREATE PROCEDURE B_HS() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_B_HS_V;  
END $$

DELIMITER ;

call B_HS();
-----------------------------------------------------------------------
DROP procedure IF EXISTS B_SE;
DELIMITER $$
CREATE PROCEDURE B_SE() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_B_SE_V;  
END $$

DELIMITER ;

call B_SE();
-----------------------------------------------------------------------
DROP procedure IF EXISTS B_SJ;
DELIMITER $$
CREATE PROCEDURE B_SJ() BEGIN  SELECT lower(name),lower(FatherName),lower(MotherName) FROM College_B_SJ_V;  
END $$

DELIMITER ;

call B_SJ();

----------------------- ANSWER13 ---------------------
-- It is performed on excel 

----------------------- ANSWER14 ----------------------

DROP PROCEDURE IF EXISTS get_name_collegeA;
DELIMITER $$
CREATE PROCEDURE get_name_collegeA  
(  INOUT name1 TEXT(40000) ) 

BEGIN   

DECLARE na INT DEFAULT 0;  
DECLARE namelist VARCHAR(16000) DEFAULT "";    
DECLARE namedetail   
CURSOR FOR  
    SELECT Name FROM college_a_hs UNION SELECT Name FROM college_a_se UNION SELECT Name FROM college_a_sj;    
    
    DECLARE CONTINUE HANDLER   
    FOR NOT FOUND SET na =1;    
    OPEN namedetail;    
    
getame :  LOOP  
    FETCH FROM namedetail INTO namelist;  
       IF na = 1 THEN  LEAVE getame;  
       END IF;  
       SET name1 = CONCAT(namelist,";",name1);    
       END LOOP getame;  
       CLOSE namedetail; 
END $$

DELIMITER ;

SET @Name = "";
CALL get_name_collegeA(@Name);
SELECT @Name Name;

-------------------- ANSWER15 ------------------

DROP PROCEDURE IF EXISTS get_name_collegeB;
DELIMITER $$
CREATE PROCEDURE get_name_collegeB  
(  INOUT name1 TEXT(40000) ) 
BEGIN   
DECLARE na INT DEFAULT 0;  
DECLARE namelist VARCHAR(16000) DEFAULT "";    
DECLARE namedetail   

CURSOR FOR  
    SELECT Name FROM college_b_hs UNION SELECT Name FROM college_b_se UNION SELECT Name FROM college_b_sj;   

     DECLARE CONTINUE HANDLER   
      FOR NOT FOUND SET na =1;    
        
        OPEN namedetail;    
        
getame :  LOOP  
   FETCH FROM namedetail INTO namelist;  
   IF na = 1 THEN  LEAVE getame;  
   END IF;  
   
      SET name1 = CONCAT(namelist,";",name1);    
      END LOOP getame;  
      CLOSE namedetail; 
      
END $$

DELIMITER ;

SET @Name = "";
CALL get_name_collegeB(@Name);
SELECT @Name Name;

 

-- ANSWER16 --
-- Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)

SELECT 'Higher Studies',
(SELECT COUNT(*) FROM college_a_hs) / ((SELECT COUNT(*) FROM college_a_hs) + (SELECT COUNT(*) FROM college_a_se) + (SELECT COUNT(*) FROM college_a_sj))*100 'Collage A Percentage',
(SELECT COUNT(*) FROM college_b_hs) / ((SELECT COUNT(*) FROM college_b_hs) + (SELECT COUNT(*) FROM college_b_se) + (SELECT COUNT(*) FROM college_b_sj))*100 'Collage B Percentage' 

UNION

SELECT 'Self Employed',
(SELECT COUNT(*) FROM college_a_se) / ((SELECT COUNT(*) FROM college_a_hs) + (SELECT COUNT(*) FROM college_a_se) + (SELECT COUNT(*) FROM college_a_sj))*100 ,
(SELECT COUNT(*) FROM college_b_se) / ((SELECT COUNT(*) FROM college_b_hs) + (SELECT COUNT(*) FROM college_b_se) + (SELECT COUNT(*) FROM college_b_sj))*100 

UNION

SELECT 'Service Job',
(SELECT COUNT(*) FROM college_a_sj) / ((SELECT COUNT(*) FROM college_a_hs) + (SELECT COUNT(*) FROM college_a_se)+(SELECT COUNT(*) FROM college_a_sj))*100 ,
(SELECT COUNT(*) FROM college_b_sj) / ((SELECT COUNT(*) FROM college_b_hs) + (SELECT COUNT(*) FROM college_b_se) + (SELECT COUNT(*) FROM college_b_sj))*100 ;



 