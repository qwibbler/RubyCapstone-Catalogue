require_relative './list_data'
require_relative './musicalbum'

class ListMusicalbums < ListData
  def list_musicalbums(data)
    return puts "No albums found\n\n" if data.empty?

    data.select! { |item| item.instance_of?(Musicalbum) }
    data.each_with_index { |album, id| get_properties(album, id, ['On Spotify'], [album.on_spotify]) }
  end
end
