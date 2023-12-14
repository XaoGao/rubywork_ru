# == Schema Information
#
# Table name: reactions

# user_id         :integer     not null, primary key
# vacancies_id    :integer     not null, primary key
# readed_at       :datetime    not null, primary key
# cover_letter    :text        default null
# created_at      :datetime    not null, primary key
# updated_at      :datetime    not null, primary key
#
# Indexes
#
# Foreign Keys
#  index_reactions_on_user_id  (user_id)
#  index_reactions_on_vacancies_id  (vacancies_id)
#
class Reaction < ApplicationRecord
end
