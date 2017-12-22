
export const fetchAllPokemon = function () {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};

export const fetchPokemon = function (pokemonId) {
  return $.ajax({
    url: `/api/pokemon/${pokemonId}`,
    method: 'GET'
  });
};