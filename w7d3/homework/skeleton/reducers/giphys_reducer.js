import { RECEIVE_SEARCH_GIPHYS, REQUEST_SEARCH_GIPHYS } from '../actions/giphy_actions';


const giphysReducer = function (oldState = [], action) {

  switch(action.type) { 
    case RECEIVE_SEARCH_GIPHYS:

      return action.giphys;
    default:
      return oldState;
  }
};

export default giphysReducer;
