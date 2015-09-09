class AddInfosToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :kms, :float
    add_column :courses, :time, :integer
  end
end
