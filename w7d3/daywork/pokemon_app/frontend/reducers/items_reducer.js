import { RECEIVE_POKEMON }  from '../actions/pokemon_actions';

export const itemsReducer = (oldState = {}, action) => {
  switch (action.type) {
    case RECEIVE_POKEMON: 
      let itemObj = {};
      action.items.forEach((item) => {
        itemObj[item.id] = item;
      });
      
      return Object.assign({}, oldState, itemObj);
      
    default: 
      return oldState;
  }
};
