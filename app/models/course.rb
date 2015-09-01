class Course < ActiveRecord::Base
  belongs_to :mover
  belongs_to :customer
end
