use clg;

-- Cross join.

select * from clg.course
join student;
select * from fee;
select* from student;

-- full join.

Select * from course c
left join student s
on c.course_id = s.name
union
select * from course c
right join student s
on c.course_id = s.name;

