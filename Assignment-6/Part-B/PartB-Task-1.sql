-- Creating database named Library
CREATE database Library;

-- Creating a new user 'project_1' and granting him all access to the Library database
CREATE USER 'library-1'@'localhost' identified by 'Password';
GRANT ALL PRIVILEGES on Library.* to 'library-1'@'localhost';

--Connecting to the Library database
use Library;

-- Creating the required Tables -> books, student, issue
CREATE TABLE books (
     book_id int(5),
     title varchar(20),
     category varchar(20),
     author varchar(20),
     PRIMARY KEY (book_id)
    );

CREATE TABLE student (
    student_id int(5),
    student_name varchar(20),
    dept_name varchar(20),
    student_year char(4),
    semester varchar(15),
    PRIMARY KEY (student_id)
    );

CREATE TABLE issue (
    student_id int(5),
    book_id int(5),
    issue_date varchar(12),
    return_date varchar(12),
    PRIMARY KEY (student_id, book_id, issue_date, return_date),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    );




