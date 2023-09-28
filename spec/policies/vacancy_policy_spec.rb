require "rails_helper"

RSpec.describe VacancyPolicy do
  let(:user)    { build_stubbed(:user, :skip_admin_role) }
  let(:record)  { build_stubbed(:vacancy, user:) }
  let(:context) { { user: } }

  describe_rule :manage? do
    succeed "when user is owner vacancy"

    succeed "when user is admin" do
      let(:user) { build_stubbed(:user, :admin) }
      let(:record) { build_stubbed(:vacancy) }
    end

    failed "when vacancy doesn`t belong user and he isn`t an admin" do
      let(:record) { build_stubbed(:vacancy) }
    end
  end
end
