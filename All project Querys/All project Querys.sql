/* Select ,Insert update and delete in any table */
/*
///////////////////////
//COURSE  PROCEDURES//
/////////////////////
*/

-- Select Course By Id
CREATE PROCEDURE SelectCourseById
  @crs_id INT
AS
BEGIN
  BEGIN TRY
    SELECT * FROM Course c WHERE c.Crs_Id = @crs_id;
  END TRY
  BEGIN CATCH
    SELECT 'Error'
  END CATCH
END;

------------------------------
-- insert Course
CREATE PROCEDURE insertCourse
  @crs_id int,
  @crs_name NCHAR(9),
  @descrip NCHAR(50),
  @ins_id INT 
AS
BEGIN
  BEGIN TRY
    INSERT INTO Course 
    VALUES ( @crs_id, @crs_name,@descrip,@ins_id);
  END TRY
  BEGIN CATCH
    SELECT SELECT 'Error'
  END CATCH
END;

-------------------------------
-- Update course
CREATE PROCEDURE Updatecourse
  @crs_id int,
  @crs_name NCHAR(19),
  @descrip NCHAR(50),
  @ins_id INT 
AS
BEGIN
  BEGIN TRY
    UPDATE Course
    SET Crs_Id =  @crs_id,
        Crs_Name = @crs_name,
        Crs_Description = @descrip,
		Ins_Id= @ins_id
    WHERE Ins_Id= @ins_id;
  END TRY
  BEGIN CATCH
		SELECT 'Error'
  END CATCH
END;

---------------------------------
-- Delete course
CREATE PROCEDURE Deletecourse
  @crs_id INT 
AS
BEGIN
  BEGIN TRY
		DELETE FROM Course WHERE Crs_Id = @crs_id ;
  END TRY
  BEGIN CATCH
		SELECT 'Error'
  END CATCH
END;

/**********************************************************************************************************/
/**********************************************************************************************************/
/*
///////////////////////////
//DEPARTMENT  PROCEDURES//
/////////////////////////
*/

-- delete department by id 
Create PROCEDURE deleteDepartment @dept_id INT 
AS
	BEGIN TRY 
		DELETE FROM Department
		WHERE dept_id = @dept_id
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

---------------------------------

-- insert department 
CREATE PROCEDURE insertDepartment @dept_name NVARCHAR(20), @dept_location NVARCHAR(100), @mgr_hirdate DATE, @ins_id INT
AS
	BEGIN TRY
		INSERT INTO department 
		VALUES (@dept_name,@dept_location,@mgr_hirdate,@ins_id)
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
	
---------------------------------

-- select department by id 
CREATE PROCEDURE selectDepartment @d_id INT
AS
	BEGIN TRY 
		SELECT * FROM department
		WHERE dept_id = @d_id
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

---------------------------------

--update Department by id
CREATE PROCEDURE updateDepartment @d_id INT, @dept_name NVARCHAR(20), @dept_location NVARCHAR(100), @mgr_hiredate DATE, @ins_id INT
AS
	BEGIN TRY 
		UPDATE department
		SET dept_name = @dept_name,dept_location =@dept_location,mgr_hiredate = @mgr_hiredate,ins_id = @ins_id
		WHERE dept_id = @d_id
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

/**********************************************************************************************************/
/**********************************************************************************************************/
/*
///////////////////////////
//INSTRUCTOR  PROCEDURES//
/////////////////////////
*/

-- Select Instructor By Id
CREATE PROCEDURE SelectInstructorById
  @ins_id INT
AS
BEGIN
  BEGIN TRY
    SELECT * FROM Instructors i WHERE ins_id = @ins_id;
  END TRY
  BEGIN CATCH
    SELECT 'Error'
  END CATCH
END;

---------------------------------

-- Insert Instructor
CREATE PROCEDURE InsertInstructor
  @ins_name VARCHAR(50),
  @ins_phone VARCHAR(20),
  @dept_id INT
AS
BEGIN
  BEGIN TRY
    INSERT INTO Instructors (ins_name, ins_phone, dept_id)
    VALUES (@ins_name, @ins_phone, @dept_id);
  END TRY
  BEGIN CATCH
    SELECT 'Error'
  END CATCH
END;

---------------------------------

-- Update Instructor
CREATE PROCEDURE UpdateInstructor
  @ins_id INT,
  @ins_name VARCHAR(100),
  @ins_phone VARCHAR(15),
  @dept_id INT
AS
BEGIN
  BEGIN TRY
    UPDATE Instructors
    SET ins_name = @ins_name,
        ins_phone = @ins_phone,
        dept_id = @dept_id
    WHERE ins_id = @ins_id;
  END TRY
  BEGIN CATCH
    SELECT 'Error'
  END CATCH
END;

---------------------------------

-- Delete Instructor By Id
CREATE PROCEDURE DeleteInstructorById
  @ins_id INT
AS
BEGIN
  BEGIN TRY
    DELETE FROM Instructors WHERE ins_id = @ins_id;
  END TRY
  BEGIN CATCH
    SELECT 'Error'
  END CATCH
END;

/**********************************************************************************************************/
/**********************************************************************************************************/
/*
/////////////////////
//TOPIC  PROCEDURES/
///////////////////
*/

--SELECT TOPIC
CREATE PROCEDURE SelectTopicById
    @topic_id INT
AS
BEGIN TRY
    SELECT * FROM Topics WHERE topic_id = @topic_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--INSERT TOPIC
CREATE PROCEDURE InsertTopic
    @topic_name NVARCHAR(50)
