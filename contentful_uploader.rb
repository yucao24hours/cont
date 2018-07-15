require 'dotenv/load'
require 'contentful/management'
require 'pry'

class ContentfulUploader
  def initialize(entries)
    @entries = entries
  end

  def upload!(blog_post)
    @entries.create(
      title: blog_post.title,
      body: blog_post.body,
      sourceFileName: blog_post.source_file_name,
      createdAt: blog_post.created_at
    )
  end
end
