class Mover < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :trucks
  has_many :courses

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/



end
