class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  has_one :cart_items, dependent: :destroy
end
