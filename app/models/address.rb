class Address < ApplicationRecord
  belongs_to :customer

  def order_address
    self.postal_code.to_s + self.address + self.name
  end
end
