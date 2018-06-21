require_relative "../import"
require "pry"

describe "Contentful への投稿" do
  it "投稿できること" do
    client = double("Contentful Client")
    # client == Contentful::Management::Client.new で作られたものと同じもの
    allow(client).to recieve(:spaces)

    expect(blog_post_content_type.entries.create)
  end
end
