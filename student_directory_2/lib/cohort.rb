class Cohort
  attr_accessor :id, :name, :starting_date

  def initialize
    @students = []
  end
end