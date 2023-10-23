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
require "rails_helper"

RSpec.describe User, type: :model do
  it "defines by default english" do
    user = build(:user)
    expect(user.locale).to eq("en")
  end

  describe "#owner?" do
    let(:user) { create(:user) }
    let(:vacancy) { create(:vacancy, user_id: user.id) }

    it "returns true when user is the owner of the vacancy" do
      expect(user).to be_owner(vacancy)
    end

    it "returns false when user is not the owner of the vacancy" do
      other_user = create(:user)

      expect(other_user).not_to be_owner(vacancy)
    end
  end
end
