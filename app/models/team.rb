class Team < ApplicationRecord
  has_many :competitions_teams
  has_many :competitions, through: :competitions_teams
  has_many :players

end
