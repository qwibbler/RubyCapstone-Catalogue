require_relative './list_data'
require_relative './author'

class ListAuthors < ListData
  def list_authors(data)
    return puts "No Authors found\n\n" if data.empty?

    data.each_with_index do |author, index|
      list(index, { 'First name' => author.first_name, 'Last name' => author.last_name })
    end
  end
end
