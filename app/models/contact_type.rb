class ContactType < ApplicationRecord
  has_many :contacts, dependent: :destroy
end
