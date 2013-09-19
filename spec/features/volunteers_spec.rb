require 'spec_helper'

feature "A volunteer signing up for duty" do
  before do
    @lists = double
    mc = double(:lists => @lists)
    Mailchimp::API.stub(:new).and_return(mc)
  end

  it 'with valid parameters' do
    @lists.should_receive(:subscribe)
    visit(volunteers_path)
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    click_button "Sign up to volunteer"
  end
end
