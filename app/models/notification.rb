# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  sender_id    :integer          not null
#  recipient_id :integer          not null
#  body         :text
#  read_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Notification < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :body, presence: true
end
