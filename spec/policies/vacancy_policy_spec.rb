require "rails_helper"

RSpec.describe VacancyPolicy, type: :policy do
  let(:user) { build_stubbed(:user, :skip_admin_role) }
  let(:vacancy) { build_stubbed(:vacancy, user:) }

  let(:policy) { described_class.new(vacancy, user:) }

  describe "#manage?" do
    subject(:policy_result) { policy.apply(:manage?) }

    let(:rules) { %i[edit? update? destroy?] }

    it "is an alias of :edit, :update, :destroy rules" do
      expect(rules).to all be_an_alias_of(policy, :manage?)
    end

    context "when user is owner vacancy" do
      it { expect(policy_result).to be_present }
    end

    context "when vacancy doesn`t belong user and he isn`t an admin" do
      let(:vacancy) { build_stubbed(:vacancy) }

      it { expect(policy_result).not_to be_present }
    end

    context "when vacancy doesn`t belong user but user is admin" do
      let(:vacancy) { build_stubbed(:vacancy) }
      let(:user)    { build_stubbed(:user, :admin) }

      it { expect(policy_result).to be_present }
    end
  end
end
