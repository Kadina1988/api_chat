FactoryBot.define do
  factory :message do
    text { "MyText" }
    association :chat
  end
end
