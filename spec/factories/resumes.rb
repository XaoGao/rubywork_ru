# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_resumes_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :resume do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { nil }
    user
  end
end
