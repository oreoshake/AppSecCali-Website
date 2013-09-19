require 'spec_helper'

feature "Volunteers" do
  before do
    @lists = double
    mc = double(:lists => @lists)
    Mailchimp::API.stub(:new).and_return(mc)
  end

  scenario 'signing up as a volunteer' do
    @lists.should_receive(:subscribe)
    visit(volunteers_path)
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    click_button "Sign up to volunteer"
  end
end
