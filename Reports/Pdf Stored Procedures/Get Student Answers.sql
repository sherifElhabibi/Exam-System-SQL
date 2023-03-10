/*Report that takes exam number and the student 
ID then returns the Questions in this exam with 
the student answers*/

CREATE PROCEDURE getExamAnswersAndGrade @exam_id INT,@std_id INT 
AS
BEGIN TRY
	SELECT ea.Exam_id,q.Q_Text,ea.Std_id,ea.St_Answer
	FROM ExamAnswer ea INNER JOIN Questions q
	ON ea.Q_id = q.Q_ID 
	INNER JOIN Student s 
	ON ea.Std_id=s.Std_ID
	WHERE ea.Exam_ID=@exam_id AND ea.Std_id=@std_id
END try
BEGIN CATCH
	SELECT 'Error'
END CATCH

