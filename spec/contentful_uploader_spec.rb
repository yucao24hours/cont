require_relative "../contentful_uploader"
require_relative "../blog_post"
require "pry"

describe "ContentfulUploader" do
  let(:entries) { spy("entries") }
  let(:uploader) { ContentfulUploader.new(entries) }
  let(:blog_post) {
    BlogPost.new(
      title: "これはタイトルです",
      body: "これは *Markdown* 形式の本文です",
      source_file_name: "2018-01-01-example",
      created_at: "2018-01-01 00:00:00 +0900"
    )
  }

  describe "#upload!" do
    it "BlogPost オブジェクトの値を使って API を叩くこと" do
      uploader.upload!(blog_post)

      expect(entries).to have_received(:create).with(
        title: "これはタイトルです",
        body: "これは *Markdown* 形式の本文です",
        sourceFileName: "2018-01-01-example",
        createdAt: "2018-01-01 00:00:00 +0900"
      )
    end
  end
end
