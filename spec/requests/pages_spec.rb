# frozen_string_literal: true

require 'rails_helper'

describe 'GET /welcome' do
  it 'returns http status success' do
    get root_url
    expect(response).to have_http_status(:success)
  end
end
