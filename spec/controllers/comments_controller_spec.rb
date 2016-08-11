require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #accept" do
    it "returns http success" do
      put :accept
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decline" do
    it "returns http success" do
      put :decline
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :remove
      expect(response).to have_http_status(:success)
    end
  end

end
