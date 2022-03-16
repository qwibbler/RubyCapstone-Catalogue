require_relative './item'
require_relative './musicalbum'
require_relative './book'
require_relative './game'

class ItemData
  def self.path
    './Data/items.json'
  end

  def self.save_data(data) # rubocop:disable Metrics/CyclomaticComplexity/
    new_data = data.map do |item|
      {
        id: item.id,
        publish_date: item.publish_date,
        genre: item.genre ? item.genre.id : nil,
        author: item.author ? item.author.id : nil,
        label: item.label ? item.label.id : nil,
        on_spotify: item.instance_of?(Musicalbum) ? item.on_spotify : nil,
        publisher: item.instance_of?(Book) ? item.publisher : nil,
        cover_state: item.instance_of?(Book) ? item.cover_state : nil,
        multiplayer: item.instance_of?(Game) ? item.multiplayer : nil,
        last_played_at: item.instance_of?(Game) ? item.last_played_at : nil
      }
    end
    File.write(ItemData.path, JSON.generate(new_data))
  end
end

item = Item.new(1)
ItemData.save_data([item])
