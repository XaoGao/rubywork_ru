require "rails_helper"

RSpec.describe "Vacancies", type: :request do
  let(:user)    { build(:user) }
  let(:vacancy) { build(:vacancy) }

  describe "#index" do
    it "returns http status success" do
      get vacancies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns http status success" do
      get new_vacancy_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    before { sign_in user }

    context "when valid params" do
      let(:create_vacancy) { post vacancies_path, params: { vacancy: vacancy.attributes } }

      it "returns http status success" do
        create_vacancy
        expect(response).to have_http_status(:redirect)
      end

      it { expect { create_vacancy }.to change(Vacancy, :count).by(1) }
    end
  end

  describe "#edit" do
    let(:vacancy) { create(:vacancy) }

    before { sign_in vacancy.user }

    it "returns http status success" do
      get edit_vacancy_path(vacancy)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    let(:vacancy) { create(:vacancy) }

    before { sign_in vacancy.user }

    it "retuns http_status success" do
      patch vacancy_path(vacancy), params: { vacancy: vacancy.attributes }
      expect(response).to redirect_to(vacancy_path(vacancy))
    end
  end

  describe "#destroy" do
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
