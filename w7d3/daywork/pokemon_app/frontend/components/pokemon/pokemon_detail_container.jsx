import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
  let pokemonId = ownProps.match.params.pokemonId;
  return {pokemon: state.entities.pokemon[pokemonId]};
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestPokemon: () => dispatch(requestPokemon(pokemonId))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);