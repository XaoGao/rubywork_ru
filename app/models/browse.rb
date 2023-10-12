class Browse < ApplicationRecord
  belongs_to :user
  belongs_to :vacancy, counter_cache: true
end
