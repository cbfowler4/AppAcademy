import React from 'react';


class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestPokemon(this.props.pokemon.id);
    console.log("");
    debugger
  }
  
  render () {
    return (<div>helloWorld</div>);
  }
  
}

export default PokemonDetail;