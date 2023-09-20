# == Schema Information
#
# Table name: contact_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  icon       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ContactType < ApplicationRecord
  has_many :contacts, dependent: :destroy

  validates :name, :icon, presence: true
end
