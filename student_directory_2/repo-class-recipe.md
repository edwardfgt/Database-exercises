# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.


```
# EXAMPLE
Table: cohorts
Columns:
id | name | starting_date

Table: students
Columns:
id | name | cohort_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_studentdr2.sql)
-- Write your SQL seed here. 
-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)
TRUNCATE TABLE students, cohorts RESTART IDENTITY; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO cohorts (name, starting_date) VALUES ('January 2023', '01/01/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('February 2023', '01/02/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('March 2023', '01/03/2023');
INSERT INTO students (name, cohort_id) VALUES ('Edward', '1');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

class Student
end

class Cohort

class CohortRepository
end

Class
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

class Cohort
  attr_accessor :id, :name, :starting_date
end

class Student
  attr_accessor :id, :name, :cohort_id
end


```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students
# Repository class
# (in lib/user_repository.rb)
class CohortRepository
  def find_with_students
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES
# 1
# Get all students
repo = UserRepository.new
Users = repo.all
user.length # =>  3
user[0].id # => 1  
user[0].username # =>  'Edward'
user[0].email # =>  'edward@makers.com'
user[1].id # =>  2
user[1].username # =>  'Luke'
user[1].email # =>  'luke@makers.com'
# 2
# Get a single student
repo = UserRepository.new
user = repo.find(1)
user.id # =>  1
user.username # =>  'Edward'
user.email # =>  'edward@makers.com'
# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE
# file: spec/student_repository_spec.rb
def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end
describe StudentRepository do
  before(:each) do 
    reset_students_table
  end
  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._