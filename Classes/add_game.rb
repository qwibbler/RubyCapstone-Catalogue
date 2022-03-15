require_relative './add_item'
require_relative './game'

class AddGame < AddItem
  def make_item(app)
    publish_date = super('game')

    print 'Is it a multiplayer game? [Y/N] '
    multiplayer = answer_yes?

    print 'When was the last time it was played? (YYYY-MM-DD) '
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_at)
    app.items << game
    puts "The game was successfully created!\n\n"
    more(game, app)
  end
end
