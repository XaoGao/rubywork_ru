# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("open")
#  name       :string           default(""), not null
#
FactoryBot.define do
  factory :resume do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { nil }
    user
  end
end
