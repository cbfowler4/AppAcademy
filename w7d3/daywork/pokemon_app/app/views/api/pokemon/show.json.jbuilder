json.pokemon do
  json.partial! 'pokemon', pokemon: @pokemon
  json.extract! @pokemon, :attack, :defense, :moves, :poke_type
end

json.items do
  json.array! @items do |item|
    json.extract! item, :id, :name, :pokemon_id, :price, :happiness
    json.image_url asset_path(item.image_url)
  end
end