require 'rails_helper'

RSpec.describe PagesController do
  describe "GET /welcome" do
    it "returns http success" do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end
end
