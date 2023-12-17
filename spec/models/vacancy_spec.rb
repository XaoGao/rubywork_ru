# == Schema Information
#
# Table name: vacancies
#
#  id            :integer          not null, primary key
#  title         :string           default(""), not null
#  body          :text             default(""), not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  browses_count :integer          default(0)
#
require "rails_helper"

RSpec.describe Vacancy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
