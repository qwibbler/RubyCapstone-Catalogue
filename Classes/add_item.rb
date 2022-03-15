require_relative './genre'
require_relative './label'
require_relative './author'

class AddItem
  def make_item(item_type)
    puts "Creating a new #{item_type}...\n\n"

    print 'What date was it published on? (YYYY-MM-DD) '
    gets.chomp
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  def add?(something)
    puts "Would you like to add #{something}? [Y/N]"
    answer_yes?(gets.chomp)
  end

  def more(item)
    puts 'Would you like to add more details? [Y/N]'
    return unless answer_yes?(gets.chomp)

    more_author(item) if add?('an author')
    more_genre(item) if add?('a genre')
    more_label(item) if add?('a label')
  end

  def more_author(item)
    puts "What is the author's first name? "
    first_name = gets.chomp
    puts "What is the author's last name? "
    last_name = gets.chomp
    item.add_author(Author.new(first_name, last_name))
  end

  def more_genre(item)
    puts "What is the genre's name? "
    item.add_genre(Genre.new(gets.chomp))
  end

  def more_label(item)
    puts "What is the label's title? "
    title = gets.chomp
    puts "What is the label's color? "
    color = gets.chomp
    item.add_label(Label.new(title, color))
  end
end
