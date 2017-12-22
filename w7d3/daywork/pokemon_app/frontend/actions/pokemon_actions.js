import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";


export const receiveAllPokemon = (pokemon) => {
  return ({
    type: RECEIVE_ALL_POKEMON,
    pokemon 
  });
  // pokemon in receiveAllPokemon is syntactic sugar for pokemon: pokemon 
};

export const receivePokemon = ({pokemon, items}) => {
  return ({
    type: RECEIVE_POKEMON,
    pokemon,
    items
  });
};

export const requestAllPokemon = () => {
  return (dispatch) => {
    APIUtil.fetchAllPokemon().then((response) => {
      dispatch(receiveAllPokemon(response));
    });
  };
};

export const requestPokemon = (pokemonId) => {
  return (dispatch) => {
    APIUtil.fetchPokemon(pokemonId).then((payload) => {
      dispatch(receivePokemon(payload));
    });
  };
};
