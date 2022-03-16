require_relative './item'
require 'date'

class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (DateTime.now.year - Date.parse(last_played_at).year > 2)
  end
end
