require_relative "../contentful_uploader"
require_relative "../blog_post"
require "pry"

describe "ContentfulUploader" do
  let(:entries) { spy("entries") }
  let(:uploader) { ContentfulUploader.new(entries) }
  let(:blog_post) {
    BlogPost.new(
      title: "Example post",
      body: "Hello! This is example.",
      source_file_name: "2018-01-01-example-post",
      created_at: "2018-01-01 12:00:00 +0900"
    )
  }

  describe "#upload!" do
    it "" do
      uploader.upload!(blog_post)

      expect(entries).to have_received(:create).with(
        title: "Example post",
        body: "Hello! This is example.",
        sourceFileName: "2018-01-01-example-post",
        createdAt: "2018-01-01 12:00:00 +0900"
      )
    end
  end
end
