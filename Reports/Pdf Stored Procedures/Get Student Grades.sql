/* Report that takes the student ID and returns the 
grades of the student in all courses. %*/

CREATE PROCEDURE getExamGrade @std_id INT 
AS
BEGIN TRY
	SELECT c.Crs_Name,sc.Std_Grade
	FROM Student_Courses sc INNER JOIN Course c
	ON sc.Crs_ID = c.Crs_Id
	WHERE sc.Std_ID = @std_id
END try
BEGIN CATCH
	SELECT 'Error'
END CATCH


