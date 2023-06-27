class CreateTeamSport < ActiveRecord::Migration[7.0]
  def change
    create_table :team_sports do |t|
      t.references :sport
      t.references :team

      t.timestamps
    end
  end
end
