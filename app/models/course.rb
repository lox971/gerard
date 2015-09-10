class Course < ActiveRecord::Base
  belongs_to :mover
  belongs_to :customer
  has_many :sites
  accepts_nested_attributes_for :sites, reject_if: :all_blank, allow_destroy: true
  # geocoded_by :pick_up_address
  # after_validation :geocode, if: :pick_up_address_changed?
  monetize :price_cents

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def compute_infos

    pickup_address = self.sites.where(type_of: "pick_up").first.address
    drop_address = self.sites.where(type_of: "drop_off").first.address
    directions = GoogleDirections.new(pickup_address, drop_address)
    self.time = directions.drive_time_in_minutes
    self.kms = directions.distance_in_miles.fdiv(1.6)
    self.price = 49 # TODO: price calculus


  end
end
