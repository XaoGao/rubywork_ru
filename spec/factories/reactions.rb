# == Schema Information
#
# Table name: reactions
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  vacancy_id   :integer          not null
#  readed_at    :datetime
#  cover_letter :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :reaction do
    user
    vacancy
    readed_at { "2023-12-13 22:30:16" }
    cover_letter { Faker::Lorem.sentence(word_count: 100) }
  end
end
