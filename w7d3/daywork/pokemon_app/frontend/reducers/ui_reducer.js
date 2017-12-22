import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

export const uiReducer = (oldState = {}, action) => {
  switch (action.type) {
    case RECEIVE_POKEMON:
      return {pokeDisplay: action.pokemon.id};
    default:
      return oldState;
  }
};