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
require "rails_helper"

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
