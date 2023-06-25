class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.string :sport_group

      t.timestamps
    end
  end
end
