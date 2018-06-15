class AddVideoIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :videoID, :string
  end
end
