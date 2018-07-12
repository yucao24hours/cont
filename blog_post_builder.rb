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

  private

  def created_at(source_base)
    # Timezone を明示的に指定したほうがいい（TZ が違う PC でこのテストを実行したら落ちる）
    Time.parse(source_base.sub(/(\A[\d]{4}-[\d]{2}-[\d]{2}).*/){ $1 }).to_s
  end
end
