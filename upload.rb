require_relative "./blog_post_builder.rb"
require_relative "./contentful_uploader.rb"
require_relative "./contentful_client.rb"

uploader = ContentfulUploader.new(ContentfulClient.new.entries)

# Dir.glob("どこか") do |filename|
json = File.read("dist/2018-01-01-example-post.html.json")
post = blog_post_builder.build(JSON.parse(json))
uploader.upload!(post)
# end
