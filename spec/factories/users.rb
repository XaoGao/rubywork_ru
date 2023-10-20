# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("applicant")
#  name                   :string
#  locale                 :string           default("en")
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "password" }
    role { User.roles.keys.sample }
    locale { "en" }
  end

  trait :admin do
    role { "admin" }
  end

  trait :skip_admin_role do
    role { User.roles.keys.reject { |key| key == "admin" }.sample }
  end

  trait :company do
    role { "company" }
  end

  trait :individual do
    role { %w[applicant moderator admin].sample }
  end
end
