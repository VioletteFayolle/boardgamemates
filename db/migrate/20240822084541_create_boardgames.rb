class CreateBoardgames < ActiveRecord::Migration[7.1]
  def change
    create_table :boardgames do |t|
      t.integer :bgg_id
      t.string :name
      t.string :description
      t.string :image_url
      t.string :thumbnail_url
      t.integer :min_players
      t.integer :max_players
      t.integer :playing_time
      t.integer :age
      t.string :category
      t.integer :release_year
      t.string :publisher

      t.timestamps
    end
  end
end
