class ChangeHouseName < ActiveRecord::Migration[5.1]
  def change
    rename_table :houses_tables, :houses
  end
end
