require_relative './author'
require 'json'

class AuthorData
  def self.path
    './Data/authors.json'
  end

  def self.read_data
    return [] unless File.exist?(AuthorData.path)

    JSON.parse(File.read(AuthorData.path)).map do |obj|
      Author.new(obj['first_name'], obj['last_name'], obj['id'])
    end
  end

  def self.save_data(authors)
    authors_data = authors.map do |author|
      { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
    File.write(AuthorData.path, JSON.generate(authors_data))
  end
end
