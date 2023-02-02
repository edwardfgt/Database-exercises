require 'post_repository'


def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
  connection.exec(seed_sql)
end
describe PostRepository do
  before(:each) do 
    reset_tables
  end

  it "Finds post 1 with related comments" do
    repo = PostRepository.new
    post = repo.find_with_comments(1)
    expect(post.title).to eq('Blog 01')
    expect(post.comments.length).to eq 2
    expect(post.comments[1].author).to eq "John"
  end
end