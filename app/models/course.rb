class Course < ActiveRecord::Base
  belongs_to :mover
  belongs_to :customer

  geocoded_by :pick_up_address
  after_validation :geocode, if: :pick_up_address_changed?

end
