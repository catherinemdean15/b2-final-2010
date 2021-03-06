require 'rails_helper'

RSpec.describe 'teams index page' do
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

    visit teams_path
  end

  it "shows the hometown and nickname of all teams" do
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team1.nickname)

    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team2.nickname)

    expect(page).to have_content(@team3.hometown)
    expect(page).to have_content(@team3.nickname)
  end

  it "shows the average age of players from each team" do
    within ("#team-#{@team1.id}") do
      expect(page).to have_content(@team1.players.average(:age).to_f.round(1))
    end

    within ("#team-#{@team2.id}") do
      expect(page).to have_content(@team2.players.average(:age).to_f.round(1))
    end

    within ("#team-#{@team3.id}") do
      expect(page).to have_content(@team3.players.average(:age).to_f.round(1))
    end
  end

  it "shows the teams by average age highest to lowest" do
    expect(@team2.hometown).to appear_before(@team3.hometown)
    expect(@team3.hometown).to appear_before(@team1.hometown)
  end

end
