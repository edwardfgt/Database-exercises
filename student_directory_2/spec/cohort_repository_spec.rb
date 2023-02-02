require 'cohort_repository'

def reset_tables
  seed_sql = File.read('spec/seeds_studentcohort.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
  connection.exec(seed_sql)
end
describe CohortRepository do
  before(:each) do 
    reset_tables
  end

  it "Finds cohort 1 with related students" do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)

    expect(cohort.name).to eq('January 2023')
    expect(cohort.students.length).to eq 2
  end
end
