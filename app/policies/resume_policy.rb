class ResumePolicy < ApplicationPolicy
  authorize :user, optional: true

  def show?
    record.open? || (user && (user.admin? || user.moderator?))
  end
end
