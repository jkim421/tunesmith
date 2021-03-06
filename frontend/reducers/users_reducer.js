import merge from 'lodash/merge';

import { RECEIVE_CURRENT_USER, UPDATE_CURRENT_USER } from '../actions/session_actions';
import { RECEIVE_USER } from '../actions/user_actions';
import { CREATE_ARTIST } from '../actions/artist_actions';
import { RECEIVE_ALBUM } from '../actions/album_actions';

const usersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, state, { [action.user.user.id]: action.user.user });
    case RECEIVE_USER:
      return merge({}, state, { [action.user.user.id]: action.user.user} )
    case CREATE_ARTIST:
      return merge({}, state, { [action.artist.user.id]: action.artist.user });
    case RECEIVE_ALBUM:
      return merge({}, state, action.users);
    case UPDATE_CURRENT_USER:
      let updateUser = merge({}, state);
      updateUser[action.user.user.id].user_collection_ids = [];
      updateUser[action.user.user.id].user_follow_ids = [];
      const newState = merge(updateUser, { [action.user.user.id]: action.user.user });
      return newState
    default:
      return state;
  }
};

export default usersReducer;
