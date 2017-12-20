
export const fetchAllPokemon = function () {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};

