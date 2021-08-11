class Shop < ApplicationRecord
  attachment :image
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

def shop_address
    self.postal_code.to_s + self.address
end

end
