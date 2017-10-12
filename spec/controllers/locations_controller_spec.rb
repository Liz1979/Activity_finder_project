require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  render_views
  
  let(:valid_attributes) {{name: "bar", country: "spain", longitude: -23.8974, latitude: 45.7352}}
  
  let(:invalid_attributes) {{name: nil, country: "spain", longitude: -23.8974, latitude: 45.7352}}
  
  let!(:changeme_activity) {Location.create(name: "changeme", country: "spain", longitude: -23.8974, latitude: 45.7352) }
  
  let!(:deleteme_activity) {Location.create(name: "changeme", country: "spain", longitude: -23.8974, latitude: 45.7352) }
  
  
    describe "GET #index" do
      it "returns http success" do
        get :index
  
        expect(response).to have_http_status(:success)
      end
  
      it "checks the title is correct" do
        get :index
  
        expect(response.body).to include("<title>Index</title>")
      end
    end 
  
    describe "GET #show" do
      it "returns http success" do
        get :show, params: {id: changeme_activity.id} 
  
        expect(response).to have_http_status(:success)
      end
  
      it "checks the title is correct" do
        get :show, params: {id: changeme_activity.id}
  
        expect(response.body).to include("<title>Show a location</title>")
      end
    end 
  
    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: {id: changeme_activity.id}
  
        expect(response.code).to eq("200")
      end
  
      it "checks the title is correct" do
        get :edit, params: {id: changeme_activity.id}
  
        expect(response.body).to include("<title>Edit a location</title>")
      end
    end 
  
    describe "Get #new" do
      it "returns http success" do
        get :new
  
        expect(response).to have_http_status(:success)
      end
  
      it "checks the title is correct" do
        get :new
  
        expect(response.body).to include("<title>Create a location</title>")
      end
    end 
  
    describe "POST #create" do
      it "returns a successful count" do
        before_create = Location.count
        post :create, params: {location: valid_attributes}
        
        expect(Location.count).to eq(before_create +1)
      end
  
      it "returns an unsuccessful count" do
        before_create = Location.count
        post :create, params: {location: invalid_attributes}
  
        expect(Location.count).to eq(before_create)
      end
    end 
  
    describe "UPDATE #create" do
      it "returns a success" do
        patch :update, params: {id: changeme_activity.id, location: valid_attributes}
        changeme_activity.reload
  
        expect(changeme_activity.name).to eq("bar")
      end
      it "returns an unsuccessful count" do
        patch :update, params: {id: changeme_activity.id, location: invalid_attributes}
        changeme_activity.reload
  
        expect(changeme_activity.name).to eq("changeme")
      end
    end  
  
    describe "DELETE #destroy" do
      it "returns a success" do
        before_delete = Location.count
        delete :destroy, params: {id: deleteme_activity.id}
  
        expect(Location.count).to eq(before_delete -1)
      end
    end
  end
