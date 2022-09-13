
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

UPDATE instructor
SET salary = salary*1.1
WHERE instructor.dept_name IN (SELECT dept_name FROM department WHERE department.budget >900000);

-- 8} iv.

SELECT course.course_id, course.title,COUNT(takes.ID) 
FROM takes, course 
where takes.course_id = course.course_id and takes.year =2007 and takes.semester ="Fall" 
GROUP BY course.course_id 
HAVING COUNT(takes.ID)>15
ORDER BY course.course_id ASC;