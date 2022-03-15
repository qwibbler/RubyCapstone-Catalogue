require_relative './list_data'
require_relative './author'

class ListAuthors < ListData
  def list_authors(data)
    return puts "No Labels found\n\n" if data.empty?

    data.each_with_index do |author, index|
      list(index, { 'first name' => author.first_name, 'last name' => author.last_name })
    end
  end
end
