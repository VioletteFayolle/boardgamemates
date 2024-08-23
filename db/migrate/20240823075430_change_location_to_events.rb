class ChangeLocationToEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.remove :location
      t.string :city
      t.string :address
      t.string :zip_code
    end
  end
end
