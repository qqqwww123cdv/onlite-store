FactoryBot.define do
  factory :checkout do
    user
    name { "Anton" }
    address { "Smorgovski streat house 29 apartment 68" }
    email { "test@mail.ru" }
  end
end