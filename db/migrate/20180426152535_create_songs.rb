class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist_name
      t.integer :playlist_id
      t.string :video_url

      t.timestamps
    end
  end
end
