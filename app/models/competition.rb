class Competition < ApplicationRecord
  has_many :competitions_teams
  has_many :teams, through: :competitions_teams

end
