class CreateBoardgamesLists < ActiveRecord::Migration[7.1]
  def change
    create_table :boardgames_lists do |t|
      t.references :event, null: false, foreign_key: true
      t.references :boardgames, null: false, foreign_key: true

      t.timestamps
    end
  end
end
