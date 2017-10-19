require 'rails_helper'

RSpec.describe Location, type: :model do
  # let (:manchester){Location.new(search: "manchester UK")}
  # let! (:oldham){Location.create!(search: "oldham UK")}
  # let! (:denton){Location.create!(search: "denton UK")}
  
  # # let(:invalid_user_bad_confirm) {User.new(username: "User2", name: "Faily McFail", password: "password", password_confirmation: "wrongpassword")}
  # # let(:invalid_user_no_name) {User.new(username: "User2", name: nil, password: "password", password_confirmation: "password")}
  # # let!(:first_valid_user) {User.create!(username: "Test", name: "Testy McTest", password: "password", password_confirmation: "password")}
  # # let(:invalid_user_duplicate_username) {User.new(username: "Test", name: "Testy McTest", password: "password", password_confirmation: "password")}

  # context "a valid location" do

  #   it "is valid" do
  #     expect(manchester).to be_valid
  #   end

  #   it "can hit the database" do

  #     expect{
  #       manchester.save
  #     }.to change(Location, :count).by(1)

  #   end
  # end


  # context "a valid address" do
    
  #       it "is valid" do
  #         oldham.address = denton.address
  #         expect{oldham.save}.to raise_error()
  #       end
    
  #       # it "e" do
    
  #       #   expect{
  #       #     manchester.save
  #       #   }.to change(Location, :count).by(1)
    
  #       # end
  #     end

  # context "a user without a name" do
  #   it "is invalid" do
  #     expect(invalid_user_no_name).to be_invalid
  #   end
  #   it "should not hit the database" do
  #     expect{
  #       invalid_user_no_name.save
  #     }.to change(User, :count).by(0)
  #   end
  # end
  # context "a user with a duplicate username" do
  #   it "is invalid" do
  #     expect(invalid_user_duplicate_username).to be_invalid
  #   end
  #   it "should not hit the database" do
  #     expect{
  #       invalid_user_duplicate_username.save
  #     }.to change(User, :count).by(0)
  #   end
  # end
  # context "a user without matching password confirms" do
  #   it "is invalid" do
  #     expect(invalid_user_bad_confirm).to be_invalid
  #   end
  #   it "should not hit the database" do
  #     expect{
  #       invalid_user_bad_confirm.save
  #     }.to change(User, :count).by(0)
  #   end
  # end
end
