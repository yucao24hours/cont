# ARGV とかで JSON のありかのディレクトリを文字列で指定できるようにするといいかも（デフォルトの位置は決めておいて、「指定することもできるよ」という状態にする
# 変えられないところはなるべく少なくしておくべき
builder = BlogPostBuilder.new
uploader = ContentfulUploader.new(entries)

Dir.glob("どこか") do |filename|
  post = builder.build(filename)
  uploader.upload!(post)
end
