require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it {should have_many :competitions_teams}
    it {should have_many(:competitions).through(:competitions_teams)}
    it {should have_many :players}
  end

  describe 'class methods' do
    it "average_player_age" do
      @competition1 = Competition.create!(name: "Super Speedy", location: "Denver", sport: "Track")
      @competition2 = Competition.create!(name: "Throw it far!", location: "Longmont", sport: "Shotput")

      @team1 = @competition1.teams.create!(hometown: "Lakewood", nickname: "Lemurs")
      @team2 = @competition1.teams.create!(hometown: "Denver", nickname: "Dolphins")
      @team3 = @competition2.teams.create!(hometown: "Aurora", nickname: "Stars")

      @player1 = @team1.players.create!(name: "Susie", age: 12.0)
      @player2 = @team1.players.create!(name: "Sam", age: 18.0)
      @player3 = @team1.players.create!(name: "Shawn", age: 14.0)
      @player4 = @team2.players.create!(name: "Sandy", age: 16.0)
      @player5 = @team2.players.create!(name: "Sonny", age: 15.0)
      @player6 = @team3.players.create!(name: "Someone Else", age: 15.0)

      expect(Team.average_player_age[0].avg_age.to_f).to eq(15.5)
      expect(Team.average_player_age[1].avg_age.to_f).to eq(15.0)
      expect(Team.average_player_age[2].avg_age.to_f.round(1)).to eq(14.7)

    end

  end
end
