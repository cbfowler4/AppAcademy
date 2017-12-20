import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import * as APIUtil from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  let store = configureStore();
  ReactDOM.render(<Root store = {store}/>, rootEl);

});