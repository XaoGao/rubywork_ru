# == Schema Information
#
# Table name: contact_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  icon       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :contact_type do
    name { %w[telegram email skype phone].sample }
    icon { "some path" }
  end
end
