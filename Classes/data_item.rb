require_relative './item'
require_relative './musicalbum'
require_relative './book'
require_relative './game'
require 'json'

class ItemData
  def self.path
    './Data/items.json'
  end

  def self.save_data(data) # rubocop:disable Metrics
    new_data = data.map do |item|
      {
        id: item.id,
        class: item.class.name,
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

  def self.read_data(authors, genres, labels)
    return [] unless File.exist?(ItemData.path)

    JSON.parse(File.read(ItemData.path)).map do |obj|
      item = Book.new(obj['publisher'], obj['cover_state'], obj['publish_date'], obj['id']) if obj['class'] == 'Book'
      if obj['class'] == 'Game'
        item = Game.new(obj['publish_date'], obj['id'], obj['multiplayer'],
                        obj['last_played_at'])
      end
      if obj['class'] == 'Musicalbum'
        item = Musicalbum.new(obj['publish_date'], obj['id'],
                              on_spotify: obj['on_spotify'])
      end
      ItemData.add_detail(item, obj, authors, genres, labels)
      item
    end
  end

  def self.add_detail(item, obj, authors, genres, labels)
    item.add_genre(genres.find { |genre| genre.id == obj['genre'] }) unless obj['genre'].nil?
    item.add_author(authors.find { |author| author.id == obj['author'] }) unless obj['author'].nil?
    item.add_label(labels.find { |label| label.id == obj['label'] }) unless obj['label'].nil?
  end
end
