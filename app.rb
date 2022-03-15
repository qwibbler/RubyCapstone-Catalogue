require_relative './Classes/list_musicalbums'
require_relative './Classes/add_musicalbum'
require_relative './Classes/list_genre'
require './Classes/list_books'
require './Classes/list_labels'
require './Classes/add_book'

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
    when '0' then ListBooks.new.list_books(@items)
    when '1' then ListMusicalbums.new.list_musicalbums(@items)
    when '2' then 'List of games'
    when '3' then ListGenre.new.list_genres(@genres)
    when '4' then ListLabels.new.list_labels(@labels)
    when '5' then "List all authors (e.g. 'Stephen King')"
    when '6' then AddBook.new.make_item(self)
    when '7' then AddMusicalbum.new.make_item(self)
    when '8' then 'Add a game'
    else 'That was not a valid answer'
    end
  end
end
