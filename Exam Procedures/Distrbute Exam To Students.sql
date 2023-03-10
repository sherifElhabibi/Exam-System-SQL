/*
////////////////////////////////
//DISTRIBUTE EXAM  PROCEDURES//
//////////////////////////////
*/
CREATE PROCEDURE Distribute_Exam @Exam_id INT,@Crs_id INT 
 AS 
	BEGIN TRY
			INSERT INTO ExamAnswer(Std_id,Exam_id,Q_id)
			SELECT sc.Std_ID,eq.Exam_ID,cq.Q_ID FROM Courses_Questions cq,ExamQuestion eq,Student_Courses sc
			WHERE cq.Q_ID= eq.Q_ID  and  sc.Crs_ID=@Crs_id AND eq.Exam_ID=@Exam_id
	END TRY
	BEGIN CATCH
			SELECT 'Error'
	END CATCH

EXEC Distribute_Exam 1 , 10