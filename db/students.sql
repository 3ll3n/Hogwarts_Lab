DROP TABLE students;
DROP TABLE houses;


CREATE TABLE houses (
  id SERIAL4 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE students (
  id SERIAL4 primary key,
  first_name VARCHAR(255) not null,
  second_name VARCHAR(255) not null,
  house_id INT4 REFERENCES houses(id) not null,
  age INT4 not null
);
