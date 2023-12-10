# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("applicant")
#  name                   :string
#  locale                 :string           default("en")
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :vacancies, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :resumes, dependent: :destroy
  has_many :sent_notifications, class_name: "Notification",
                                foreign_key: :sender_id, dependent: :destroy, inverse_of: :sender
  has_many :received_notifications, class_name: "Notification",
                                    foreign_key: :recipient_id, dependent: :destroy, inverse_of: :recipient

  enum :role, %i[applicant company moderator admin]

  validates :locale, presence: true

  def owner?(vacancy)
    id == vacancy.user_id
  end
end
