class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :type_of
      t.string :address
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
