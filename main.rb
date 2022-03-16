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
  puts "\n\nA Catalogue of My Favorite Things\n"
  loop do
    puts
    options.each_with_index { |option, index| puts "#{index}) #{option}" }
    puts
    answer = gets.chomp
    app.options(answer)
    if %w[9 quit q exit].include?(answer)
      app.app_save
      puts "\nThank you for using the App. Hope to see you soon! :)\n\n"
      break
    end
  end
end

main(arr_options)
