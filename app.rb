require_relative './Classes/list_data'
require_relative './Classes/add_game'
require_relative './Classes/list_games'
require_relative './Classes/list_authors'
require_relative './Classes/list_musicalbums'
require_relative './Classes/add_musicalbum'
require_relative './Classes/list_genre'
require_relative './Classes/list_books'
require_relative './Classes/list_labels'
require_relative './Classes/add_book'
require_relative './Classes/data_genre'
require './Classes/data_author'
require_relative './Classes/data_label'

class App
  attr_reader :items, :labels, :genres, :authors

  def initialize
    @items = []
    @labels = LabelData.read_data || []
    @genres = GenreData.read_data || []
    @authors = AuthorData.read_data || []
  end

  def options(answer) # rubocop:disable Metrics/CyclomaticComplexity/
    case answer
    when '0' then ListBooks.new.list_books(@items)
    when '1' then ListMusicalbums.new.list_musicalbums(@items)
    when '2' then ListGames.new.list_items(@items)
    when '3' then ListGenre.new.list_genres(@genres)
    when '4' then ListLabels.new.list_labels(@labels)
    when '5' then ListAuthors.new.list_authors(@authors)
    when '6' then AddBook.new.make_item(self)
    when '7' then AddMusicalbum.new.make_item(self)
    when '8' then AddGame.new.make_item(self)
    when '9', 'quit', 'q', 'exit' then puts
    else puts 'That was not a valid option'
    end
  end

  def app_save
    GenreData.save_data(@genres)
    AuthorData.save_data(@authors)
    LabelData.save_data(@labels)
  end
end
