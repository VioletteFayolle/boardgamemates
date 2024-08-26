class RemoveZipCodeToEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :zip_code, :string
  end
end
