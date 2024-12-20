FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "John#{n}" }
    sequence(:email) { |n| "johndoe#{n}@mail.com" }
    password { '5555555' }
    phone_number { '73988888888' }
  end
end
