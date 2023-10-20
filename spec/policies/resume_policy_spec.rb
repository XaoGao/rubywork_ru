require "rails_helper"

RSpec.describe ResumePolicy do
  let(:user)    { build_stubbed(:user, :company) }
  let(:record)  { build_stubbed(:resume, user:) }

  let(:context) { { user: } }

  describe_rule :new? do
    succeed "when user is company"

    failed "when user is admin" do
      let(:user) { build_stubbed(:user, :admin) }
      let(:record) { build_stubbed(:resume) }
    end
  end
end
