class AddingArtworkShareIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :artwork_shares, [:artwork_id, :viewer_id]
    add_index :artwork_shares, :viewer_id
  end
end
