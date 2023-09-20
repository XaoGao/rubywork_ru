# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  contact_type_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :contact do
    user
    contact_type
  end
end
