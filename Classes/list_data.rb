class ListData
  def list(index, data)
    print "#{index + 1}) "
    data.each { |key, value| print "#{key}: #{value}  \t" }
    puts
  end
end

# class ListBooks < ListData
#   def list(data)
#     return puts "No Books found\n\n" if data.empty?

#     data.select { |item| item.instance_of?(Book) }.each_with_index do |book, index|
#       super(index, { 'ID' => book.id, 'Publisher' => book.publisher, 'Publish Date' => book.publish_date })
#     end
#     puts
#   end
# end

# class ListLabels < ListData
#   def list(data)
#     return 'No Labels found' if data.empty?

#     data.select { |item| item.instance_of?(Label) }.each_with_index do |label, index|
#       super(index, { 'ID' => label.id, 'Title' => label.title, 'Color' => label.color })
#     end
#     nil
#   end
# end

# require_relative './item'
# require_relative './book'
# require_relative './label'
# data = [
#   Item.new('2020'),
#   Book.new('publisher1', 'good', '2020-1-1'),
#   Book.new('publisher2', 'good', '2020-2-2'),
#   Book.new('publisher3', 'good', '2020-3-3'),
#   Label.new('title1', 'color1'),
#   Label.new('title2', 'color2')
# ]
# ListLabels.new.list(data)
