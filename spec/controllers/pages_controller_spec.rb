require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "checks the title is correct" do
      get :home
      expect(response.body).to include("<title>Home | Activity Finder</title>")
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :help
      expect(response.body).to include("<title>Help | Activity Finder</title>")
    end
  end

end
