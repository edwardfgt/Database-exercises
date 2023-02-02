require_relative './blog.rb'
require_relative './comment.rb'

class PostRepository
  def find_with_comments(id)
    sql = 'SELECT blogs.id,
    blogs.title AS "title",
    blogs.content AS "content",
    comments.id AS "comment_id",
    comments.content AS "comment_content",
    comments.author AS "comment_author"
    FROM blogs
    	JOIN comments ON comments.blog_id = blogs.id
    WHERE blogs.id = $1;'
    
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    blog = Blog.new
    blog.id = result.first['id']
    blog.title = result.first['title']
    blog.content = result.first['content']

    result.each do |record|
      comment = Comment.new
      comment.id = record['comment_id']
      comment.content = record['comment_content']
      comment.author = record['comment_author']

      blog.comments << comment
    end

    return blog

  end


end