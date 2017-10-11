require 'rails_helper'

RSpec.describe ActivityTypeController, type: :controller do
render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "checks the title is correct" do
      get :index
      expect(:title).to be_eq("index")
    end
  end 

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "checks the title is correct" do
      get :show
      expect(:title).to be_eq("Show an activity")
    end
  end 

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "checks the title is correct" do
      get :edit
      expect(:title).to be_eq("Edit an activity")
    end
  end 

  describe "Get #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "checks the title is correct" do
      get :new
      expect(:title).to be_eq("Create an activity")
    end
  end 

  describe "POST #create" do
    it "returns http success" do
      post :new
      expect(response).to have_http_status(:success)
    end
  end 

    describe "" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
  
      it "checks the title is correct" do
        get :index
        expect(:title).to be_eq("index")
      end
    end 
end
