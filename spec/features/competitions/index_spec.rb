require 'rails_helper'

RSpec.describe 'competitions index' do
  before :each do
    @competition1 = Competition.create!(name: "Super Speedy", location: "Denver", sport: "Track")
    @competition2 = Competition.create!(name: "Throw it far!", location: "Longmont", sport: "Shotput")
    @competition3 = Competition.create!(name: "Deep Dives", location: "Boulder", sport: "Diving")

    visit competitions_path
  end

  it 'shows the names of all competitions' do
    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition2.name)
    expect(page).to have_content(@competition3.name)
  end

  it "links to the competitions show page" do
    expect(page).to have_link "#{@competition2.name}"
    expect(page).to have_link "#{@competition3.name}"
    click_link "#{@competition1.name}"
    expect(current_path).to eq(competition_path(@competition1))
  end

end
