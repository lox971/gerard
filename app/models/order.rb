class Order < ActiveRecord::Base
  monetize :amount_cents
  validates :course_sku, presence: true
  validates :course_sku, uniqueness: true
end
