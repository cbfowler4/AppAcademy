import React from 'react';
import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';
import { PokemonIndexItem } from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }
  
  render() {
    const pokemonsList = this.props.pokemon.map((currentPokemon) => {
      return (
        <PokemonIndexItem key={currentPokemon.id} currentPokemon={currentPokemon}/>
      );
    });

    return (
      <ul className="pokemon-list">{ pokemonsList }</ul>
    );
  }
}

const mapStateToProps = state => {
  return {
    pokemon: selectAllPokemon(state)
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestAllPokemon: () => dispatch(requestAllPokemon())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);