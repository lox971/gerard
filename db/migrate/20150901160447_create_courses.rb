class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :mover, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
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
