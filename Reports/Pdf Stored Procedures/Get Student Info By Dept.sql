/*Report that returns the students information according to Department No parameter */

CREATE PROC GetStudentsByID @DeptID INT 
AS
	BEGIN TRY
		SELECT s.Std_ID,s.St_Name,s.St_Email,d.dept_name
		FROM Student s
		JOIN Department d ON s.Dept_ID = d.Dept_ID WHERE s.Dept_ID = @DeptID
	END TRY
	BEGIN CATCH
	SELECT 'Error'
	END CATCH
