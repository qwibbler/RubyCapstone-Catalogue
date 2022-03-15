class ListBooks < ListData
  def list_books(data)
    return puts "No Books found\n\n" if data.empty?

    data.select! { |item| item.instance_of?(Book) }
    data.each_with_index { |book, index| get_properties(book, index, ['Publisher'], [book.publisher]) }
  end
end
