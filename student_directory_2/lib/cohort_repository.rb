require_relative './cohort.rb'
require_relative './student.rb'

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.id,
    cohorts.name AS "name",
    cohorts.starting_date AS "start_date",
    students.id AS "student_id",
    students.name AS "student_name"
    FROM cohorts
    	JOIN students ON students.cohort_id = cohorts.id
    WHERE cohorts.id = $1;'
    
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    cohort = Cohort.new
    cohort.id = result.first['id']
    cohort.name = result.first['name']
    cohort.name = result.first['start_date']

    result.each do |record|
      student = Student.new
      student.id = record['student_id']
      student.name = record['student_name']

      cohort.students << student
    end
    return cohort
  end
end