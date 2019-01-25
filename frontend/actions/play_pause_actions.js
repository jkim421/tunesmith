import React from 'react';

export const SET_PLAY_PAUSE = "SET_PLAY_PAUSE";

export const setPlayPause = (play) => {
  return {
    type: SET_PLAY_PAUSE,
    play,
  };
};
