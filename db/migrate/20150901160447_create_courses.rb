class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :mover, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.string :pick_up_address
      t.string :drop_off_address
      t.datetime :accepted_at
      t.datetime :course_start_time
      t.datetime :travel_start_time
      t.datetime :travel_end_time
      t.datetime :course_end_time
      t.integer :mover_rating

      t.timestamps null: false
    end
  end
end
