require './item'

class Genre
  attr_reader :id, :items

  def initialize(name, *args)
    super(*args)
    @id = Random.rand(1..1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) if item.instance_of?(Item) && !@items.include?(item)
    item.add_genre(self)
  end
end