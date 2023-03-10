/*Report that takes exam number and returns the 
Questions in it and chocies*/

CREATE PROCEDURE getExamQuestions @exam_id INT
AS
BEGIN TRY
	SELECT eq.Exam_ID,q.Q_Text,c.Q_Choice
	FROM ExamQuestion eq INNER JOIN Questions q
	ON eq.Q_ID = q.Q_ID
    INNER JOIN Choices c
	ON c.Q_ID = eq.Q_ID
	WHERE eq.Exam_ID=@exam_id 
END try
BEGIN CATCH
	SELECT 'Error'
END CATCH

