import React from 'react';
import { connect } from 'react-redux';
import SearchBar from './search_bar';
import { fetchSearchResults, resetSearchResults } from '../../actions/search_actions';

const mapStateToProps = (state) => {
  return {
    searchResults: state.ui.searchResults,
    inputType: "thin-search",
    placeholderText: "search tuneful",
    listType: "thin-search-list",
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchSearchResults: (query) => dispatch(fetchSearchResults(query)),
    resetSearchResults: () => dispatch(resetSearchResults()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SearchBar);
