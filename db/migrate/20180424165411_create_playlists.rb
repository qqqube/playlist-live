class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.integer :manager_id
      t.integer :curr_index
      t.boolean :active
      t.string :join_name
      t.string :join_password

      t.timestamps
    end
  end
end
