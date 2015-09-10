class AddAcceptedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :accepted, :boolean, default: false
  end
end
