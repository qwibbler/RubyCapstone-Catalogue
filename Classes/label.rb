require './item'

class Label
  attr_reader :title, :color, :items

  def initialize(title, color, *args)
    super(*args)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item if item.instance_of?(Item) && @items.include?(item) == false
    item.add_label(self)
  end
end
