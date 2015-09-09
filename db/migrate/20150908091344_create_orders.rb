class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :course_sku
      t.monetize :amount, currency: { present: false }
      t.json :payment

      t.timestamps null: false
    end
  end
end
