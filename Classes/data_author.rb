require_relative './author'
require 'json'

class AuthorData
  def self.path
    './Data/authors.json'
  end

  def self.read_data
    authors_arr = []
    if File.exist?(AuthorData.path)
      authors_arr = JSON.parse(File.read(AuthorData.path)).map { |obj|
        Author.new(obj['first_name'], obj['last_name'], obj['id'])
      }
    end
    authors_arr
  end

  def self.save_data(authors)
    authors_data = []
    authors_data = authors.map { |author|
      { id: author.id, first_name: author.first_name, last_name: author.last_name } }
    File.write(AuthorData.path, JSON.generate(authors_data))
  end
end