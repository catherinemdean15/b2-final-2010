class CreateJoinTableCompetitionTeams < ActiveRecord::Migration[5.2]
  def change
    create_join_table :competitions, :teams do |t|
      # t.index [:competition_id, :team_id]
      # t.index [:team_id, :competition_id]
    end
  end
end
