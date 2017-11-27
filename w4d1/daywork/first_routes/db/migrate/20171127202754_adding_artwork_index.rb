class AddingArtworkIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :artworks, [:title, :artist_id]
    add_index :artworks, :artist_id
  end
end
