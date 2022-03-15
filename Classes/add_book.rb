require_relative './add_item'
require_relative './book'

class AddBook < AddItem
  def make_item(app)
    publish_date = super('book')
    print 'Who was the Publisher? '
    publisher = gets.chomp
    print 'What state is the cover in? '
    cover_state = gets.chomp
    @book = Book.new(publisher, cover_state, publish_date)
    app.items << @book
    puts 'Book created!'
    more(@book)
  end
end
