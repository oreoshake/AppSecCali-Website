require 'spec_helper'

feature "A user signing up for a beta invitation" do
  before do
    @lists = double
    mc = double(:lists => @lists)
    Mailchimp::API.stub(:new).and_return(mc)
  end

  scenario "with valid parameters" do
    @lists.should_receive(:subscribe)

    visit '/'
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    click_button "Sign up for announcements"
  end
end
