FactoryBot.define do
  factory :product do
    id { "2" }
    product_name { "TV" }
    vendor_code { "1234567" }
    description { "text" }
    price { "11" }
    category
  end
end