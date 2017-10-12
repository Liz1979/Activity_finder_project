require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) {User.new(username: "User1", name: "Testy McTest", password: "password", password_confirmation: "password")}
  let(:invalid_user_bad_confirm) {User.new(username: "User2", name: "Faily McFail", password: "password", password_confirmation: "wrongpassword")}
  let(:invalid_user_no_name) {User.new(username: "User2", name: nil, password: "password", password_confirmation: "password")}
  let!(:first_valid_user) {User.create!(username: "Test", name: "Testy McTest", password: "password", password_confirmation: "password")}
  let(:invalid_user_duplicate_username) {User.new(username: "Test", name: "Testy McTest", password: "password", password_confirmation: "password")}

  context "a valid user" do

    it "is valid" do
      expect(valid_user).to be_valid
    end

    it "can hit the database" do

      expect{
        valid_user.save
      }.to change(User, :count).by(1)

    end
  end

  context "a user without a name" do
    it "is invalid" do
      expect(invalid_user_no_name).to be_invalid
    end
    it "should not hit the database" do
      expect{
        invalid_user_no_name.save
      }.to change(User, :count).by(0)
    end
  end
  context "a user with a duplicate username" do
    it "is invalid" do
      expect(invalid_user_duplicate_username).to be_invalid
    end
    it "should not hit the database" do
      expect{
        invalid_user_duplicate_username.save
      }.to change(User, :count).by(0)
    end
  end
  context "a user without matching password confirms" do
    it "is invalid" do
      expect(invalid_user_bad_confirm).to be_invalid
    end
    it "should not hit the database" do
      expect{
        invalid_user_bad_confirm.save
      }.to change(User, :count).by(0)
    end
  end
end
