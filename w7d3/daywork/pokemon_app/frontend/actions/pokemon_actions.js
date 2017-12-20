import * as APIUtil from '../util/api_util';

const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";

const receiveAllPokemon = (pokemon) => {
  return ({
    type: RECEIVE_ALL_POKEMON,
    pokemon 
  });
  // pokemon in receiveAllPokemon is syntactic sugar for pokemon: pokemon 
};

const requestAllPokemon = () => {
  return (dispatch) => {
    APIUtil.fetchAllPokemon().then((response) => {
      dispatch(receiveAllPokemon(response));
    });
  };
};

export { RECEIVE_ALL_POKEMON, receiveAllPokemon, requestAllPokemon };
