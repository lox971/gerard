class AddPriceToCourses < ActiveRecord::Migration
  def change
     add_column :courses, :sku, :string
     add_monetize :courses, :price, currency: { present: false }
  end
end
