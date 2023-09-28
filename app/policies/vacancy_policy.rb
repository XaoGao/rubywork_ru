class VacancyPolicy < ApplicationPolicy
  alias_rule :edit?, :destroy?, :update?, to: :manage?

  def manage?
    allowed_to?(:allow_record)
  end
end
