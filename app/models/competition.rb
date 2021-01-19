class Competition < ApplicationRecord
  has_many :competitions_teams
  has_many :teams, through: :competitions_teams

  def average_age
    teams.joins(:players).average(:age).to_f
  end
end
