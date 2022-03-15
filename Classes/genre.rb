require './item'

class Genre
  attr_reader :id, :items
  def initialize(name)
    @id = Random.rand(1..1_000_000)
    @name = name
    @items = []
  end
end