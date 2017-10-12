require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :name => "Name",
        :password_confirmation => "password",
        :password => "password",
      ),
      User.create!(
        :username => "Othername",
        :name => "Name",
        :password_confirmation => "password",
        :password => "password",
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
