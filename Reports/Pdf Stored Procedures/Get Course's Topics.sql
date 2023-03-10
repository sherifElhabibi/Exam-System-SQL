/* 	Report that takes course ID and returns its topics */

CREATE PROC get_course_Topics @crs_id INT
AS 
	BEGIN TRY
		SELECT Topic_ID, Topic_Name, Topic_description 
		FROM Topics t inner join Course c
		ON c.Crs_ID = t.Crs_ID
		WHERE t.Crs_ID = @crs_id
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH