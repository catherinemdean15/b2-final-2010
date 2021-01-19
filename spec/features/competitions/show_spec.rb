require 'rails_helper'

RSpec.describe 'competitions show page' do
  before :each do
    @competition1 = Competition.create!(name: "Super Speedy", location: "Denver", sport: "Track")
    @competition2 = Competition.create!(name: "Throw it far!", location: "Longmont", sport: "Shotput")

    @team1 = @competition1.teams.create!(hometown: "Lakewood", nickname: "Lemurs")
    @team2 = @competition1.teams.create!(hometown: "Denver", nickname: "Dolphins")
    @team3 = @competition2.teams.create!(hometown: "Aurora", nickname: "Stars")

    @player1 = @team1.players.create!(name: "Susie", age: 12)
    @player2 = @team1.players.create!(name: "Sam", age: 18)
    @player3 = @team1.players.create!(name: "Shawn", age: 14)
    @player4 = @team2.players.create!(name: "Sandy", age: 16)
    @player5 = @team2.players.create!(name: "Sonny", age: 15)
    @player6 = @team3.players.create!(name: "Someone Else", age: 15)

    visit competition_path(@competition1)
  end

  it 'shows the competition information' do
    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition1.location)
    expect(page).to have_content(@competition1.sport)

    expect(page).to_not have_content(@competition2.name)
    expect(page).to_not have_content(@competition2.location)
    expect(page).to_not have_content(@competition2.sport)
  end

  it "shows the name and hometown of all teams" do
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team1.nickname)

    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team2.nickname)

    expect(page).to_not have_content(@team3.hometown)
    expect(page).to_not have_content(@team3.nickname)
  end

  it "shows the average age of all players in the competition" do
    expect(page).to have_content(@competition1.average_age)
  end

end
