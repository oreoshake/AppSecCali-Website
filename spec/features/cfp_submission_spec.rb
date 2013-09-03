require 'spec_helper'

feature "A speaker submits a proposal" do
  scenario "with valid parameters" do
    visit new_speaker_path
    fill_in "speaker_name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    fill_in "Abstract", with: "lol"
    click_button "Submit"

    expect(page).to have_content('Thanks for submitting!')
    speaker = Speaker.last
    expect(speaker.name).to eq 'John Doe'
    expect(speaker.email).to eq 'jdoe@example.com'
  end

  scenario "with valid missing parameters" do
    visit new_speaker_path
    click_button "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Abstract can't be blank")

    fill_in "Email", with: 'lol'
    click_button "Submit"
    expect(page).to have_content("Email is invalid")

    fill_in "speaker_image_url", with: 'http://example.com'
    click_button "Submit"
    expect(page).to have_content("Image url is invalid")
  end
end
