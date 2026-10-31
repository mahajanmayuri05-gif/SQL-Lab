create database clg;

use clg;

-- ---------- Student ----------
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    city       VARCHAR(50)
);
 
INSERT INTO Student (student_id, name, city) VALUES
(1, 'Asha',  'Pune'),
(2, 'Ravi',  'Mumbai'),
(3, 'Meera', 'Pune'),
(4, 'Kiran', 'Nagpur'),
(5, 'Sana',  'Mumbai'),
(6, 'Dev',   'Pune');
 
-- ---------- Course ----------
CREATE TABLE Course (
    course_id       VARCHAR(5) PRIMARY KEY,
    course_name     VARCHAR(50) NOT NULL,
    duration_months INT,
    total_fee       INT
);
 
INSERT INTO Course (course_id, course_name, duration_months, total_fee) VALUES
('C1', 'SQL',      2, 15000),
('C2', 'Excel',    1,  8000),
('C3', 'Python',   3, 25000),
('C4', 'Power BI', 2, 18000);
 
-- ---------- Enrollment ----------
CREATE TABLE Enrollment (
    enroll_id   VARCHAR(5) PRIMARY KEY,
    student_id  INT        NOT NULL,
    course_id   VARCHAR(5) NOT NULL,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);
 
INSERT INTO Enrollment (enroll_id, student_id, course_id, enroll_date) VALUES
('E1', 1, 'C1', '2026-01-10'),
('E2', 1, 'C2', '2026-02-05'),
('E3', 2, 'C1', '2026-01-15'),
('E4', 3, 'C3', '2026-02-01'),
('E5', 3, 'C1', '2026-02-10'),
('E6', 4, 'C2', '2026-03-01'),
('E7', 5, 'C3', '2026-03-05'),
('E8', 2, 'C3', '2026-03-12');
 
-- ---------- Fee ----------
CREATE TABLE Fee (
    fee_id       VARCHAR(5) PRIMARY KEY,
    enroll_id    VARCHAR(5) NOT NULL,
    amount_paid  INT,
    payment_date DATE,
    mode         VARCHAR(10),
    FOREIGN KEY (enroll_id) REFERENCES Enrollment(enroll_id)
);
 
INSERT INTO Fee (fee_id, enroll_id, amount_paid, payment_date, mode) VALUES
('F1', 'E1', 15000, '2026-01-10', 'UPI'),
('F2', 'E2',  4000, '2026-02-05', 'Cash'),
('F3', 'E2',  4000, '2026-02-20', 'UPI'),
('F4', 'E3', 10000, '2026-01-15', 'Card'),
('F5', 'E4', 25000, '2026-02-01', 'UPI'),
('F6', 'E5', 15000, '2026-02-10', 'Cash'),
('F7', 'E6',  8000, '2026-03-01', 'Card'),
('F8', 'E7', 12000, '2026-03-05', 'UPI');
 
-- ---------- Quick check ----------
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Fee;


-- Students and their course
Select s.name, c.course_name from student s
inner join enrollment e
on s.student_id = e.student_id
inner join course c
on e.course_id = c.course_id;

-- 1. show student name and enroll_date for every enrollment.

Select name,enroll_date from student s
inner join enrollment e
on s.student_id = e.student_id;

-- 2. show the course_name and enroll_date for every enrollment.

Select course_name, enroll_date from course c
inner join enrollment e
on c.course_id = e.course_id;

-- 3. show the student name and course name for every enrollment.alter

select name,course_name from student s
inner join enrollment e
on s.student_id = e.student_id
inner join course c
on e.course_id = c.course_id;

-- 4. show the enroll_id and amount_paid for every payment.

Select enroll_id, amount_paid from fee;

-- 5. show the student name and amount_paid for every payment.

select name, amount_paid from student s
inner join enrollment e
on s.student_id = e.student_id
inner join fee f
on e.enroll_id = f.enroll_id;

-- 6. show the course name and total amount paid for every payment.
select course_name,amount_paid from course c
inner join enrollment e
on c.course_id = e.course_id
inner join fee f
on e.enroll_id = f.enroll_id;

-- 7. Show the student name, course_name and amount_paid for every payment .

select name,course_name, amount_paid from student s
inner join enrollment e
on s.student_id = e.student_id
inner join course c 
on e.course_id = c.course_id
inner join fee f
on e.enroll_id = f.enroll_id;

-- 8. Show all students with the courses they enrolled in, including students who have not enrolled anywhere.

Select name, course_name from student s
left join enrollment e
on s.student_id = e.student_id
left join course c
on e.course_id = c.course_id;

-- 9. Show all courses with the names of students enrolled, including courses that have no students.
SELECT c.course_name, s.student_name FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
LEFT JOIN students s
ON e.student_id = s.student_id;

-- 10. Show every enrollment with its payments, including enrollments that have no payment yet.

SELECT e.enroll_id, e.student_id, e.course_id FROM enrollment e
LEFT JOIN fee f
ON e.enroll_id = f.enroll_id;


-- 11. show the name of students from pune who enrolled in the sql course.
select s.name, c.course_name from student s
inner join enrollment e
on s.student_id = e.student_id
inner join course c 
on e.course_id = c.course_id
where s.city = "Pune";

-- 12--
Select s.name, sum(f.amount_paid) from student s
inner join enrollment e
on s.student_id = e.student_id
inner join fee f
on e.enroll_id = f.enroll_id
group by s.name
order by sum(f.amount_paid) desc
limit 1;

-- 13. show the number of students enrolled in each course
-- 14. show the most popular course first

select e.course_id, count(*) from student s
inner join enrollment e
group by e.course_id
order by count(*) desc
limit 1 ;

Select s.name from student s
inner join enrollment e
on e.student_id = s.student_id
group by s.student_id, s.name
having count(e.course_id) > 1;

-- 15. show the total fee collected per course, but only for courses where the total is above 20000.

select c.course_name, sum(f.amount_paid) as fees_paid from course c
inner join enrollment e
on c.course_id = e.course_id
inner join fee f
on e.enroll_id = f.enroll_id
group by c.course_name
having sum(f.amount_paid)>20000;

-- 16. show the total amount collected for each payment mode, from highest to lowest.

Select f.mode, sum(f.amount_paid) as total_amount from fee f
inner join enrollment e
on f.enroll_id = e.enroll_id
group by f.mode
order by total_amount desc;

-- 17. show the course that have no enrollment at all
select c.course_name from course c
left join enrollment e
on c.course_id = e.course_id
where e.course_id is null;



-- 18 .show the total fee collected per city, only for cities where the total is above 15000
Select s.city, sum(f.amount_paid) from student s
inner join enrollment e
on s.student_id = e.student_id
inner join fee f
on e.enroll_id = f.enroll_id
group by s.city
having sum(f.amount_paid)>15000;


-- 19. show the top 3 student by total amount paid.
select s.name,sum(f.amount_paid) from student s
inner join enrollment e
on s.student_id = e.student_id
inner join fee f
on e.enroll_id = f.enroll_id
group by s.student_id, s.name 
order by sum(f.amount_paid) desc limit 3;