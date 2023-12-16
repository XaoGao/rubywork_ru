# == Schema Information
#
# Table name: vacancies
#
#  id            :integer          not null, primary key
#  title         :string           default(""), not null
#  body          :text             default(""), not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  browses_count :integer          default(0)
#
FactoryBot.define do
  factory :vacancy do
    title { Faker::Lorem.sentence(word_count: 3) }
    body { Faker::Lorem.paragraph }
    user
  end
end
