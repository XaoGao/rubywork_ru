require "rails_helper"

RSpec.describe "Resumes", type: :request do
  let(:user) { create(:user, :company) }
  let(:resume) { build(:resume, user:) }

  describe "POST /create" do
    before { sign_in user }

    context "when valid params" do
      let(:create_resume) { post resumes_path, params: { resume: resume.attributes } }

      it "http status success" do
        create_resume
        expect(response).to have_http_status(:redirect)
      end

      it { expect { create_resume }.to change(Resume, :count).by(1) }
    end
  end
end
