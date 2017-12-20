class Api::PokemonController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end
  
  def show
    
    @pokemon = Pokemon.find(params[:id])
    @items = @pokemon.items
    
  end
  
end