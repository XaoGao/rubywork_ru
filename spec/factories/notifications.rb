FactoryBot.define do
  factory :notification do
    sender { association(:user) }
    recipient { association(:user) }
    body { "MyText" }
    read_at { "2023-09-24 11:25:45" }
  end
end
