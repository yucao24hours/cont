require "pry"
require "time"
require_relative "./blog_post"

class BlogPostBuilder
  def build(blog_post_hash)
    BlogPost.new(
      title: blog_post_hash["title"],
      body: blog_post_hash["bodyContent"],
      source_file_name: File.basename(blog_post_hash["sourceBase"], ".html.md"),
      date: date(blog_post_hash["sourceBase"])
    )
  end

  private

  def date(source_base)
    Time.parse(source_base.sub(/(\A[\d]{4}-[\d]{2}-[\d]{2}).*/){ $1 }).to_s
  end
end
