
-- Q8} i.

SELECT DISTINCT i.ID, i.name, teaches.course_id, c.title FROM instructor AS i, teaches, course AS c, section AS s
WHERE i.ID in (SELECT ID FROM instructor WHERE dept_name = 'Comp. Sci.') 
AND i.ID = teaches.ID AND teaches.course_id = c.course_id
AND c.course_id = s.course_id AND c.dept_name = 'Civil Engg.'
and s.year = '2009' 
ORDER BY i.name ASC;

-- 8} ii.
-- First Inserting 2 courses 'CS-303' and 'CS-333'
INSERT INTO course(course_id, title, dept_name, credits) VALUES ('CS-303','Databases and Information Systems','Comp. Sci.','6');
INSERT INTO course(course_id, title, dept_name, credits) VALUES ('CS-333','Operating Systems','Comp. Sci.','6');
-- Now inserting the required entry into the prereq table
INSERT INTO prereq(course_id, prereq_id) VALUES ('CS-333','CS-303');


-- 8} iii.

WITH updated_salaries (Name, Updated_Salary) AS
(SELECT inst.name, inst.salary as New_Salary FROM instructor as inst,department
WHERE inst.dept_name = department.dept_name AND department.budget > 90000)
-- Updating Instructor Table as per requirements
UPDATE instructor SET salary = salary * 1.1 WHERE instructor.name IN (SELECT Name FROM updated_salaries);
SELECT instructor.ID,instructor.name,instructor.dept_name,instructor.salary FROM instructor,department 
WHERE instructor.dept_name = department.dept_name AND department.budget > 90000;

-- 8} iv.

WITH selected_courses(Course_ID,Title,num_students) AS 
(SELECT course.course_id,course.title,count(student.ID) FROM course,student,section,takes 
WHERE course.course_id = section.course_id AND section.semester = 'Fall' 
AND section.year = '2007' AND section.sec_id = takes.sec_id 
AND student.ID = takes.ID AND takes.course_id = course.course_id
GROUP BY course.course_id)
-- Displaying all such courses which have 15+ students undertaking it in the year 2007
SELECT Course_ID,Title,num_students FROM selected_courses WHERE num_students > 15
ORDER BY Course_ID ASC;