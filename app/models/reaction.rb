# == Schema Information
#
# Table name: reactions
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  vacancies_id :integer          not null
#  readed_at    :datetime
#  cover_letter :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :vacancy

  validates :cover_letter, length: { maximum: 500 }
end
