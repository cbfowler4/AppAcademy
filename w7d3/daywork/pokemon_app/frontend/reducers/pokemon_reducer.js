import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (oldState = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_POKEMON: 
      return Object.assign({}, oldState, {[action.pokemon.id]: action.pokemon});
    default:
      return oldState;
  }
};
