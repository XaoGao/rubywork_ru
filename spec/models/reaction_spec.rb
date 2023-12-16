# == Schema Information
#
# Table name: reactions
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  vacancy_id   :integer          not null
#  readed_at    :datetime
#  cover_letter :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "rails_helper"

RSpec.describe Reaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
