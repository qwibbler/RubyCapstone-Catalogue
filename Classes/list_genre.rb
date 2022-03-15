require_relative './list_data'

class ListGenre < ListData
  def list_genres(data)
    return puts "No Genres found\n\n" if data.empty?

    data.each_with_index { |genre, index| list(index, { 'Name' => genre.name }) }
  end
end
