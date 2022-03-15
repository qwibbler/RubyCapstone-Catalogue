require './item'

class Musicalbum < Item
  def initialize(*args, on_spotify: false)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
