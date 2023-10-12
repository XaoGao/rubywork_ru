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
class Browse < ApplicationRecord
  belongs_to :user
  belongs_to :vacancy, counter_cache: true
end
