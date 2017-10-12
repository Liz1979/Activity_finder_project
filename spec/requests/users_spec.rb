require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "redirects to login if user not logged in" do
      get users_path
      expect(response).to redirect_to("/login")
    end
  end
end
