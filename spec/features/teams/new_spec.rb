require 'rails_helper'

RSpec.describe 'new team page' do
  before :each do
    @competition1 = Competition.create!(name: "Super Speedy", location: "Denver", sport: "Track")

    visit competition_path(@competition1)
  end

  it "can register a new team" do
    expect(page).to_not have_content("Thornton")
    expect(page).to_not have_content("Tigers")

    click_link "Register a new team"

    fill_in "Hometown", with: "Thornton"
    fill_in "Nickname", with: "Tigers"

    click_button "Submit"
    expect(current_path).to eq(competition_path(@competition1))
    expect(page).to have_content("Thornton")
    expect(page).to have_content("Tigers")
  end
end
