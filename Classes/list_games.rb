require_relative './list_data'
require_relative './game'

class ListGames < ListData
  def list_items(data)
    new_data = data.select { |item| item.instance_of?(Game) }
    return puts "No Games found\n\n" if new_data.empty?

    new_data.each_with_index do |game, index|
      get_properties(game, index, ['Multiplayer', 'Last played on'], [game.multiplayer, game.last_played_at])
    end
  end
end
