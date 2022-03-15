require_relative './musicalbum'
require_relative './add_item'

class AddMusicalbum < AddItem
  def make_item(app)
    date = super('Music album')
    print 'Is this album on Spotify? [Y/N] '
    on_spotify = answer_yes?
    musicalbum = Musicalbum.new(date, on_spotify: on_spotify)
    app.items << musicalbum
    puts "The album was successfully created!\n\n"
    more(musicalbum)
  end
end
