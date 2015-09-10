class AddSkuToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :status, :string
    add_column :courses, :payment, :json
  end
end
