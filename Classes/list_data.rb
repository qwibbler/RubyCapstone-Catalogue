class ListData
  def list(index, data)
    print "#{index + 1}) "
    data.each { |key, value| print "#{key}: #{value}  \t" unless value.nil? }
    puts
  end

  def get_properties(item, index, prop_names, props)
    hash = {
      'ID' => item.id,
      'Publish Date' => item.publish_date
    }
    hash['Genre'] = item.genre.name if item.genre
    hash['Author'] = "#{item.author.first_name} #{item.author.last_name}" if item.author
    hash['Label'] = item.label.title if item.label

    props.each_with_index { |prop, index| hash[prop_names[index]] = prop }

    list(index, hash)
  end
end

class ListBooks < ListData
  def list_books(data)
    return puts "No Books found\n\n" if data.empty?

    data.select! { |item| item.instance_of?(Book) }
    data.each_with_index { |book, index| get_properties(book, index, ['Publisher'], [book.publisher]) }
  end
end

class ListLabels < ListData
  def list(data)
    return 'No Labels found' if data.empty?

    data.select { |item| item.instance_of?(Label) }.each_with_index do |label, index|
      super(index, { 'ID' => label.id, 'Title' => label.title, 'Color' => label.color })
    end
    nil
  end
end

require_relative './item'
require_relative './book'
require_relative './label'
book = Book.new('publisher1', 'good', '2020-1-1')
label = Label.new('title1', 'color1')
book.add_label(label)
data = [
  Item.new('2020'),
  book, label,
  Book.new('publisher2', 'good', '2020-2-2'),
  Book.new('publisher3', 'good', '2020-3-3'),
  Label.new('title2', 'color2')
]
ListBooks.new.list_books(data)
