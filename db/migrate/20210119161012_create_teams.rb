class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :hometown
      t.string :nickname
    end
  end
end
