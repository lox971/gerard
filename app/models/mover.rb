class Mover < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :trucks
  has_many :courses
end
