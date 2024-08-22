class CreateInscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :inscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :status
      t.string :comment

      t.timestamps
    end
  end
end
