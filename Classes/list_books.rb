require_relative './list_data'

class ListBooks < ListData
  def list_books(data)
    new_data = data.select { |item| item.instance_of?(Book) }
    return puts "No Books found\n\n" if new_data.empty?

    new_data.each_with_index { |book, index| get_properties(book, index, ['Publisher'], [book.publisher]) }
  end
end
