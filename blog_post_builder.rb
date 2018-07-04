require "pry"
require "time"
require_relative "./blog_post"

class BlogPostBuilder
  def build(blog_post_hash)
    # いったんここで File.read して
    # あとから別のメソッドにする
    # ここでは new するだけにしたい
    # まずはひとつの json を扱えるようにして
    # そのあと（どこかで）Dir.glob するなりするようにする
    # なのでいったん File.read の引数はハードコーディング

    BlogPost.new(
      title: blog_post_hash["title"],
      body: blog_post_hash["bodyContent"],
      source_file_name: File.basename(blog_post_hash["sourceBase"], ".html.md"),
      created_at: created_at(blog_post_hash["sourceBase"])
    )
  end

  def parsed
    # 毎回ファイルを読み込まれているので効率が悪い
    # ディレクトリをハードコーディングするとテストするとき
    # テストデータに差し替えづらいので、
    # パスを引数として受け渡す方式のほうがよさそう
    JSON.parse(File.read("dist/2018-04-17-nipo.html.json"))
  end

  private

  def created_at(source_base)
    Time.parse(source_base.match(/([\d]{4})-([\d]{2})-([\d]{2})/).to_s).to_s
  end
end
