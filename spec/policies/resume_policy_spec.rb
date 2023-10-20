require "rails_helper"

RSpec.describe ResumePolicy do
  let(:user)    { build_stubbed(:user, :company) }
  let(:resume)  { build_stubbed(:resume, user:) }

  let(:policy) { described_class.new(resume, user:) }

  describe "#new?" do
    subject { policy.apply(:new?) }

    context "when the user is a company, it returns true" do
      it { is_expected.to be true }
    end

    context "when the user is admin, it returns false" do
      let(:user) { build_stubbed(:user, :admin) }

      it { is_expected.to be false }
    end
  end
end
