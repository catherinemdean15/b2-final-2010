class Team < ApplicationRecord
  has_many :competitions_teams
  has_many :competitions, through: :competitions_teams
  has_many :players

  def self.average_player_age
    Team.joins(:players).select('teams.*, avg(age) as avg_age').group('teams.id').order('avg_age desc')
  end
end
