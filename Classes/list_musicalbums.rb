require_relative './list_data'
require_relative './musicalbum'

class ListMusicalbums < ListData
  def list_musicalbums(data)
    new_data = data.select { |item| item.instance_of?(Musicalbum) }
    return puts "No Albums found\n\n" if new_data.empty?

    new_data.each_with_index { |album, id| get_properties(album, id, ['On Spotify'], [album.on_spotify]) }
  end
end
