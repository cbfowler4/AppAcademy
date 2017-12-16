import Root from './frontend/root';
import React from 'react';
import ReactDOM from 'react-dom';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');


  const tabs = [
    {title: "tab1", content: "indian cuisine"},
    {title: "tab2", content: "pizzzzaaaa cuisine"},
    {title: "hotpockets", content: "lets get drunk"}
  ];


  return(
    ReactDOM.render(<Root tabs={tabs} />, root)
  );
});
