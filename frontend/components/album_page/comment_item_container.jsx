import React from 'react';
import { connect } from 'react-redux';
import CommentItem from './comment_item';

import {
  createComment, } from '../../actions/album_actions';

const mapStateToProps = (state, ownProps) => {
  const currentUser = state.session ? state.session.id === ownProps.user.id : false;
  return {
    currentUser,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    createComment: (comment) => dispatch(createComment(comment)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(CommentItem);
