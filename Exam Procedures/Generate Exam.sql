/*
//////////////////////////////
//GENERATE EXAM  PROCEDURES//
////////////////////////////
*/


CREATE PROCEDURE Generate_Exam @Crs_id INT,@MCQ_NO INT=7,@TF_NO INT=3
 AS 
	BEGIN TRY
		INSERT INTO Exam (ExamDate,ExamTime)
		values(GETDATE(),GETDATE())

		INSERT INTO ExamQuestion(Exam_ID,Q_ID)
		SELECT TOP(@MCQ_NO) e.Exam_id,Q_ID 
		FROM Questions q,Exam e 
		WHERE q.Crs_ID=@Crs_id AND q.Q_Type='MCQ' AND e.Exam_id IN(SELECT MAX(Exam_id) FROM Exam e1) ORDER BY NEWID()

		INSERT INTO ExamQuestion(Exam_ID,Q_ID) 
		SELECT TOP(@TF_NO) e.Exam_id,Q_ID 
		FROM Questions q,Exam e
        WHERE q.Crs_ID=@Crs_id AND q.Q_Type='T/F' AND e.Exam_id IN(SELECT MAX(Exam_id) FROM Exam e1) ORDER BY NEWID()
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH