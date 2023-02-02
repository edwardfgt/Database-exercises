require 'post_repository'


describe PostRepository do
  it "Finds all posts for a given tag" do
    repo = PostRepository.new
    tags = repo.find_by_tag(1)
    expect(tags.posts.length).to eq 4
    expect(tags.posts[0].title).to eq "How to use Git"
  end
end