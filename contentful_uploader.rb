require 'dotenv/load'
require 'contentful/management'
require 'pry'

# Contentful にべた書きの何かが投稿できる
# 手元の markdown をもとにした　JSON を使って投稿できる

# client = Contentful::Management::Client.new(ENV['CTF_CMA_ACCESS_TOKEN'])
# blog_space = client.spaces.find(ENV['CTF_SPACE_ID'])
# environment = blog_space.environments.find('master')
# blog_post_content_type = environment.content_types.find(ENV['CTF_CONTENT_TYPE_ID'])
# 
# created_entry = blog_post_content_type.entries.create(
#   title: 'titletest',
#   body: 'bodytest',
#   sourceFileName: 'filenametest',
#   createdAt: DateTime.now.to_s
# )
# created_entry.publish

class ContentfulUploader
  def initialize(entries)
    @entries = entries
  end

  def client
    @client ||= Contentful::Management::Client.new(ENV['CTF_CMA_ACCESS_TOKEN'])
  end

  def blog_space
    @blog_space ||= client.spaces.find(ENV['CTF_SPACE_ID'])
  end

  def environment
    @environment ||= blog_space.environments.find('master')
  end

  def entries
    @entries ||= environment.content_types.find(ENV['CTF_CONTENT_TYPE_ID']).entries
  end

  # upload! をよんだときに、
  # create のパラメータに blog_post の各値を渡されてよばれたかを
  # テストする、というふうにかける
  # have_recieved というのをつかえる
  def upload!(blog_post)
    entries.create(
      title: blog_post.title,
      body: blog_post.body,
      sourceFileName: blog_post.source_file_name,
      createdAt: blog_post.created_at
    )
  end
end
