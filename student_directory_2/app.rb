require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'

# We need to give the database name to the method `connect`.
class Application
  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io 
    @cohort_repository = cohort_repository

  end

  def run
    @io.puts "Welcome to the student directory"
    @io.puts "please enter which cohort id you would like to view"
    input = @io.gets.chomp
    @io.puts "Cohort #{input} students"
    @io.puts "------------------------"

    @cohort_repository.find_with_students(input).students.each do |student|
      @io.puts "#{student.name}"
    end
    
  end
end


if __FILE__ == $0
  app = Application.new(
    'student_directory_2',
    Kernel,
    CohortRepository.new
  )
  app.run
end