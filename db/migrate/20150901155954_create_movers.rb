class CreateMovers < ActiveRecord::Migration
  def change
    create_table :movers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :driving_license_number
      t.string :identification_document_number

      t.timestamps null: false
    end
  end
end
