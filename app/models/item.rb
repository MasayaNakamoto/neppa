class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  has_many :order_details

  validates :name, :price, presence: true

  def add_tax_price
   (self.price * 1.1).round
  end
end
