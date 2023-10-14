require "rails_helper"

RSpec.describe "Vacancies", type: :request do
  let(:user)    { build(:user) }
  let(:vacancy) { build(:vacancy) }

  describe "GET /vacancies" do
    it "http status success" do
      get vacancies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /vacancies/new" do
    before { sign_in user }

    it "http status success" do
      get new_vacancy_path
      expect(response).to have_http_status(:success)
    end

    # context "when user is not company role" do
    #   let(:user) { build(:user, :individual) }

    #   it "redirect on root_page" do
    #     sign_in user
    #     get new_vacancy_path
    #     expect(response).to redirect_to(root_path)
    #   end
    # end
  end

  describe "POST /vacancies/create" do
    before { sign_in user }

    context "when valid params" do
      let(:create_vacancy) { post vacancies_path, params: { vacancy: vacancy.attributes } }

      it "http status success" do
        create_vacancy
        expect(response).to have_http_status(:redirect)
      end

      it { expect { create_vacancy }.to change(Vacancy, :count).by(1) }
    end
  end

  describe "GET /vacancies/edit" do
    let(:vacancy) { create(:vacancy) }

    before { sign_in vacancy.user }

    it "http status success" do
      get edit_vacancy_path(vacancy)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /vacancies/update" do
    let(:vacancy) { create(:vacancy) }

    before { sign_in vacancy.user }

    it "http_status success" do
      put vacancy_path(vacancy), params: { vacancy: vacancy.attributes }
      expect(response).to redirect_to(vacancy_path(vacancy))
    end
  end

  describe "DELETE /vacancies/destroy" do
    let(:vacancy) { create(:vacancy) }

    before { sign_in vacancy.user }

    it "destroy vacancy record" do
      expect { delete vacancy_path(vacancy) }.to change(Vacancy, :count).by(-1)
    end

    it "redirects to the vacancies list" do
      delete vacancy_path(vacancy)
      expect(response).to redirect_to(vacancies_path)
    end
  end
end
