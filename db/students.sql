DROP TABLE students;

CREATE TABLE students(
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
house VARCHAR(255),
age INT4
);


-- INSERT INTO students
-- (first_name, second_name, house, age)
-- VALUES ('Harry', 'Potter', 'Gryffindor', 12);
--
-- INSERT INTO students
-- (first_name, second_name, house, age)
-- VALUES ('Draco', 'Malfoy', 'Slytherin', 11);
--
-- INSERT INTO students
-- (first_name, second_name, house, age)
-- VALUES ('Rowena', 'Ravenclaw', 'Ravenclaw', 350);
