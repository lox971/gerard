class Course < ActiveRecord::Base
  belongs_to :mover
  belongs_to :customer
  has_many :sites
  accepts_nested_attributes_for :sites, reject_if: :all_blank, allow_destroy: true
  # geocoded_by :pick_up_address
  # after_validation :geocode, if: :pick_up_address_changed?
  monetize :price_cents

  def order
    Order.find_by(course_sku: sku)
  end
end
