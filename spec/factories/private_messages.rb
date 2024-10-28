FactoryBot.define do
  factory :private_message do
    content { "MyText" }
    sender { nil }
    receiver { nil }
  end
end
