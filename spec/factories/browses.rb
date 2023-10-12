# == Schema Information
#
# Table name: browses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  vacancy_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :browse do
    user { nil }
    vacancy { nil }
  end
end
