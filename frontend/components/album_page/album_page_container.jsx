import React from 'react';
import { connect } from 'react-redux';
import AlbumPage from './album_page';
import {
  createCollectionAlbum,
  deleteCollectionAlbum,
  createFollow,
  deleteFollow,
} from '../../actions/user_actions';
import { fetchAlbum, fetchArtistAlbums } from '../../actions/album_actions';
import { fetchArtist } from '../../actions/artist_actions';
import { fetchSongs, setCurrentSong } from '../../actions/song_actions';
import { selectDiscog } from '../../selectors/albums_selectors';
import { openModal } from '../../actions/modal_actions';

const mapStateToProps = (state, ownProps) => {
  const userId = state.session.id;
  const album = state.entities.albums[ownProps.match.params.albumId] || {};
  const artist = state.entities.artists[album.artist_id] || {};
  const songs = state.entities.songs[ownProps.match.params.albumId] || [];
  return {
    album,
    artist,
    songs,
    discog: selectDiscog(state.entities.albums, artist.album_ids),
    currentUser: userId,
    userCollection: userId ? state.entities.users[userId].user_collection_ids : [],
    userFollows: userId ? state.entities.users[userId].user_follow_ids : [],
    currentSong: state.entities.currentSong,
    isPlaying: state.ui.playPause,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchAlbum: (albumId) => dispatch(fetchAlbum(albumId)),
    fetchArtist: (artistId) => dispatch(fetchArtist(artistId)),
    fetchArtistAlbums: (artistId) => dispatch(fetchArtistAlbums(artistId)),
    fetchSongs: (albumId) => dispatch(fetchSongs(albumId)),
    addCollection: (data) => dispatch(createCollectionAlbum(data)),
    removeCollection: (data) => dispatch(deleteCollectionAlbum(data)),
    addFollow: (data) => dispatch(createFollow(data)),
    removeFollow: (data) => dispatch(deleteFollow(data)),
    openModal: () => dispatch(openModal("donate")),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(AlbumPage);
