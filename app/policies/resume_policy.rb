class ResumePolicy < ApplicationPolicy
  def new?
    user.company?
  end
end
