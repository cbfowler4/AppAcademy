class AddUniquenessToUsername < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username 
    add_column :users, :username, :string, unique: true
  end
end
