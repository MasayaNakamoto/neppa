FactoryBot.define do
  factory :cart_item do
    customer_id { 1 }
    item_id { 1 }
    amount { 2 }
  end
end