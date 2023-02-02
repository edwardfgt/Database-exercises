require_relative './tag.rb'
require_relative './post.rb'

class TagRepository
  def find_by_post(id)
    sql = 'SELECT posts.id,
    posts.title AS "title",
    tags.id AS "tag_id",
    tags.name AS "tag_name"
    FROM posts
		JOIN posts_tags ON posts_tags.post_id = posts.id
		JOIN tags ON posts_tags.tag_id = tags.id
		WHERE posts.id = $1;'
    
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    post = Post.new
    post.id = result.first['id']
    post.title = result.first['title']

    result.each do |record|
      tag = Tag.new
      tag.id = record['tag_id']
      tag.name = record['tag_name']
      post.tags << tag
    end

    return post
  end

end