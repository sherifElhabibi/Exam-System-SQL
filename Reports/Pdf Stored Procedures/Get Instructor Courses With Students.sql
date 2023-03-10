/* Report that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.*/

CREATE PROCEDURE getInsCrs @ins_id INT
AS
BEGIN TRY
	SELECT COUNT(sc.Std_ID) Number_of_Students,c.Crs_Name 
	FROM Course c INNER JOIN Instructors i
	ON c.Ins_Id = i.ins_id
    INNER JOIN Student_Courses sc 
	ON c.Crs_Id = sc.Crs_ID
	WHERE c.Ins_id=@ins_id GROUP BY c.Crs_Name
END try
BEGIN CATCH
	SELECT 'Error'
END CATCH

