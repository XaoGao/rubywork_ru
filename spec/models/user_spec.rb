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
#
require "rails_helper"

RSpec.describe User, type: :model do
  context "locales" do
    it "defines by default english" do
      user = FactoryBot.build(:user)
      expect(user.locale).to eq("en")
    end
  end
end
