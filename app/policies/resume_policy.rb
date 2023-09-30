class ResumePolicy < ApplicationPolicy
  def show?
    record.open? || user.admin? || user.moderator?
  end
end