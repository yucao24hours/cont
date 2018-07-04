require_relative "./blog_post_builder.rb"
require_relative "./contentful_uploader.rb"
# ARGV とかで JSON のありかのディレクトリを文字列で指定できるようにするといいかも（デフォルトの位置は決めておいて、「指定することもできるよ」という状態にする
# 変えられないところはなるべく少なくしておくべき
blog_post_builder = BlogPostBuilder.new
uploader = ContentfulUploader.new(entries)

# Dir.glob("どこか") do |filename|
  json = File.read("dist/2018-01-01-example-post.html.json")
  post = blog_post_builder.build(JSON.parse(json))
  uploader.upload!(post)
# end
