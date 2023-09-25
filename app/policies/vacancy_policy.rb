class VacancyPolicy < ApplicationPolicy
  alias_rule :edit?, :destroy?, :update?, to: :manage?

  def manage?
    allow_record
  end
end
