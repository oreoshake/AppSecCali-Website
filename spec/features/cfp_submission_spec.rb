require 'spec_helper'

feature "A speaker submits a proposal" do
  def submit
    visit new_speaker_path
    fill_in "speaker_name", with: "John Doe"
    fill_in "Email", with: "jdoe@example.com"
    fill_in "Abstract", with: "lol"
    click_button "Submit"
  end

  scenario "with valid parameters" do
    submit

    speaker = Speaker.last
    expect(speaker.name).to eq 'John Doe'
    expect(speaker.email).to eq 'jdoe@example.com'
  end

  scenario "non-confirmed speakers should not be visible" do
    keanu = Speaker.create!(:name => "Test", :email => "test@test.com", :abstract => "woah")
    visit(speaker_path(keanu.reload))
    page.status_code.should_not == 200
  end

  scenario "non-confirmed speakers should not be visible" do
    keanu = Speaker.new(:name => "Test", :email => "test@test.com", :abstract => "woah")
    keanu.confirmed = true
    keanu.save!
    visit(speaker_path(keanu.reload))
    page.status_code.should == 200
  end

  scenario "already submitted" do
    keanu = Speaker.create!(:name => "John Doe", :email => "jdoe@example.com", :abstract => "lol")
    submit
    expect(page).to have_content("You have already submitted to the CFP. Thanks!")
  end

  scenario "with missing parameters" do
    visit new_speaker_path
    click_button "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Abstract can't be blank")

    fill_in "Email", with: 'lol'
    click_button "Submit"
    expect(page).to have_content("Email is not an email")

    fill_in "speaker_image_url", with: 'http://example.com'
    click_button "Submit"
    expect(page).to have_content("Image url is invalid")
  end
end
