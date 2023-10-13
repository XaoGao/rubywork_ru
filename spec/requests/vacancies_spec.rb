require "rails_helper"

RSpec.describe "Vacancies", type: :request do
  describe "GET /vacancies" do
    it "http success" do
      get vacancies_path
      expect(response).to have_http_status(:success)
    end

    it "redirects user to users/sign_in if user is not authenticated" do
      get my_vacancies_vacancies_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "redirects user with 302 status code if user is not authenticated" do
      get my_vacancies_vacancies_path
      expect(response).to have_http_status(:found)
    end
  end
end
