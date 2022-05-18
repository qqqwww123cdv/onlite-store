FactoryBot.define do
  factory :user do
    email { "tessqwqt@mail.ru" }
    password { "password" }
    password_confirmation { "password" }
    role { "admin" }
  end
end
