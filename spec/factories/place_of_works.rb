# == Schema Information
#
# Table name: place_of_works
#
#  id         :integer          not null, primary key
#  company    :string           not null
#  ended_at   :datetime
#  started_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume_id  :integer          not null
#
# Indexes
#
#  index_place_of_works_on_resume_id  (resume_id)
#
# Foreign Keys
#
#  resume_id  (resume_id => resumes.id)
#
FactoryBot.define do
  factory :place_of_work do
    started_at { "2023-09-26 21:27:30" }
    ended_at { "2023-09-26 21:27:30" }
    company { "MyString" }
    resume { nil }
  end
end
