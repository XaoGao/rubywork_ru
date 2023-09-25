class ApplicationPolicy < ActionPolicy::Base
  def allow_record
    allow! if current_admin? || owner_record?
  end

  private

  def current_admin?
    user.admin?
  end

  def owner_record?
    user.id == record.user_id
  end
end
