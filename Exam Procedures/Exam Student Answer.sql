/*
///////////////////////////////////////
//GENERATE STUDENT ANSWER  PROCEDURES//
//////////////////////////////////////
*/
CREATE PROCEDURE Generate_Student_Answers @Exam_id INT,@Std_ID INT,@Q_id INT , @answer varchar(5)
 AS 
	BEGIN TRY
			UPDATE ExamAnswer SET St_Answer = @answer WHERE Std_id=@Std_ID AND Q_id=@Q_id AND Exam_id=@Exam_id
	END TRY
	BEGIN CATCH
			SELECT 'Error'
	END CATCH
    
Generate_Exam_Answers 1,1,36,'c'