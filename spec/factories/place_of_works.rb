# == Schema Information
#
# Table name: place_of_works
#
#  id         :integer          not null, primary key
#  started_at :datetime         not null
#  ended_at   :datetime
#  company    :string           not null
#  resume_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :place_of_work do
    started_at { "2023-09-26 21:27:30" }
    ended_at { "2023-09-26 21:27:30" }
    company { "MyString" }
    resume { nil }
  end
end
