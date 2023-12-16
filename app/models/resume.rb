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
class Resume < ApplicationRecord
  belongs_to :user
  has_rich_text :description

  enum :status, %i[open hidden irrelevant]

  validates :name, presence: true
end
