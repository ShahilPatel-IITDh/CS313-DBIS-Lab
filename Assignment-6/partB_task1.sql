-- Creating database named Library
CREATE database Library;

-- Creating a new user 'project_1' and granting him all access to the Library database
CREATE USER 'project_1'@'localhost' identified by 'pass';
GRANT ALL PRIVILEGES on Library.* to 'project_1'@'localhost';

--Connecting to the Library database
use Library;

-- Creating the required Tables -> books, student, issue
CREATE TABLE books (
     book_id int,
     title varchar(20),
     category varchar(10),
     author varchar(15),
     PRIMARY KEY (book_id),
    );
CREATE TABLE student (
    student_id int,
    name varchar(15),
    dept_name varchar(15),
    year char(4),
    semester varchar(10),
    PRIMARY KEY (student_id)
    );
CREATE TABLE issue (
    student_id int,
    book_id int,
    issue_date varchar(10),
    return_date varchar(10),
    PRIMARY KEY (student_id,book_id,issue_date,return_date),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    );




