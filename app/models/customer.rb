class Customer < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :courses

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
