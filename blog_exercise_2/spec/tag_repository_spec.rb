require 'tag_repository'


describe TagRepository do
  it "Finds all tags for a given tag" do
    repo = TagRepository.new
    posts = repo.find_by_post(2)
    expect(posts.tags.length).to eq 2
    expect(posts.title).to eq "Ruby classes"
  end
end