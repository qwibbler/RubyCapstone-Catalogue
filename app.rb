require_relative './Classes/list_musicalbums'
require_relative './Classes/add_musicalbum'

class App
  attr_reader :items

  def initialize
    @items = []
  end

  def options(answer) # rubocop:disable Metrics/CyclomaticComplexity/
    case answer
    when '0' then ListBooks.new.list(@items)
    when '1' then ListMusicalbums.new.list_musicalbums(@items)
    when '2' then 'List of games'
    when '3' then "List all genres (e.g 'Comedy', 'Thriller')"
    when '4' then 'List of labels'
    when '5' then "List all authors (e.g. 'Stephen King')"
    when '6' then 'Add a book'
    when '7' then AddMusicalbum.new.make_item(self)
    when '8' then 'Add a game'
    else 'That was not a valid answer'
    end
  end
end
