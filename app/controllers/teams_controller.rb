class TeamsController < ApplicationController
  before_action :find_competition, only: [:new, :create]

  def index
    @teams = Team.average_player_age
  end

  def new

  end

  def create
    @competition.teams.create!(teams_params)
    redirect_to competition_path(@competition)
  end

  private

  def teams_params
    params.require(:competition).permit(:hometown, :nickname)
  end

  def find_competition
    @competition = Competition.find(params[:competition_id])
  end

end
