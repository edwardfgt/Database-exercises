require_relative './tag.rb'
require_relative './post.rb'

class PostRepository
  def find_by_tag(id)
    sql = 'SELECT posts.id,
    posts.title AS "title",
    tags.id AS "tag_id",
    tags.name AS "tag_name"
    FROM posts
		JOIN posts_tags ON posts_tags.post_id = posts.id
		JOIN tags ON posts_tags.tag_id = tags.id
		WHERE tags.id = $1;'
    
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    tag = Tag.new
    tag.id = result.first['tag_id']
    tag.name = result.first['name']

    result.each do |record|
      puts record
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      tag.posts << post
    end

    return tag
  end

end