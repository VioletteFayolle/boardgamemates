class AddAgeAndCity < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer
    
    remove_column :users, :birth_date, :date
    add_column :users, :city, :string

  end
end
