class App
  attr_reader :items

  def initialize
    @items = []
  end

  def options(answer) # rubocop:disable Metrics/CyclomaticComplexity/
    case answer
    when 1 then 'List all books'
    when 2 then 'List all music albums'
    when 3 then 'List of games'
    when 4 then "List all genres (e.g 'Comedy', 'Thriller')"
    when 5 then "List all labels (e.g. 'Gift', 'New')"
    when 6 then "List all authors (e.g. 'Stephen King')"
    when 7 then 'Add a book'
    when 8 then 'Add a music album'
    when 9 then 'Add a game'
    else 'That was not a valid answer'
    end
  end
end
