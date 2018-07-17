class BlogPost
  attr_reader :title, :body, :source_file_name, :date

  def initialize(title:, body:, source_file_name:, date:)
    @title = title
    @body = body
    @source_file_name = source_file_name
    @date = date
  end
end
