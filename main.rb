require './app'

def main
  app = App.new
  puts "\nA Catalogue of My Favorite Things\n"
  loop do
    puts "
     1) List all books
     2) List all music albums
     3) List of games
     4) List all genres (e.g 'Comedy', 'Thriller')
     5) List all labels (e.g. 'Gift', 'New')
     6) List all authors (e.g. 'Stephen King')
     7) Add a book
     8) Add a music album
     9) Add a game
    10) Exit"

    answer = gets.chomp.to_i
    app.options(answer)
    puts "\nThank you for using the App. Hope to see you soon! :)\n\n" if answer == 10
    break if answer == 10
  end
end

main
