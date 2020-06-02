class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.text :description
      t.string :address
      t.integer :reward_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
