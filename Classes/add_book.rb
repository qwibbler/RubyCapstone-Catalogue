require_relative './book'

class AddBook
  def make_book(app)
    puts "Creating a new Book...\n\n"
    print 'Who was the Publisher? '
    publisher = gets.chomp
    print 'What date was it published on? (YYYY-MM-DD) '
    publish_date = gets.chomp
    print 'What state is the cover in? '
    cover_state = gets.chomp
    @book = Book.new(publisher, cover_state, publish_date)
    app.items << @book
    print 'Book created! Would you like to add more details? [Y/N] '
    more if answer_yes(gets.chomp)
  end

  def answer_yes?(answer)
    %w[y yes].include?(answer.downcase)
  end

  def add(something)
    puts "Would you like to add #{something}? [Y/N]"
    answer_yes?(gets.chomp)
  end

  def more
    more_author if add('an author')
    more_genre if add('a genre')
    more_label if add('a label')
  end

  def more_author
    puts "What is the author's name? "
    author = gets.chomp
  end

  def more_genre
    puts "What is the genre's name? "
    @book.add_genre(Genre.new(gets.chomp))
  end

  def more_label
    puts "What is the label's title? "
    title = gets.chomp
    puts "What is the label's color? "
    color = gets.chomp
    @book.add_label(Label.new(title, color))
  end
end
