require_relative './list_data'
require_relative './game'

class ListGames < ListData
  def list_items(data)
    return puts "No Games found\n\n" if data.empty?

    data.select! { |item| item.instance_of?(Game) }
    data.each_with_index { |game, index| get_properties(game, index, ['multiplayer', 'last player at'], [game.multiplayer, game.last_played_at]) }
  end
end