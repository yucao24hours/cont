require "pry"

class ContentfulClient
  attr_reader :entries

  def initialize
    @client = Contentful::Management::Client.new(ENV['CTF_CMA_ACCESS_TOKEN'])
    @blog_space = @client.spaces.find(ENV['CTF_SPACE_ID'])
    @environment = @blog_space.environments.find('master')
    @entries = @environment.content_types.find(ENV['CTF_CONTENT_TYPE_ID']).entries
  end
end
