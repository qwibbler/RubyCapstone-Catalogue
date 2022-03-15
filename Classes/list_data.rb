class ListData
  def list(index, data)
    print "#{index + 1}) "
    data.each { |key, value| print "#{key}: #{value} \t" }
    puts
  end
end

class ListBooks < ListData
  def list(data)
    data.select { |item| item.instance_of?(Book) }.each_with_index do |book, index|
      super(index, { 'ID' => book.id, 'Publisher' => book.publisher, 'Publish Date' => book.publish_date })
    end
    nil
  end
end

require_relative './book'
require_relative './item'
data = [
  Item.new('2020'),
  Book.new('publisher1', 'good', '2020-1-1'),
  Book.new('publisher2', 'good', '2020-2-2'),
  Book.new('publisher3', 'good', '2020-3-3')
]
ListBooks.new.list(data)
