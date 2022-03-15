require './Classes/list_data'
require_relative './Classes/add_game'
require_relative './Classes/list_games'
require_relative './Classes/list_authors'

class App
  attr_reader :items, :labels, :genres, :authors

  def initialize
    @items = []
    @labels = []
    @genres = []
    @authors = []
  end

  def options(answer) # rubocop:disable Metrics/CyclomaticComplexity/
    case answer
    when '0' then ListBooks.new.list(@items)
    when '1' then 'List all music albums'
    when '2' then ListGames.new.list_items(@items)
    when '3' then "List all genres (e.g 'Comedy', 'Thriller')"
    when '4' then ListLabels.new.list(@items)
    when '5' then ListAuthors.new.list_authors(@authors)
    when '6' then "Add a book"
    when '7' then "Add a music album"
    when '8' then AddGame.new.make_item(self)
    else 'That was not a valid answer'
    end
  end
end
