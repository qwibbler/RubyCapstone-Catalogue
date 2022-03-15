require './app'

arr_options = [
  'List all books',
  'List all music albums',
  'List of games',
  "List all genres (e.g 'Comedy', 'Thriller')",
  "List all labels (e.g. 'Gift', 'New')",
  "List all authors (e.g. 'Stephen King')",
  'Add a book',
  'Add a music album',
  'Add a game',
  'Exit'
]

def main(options = arr_options)
  app = App.new
  puts "\n\nA Catalogue of My Favorite Things\n\n"
  loop do
    options.each_with_index { |option, index| puts "#{index}) #{option}" }
    puts
    answer = gets.chomp
    app.options(answer)
    puts "\nThank you for using the App. Hope to see you soon! :)\n\n" if answer == 9
    break if ['9', 'quit', 'q', 'exit'].include(answer)
  end
end

main(arr_options)
