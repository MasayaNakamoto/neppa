FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "test#{n}" }
    sequence(:introduction) { |n| "test#{n}" }
    price { "1,000" }
    # image { File.open("app/assets/images/sauna.jpg") }
  end
end