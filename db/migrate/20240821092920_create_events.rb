class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :capacity
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
