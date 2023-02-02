class Blog
  attr_accessor :id, :title, :content, :comments

  def initialize
    @comments = []
  end
end