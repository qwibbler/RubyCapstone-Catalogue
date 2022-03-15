require './item'

class Musicalbum < Item
  def initialize(*args, on_spotify: false)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
