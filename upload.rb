# ARGV とかで JSON のありかのディレクトリを文字列で指定できるようにするといいかも（デフォルトの位置は決めておいて、「指定することもできるよ」という状態にする
# 変えられないところはなるべく少なくしておくべき
blog_post_builder = BlogPostBuilder.new
uploader = ContentfulUploader.new(entries)

Dir.glob("どこか") do |filename|
  blog_post_hash = JsonParser.new.parse(filename) # 実質やるのは JSON.parse なのでべつにクラスにしなくてもいいだろうけど、ここにべた書きするのもなんなのでいったんこうしとく
  post = blog_post_builder.build(blog_post_hash)
  uploader.upload!(post)
end
