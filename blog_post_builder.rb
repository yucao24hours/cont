require "pry"

class BlogPostBuilder
  def build
    # いったんここで File.read して
    # あとから別のメソッドにする
    # ここでは new するだけにしたい
    # まずはひとつの json を扱えるようにして
    # そのあと（どこかで）Dir.glob するなりするようにする
    # なのでいったん File.read の引数はハードコーディング
    BlogPost.new(
      title: parsed["title"],
      body: parsed["bodyContent"],
      source_file_name: File.basename(parsed["sourceBase"], ".html.md"),
      created_at: created_at(parsed["sourceBase"])
    )
  end

  def parsed
    # 毎回ファイルを読み込まれているので効率が悪い
    # ディレクトリをハードコーディングするとテストするとき
    # テストデータに差し替えづらいので、
    # パスを引数として受け渡す方式のほうがよさそう
    JSON.parse(File.read("dist/2018-04-17-nipo.html.json"))
  end

  # これは private でいい気がする
  def created_at(source_base)
    Time.parse(source_base.match(/([\d]{4})-([\d]{2})-([\d]{2})/).to_s).to_s
  end
end
