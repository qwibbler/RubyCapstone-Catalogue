require_relative './item'

class Label
  attr_reader :title, :color, :items, :id

  def initialize(title, color)
    @id = Random.rand(1..1_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return unless item.instance_of?(Item) && !@items.include?(item)

    @items << item
    item.add_label(self)
  end
end
