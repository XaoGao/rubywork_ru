# == Schema Information
#
# Table name: place_of_works
#
#  id         :integer          not null, primary key
#  started_at :datetime         not null
#  ended_at   :datetime
#  company    :string           not null
#  resume_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PlaceOfWork < ApplicationRecord
  belongs_to :resume
end
