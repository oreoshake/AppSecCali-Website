require 'spec_helper'

feature "A user signing up for a beta invitation" do
  scenario "with valid parameters" do
    visit '/'
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    click_button "Join Now"

    expect(page).to have_content('Thanks for signing up!')
    beta_request = BetaRequest.last
    expect(beta_request.name).to eq 'John Doe'
    expect(beta_request.email).to eq 'jdoe@example.com'
  end
end
