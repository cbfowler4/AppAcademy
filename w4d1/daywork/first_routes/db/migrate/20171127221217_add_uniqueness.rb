class AddUniqueness < ActiveRecord::Migration[5.1]
  def change
    
    change_column :users, :username, :string, unique: true
    
    remove_index :artwork_shares, [:artwork_id, :viewer_id]
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    remove_index :artworks, [:title, :artist_id]
    add_index :artworks, [:title, :artist_id], unique: true

  end
end
