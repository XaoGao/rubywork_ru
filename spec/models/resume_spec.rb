# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("open")
#  name       :string           default(""), not null
#
require "rails_helper"

RSpec.describe Resume, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
