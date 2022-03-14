require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1_000_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(publish_date).year > 10
  end
end

item = Item.new('genre', 'author', 'source', 'label', '2010-03-02')
puts (item.can_be_archived?)
