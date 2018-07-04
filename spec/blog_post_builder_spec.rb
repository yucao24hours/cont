require 'json'
require_relative "../blog_post"
require_relative "../blog_post_builder"

describe "BlogPostBuilder" do
  let(:builder) { BlogPostBuilder.new }

  describe "#build" do
    let(:blog_post_hash) {
      {
        "title" => "これはタイトルです",
        "bodyContent" => "これは *Markdown* 形式の本文です",
        "sourceBase" => "2018-01-01-hello-example.html.md",
      }
    }

    it "引数で受け取ったデータをもとに BlogPost オブジェクトを作成し返すこと" do
      blog_post = builder.build(blog_post_hash)

      expect(blog_post.title).to eq "これはタイトルです"
      expect(blog_post.body).to eq "これは *Markdown* 形式の本文です"
      expect(blog_post.source_file_name).to eq "2018-01-01-hello-example"
      expect(blog_post.created_at).to eq "2018-01-01 00:00:00 +0900"
    end
  end

  # # XXX これはこのクラス外でやる
  # describe "#parsed" do
  #   it do
  #     parsed = builder.parsed
  #     expect(parsed).to be
  #   end
  # end
end
