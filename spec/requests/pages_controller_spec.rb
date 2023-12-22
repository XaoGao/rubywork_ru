require "rails_helper"

describe PagesController, type: :request do
  describe "GET /welcome" do
    it "returns http status success" do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #switch_locale" do
    let(:user) { create(:user) }

    context "when user is signed in" do
      before { sign_in user }

      it "changes the I18n locale" do
        get switch_locale_path(locale: "ru")
        expect(I18n.locale).to eq(:ru)
      end

      it "changes the user locale" do
        get switch_locale_path(locale: "ru")
        expect(user.reload.locale).to eq("ru")
      end

      it "clears the session locale" do
        get switch_locale_path(locale: "ru")
        expect(session[:locale]).to be_nil
      end

      it "redirects back" do
        get switch_locale_path(locale: "ru")
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is not signed in" do
      it "changes the I18n locale" do
        get switch_locale_path(locale: "ru")
        expect(I18n.locale).to eq(:ru)
      end

      it "changes the session locale" do
        get switch_locale_path(locale: "ru")
        expect(session[:locale]).to eq(:ru)
      end

      it "redirects back" do
        get switch_locale_path(locale: "ru")
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the requested locale is not available" do
      it "falls back to the default I18n locale" do
        get switch_locale_path(locale: "invalid_locale")
        expect(I18n.locale).to eq(:en)
      end

      it "falls back to the default session locale" do
        get switch_locale_path(locale: "invalid_locale")
        expect(session[:locale]).to eq(:en)
      end

      it "redirects back" do
        get switch_locale_path(locale: "invalid_locale")
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
