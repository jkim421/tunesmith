export const fetchAlbums = (filter) => {
  return $.ajax({
    method: 'GET',
    url: '/api/albums',
    data: { filter},
  });
};

export const fetchAlbum = (albumId) => {
  return $.ajax({
    method: 'GET',
    url: `/api/albums/${albumId}`,
  });
};

export const createAlbum = (album) => {
  return $.ajax({
    method: 'POST',
    url: '/api/albums',
    data: { album },
  });
};
