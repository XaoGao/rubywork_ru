# == Schema Information
#
# Table name: vacancies
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  body       :text             default(""), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vacancy < ApplicationRecord
  belongs_to :user

  has_many :browses
end
