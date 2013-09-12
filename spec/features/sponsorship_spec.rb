require 'spec_helper'

feature "A sponsor visits the site" do
  scenario "to download the sponsor packet" do
    visit(sponsorship_path)
    click_link('Download the Sponsor Package')
    page.status_code.should == 200
  end
end