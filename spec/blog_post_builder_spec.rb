require_relative "../blog_post"
require_relative "../blog_post_builder"

describe "BlogPostBuilder" do
  let(:builder) { BlogPostBuilder.new }

  #describe "#build" do
  #  it do
  #    blog_post = builder.build

  #    expect(blog_post.title).to eq "aaa"
  #    expect(blog_post.body).to eq "Hello! This is example"
  #    expect(blog_post.source_file_name).to eq "2018-01-01-example-post"
  #    expect(blog_post.created_at).to eq "2018-01-01 12:00:00 +0900"
  #  end
  #end

  describe "#parsed" do
    it do
      parsed = builder.parsed
      expect(parsed).to be
    end
  end

  describe "#created_at" do
    it "yyyy-mm-dd-slug の文字列を受け取り、yyyy-mm-dd のタイムゾーン付き文字列を返すこと" do
      expect(builder.created_at("2018-01-01-example")).to eq "2018-01-01 00:00:00 +0900"
    end
  end
end
