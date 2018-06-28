class BlogPost
  attr_reader :title, :body, :source_file_name, :created_at

  def initialize(title:, body:, source_file_name:, created_at:)
    @title = title
    @body = body
    @source_file_name = source_file_name
    @created_at = created_at
  end
end
