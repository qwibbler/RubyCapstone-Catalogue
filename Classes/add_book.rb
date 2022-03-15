require_relative './book'

class AddBook
  def initialize(app)
    puts "Creating a new Book...\n\n"
    print 'Who was the Publisher? '
    publisher = gets.chomp
    print 'What date was it published on? '
    publish_date = gets.chomp
    print 'What state is the cover in? '
    cover_state = gets.chomp
    app.items << Book.new(publisher, cover_state, publish_date)
    puts "Book created! What would you like to do next?\n\n"
  end
end
