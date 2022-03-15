require_relative './item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(*args, on_spotify: false)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
