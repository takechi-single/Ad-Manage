require 'rails_helper'

RSpec.describe "Plans", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/plans/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/plans/new"
      expect(response).to have_http_status(:success)
    end
  end

end
