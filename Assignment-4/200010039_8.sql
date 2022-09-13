
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

SELECT c.course_id, c.title, COUNT(takes.ID) 
FROM takes AS t, course AS c
WHERE t.course_id = c.course_id AND t.year = 2007 AND t.semester ="Fall" AND c.dept_name = "Comp. Sci."
GROUP BY c.course_id 
HAVING COUNT(t.ID)>15
ORDER BY c.course_id ASC;