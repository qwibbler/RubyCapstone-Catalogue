require './item'

class author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1_000_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item if item.instance_of?(Item) && !@items.include?(item)
    item.add_author(self)
  end
end
