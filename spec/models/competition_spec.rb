require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it {should have_many :competitions_teams}
    it {should have_many(:teams).through(:competitions_teams)}
  end

  describe 'instance methods' do
    it "average_age of all players" do
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

      expect(@competition1.average_age).to eq(15.0)
    end
  end
end
