TRUNCATE TABLE students, cohorts RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES ('January 2023', '01/01/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('February 2023', '01/02/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('March 2023', '01/03/2023');
INSERT INTO students (name, cohort_id) VALUES ('Edward', '1');
INSERT INTO students (name, cohort_id) VALUES ('Cassius', '1');
INSERT INTO students (name, cohort_id) VALUES ('Fred', '2');