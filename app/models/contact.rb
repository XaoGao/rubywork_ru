class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :contact_type
end