AS
BEGIN TRY
    INSERT INTO Topics (topic_name) VALUES (@topic_name);
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--Delete Topic
CREATE PROCEDURE DeleteTopic
    @topic_id INT
AS
BEGIN TRY
    DELETE FROM Topic WHERE topic_id = @topic_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--Update Topic
CREATE PROCEDURE UpdateTopic
    @topic_id INT,@topic_desc VARCHAR(MAX)
AS
BEGIN TRY
    UPDATE Topics SET Topic_Description=@topic_desc WHERE topic_id = @topic_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

UpdateTopic 1,'DESIGNING WEB PAGES'
/**********************************************************************************************************/
/**********************************************************************************************************/
/*
/////////////////////
//EXAM  PROCEDURES//
///////////////////
*/

-- Select Exam
CREATE PROCEDURE sp_GetExamDetails 
@Exam_ID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Exam WHERE Exam_ID = @Exam_ID
    END TRY
    BEGIN CATCH
        SELECT 'Error'
    END CATCH
END

---------------------------------

-- Insert Exam 
CREATE PROCEDURE sp_InsertExam 
@ExamDate date,
@ExamTime time(7)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Exam (ExamDate, ExamTime) VALUES (@ExamDate, @ExamTime)
    END TRY
    BEGIN CATCH
        SELECT 'Error'
    END CATCH
END

---------------------------------

--Update Exam 
CREATE PROCEDURE sp_UpdateExam 
@Exam_ID int,
@ExamDate date,
@ExamTime time(7)
AS
BEGIN
    BEGIN TRY
        UPDATE Exam SET ExamDate = @ExamDate, ExamTime = @ExamTime WHERE Exam_ID = @Exam_ID
    END TRY
    BEGIN CATCH
        SELECT 'Error'
    END CATCH
END

---------------------------------

-- Delete Exam   
CREATE PROCEDURE sp_DeleteExam 
@Exam_ID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM Exam WHERE Exam_ID = @Exam_ID
    END TRY
    BEGIN CATCH
        SELECT 'Error'
    END CATCH
END

/**********************************************************************************************************/
/**********************************************************************************************************/
/*
/////////////////////////
//QUESTION  PROCEDURES//
///////////////////////
*/
-- Select Question By Id
CREATE PROCEDURE SelectQuestionById
    @q_id INT
AS
BEGIN TRY
    SELECT * FROM Questions WHERE Q_ID = @q_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--Insert Question
CREATE PROCEDURE InsertQuestion
    @q_text VARCHAR(50),
    @q_type VARCHAR(50),
    @q_modelanswer VARCHAR(50),
    @crs_id INT
AS
BEGIN TRY
    INSERT INTO Questions (Q_Text, Q_Type, Q_ModelAnswer, Crs_ID) 
    VALUES (@q_text, @q_type, @q_modelanswer, @crs_id);
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--Update Question
CREATE PROCEDURE UpdateQuestion
    @q_id INT,
    @q_text VARCHAR(50),
    @q_type VARCHAR(50),
    @q_modelanswer VARCHAR(50),
    @crs_id INT
AS
BEGIN TRY
    UPDATE Questions 
    SET Q_Text = @q_text, Q_Type = @q_type, 
    Q_ModelAnswer = @q_modelanswer, Crs_ID = @crs_id 
    WHERE Q_ID = @q_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH

---------------------------------

--Delete Question
CREATE PROCEDURE DeleteQuestion
    @q_id INT
AS
BEGIN TRY
    DELETE FROM Questions WHERE Q_ID = @q_id;
END TRY
BEGIN CATCH
    SELECT 'Error'
END CATCH
/**********************************************************************************************************/
/**********************************************************************************************************/
/**********************************************************************************************************/
/**********************************************************************************************************/

/*
////////////////////////
//REPORTS  PROCEDURES//
//////////////////////
*/

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

---------------------------------

/*Report that takes exam number and returns the Questions in it and chocies*/
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

---------------------------------

/*Report that takes exam number and the student ID then returns the Questions in this exam with the student answers*/

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

---------------------------------

/* Report that takes the student ID and returns the grades of the student in all courses % */

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

--------------------------------- 

/* Report that takes course ID and returns its topics */
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

---------------------------------

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

/**********************************************************************************************************/
/**********************************************************************************************************/
/**********************************************************************************************************/
/**********************************************************************************************************/

/*
//////////////////////////////
//GENERATE EXAM  PROCEDURES//
////////////////////////////
*/


CREATE PROCEDURE Generate_Exam @Crs_id INT,@MCQ_NO INT=7,@TF_NO INT=3
 AS 
   BEGIN 
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
   END 

---------------------------------

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
	END  TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

---------------------------------

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
    
---------------------------------

/*
/////////////////////////////////////////
//GENERATE EXAM CORRECTION  PROCEDURES//
///////////////////////////////////////
*/
CREATE PROCEDURE Generate_Exam_Correction @Exam_id INT,@Std_ID INT,@crs_id int
 AS 
	BEGIN TRY
			DECLARE @std_grade INT=0
			SELECT @std_grade = COUNT(*)*10 FROM ExamAnswer ea , Questions q
			WHERE q.Q_ID=ea.Q_id AND ea.Exam_id=@Exam_id AND ea.Std_id=@Std_ID AND q.Q_ModelAnswer=ea.St_Answer
   
			UPDATE Student_Courses
			SET Std_Grade = @std_grade
			WHERE Std_ID = @Std_ID AND Crs_ID=@crs_id
	END TRY
	BEGIN CATCH
			SELECT 'Error'
	END CATCH


   
   
   
