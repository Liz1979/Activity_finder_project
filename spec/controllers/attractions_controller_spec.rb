require 'rails_helper'

RSpec.describe AttractionsController, type: :controller do
  render_views
  
  let(:valid_attributes) {{name: "bar", longitude: -23.8974, latitude: 45.7352 speciality: "bob"}}
  
  let(:invalid_attributes) {{name: nil, longitude: -23.8974, latitude: 45.7352 speciality: "bob"}}
  
  let!(:changeme_activity) {ActivityType.create(name: "changeme", longitude: -23.8974, latitude: 45.7352 speciality: "bob") }
  
  let!(:deleteme_activity) {ActivityType.create(name: "changeme", longitude: -23.8974, latitude: 45.7352 speciality: "bob") }
  
  
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
  
        expect(response.body).to include("<title>Show an activity</title>")
      end
    end 
  
    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: {id: changeme_activity.id}
  
        expect(response.code).to eq("200")
      end
  
      it "checks the title is correct" do
        get :edit, params: {id: changeme_activity.id}
  
        expect(response.body).to include("<title>Edit an activity</title>")
      end
    end 
  
    describe "Get #new" do
      it "returns http success" do
        get :new
  
        expect(response).to have_http_status(:success)
      end
  
      it "checks the title is correct" do
        get :new
  
        expect(response.body).to include("<title>Create an activity</title>")
      end
    end 
  
    describe "POST #create" do
      it "returns a successful count" do
        before_create = ActivityType.count
        post :create, params: {activity_type: valid_attributes}
        
        expect(ActivityType.count).to eq(before_create +1)
      end
  
      it "returns an unsuccessful count" do
        before_create = ActivityType.count
        post :create, params: {activity_type: invalid_attributes}
  
        expect(ActivityType.count).to eq(before_create)
      end
    end 
  
    describe "UPDATE #create" do
      it "returns a success" do
        patch :update, params: {id: changeme_activity.id, activity_type: valid_attributes}
        changeme_activity.reload
  
        expect(changeme_activity.name).to eq("bars")
      end
      it "returns an unsuccessful count" do
        patch :update, params: {id: changeme_activity.id, activity_type: invalid_attributes}
        changeme_activity.reload
  
        expect(changeme_activity.name).to eq("changeme")
      end
    end  
  
    describe "DELETE #destroy" do
      it "returns a success" do
        before_delete = ActivityType.count
        delete :destroy, params: {id: deleteme_activity.id}
  
        expect(ActivityType.count).to eq(before_delete -1)
      end
    end
  end
