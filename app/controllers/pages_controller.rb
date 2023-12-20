class PagesController < ApplicationController
  def welcome
    return unless user_signed_in?

    redirect_to page_for_signed_in(current_user)
  end

  private

  def page_for_signed_in(user)
    {user.applicant? => vacancies_path, user.company? => resumes_path}[true]
  end
end
