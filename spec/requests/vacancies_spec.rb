require "rails_helper"

RSpec.describe "Vacancies", type: :request do
  describe "GET /vacancies" do
    it "returns http success" do
      get vacancies_path
      expect(response).to have_http_status(:success)
    end

    it "redirects to root_path if current_user is not authenticated" do
      get my_vacancies_vacancies_path
      expect(response).to redirect_to(root_path)
    end

    it "redirects with 302 status code if current_user is not authenticated" do
      get my_vacancies_vacancies_path
      expect(response).to have_http_status(:found)
    end
  end
end
