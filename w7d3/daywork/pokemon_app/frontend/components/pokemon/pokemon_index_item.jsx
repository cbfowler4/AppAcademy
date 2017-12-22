import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (props) => {
  return (<Link to={"/pokemon/" + props.currentPokemon.id}><li><img src={props.currentPokemon.image_url}></img>{props.currentPokemon.name}</li></Link>);
};

