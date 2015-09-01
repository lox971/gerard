class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.references :mover, index: true, foreign_key: true
      t.string :brand
      t.string :model
      t.string :year
      t.string :registration
      t.string :truck_identification

      t.timestamps null: false
    end
  end
end
