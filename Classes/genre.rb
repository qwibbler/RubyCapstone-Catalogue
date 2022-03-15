require_relative './item'

class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.instance_of?(Item) && !@items.include?(item)

    @items << item
    item.add_genre(self)
  end
end
