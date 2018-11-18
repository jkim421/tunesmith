@albums.each do |album|
  json.set! album.id do
    json.partial! 'api/albums/album', album: album, songs: album.songs
  end
end
