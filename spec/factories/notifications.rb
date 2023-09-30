# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  sender_id    :integer          not null
#  recipient_id :integer          not null
#  body         :text
#  read_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :notification do
    sender factory: :user
    recipient factory: :user
    body { "MyText" }
    read_at { nil }
  end
end
